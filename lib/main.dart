import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/home/presentation/provider/home.provider.dart';
import 'package:parking_provider/app/modules/movie/infra/movie_repository.dart';
import 'package:parking_provider/app/modules/movie/presentation/provider/discovery_provider.dart';
import 'package:parking_provider/app/modules/profile/infra/profile_repository.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:parking_provider/app/services/environment.service.dart';
import 'package:parking_provider/app/services/navigation.service.dart';
import 'package:parking_provider/app/services/routes.service.dart';
import 'package:parking_provider/app/services/super_module/basic_route.service.dart';
import 'package:parking_provider/app/services/super_module/dio_http.service.dart';
import 'package:parking_provider/app/services/super_module/local_storage.service.dart';
import 'package:parking_provider/app/services/super_module/observable_event.service.dart';
import 'package:parking_provider/app/services/super_module/provider.service.dart';
import 'package:provider/provider.dart';
import 'package:super_module/runtime/app.runtime.dart';
import 'package:super_module/services/navigation.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var environmentService = LocalEnvironmentService();
  var runtime = AppRuntime(
      routeService: BasicRouteService(initialRoute: "/"),
      httpService:
          DioHttpService(baseUrl: 'https://jsonplaceholder.typicode.com'),
      storageService: LocalStorageService(),
      eventService: ObservableEventService(),
      environmentService: environmentService,
      secureStorageService: LocalStorageService(),
      appProvider: ProviderService());

  AppRoutes().registerRoutes(runtime);

  runtime.appProvider.registerServiceProvider(HomeProvider());

  await runtime.initialize();
  runApp(
    MultiProvider(
      providers: [
        Provider<AppRuntime>.value(value: runtime),
        Provider<NavigationService>.value(value: AppNavigationService()),
        ChangeNotifierProvider(
            create: (context) => ProfileProvider(
                ProfileRepositoryImpl(httpService: runtime.httpService))),
        ChangeNotifierProvider(
            create: (context) => DiscoveryProvider(
                MovieRepositoryImpl(httpService: runtime.httpService))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _registerServiceProviderOnSplashScreen(
      AppRuntime runtime, BuildContext context) {
    var navigationService = context.read<NavigationService>();
    ;

    /// End application boot and register ServiceProviders
    runtime.appProvider.registerAll(context).then((value) {
      Future.delayed(const Duration(milliseconds: 100), () {
        navigationService.replaceTo(context, runtime.routeService.initialRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Get Current AppRuntime
    var runtime = context.read<AppRuntime>();

    /// Add middle on splash screen page renders
    runtime.routeService.addMiddleware(runtime.routeService.splashScreenRoute,
        (context) {
      _registerServiceProviderOnSplashScreen(runtime, context);
    });

    /// Render Application
    return MaterialApp(
      title: 'SuperApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: runtime.routeService.splashScreenRoute,
      routes: runtime.routeService
          .routes, //_registerServiceProviderOnSplashScreen(runtime),
    );
  }
}
