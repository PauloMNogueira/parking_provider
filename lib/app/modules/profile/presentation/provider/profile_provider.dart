import 'package:flutter/material.dart';
import 'package:parking_provider/app/modules/profile/domain/profile_repository.dart';
import 'package:parking_provider/app/modules/profile/domain/user_profile_entity.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository;

  UserProfile _userProfile = UserProfile(name: '', email: '');
  bool isLoading = true;
  ProfileProvider(this._repository) {
    _loadUserProfile();
  }

  UserProfile get userProfile => _userProfile;

  Future<void> _loadUserProfile() async {
    _userProfile = await _repository.getUserProfile();
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile() async {
    final newProfile = await _repository.updateUserProfile();
    _userProfile = newProfile;
    notifyListeners();
  }
}
