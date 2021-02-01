import 'package:simple_moment/simple_moment.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class TrialEndedSubjectListScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _subjectList = [];
  List<Map<String, dynamic>> get subjectList => _subjectList;

  loadData() async {
    try {
      Map<String, dynamic> response = await _subjectService.getUserSubject();
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'You have not subscribed any subjects. ');
      } else {
        _subjectList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting your subscribed subjects. $e.');
    }
  }

  navigateToSubscriptionService(String subjectId, String subjectName) {
    _navigationService.navigateTo(
      Routes.subscriptionScreenViewRoute,
      arguments: SubscriptionScreenViewArguments(
          subjectId: subjectId, subjectName: subjectName),
    );
  }

  formatDate(String value) {
    return Moment.parse(value).format('dd/MM/yyyy');
  }

  isSubscriptionActive(String value) {
    return (Moment.parse(value).compareTo(DateTime.now()) > 0);
  }
}
