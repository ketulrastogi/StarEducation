import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/firebase_auth_service.dart';

class ForgotOtpViewModel extends BaseViewModel {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  String _smsCode;
  String get smsCode => _smsCode;

  String _phoneNumber;
  String get phoneNumber => _phoneNumber;

  String _firstName;
  String get firstName => _firstName;

  String _lastName;
  String get lastName => _lastName;

  String _email;
  String get email => _email;

  String _password;
  String get password => _password;

  setSmsCode(String value) {
    _smsCode = value;
    notifyListeners();
  }

  setData(
    String phone,
  ) {
    _phoneNumber = phone;
    notifyListeners();
    sendSmsCode(phone);
  }

  popNavigator() {
    _navigationService.popRepeated(1);
  }

  Future<void> sendSmsCode(String phoneNumber) async {
    // setBusy(true);
    print('phoneNumber: +91$phoneNumber');
    _authService
        .sendSmsCode(phoneNumber: '+91$phoneNumber')
        .listen((AuthStatus authStatus) {
      if (authStatus.signedIn) {
        print('Current Route: ${_navigationService.currentRoute.toString()}');
        print('Previous Route: ${_navigationService.previousRoute.toString()}');
        // _navigationService.navigateTo(Routes.homeViewRoute);
        onPhoneOtpVerificationComplete();
      }
      if (authStatus.error != null) {
        _snackbarService.showSnackbar(message: authStatus.error);
      }
      // setBusy(false);
      // setPhoneLoading(false);
    });
  }

  Future<void> verifyOtp() async {
    setBusy(true);
    // setCodeLoading(true);
    AuthStatus _authStatus = await _authService.verifySmsCode(_smsCode);

    if (_authStatus.appUser != null) {
      await onPhoneOtpVerificationComplete();
    } else {
      _snackbarService.showSnackbar(message: _authStatus.error);
    }
    // await Future.delayed(Duration(seconds: 1));
    setBusy(false);
    // setCodeLoading(false);
  }

  onPhoneOtpVerificationComplete() async {
    Map<String, dynamic> response;
    try {
      response = await _authService.getUserId(
        _phoneNumber,
      );

      print('Response: ${response['result']}');
      if (!response['result']) {
        _snackbarService.showSnackbar(message: response['message']);
      } else {
        _navigationService.navigateTo(
          Routes.ResetPasswordView,
          arguments: ResetPasswordViewArguments(userId: response['data']['id']),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while register.');
    }
  }
}
