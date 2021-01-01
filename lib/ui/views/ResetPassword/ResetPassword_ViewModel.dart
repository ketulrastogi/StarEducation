import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/firebase_auth_service.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  String _userId;
  String get userId => _userId;

  setUserId(String value) {
    _userId = value;
    notifyListeners();
  }

  String _newPassword;
  String get newPassword => _newPassword;

  setNewPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  String _confirmPassword;
  String get confirmPassword => _confirmPassword;

  setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  resetPassword() async {
    if (_newPassword == _confirmPassword) {
      try {
        print('UserId: $_userId, Password: $_newPassword');
        await _authService.resetPassword(_userId, _newPassword);
        _navigationService.clearStackAndShow(Routes.loginViewRoute);
      } catch (e) {
        _snackbarService.showSnackbar(
            message:
                'An error occured while updating password. Please try again. $e');
      }
    } else {
      _snackbarService.showSnackbar(
          message:
              'New Password and Confirm Password don\'t match. Please try again.');
    }
  }
}
