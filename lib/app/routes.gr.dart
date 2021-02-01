// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/AboutUs/AboutUsScreen_View.dart';
import '../ui/views/AddScratchCard/AddScratchCardScreen_View.dart';
import '../ui/views/AddSubject/AddSubjectScreen_View.dart';
import '../ui/views/ChapterList/ChapterListScreen_View.dart';
import '../ui/views/ChapterProgress/ChapterProgressScreen_View.dart';
import '../ui/views/ChapterQuizList/ChapterQuizListScreen_View.dart';
import '../ui/views/ContactUs/ContactUsScreen_View.dart';
import '../ui/views/CustomQuizOldResult/CustomQuizOldResultScreen_View.dart';
import '../ui/views/CustomQuizQuestion/CustomQuizQuestionScreen_View.dart';
import '../ui/views/CustomSubjectQuizSelectChaptersAndTopics/CustomSubjectQuizSelectChaptersAndTopicsScreen_View.dart';
import '../ui/views/DocumentViewer/DocumentViewerScreen_View.dart';
import '../ui/views/ExerciseQuestion/ExerciseQuestionScreen_View.dart';
import '../ui/views/Feedback/FeedbackScreen_View.dart';
import '../ui/views/ForgotOtp/ForgotOtp_View.dart';
import '../ui/views/ForgotPassword/ForgotPassword_View.dart';
import '../ui/views/GetCustomQuiz/GetCustomQuizScreen_View.dart';
import '../ui/views/ResetPassword/ResetPassword_View.dart';
import '../ui/views/SubjectQuiz/SubjectQuizScreen_View.dart';
import '../ui/views/SubjectQuizList/SubjectQuizListScreen_View.dart';
import '../ui/views/SubjectQuizResult/SubjectQuizResultScreen_View.dart';
import '../ui/views/Subscription/SubscriptionScreen_View.dart';
import '../ui/views/TopicConcept/TopicConceptScreen_View.dart';
import '../ui/views/TopicDetails/TopicDetailsScreen_View.dart';
import '../ui/views/TopicExercise/TopicExerciseScreen_View.dart';
import '../ui/views/TrialEndedSubjectList/TrialEndedSubjectListScreen_View.dart';
import '../ui/views/home/HomeScreen_View.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/otp/otp_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/root/root_view.dart';
import '../ui/views/user_profile/user_profile_view.dart';

