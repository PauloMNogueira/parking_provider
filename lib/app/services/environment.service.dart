import 'package:super_module/services/environment.service.dart';

class LocalEnvironmentService extends EnvironmentService {
  @override
  Future<String> getByName(String name) async {
    return String.fromEnvironment(name);
  }
}
