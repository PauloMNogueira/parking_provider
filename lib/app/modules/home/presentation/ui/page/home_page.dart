import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/profile/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:super_module/services/navigation.service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ProfileProvider>(builder: (context, provider, _) {
              return provider.isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      "Bem vindo ${provider.userProfile.name.isEmpty ? 'Visitante' : provider.userProfile.name}");
            }),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<NavigationService>()
                      .goTo(context, '/movie/discovery');
                },
                child: const Text('Ver filmes')),
            ElevatedButton(
                onPressed: () {
                  context.read<NavigationService>().goTo(context, '/profile');
                },
                child: const Text('Ir pro Perfil'))
          ],
        ),
      ),
    );
  }
}
