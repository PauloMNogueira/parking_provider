import 'package:parking_provider/app/modules/profile/domain/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<UserProfile> updateUserProfile();
}
