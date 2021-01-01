import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  String _firstName;
  String get firstName => _firstName;

  String _lastName;
  String get lastName => _lastName;

  String _phoneNumber;
  String get phoneNumber => _phoneNumber;

  String _email;
  String get email => _email;

  String _password;
  String get password => _password;

  setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  navigateToLoginView() {
    _navigationService.navigateTo(Routes.loginViewRoute);
  }

  registerUser() {
    _navigationService.navigateTo(
      Routes.otpViewRoute,
      arguments: OtpViewArguments(
        email: _email,
        firstName: _firstName,
        lastName: _lastName,
        phoneNumber: _phoneNumber,
        password: _password,
      ),
    );
  }
}
