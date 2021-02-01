import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/models/app_user_model.dart';
import 'package:stareducation/services/firebase_auth_service.dart';

class RootViewModel extends StreamViewModel<AppUser> {
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Stream<AppUser> get stream => _authService.onAuthStateChange();

  checkAuthStatus() async {
    await Future.delayed(Duration(seconds: 3));
    Map<String, dynamic> userProfile = await _authService.getUserProfile();
    if (userProfile != null && userProfile['mobile'] != null) {
      _navigationService.clearStackAndShow(Routes.homeViewRoute);
    } else {
      _navigationService.clearStackAndShow(Routes.loginViewRoute);
    }
    // stream.listen((AppUser appUser) {
    //   if (appUser != null) {
    //     print('User Phone: ${appUser.phoneNumber}');
    //     if (appUser.displayName != null && appUser.displayName.isNotEmpty) {
    //       _navigationService.navigateTo(Routes.homeViewRoute);
    //     } else {
    //       _navigationService.navigateTo(Routes.userProfileViewRoute);
    //     }
    //   } else {
    //     print('User Phone: null');
    //     _navigationService.navigateTo(Routes.loginViewRoute);
    //   }
    // });
  }
}
