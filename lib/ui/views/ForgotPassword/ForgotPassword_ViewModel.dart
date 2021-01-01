import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  String _phoneNumber;
  String get phoneNumber => _phoneNumber;

  setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  sendOtp() {
    _navigationService.navigateTo(
      Routes.forgotOtpViewRoute,
      arguments: ForgotOtpViewArguments(
        phoneNumber: _phoneNumber,
      ),
    );
  }
}
