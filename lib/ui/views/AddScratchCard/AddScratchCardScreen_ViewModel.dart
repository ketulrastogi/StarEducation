import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class AddScratchCardScreenViewModel extends BaseViewModel {
  final SubjectService _subjectService = locator<SubjectService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  String _scratchCardNumber;
  String get scratchCardNumber => _scratchCardNumber;

  String _walletBalance;
  String get walletBalance => _walletBalance;

  setScratchCardNumber(String value) {
    _scratchCardNumber = value;
    notifyListeners();
  }

  getWalletDetails() async {
    try {
      Map<String, dynamic> response = await _subjectService.getWallet();
      print('Response: ${response['result']}');
      if (!response['result']) {
        _snackbarService.showSnackbar(message: response['message']);
      } else {
        _walletBalance = response['data']['balance'];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting wallet balance.');
    }
  }

  addScratchCard() async {
    setBusy(true);
    try {
      Map<String, dynamic> response =
          await _subjectService.addScratchCard(_scratchCardNumber);

      print('Response: ${response['result']}');
      if (!response['result']) {
        _snackbarService.showSnackbar(message: response['message']);
      }
      await getWalletDetails();
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while adding scratch card. $e');
      print('Error: $e');
    }

    setBusy(false);
  }
}
