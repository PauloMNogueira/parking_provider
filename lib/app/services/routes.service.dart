import 'package:parking_provider/app/modules/home/presentation/ui/page/home_page.dart';
import 'package:parking_provider/app/modules/profile/presentation/page/profile_page.dart';
import 'package:parking_provider/app/modules/splash/presentation/page/splash_page.dart';
import 'package:super_module/runtime/app.runtime.dart';

class AppRoutes {
  void registerRoutes(AppRuntime runtime) {
    // Register SplashScreen Route
    runtime.routeService
        .registerRoute("/splash-screen", (context) => const SplashPage());
    // Register Home Route
    runtime.routeService.registerRoute(
        "/", (context) => const MyHomePage(title: 'Página Inicial'));
    // Register Profile Route
    runtime.routeService
        .registerRoute("/profile", (context) => const ProfilePage());
  }
}
