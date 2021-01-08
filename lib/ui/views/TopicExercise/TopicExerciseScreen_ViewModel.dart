import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:flutter/material.dart';

class TopicExerciseScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _exerciseList;
  List<Map<String, dynamic>> get exerciseList => _exerciseList;

  loadData(Map<String, dynamic> topicDetails) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getExerciseList(topicDetails['top_id']);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No exercise available for Selected Topic. ');
      } else {
        _exerciseList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting exercise for selected topic. $e.');
    }
  }

  navigateToExerciseQuestionScreenView(
      String title, Color color, String exerciseId) {
    _navigationService.navigateTo(
      Routes.exerciseQuestionScreenViewRoute,
      arguments: ExerciseQuestionScreenViewArguments(
        questionType: title,
        questionTypeColor: color,
        exerciseId: exerciseId,
        questionGroup: 'exercise',
      ),
    );
  }

  navigateToTryQuestion() {}
  navigateToApplyQuestion() {}
}
