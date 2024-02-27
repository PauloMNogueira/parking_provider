import 'dart:math';

import 'package:parking_provider/app/modules/profile/domain/profile_repository.dart';
import 'package:parking_provider/app/modules/profile/domain/user_profile_entity.dart';
import 'package:super_module/services/http.service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final HttpService httpService;

  ProfileRepositoryImpl({required this.httpService});
  @override
  Future<UserProfile> getUserProfile() async {
    final response = await httpService.get('/users');
    return UserProfile(
        name: response.data?['data'][0]['name'] ?? '',
        email: response.data?['data'][0]['email'] ?? '');
  }

  @override
  Future<UserProfile> updateUserProfile() async {
    final response = await httpService.get('/users');
    const int start = 0;
    final int end = response.data?['data']?.length - 1;
    Random random = Random();
    final randomIndex = start + random.nextInt(end - start + 1);
    return UserProfile(
        name: response.data?['data'][randomIndex]['name'] ?? '',
        email: response.data?['data'][randomIndex]['email'] ?? '');
  }
}
