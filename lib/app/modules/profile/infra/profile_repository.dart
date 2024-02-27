import 'package:parking_provider/app/modules/profile/domain/profile_repository.dart';
import 'package:parking_provider/app/modules/profile/domain/user_profile_entity.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<UserProfile> getUserProfile() {
    return Future.delayed(const Duration(seconds: 5), () {
      return UserProfile(name: 'Paulo', email: 'paulo.nogueira@jcpm.com.br');
    });
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) {
    throw UnimplementedError();
  }
}
