import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/services/firebase_auth_service.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/subject_service.dart';

class ImportedDocumentListWidgetViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _importedDocumentList = [];
  List<Map<String, dynamic>> get importedDocumentList => _importedDocumentList;

  getImportedDocumetns() async {
    try {
      Map<String, dynamic> response = await _subjectService.getDocuments('4');
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No ImportedDocuments available right now. ');
      } else {
        _importedDocumentList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting Imported Documents. $e.');
    }
  }

  navigateToDocumentViewerScreen(Map<String, dynamic> documentDetails) {
    _navigationService.navigateTo(
      Routes.documentViewerScreenViewRoute,
      arguments: DocumentViewerScreenViewArguments(
        title: documentDetails['title'],
        url: documentDetails['file'],
      ),
    );
  }
}
