import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:stareducation/ui/views/AddSubject/AddSubjectScreen_View.dart';
import 'package:stareducation/ui/views/ChapterList/ChapterListScreen_View.dart';
import 'package:stareducation/ui/views/ChapterProgress/ChapterProgressScreen_View.dart';
import 'package:stareducation/ui/views/ForgotOtp/ForgotOtp_View.dart';
import 'package:stareducation/ui/views/ForgotPassword/ForgotPassword_View.dart';
import 'package:stareducation/ui/views/ResetPassword/ResetPassword_View.dart';
import 'package:stareducation/ui/views/SubjectQuiz/SubjectQuizScreen_View.dart';
import 'package:stareducation/ui/views/Subscription/SubscriptionScreen_View.dart';
import 'package:stareducation/ui/views/TopicConcept/TopicConceptScreen_View.dart';
import 'package:stareducation/ui/views/TopicDetails/TopicDetailsScreen_View.dart';
import 'package:stareducation/ui/views/TopicExercise/TopicExerciseScreen_View.dart';
import 'package:stareducation/ui/views/TrialEndedSubjectList/TrialEndedSubjectListScreen_View.dart';
import 'package:stareducation/ui/views/home/HomeScreen_View.dart';
import 'package:stareducation/ui/views/login/login_view.dart';
import 'package:stareducation/ui/views/register/register_view.dart';
import 'package:stareducation/ui/views/root/root_view.dart';
import 'package:stareducation/ui/views/user_profile/user_profile_view.dart';
import 'package:stareducation/ui/views/otp/otp_view.dart';
import 'package:stareducation/ui/views/AddScratchCard/AddScratchCardScreen_View.dart';
import 'package:stareducation/ui/views/ExerciseQuestion/ExerciseQuestionScreen_View.dart';
import 'package:stareducation/ui/views/SubjectQuizList/SubjectQuizListScreen_View.dart';
import 'package:stareducation/ui/views/SubjectQuizResult/SubjectQuizResultScreen_View.dart';
import 'package:stareducation/ui/views/CustomSubjectQuizSelectChaptersAndTopics/CustomSubjectQuizSelectChaptersAndTopicsScreen_View.dart';
import 'package:stareducation/ui/views/GetCustomQuiz/GetCustomQuizScreen_View.dart';
import 'package:stareducation/ui/views/CustomQuizQuestion/CustomQuizQuestionScreen_View.dart';
import 'package:stareducation/ui/views/CustomQuizOldResult/CustomQuizOldResultScreen_View.dart';
import 'package:stareducation/ui/views/AboutUs/AboutUsScreen_View.dart';
import 'package:stareducation/ui/views/Feedback/FeedbackScreen_View.dart';
import 'package:stareducation/ui/views/ContactUs/ContactUsScreen_View.dart';

// Defining routes and global transitions
@CustomAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: RootView,
      name: 'rootViewRoute',
      initial: true,
    ),
    MaterialRoute(
      page: LoginView,
      name: 'loginViewRoute',
    ),
    MaterialRoute(
      page: RegisterView,
      name: 'registerViewRoute',
    ),
    MaterialRoute(
      page: OtpView,
      name: 'otpViewRoute',
    ),
    MaterialRoute(
      page: ForgotOtpView,
      name: 'forgotOtpViewRoute',
    ),
    MaterialRoute(
      page: ForgotPasswordView,
      name: 'ForgotPasswordViewRoute',
    ),
    MaterialRoute(
      page: ResetPasswordView,
      name: 'ResetPasswordView',
    ),
    MaterialRoute(
      page: UserProfileView,
      name: 'userProfileViewRoute',
    ),
    MaterialRoute(
      page: HomeScreenView,
      name: 'homeViewRoute',
    ),
    MaterialRoute(
      page: AddSubjectScreenView,
      name: 'addSubjectScreenViewRoute',
    ),
    MaterialRoute(
      page: AddScratchCardScreenView,
      name: 'addScratchCardScreenViewRoute',
    ),
    MaterialRoute(
      page: SubscriptionScreenView,
      name: 'subscriptionScreenViewRoute',
    ),
    MaterialRoute(
      page: TrialEndedSubjectListScreenView,
      name: 'trialEndedSubjectListScreenViewRoute',
    ),
    MaterialRoute(
      page: ChapterListScreenView,
      name: 'chapterListScreenViewRoute',
    ),
    MaterialRoute(
      page: ChapterProgressScreenView,
      name: 'chapterProgressScreenViewRoute',
    ),
    MaterialRoute(
      page: TopicDetailsScreenView,
      name: 'topicDetailsScreenViewRoute',
    ),
    MaterialRoute(
      page: TopicConceptScreenView,
      name: 'topicConceptScreenViewRoute',
    ),
    MaterialRoute(
      page: TopicExerciseScreenView,
      name: 'topicExerciseScreenViewRoute',
    ),
    MaterialRoute(
      page: ExerciseQuestionScreenView,
      name: 'exerciseQuestionScreenViewRoute',
    ),
    MaterialRoute(
      page: SubjectQuizListScreenView,
      name: 'subjectQuizListScreenViewRoute',
    ),
    MaterialRoute(
      page: SubjectQuizScreenView,
      name: 'SubjectQuizScreenViewRoute',
    ),
    MaterialRoute(
      page: SubjectQuizResultScreenView,
      name: 'subjectQuizResultScreenViewRoute',
    ),
    MaterialRoute(
      page: CustomSubjectQuizSelectChaptersAndTopicsScreenView,
      name: 'customSubjectQuizSelectChaptersAndTopicsScreenViewRoute',
    ),
    MaterialRoute(
      page: GetCustomQuizScreenView,
      name: 'getCustomQuizScreenViewRoute',
    ),
    MaterialRoute(
      page: CustomQuizQuestionScreenView,
      name: 'customQuizQuestionScreenViewRoute',
    ),
    MaterialRoute(
      page: CustomQuizOldResultScreenView,
      name: 'customQuizOldResultScreenViewRoute',
    ),
    MaterialRoute(
      page: AboutUsScreenView,
      name: 'aboutUsScreenViewRoute',
    ),
    MaterialRoute(
      page: FeedbackScreenView,
      name: 'feedbackScreenViewRoute',
    ),
    MaterialRoute(
      page: ContactUsScreenView,
      name: 'contactUsScreenViewRoute',
    ),
    // MaterialRoute(
    //   page: HomeScreen,
    //   name: 'homeScreenRoute',
    // ),
  ],
  transitionsBuilder: TransitionsBuilders.slideLeft,
  durationInMilliseconds: 800,
)
class $Router {}
