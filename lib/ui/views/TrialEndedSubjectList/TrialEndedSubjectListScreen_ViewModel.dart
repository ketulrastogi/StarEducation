import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';

class TrialEndedSubjectListScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToSubscriptionService() {
    _navigationService.navigateTo(Routes.subscriptionScreenViewRoute);
  }
}
