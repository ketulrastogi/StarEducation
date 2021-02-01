import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/firebase_auth_service.dart';

class SubscriptionScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final _razorpay = Razorpay();

  bool _yearSelected = false;

  bool get yearSelected => _yearSelected;

  String _subjectId;
  String get subjectId => _subjectId;

  Map<String, dynamic> _planDetails;
  Map<String, dynamic> get planDetails => _planDetails;

  Map<String, dynamic> _walletDetails;
  Map<String, dynamic> get walletDetails => _walletDetails;

  double _walletBalance = 0.0;
  double get walletBalance => _walletBalance;

  double _price = 0.0;
  double get price => _price;

  double _gst = 0.0;
  double get gst => _gst;

  double _subTotal = 0.0;
  double get subTotal => _subTotal;

  double _useWallet = 0.0;
  double get useWallet => _useWallet;

  double _grandTotal = 0.0;
  double get grandTotal => _grandTotal;

  initializeRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  setYearSelected(bool value) {
    _yearSelected = value;
    if (_yearSelected) {
      _price = double.parse(_planDetails['price']);
      _gst = double.parse((_price * 0.18).toStringAsPrecision(2));
      _subTotal = _price + _gst;
      // _walletBalance = double.parse(_walletDetails['balance']);

      _useWallet = (_walletBalance > _subTotal) ? _subTotal : _walletBalance;
      _grandTotal =
          (_walletBalance > _subTotal) ? 0.0 : _subTotal - _walletBalance;
    } else {
      _gst = 0.0;
      _subTotal = 0.0;
      _grandTotal = 0.0;
      _useWallet = 0.0;
    }

    notifyListeners();
  }

  loadData(String subjectId) async {
    initializeRazorPay();
    await getPricePlan(subjectId);
    await getWalletDetails();
  }

  getPricePlan(String subjectId) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getPricePlan(subjectId);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(message: 'Subject is not available. ');
      } else {
        _planDetails = [...response['data']][0];

        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting subject plan details. $e.');
    }
  }

  getWalletDetails() async {
    try {
      Map<String, dynamic> response = await _subjectService.getWallet();
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(message: 'Wallet is not available. ');
      } else {
        _walletDetails = response['data'];
        _walletBalance = double.parse(_walletDetails['balance']);
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting wallet details. $e.');
    }
  }

  checkout(String subjectId, String subjectName, double amount) async {
    Map<String, dynamic> _userProfile = await _authService.getUserProfile();
    var options = {
      'key': 'rzp_live_Cm5ijmdw4hI8Wz',
      'amount': amount * 100,
      'name': subjectName,
      'description': subjectName,
      'prefill': {
        'contact': '${_userProfile['mobile']}',
        'email': '${_userProfile['email']}'
      }
    };
    if (_grandTotal != 0) {
      _razorpay.open(options);
    } else if (_useWallet != 0) {
      await _subjectService.setSubscription(
          subjectId,
          '',
          planDetails['p_id'],
          'CONFIRM',
          _subTotal.toString(),
          _useWallet.toString(),
          _grandTotal.toString());
      _dialogService.showCustomDialog(
        mainButtonTitle: 'Close',
        title: 'Success',
        description: 'Your payment for subscription is succesfull.',
      );
      _navigationService.clearStackAndShow(Routes.homeViewRoute);
    } else {
      _snackbarService.showSnackbar(message: 'Please select one plan.');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    print('Success');
    await _subjectService.setSubscription(
        _subjectId,
        response.paymentId,
        planDetails['p_id'],
        'PENDING',
        _subTotal.toString(),
        _useWallet.toString(),
        _grandTotal.toString());
    _dialogService.showCustomDialog(
      mainButtonTitle: 'Close',
      title: 'Success',
      description: 'Your payment for subscription is succesfull.',
    );
    _navigationService.clearStackAndShow(Routes.homeViewRoute);
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    // Do something when payment fails
    print('Failure');
    await _subjectService.setSubscription(
        _subjectId,
        '',
        planDetails['p_id'],
        'FAILED',
        _subTotal.toString(),
        _useWallet.toString(),
        _grandTotal.toString());
    _dialogService.showCustomDialog(
      mainButtonTitle: 'Close',
      title: 'Success',
      description: 'An error occured while payment. ${response.message}.',
    );
    _navigationService.clearStackAndShow(Routes.homeViewRoute);
    _snackbarService.showSnackbar(
        message: 'An error occured while payment. ${response.message}.');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print('Wallet');
  }
}
