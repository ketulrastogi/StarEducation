import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stacked/stacked.dart';

class SubscriptionScreenViewModel extends BaseViewModel {
  final _razorpay = Razorpay();
  var options = {
    'key': 'rzp_live_Cm5ijmdw4hI8Wz',
    'amount': 118.00,
    'name': 'Advance Physics.',
    'description': '12th Science Subject',
    'prefill': {'contact': '+919408393331', 'email': 'ketul@bugletech.com'}
  };

  bool _yearSelected = false;

  bool get yearSelected => _yearSelected;

  initializeRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  setYearSelected(bool value) {
    _yearSelected = value;
    notifyListeners();
  }

  checkout() {
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}
