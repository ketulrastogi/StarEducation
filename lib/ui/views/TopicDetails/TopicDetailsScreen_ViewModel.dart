import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class TopicDetailsScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  Map<String, dynamic> _topicInfo;
  Map<String, dynamic> get topicInfo => _topicInfo;

  loadData(Map<String, dynamic> topicDetails) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getTopicInfo(topicDetails['top_id']);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No data available for Selected Topic. ');
      } else {
        _topicInfo = response['data'];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting data for selected topic. $e.');
    }
  }

  navigateToConceptOrExerciseScreen(
      Map<String, dynamic> topicDetails, bool isExercise) {
    if (isExercise) {
      _navigationService.navigateTo(
        Routes.topicExerciseScreenViewRoute,
        arguments: TopicExerciseScreenViewArguments(
          topicDetails: topicDetails,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.topicConceptScreenViewRoute,
        arguments: TopicConceptScreenViewArguments(
          topicDetails: topicDetails,
        ),
      );
    }
  }
}
