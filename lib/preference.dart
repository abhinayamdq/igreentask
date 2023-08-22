import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'IGreen';
  static const _MOBILE_NUMBER = 'mobile_number';
  static const PROFILE_NAME = '_PROFILE_NAME';
  static const USER_UUID = '_USER_UUID';

  static const leadEvaluationStatusLabel = "feature_permission_lead_evaluation";

  final _storage = GetStorage(STORAGE_NAME);

  Future<bool> init() {
    return _storage.initStorage;
  }

  updateMobileNumber(String mobileNumber) {
    _storage.write(_MOBILE_NUMBER, mobileNumber);
  }

  String get mobileNumber {
    try {
      return _storage.read(_MOBILE_NUMBER);
    } catch (e) {
      return "";
    }
  }

  void updateProfileName(String name) {
    _storage.write(PROFILE_NAME, name);
  }

  String get ProfileName {
    try {
      return _storage.read(PROFILE_NAME);
    } catch (e) {
      return "";
    }
  }

  void updateUserUUidName(String name) {
    _storage.write(USER_UUID, name);
  }

  String get UserUUid {
    try {
      return _storage.read(USER_UUID);
    } catch (e) {
      return "";
    }
  }

  void clearData() {
    _storage.erase();
  }
}
