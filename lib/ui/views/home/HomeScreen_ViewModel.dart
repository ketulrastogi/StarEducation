import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/services/firebase_auth_service.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/subject_service.dart';

class HomeScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  // checkLocationPermission() async {}

  Map<String, dynamic> _userProfile;
  Map<String, dynamic> get userProfile => _userProfile;

  List<Map<String, dynamic>> _userSubjectList = [];
  List<Map<String, dynamic>> get userSubjectList => _userSubjectList;

  List<Map<String, dynamic>> _popularVideoList = [];
  List<Map<String, dynamic>> get popularVideoList => _popularVideoList;

  getUsername() {
    return (_authService.user.displayName != null &&
            _authService.user.displayName.isNotEmpty)
        ? _authService.user.displayName
        : 'Guest';
  }

  navigateToUserProfileScreen() {
    _navigationService.navigateTo(Routes.userProfileViewRoute);
  }

  navigateToAddSubjectScreen() {
    _navigationService.navigateTo(Routes.addSubjectScreenViewRoute);
  }

  navigateToChapterListScreen(Map<String, dynamic> subjectDetails) {
    _navigationService.navigateTo(Routes.chapterListScreenViewRoute,
        arguments: ChapterListScreenViewArguments(
          subjectDetails: subjectDetails,
        ));
  }

  getUserSubject() async {
    try {
      _userProfile = await _authService.getUserProfile();
      Map<String, dynamic> response = await _subjectService.getUserSubject();
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No data available for User Enrolled Subjects. ');
      } else {
        _userSubjectList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting User Enrolled Subjects. $e.');
    }
    await getPopularVideos();
  }

  getPopularVideos() async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getPopularVideo('4');
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No popular videos available right now. ');
      } else {
        _popularVideoList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting Popular Videos. $e.');
    }
  }
}
