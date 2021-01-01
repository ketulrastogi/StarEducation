// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/firebase_auth_service.dart';
import 'package:stareducation/Screens/AddSubjectScreen.dart';
import 'package:stareducation/Screens/ProfileScreen.dart';
import 'package:stareducation/Screens/TrialEndedSubjectScreen.dart';

buildDrawer(BuildContext context, Map<String, dynamic> userProfile) {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Icon(
                  Icons.person,
                  size: 48.0,
                  color: Colors.white,
                ),
              ),
              Container(
                child: Text(
                  '${userProfile['first_name']} ${userProfile['last_name']}',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Container(
                child: Text(
                  '${userProfile['mobile']}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          )),
        ),
        ListTile(
          title: Text('Profile'),
          leading: Icon(
            Icons.person,
          ),
          onTap: () {
            _navigationService.navigateTo(Routes.userProfileViewRoute);
          },
        ),
        ListTile(
          title: Text('Add New Subject'),
          leading: Icon(
            Icons.library_books,
          ),
          onTap: () {
            _navigationService.navigateTo(Routes.addSubjectScreenViewRoute);
          },
        ),
        ListTile(
          title: Text('Add Scratch Card'),
          leading: Icon(
            Icons.card_giftcard,
          ),
          onTap: () {
            _navigationService.navigateTo(Routes.addScratchCardScreenViewRoute);
          },
        ),
        ListTile(
          title: Text('Subscribe Now'),
          leading: Icon(
            Icons.rss_feed,
          ),
          onTap: () {
            _navigationService
                .navigateTo(Routes.trialEndedSubjectListScreenViewRoute);
          },
        ),
        ListTile(
          title: Text('About Us'),
          leading: Icon(
            Icons.apartment,
          ),
        ),
        ListTile(
          title: Text('Feedback'),
          leading: Icon(
            Icons.feedback,
          ),
        ),
        ListTile(
          title: Text('Contact Us'),
          leading: Icon(
            Icons.contact_mail,
          ),
        ),
        ListTile(
          title: Text('Share App'),
          leading: Icon(
            Icons.share,
          ),
        ),
        ListTile(
          title: Text('Logout'),
          leading: Icon(
            Icons.exit_to_app,
          ),
          onTap: () {
            _authService.signOut();
            _navigationService.clearStackAndShow(Routes.loginViewRoute);
          },
        ),
      ],
    ),
  );
}
