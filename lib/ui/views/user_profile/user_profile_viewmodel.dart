import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/models/app_user_model.dart';
import 'package:stareducation/services/firebase_auth_service.dart';
import 'package:stareducation/models/app_user_model.dart';

class UserProfileViewModel extends BaseViewModel {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  AppUser _appUser;
  String _firstName;
  String _lastName;
  String _email;
  String _birthdate;

  AppUser get appUser => _appUser;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get birthdate => _birthdate;

  setAppUser() async {
    // _appUser = await _authService.getCurrentUser();
    // _displayName = _appUser.displayName;
    // _email = _appUser.email;
    // _birthdate = _appUser.birthdate;
    // notifyListeners();
    // return await _authService.getCurrentUser();
    Map<String, dynamic> appUserMap = await _authService.getUserProfile();
    _appUser = AppUser.fromJson(appUserMap);
    // notifyListeners();
    return _appUser;
  }

  setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setBirthdate(String value) {
    _birthdate = value;
    notifyListeners();
  }

  saveUserProfile() async {
    setBusy(true);
    await _authService.saveUserProfile(firstName, _email, _birthdate);
    setBusy(false);
    _navigationService.navigateTo(Routes.homeViewRoute);
  }

  updateUserProfile() async {
    setBusy(true);
    await _authService.updateProfile(_appUser.userId, firstName, lastName,
        _email, _appUser.phoneNumber, birthdate);
    _dialogService
        .showCustomDialog(
          mainButtonTitle: 'Close',
          title: 'Success',
          description: 'Your Profile Updated Successfully',
        )
        .then((value) => _navigationService.popRepeated(1));
  }
}
