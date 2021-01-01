import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';

class AddSubjectScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();
  Map<String, dynamic> _boardMediumStandardList;
  Map<String, dynamic> get boardMediumStandardList => _boardMediumStandardList;

  List<Map<String, dynamic>> _subjectList = [];
  List<Map<String, dynamic>> get subjectList => _subjectList;

  Map<String, dynamic> _selectedSubject;
  Map<String, dynamic> get selectedSubject => _selectedSubject;

  String _board;
  String _medium;
  String _standard;
  bool _isSubjectSelected = false;

  bool _isFormValid = false;

  String get board => _board;
  String get medium => _medium;
  String get standard => _standard;
  bool get isSubjectSelected => _isSubjectSelected;
  bool get isFormValid => _isFormValid;

  setBoard(String value) {
    _board = value;
    notifyListeners();
  }

  setMedium(String value) {
    _medium = value;
    notifyListeners();
  }

  setStandard(String value) {
    _standard = value;
    notifyListeners();
  }

  selectSubject(Map<String, dynamic> value) {
    if (_selectedSubject != null &&
        value['sub_id'] == _selectedSubject['sub_id']) {
      _selectedSubject = null;
    } else {
      _selectedSubject = value;
    }
    notifyListeners();
  }

  validateForm(bool value) {
    _isFormValid = value;
    notifyListeners();
  }

  getBoardMediumStandardData() async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getBoardMediumStandardData();

      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No data available for Board Medium Standard List. ');
      } else {
        _boardMediumStandardList = response['data'];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting Board Medium Standard List. $e.');
    }
  }

  getSubjectList() async {
    try {
      print('GetSubjectListMethod: 75');
      Map<String, dynamic> response =
          await _subjectService.getSubjectListData(_medium, _standard, _board);
      print('Response: $response');
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message:
                'No subjects available for selected Board Medium Standard. ');
      } else {
        _subjectList = [...response['data']];
        print('SubjectList: ${_subjectList.length}');
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting subjects available for selected Board Medium Standard List. $e.');
    }
  }

  addSubject() async {
    try {
      Map<String, dynamic> response =
          await _subjectService.addSubject(_selectedSubject['sub_id']);
      if (!response['status'] || response['data'] == null) {
        _snackbarService.showSnackbar(message: response['message']);
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while adding subject. $e.');
    }
  }
}
