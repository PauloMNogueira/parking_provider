import 'package:parking_provider/app/modules/splash/presentation/page/splash_page.dart';
import 'package:super_module/providers/service.provider.dart';
import 'package:super_module/runtime/app.runtime.dart';

class HomeProvider extends ServiceProvider {
  HomeProvider() : super("parking_provider");

  @override
  Future<void> boot(AppRuntime runtime) async {
    print('BOOT NA HOME');
    String initialRoute = runtime.routeService.initialRoute;
    print(initialRoute);
    runtime.routeService
        .registerRoute("/test", (context) => const SplashPage());
    runtime.routeService.changeInitialRoute("/test");
  }
}