class Routes {
  static const String rootViewRoute = '/';
  static const String loginViewRoute = '/login-view';
  static const String registerViewRoute = '/register-view';
  static const String otpViewRoute = '/otp-view';
  static const String forgotOtpViewRoute = '/forgot-otp-view';
  static const String ForgotPasswordViewRoute = '/forgot-password-view';
  static const String ResetPasswordView = '/reset-password-view';
  static const String userProfileViewRoute = '/user-profile-view';
  static const String homeViewRoute = '/home-screen-view';
  static const String addSubjectScreenViewRoute = '/add-subject-screen-view';
  static const String addScratchCardScreenViewRoute =
      '/add-scratch-card-screen-view';
  static const String subscriptionScreenViewRoute = '/subscription-screen-view';
  static const String trialEndedSubjectListScreenViewRoute =
      '/trial-ended-subject-list-screen-view';
  static const String chapterListScreenViewRoute = '/chapter-list-screen-view';
  static const String chapterProgressScreenViewRoute =
      '/chapter-progress-screen-view';
  static const String topicDetailsScreenViewRoute =
      '/topic-details-screen-view';
  static const String topicConceptScreenViewRoute =
      '/topic-concept-screen-view';
  static const String topicExerciseScreenViewRoute =
      '/topic-exercise-screen-view';
  static const String exerciseQuestionScreenViewRoute =
      '/exercise-question-screen-view';
  static const String subjectQuizListScreenViewRoute =
      '/subject-quiz-list-screen-view';
  static const String SubjectQuizScreenViewRoute = '/subject-quiz-screen-view';
  static const String subjectQuizResultScreenViewRoute =
      '/subject-quiz-result-screen-view';
  static const String customSubjectQuizSelectChaptersAndTopicsScreenViewRoute =
      '/custom-subject-quiz-select-chapters-and-topics-screen-view';
  static const String getCustomQuizScreenViewRoute =
      '/get-custom-quiz-screen-view';
  static const String customQuizQuestionScreenViewRoute =
      '/custom-quiz-question-screen-view';
  static const String customQuizOldResultScreenViewRoute =
      '/custom-quiz-old-result-screen-view';
  static const String aboutUsScreenViewRoute = '/about-us-screen-view';
  static const String feedbackScreenViewRoute = '/feedback-screen-view';
  static const String contactUsScreenViewRoute = '/contact-us-screen-view';
  static const String documentViewerScreenViewRoute =
      '/document-viewer-screen-view';
  static const String chapterQuizListScreenViewRoute =
      '/chapter-quiz-list-screen-view';
  static const all = <String>{
    rootViewRoute,
    loginViewRoute,
    registerViewRoute,
    otpViewRoute,
    forgotOtpViewRoute,
    ForgotPasswordViewRoute,
    ResetPasswordView,
    userProfileViewRoute,
    homeViewRoute,
    addSubjectScreenViewRoute,
    addScratchCardScreenViewRoute,
    subscriptionScreenViewRoute,
    trialEndedSubjectListScreenViewRoute,
    chapterListScreenViewRoute,
    chapterProgressScreenViewRoute,
    topicDetailsScreenViewRoute,
    topicConceptScreenViewRoute,
    topicExerciseScreenViewRoute,
    exerciseQuestionScreenViewRoute,
    subjectQuizListScreenViewRoute,
    SubjectQuizScreenViewRoute,
    subjectQuizResultScreenViewRoute,
    customSubjectQuizSelectChaptersAndTopicsScreenViewRoute,
    getCustomQuizScreenViewRoute,
    customQuizQuestionScreenViewRoute,
    customQuizOldResultScreenViewRoute,
    aboutUsScreenViewRoute,
    feedbackScreenViewRoute,
    contactUsScreenViewRoute,
    documentViewerScreenViewRoute,
    chapterQuizListScreenViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootViewRoute, page: RootView),
    RouteDef(Routes.loginViewRoute, page: LoginView),
    RouteDef(Routes.registerViewRoute, page: RegisterView),
    RouteDef(Routes.otpViewRoute, page: OtpView),
    RouteDef(Routes.forgotOtpViewRoute, page: ForgotOtpView),
    RouteDef(Routes.ForgotPasswordViewRoute, page: ForgotPasswordView),
    RouteDef(Routes.ResetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.userProfileViewRoute, page: UserProfileView),
    RouteDef(Routes.homeViewRoute, page: HomeScreenView),
    RouteDef(Routes.addSubjectScreenViewRoute, page: AddSubjectScreenView),
    RouteDef(Routes.addScratchCardScreenViewRoute,
        page: AddScratchCardScreenView),
    RouteDef(Routes.subscriptionScreenViewRoute, page: SubscriptionScreenView),
    RouteDef(Routes.trialEndedSubjectListScreenViewRoute,
        page: TrialEndedSubjectListScreenView),
    RouteDef(Routes.chapterListScreenViewRoute, page: ChapterListScreenView),
    RouteDef(Routes.chapterProgressScreenViewRoute,
        page: ChapterProgressScreenView),
    RouteDef(Routes.topicDetailsScreenViewRoute, page: TopicDetailsScreenView),
    RouteDef(Routes.topicConceptScreenViewRoute, page: TopicConceptScreenView),
    RouteDef(Routes.topicExerciseScreenViewRoute,
        page: TopicExerciseScreenView),
    RouteDef(Routes.exerciseQuestionScreenViewRoute,
        page: ExerciseQuestionScreenView),
    RouteDef(Routes.subjectQuizListScreenViewRoute,
        page: SubjectQuizListScreenView),
    RouteDef(Routes.SubjectQuizScreenViewRoute, page: SubjectQuizScreenView),
    RouteDef(Routes.subjectQuizResultScreenViewRoute,
        page: SubjectQuizResultScreenView),
    RouteDef(Routes.customSubjectQuizSelectChaptersAndTopicsScreenViewRoute,
        page: CustomSubjectQuizSelectChaptersAndTopicsScreenView),
    RouteDef(Routes.getCustomQuizScreenViewRoute,
        page: GetCustomQuizScreenView),
    RouteDef(Routes.customQuizQuestionScreenViewRoute,
        page: CustomQuizQuestionScreenView),
    RouteDef(Routes.customQuizOldResultScreenViewRoute,
        page: CustomQuizOldResultScreenView),
    RouteDef(Routes.aboutUsScreenViewRoute, page: AboutUsScreenView),
    RouteDef(Routes.feedbackScreenViewRoute, page: FeedbackScreenView),
    RouteDef(Routes.contactUsScreenViewRoute, page: ContactUsScreenView),
    RouteDef(Routes.documentViewerScreenViewRoute,
        page: DocumentViewerScreenView),
    RouteDef(Routes.chapterQuizListScreenViewRoute,
        page: ChapterQuizListScreenView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RootView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RootView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => OtpViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OtpView(
          key: args.key,
          phoneNumber: args.phoneNumber,
          firstName: args.firstName,
          lastName: args.lastName,
          email: args.email,
          password: args.password,
        ),
        settings: data,
      );
    },
    ForgotOtpView: (data) {
      final args = data.getArgs<ForgotOtpViewArguments>(
        orElse: () => ForgotOtpViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotOtpView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      final args = data.getArgs<ResetPasswordViewArguments>(
        orElse: () => ResetPasswordViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResetPasswordView(
          key: args.key,
          userId: args.userId,
        ),
        settings: data,
      );
    },
    UserProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileView(),
        settings: data,
      );
    },
    HomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreenView(),
        settings: data,
      );
    },
    AddSubjectScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddSubjectScreenView(),
        settings: data,
      );
    },
    AddScratchCardScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddScratchCardScreenView(),
        settings: data,
      );
    },
    SubscriptionScreenView: (data) {
      final args = data.getArgs<SubscriptionScreenViewArguments>(
        orElse: () => SubscriptionScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubscriptionScreenView(
          key: args.key,
          subjectId: args.subjectId,
          subjectName: args.subjectName,
        ),
        settings: data,
      );
    },
    TrialEndedSubjectListScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TrialEndedSubjectListScreenView(),
        settings: data,
      );
    },
    ChapterListScreenView: (data) {
      final args = data.getArgs<ChapterListScreenViewArguments>(
        orElse: () => ChapterListScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChapterListScreenView(
          key: args.key,
          subjectDetails: args.subjectDetails,
        ),
        settings: data,
      );
    },
    ChapterProgressScreenView: (data) {
      final args = data.getArgs<ChapterProgressScreenViewArguments>(
        orElse: () => ChapterProgressScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChapterProgressScreenView(
          key: args.key,
          subjectDetails: args.subjectDetails,
        ),
        settings: data,
      );
    },
    TopicDetailsScreenView: (data) {
      final args = data.getArgs<TopicDetailsScreenViewArguments>(
        orElse: () => TopicDetailsScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TopicDetailsScreenView(
          key: args.key,
          topicDetails: args.topicDetails,
        ),
        settings: data,
      );
    },
    TopicConceptScreenView: (data) {
      final args = data.getArgs<TopicConceptScreenViewArguments>(
        orElse: () => TopicConceptScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TopicConceptScreenView(
          key: args.key,
          topicDetails: args.topicDetails,
        ),
        settings: data,
      );
    },
    TopicExerciseScreenView: (data) {
      final args = data.getArgs<TopicExerciseScreenViewArguments>(
        orElse: () => TopicExerciseScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TopicExerciseScreenView(
          key: args.key,
          topicDetails: args.topicDetails,
        ),
        settings: data,
      );
    },
    ExerciseQuestionScreenView: (data) {
      final args = data.getArgs<ExerciseQuestionScreenViewArguments>(
        orElse: () => ExerciseQuestionScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ExerciseQuestionScreenView(
          key: args.key,
          questionType: args.questionType,
          questionTypeColor: args.questionTypeColor,
          exerciseId: args.exerciseId,
          questionGroup: args.questionGroup,
        ),
        settings: data,
      );
    },
    SubjectQuizListScreenView: (data) {
      final args = data.getArgs<SubjectQuizListScreenViewArguments>(
        orElse: () => SubjectQuizListScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubjectQuizListScreenView(
          key: args.key,
          subjectDetails: args.subjectDetails,
        ),
        settings: data,
      );
    },
    SubjectQuizScreenView: (data) {
      final args = data.getArgs<SubjectQuizScreenViewArguments>(
        orElse: () => SubjectQuizScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubjectQuizScreenView(
          key: args.key,
          quizDetails: args.quizDetails,
        ),
        settings: data,
      );
    },
    SubjectQuizResultScreenView: (data) {
      final args = data.getArgs<SubjectQuizResultScreenViewArguments>(
        orElse: () => SubjectQuizResultScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubjectQuizResultScreenView(
          key: args.key,
          quizId: args.quizId,
          quizType: args.quizType,
        ),
        settings: data,
      );
    },
    CustomSubjectQuizSelectChaptersAndTopicsScreenView: (data) {
      final args = data
          .getArgs<CustomSubjectQuizSelectChaptersAndTopicsScreenViewArguments>(
        orElse: () =>
            CustomSubjectQuizSelectChaptersAndTopicsScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            CustomSubjectQuizSelectChaptersAndTopicsScreenView(
          key: args.key,
          subjectDetails: args.subjectDetails,
        ),
        settings: data,
      );
    },
    GetCustomQuizScreenView: (data) {
      final args = data.getArgs<GetCustomQuizScreenViewArguments>(
        orElse: () => GetCustomQuizScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => GetCustomQuizScreenView(
          key: args.key,
          subjectId: args.subjectId,
          topicIdList: args.topicIdList,
        ),
        settings: data,
      );
    },
    CustomQuizQuestionScreenView: (data) {
      final args = data.getArgs<CustomQuizQuestionScreenViewArguments>(
        orElse: () => CustomQuizQuestionScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomQuizQuestionScreenView(
          key: args.key,
          subjectId: args.subjectId,
          topicIdList: args.topicIdList,
          mutliple: args.mutliple,
          trueFalse: args.trueFalse,
          oneWord: args.oneWord,
        ),
        settings: data,
      );
    },
    CustomQuizOldResultScreenView: (data) {
      final args = data.getArgs<CustomQuizOldResultScreenViewArguments>(
        orElse: () => CustomQuizOldResultScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomQuizOldResultScreenView(
          key: args.key,
          subjectId: args.subjectId,
        ),
        settings: data,
      );
    },
    AboutUsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUsScreenView(),
        settings: data,
      );
    },
    FeedbackScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeedbackScreenView(),
        settings: data,
      );
    },
    ContactUsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContactUsScreenView(),
        settings: data,
      );
    },
    DocumentViewerScreenView: (data) {
      final args = data.getArgs<DocumentViewerScreenViewArguments>(
        orElse: () => DocumentViewerScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DocumentViewerScreenView(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
        settings: data,
      );
    },
    ChapterQuizListScreenView: (data) {
      final args = data.getArgs<ChapterQuizListScreenViewArguments>(
        orElse: () => ChapterQuizListScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChapterQuizListScreenView(
          key: args.key,
          chapterDetails: args.chapterDetails,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OtpView arguments holder class
class OtpViewArguments {
  final Key key;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  OtpViewArguments(
      {this.key,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.email,
      this.password});
}

/// ForgotOtpView arguments holder class
class ForgotOtpViewArguments {
  final Key key;
  final String phoneNumber;
  ForgotOtpViewArguments({this.key, this.phoneNumber});
}

/// ResetPasswordView arguments holder class
class ResetPasswordViewArguments {
  final Key key;
  final String userId;
  ResetPasswordViewArguments({this.key, this.userId});
}

/// SubscriptionScreenView arguments holder class
class SubscriptionScreenViewArguments {
  final Key key;
  final String subjectId;
  final String subjectName;
  SubscriptionScreenViewArguments({this.key, this.subjectId, this.subjectName});
}

/// ChapterListScreenView arguments holder class
class ChapterListScreenViewArguments {
  final Key key;
  final Map<String, dynamic> subjectDetails;
  ChapterListScreenViewArguments({this.key, this.subjectDetails});
}

/// ChapterProgressScreenView arguments holder class
class ChapterProgressScreenViewArguments {
  final Key key;
  final Map<String, dynamic> subjectDetails;
  ChapterProgressScreenViewArguments({this.key, this.subjectDetails});
}

/// TopicDetailsScreenView arguments holder class
class TopicDetailsScreenViewArguments {
  final Key key;
  final Map<String, dynamic> topicDetails;
  TopicDetailsScreenViewArguments({this.key, this.topicDetails});
}

/// TopicConceptScreenView arguments holder class
class TopicConceptScreenViewArguments {
  final Key key;
  final Map<String, dynamic> topicDetails;
  TopicConceptScreenViewArguments({this.key, this.topicDetails});
}

/// TopicExerciseScreenView arguments holder class
class TopicExerciseScreenViewArguments {
  final Key key;
  final Map<String, dynamic> topicDetails;
  TopicExerciseScreenViewArguments({this.key, this.topicDetails});
}

/// ExerciseQuestionScreenView arguments holder class
class ExerciseQuestionScreenViewArguments {
  final Key key;
  final String questionType;
  final Color questionTypeColor;
  final String exerciseId;
  final String questionGroup;
  ExerciseQuestionScreenViewArguments(
      {this.key,
      this.questionType,
      this.questionTypeColor,
      this.exerciseId,
      this.questionGroup});
}

/// SubjectQuizListScreenView arguments holder class
class SubjectQuizListScreenViewArguments {
  final Key key;
  final Map<String, dynamic> subjectDetails;
  SubjectQuizListScreenViewArguments({this.key, this.subjectDetails});
}

/// SubjectQuizScreenView arguments holder class
class SubjectQuizScreenViewArguments {
  final Key key;
  final Map<String, dynamic> quizDetails;
  SubjectQuizScreenViewArguments({this.key, this.quizDetails});
}

/// SubjectQuizResultScreenView arguments holder class
class SubjectQuizResultScreenViewArguments {
  final Key key;
  final String quizId;
  final String quizType;
  SubjectQuizResultScreenViewArguments({this.key, this.quizId, this.quizType});
}

/// CustomSubjectQuizSelectChaptersAndTopicsScreenView arguments holder class
class CustomSubjectQuizSelectChaptersAndTopicsScreenViewArguments {
  final Key key;
  final Map<String, dynamic> subjectDetails;
  CustomSubjectQuizSelectChaptersAndTopicsScreenViewArguments(
      {this.key, this.subjectDetails});
}

/// GetCustomQuizScreenView arguments holder class
class GetCustomQuizScreenViewArguments {
  final Key key;
  final String subjectId;
  final String topicIdList;
  GetCustomQuizScreenViewArguments(
      {this.key, this.subjectId, this.topicIdList});
}

/// CustomQuizQuestionScreenView arguments holder class
class CustomQuizQuestionScreenViewArguments {
  final Key key;
  final String subjectId;
  final String topicIdList;
  final String mutliple;
  final String trueFalse;
  final String oneWord;
  CustomQuizQuestionScreenViewArguments(
      {this.key,
      this.subjectId,
      this.topicIdList,
      this.mutliple,
      this.trueFalse,
      this.oneWord});
}

/// CustomQuizOldResultScreenView arguments holder class
class CustomQuizOldResultScreenViewArguments {
  final Key key;
  final String subjectId;
  CustomQuizOldResultScreenViewArguments({this.key, this.subjectId});
}

/// DocumentViewerScreenView arguments holder class
class DocumentViewerScreenViewArguments {
  final Key key;
  final String title;
  final String url;
  DocumentViewerScreenViewArguments({this.key, this.title, this.url});
}

/// ChapterQuizListScreenView arguments holder class
class ChapterQuizListScreenViewArguments {
  final Key key;
  final Map<String, dynamic> chapterDetails;
  ChapterQuizListScreenViewArguments({this.key, this.chapterDetails});
}
