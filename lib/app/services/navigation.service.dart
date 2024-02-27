import 'package:flutter/material.dart';
import 'package:super_module/services/navigation.service.dart';

class AppNavigationService extends NavigationService {
  @override
  Future<void> goBack(BuildContext context, {args}) async {
    if (context.mounted) {
      Navigator.pop(context, [args]);
    }
  }

  @override
  Future<void> goTo(BuildContext context, String name, {args}) async {
    if (context.mounted) {
      await Navigator.pushNamed(context, name, arguments: args);
    }
  }

  @override
  Future<void> replaceTo(BuildContext context, String name, {args}) async {
    if (context.mounted) {
      await Navigator.pushNamedAndRemoveUntil(context, name, (_) => false,
          arguments: args);
    }
  }
}
