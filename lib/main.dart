import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/ui/setup_dialog_ui.dart';
import 'package:stareducation/ui/setup_snackbar_ui.dart';

import 'app/locator.dart';
import 'app/routes.gr.dart' as auto_router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Education',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.orange,
        // textTheme: textTheme,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: auto_router.Routes.rootViewRoute,
      onGenerateRoute: auto_router.Router().onGenerateRoute,
      // home: LocationRequestView(),
    );
  }
}
