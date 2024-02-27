import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/home/presentation/ui/page/home_page.dart';
import 'package:parking_provider/app/modules/profile/presentation/page/details_page.dart';
import 'package:parking_provider/app/modules/profile/presentation/page/profile_page.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:parking_provider/app/modules/splash/presentation/page/splash_page.dart';
import 'package:provider/provider.dart';
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

    // Register Profile Details Route
    runtime.routeService
        .registerRoute('/detail', (context) => const DetailsProfilePage());

    runtime.routeService.addMiddleware('/detail', (context) {
      // Adiciona um Middleware para setar uma cor própria para a AppBar dele
      mappColor(context);
    });
  }

  void mappColor(BuildContext context) {
    final user = context.read<ProfileProvider>().userProfile.name;
    switch (user) {
      case 'Leanne Graham':
        context.read<ProfileProvider>().profileColor = Colors.green;
        break;
      case 'Ervin Howell':
        context.read<ProfileProvider>().profileColor = Colors.pink;
        break;
      case 'Clementine Bauch':
        context.read<ProfileProvider>().profileColor = Colors.blue;
        break;
      case 'Patricia Lebsack':
        context.read<ProfileProvider>().profileColor = Colors.brown;
        break;
      default:
        context.read<ProfileProvider>().profileColor = Colors.yellow;
    }
  }
}
