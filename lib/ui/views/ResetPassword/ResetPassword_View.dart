import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ResetPassword/ResetPassword_ViewModel.dart';

class ResetPasswordView extends StatelessWidget {
  final String userId;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordView({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      onModelReady: (model) => model.setUserId(userId),
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 64.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                    ),
                    child: Text(
                      'Enter Phone Number',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            controller: _newPasswordController,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                            decoration: InputDecoration(
                              hintText: '*******',
                              labelText: 'Password',
                              filled: true,
                            ),
                            obscureText: true,
                            onSaved: (String value) {
                              model.setNewPassword(value);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password can not be empty';
                              } else if (value.length < 6) {
                                return 'Password must be minimum 6 characters';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                            decoration: InputDecoration(
                              hintText: '*******',
                              labelText: 'Confirm Password',
                              filled: true,
                            ),
                            obscureText: true,
                            onSaved: (String value) {
                              model.setConfirmPassword(value);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Confirm Password can not be empty';
                              } else if (value.length < 6) {
                                return 'Confirm Password must be minimum 6 characters';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            color: Theme.of(context).accentColor,
                            child: model.isBusy
                                ? Container(
                                    height: 17.0,
                                    width: 17.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        Colors.white,
                                      ),
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Text(
                                    'UPDATE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                  ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                await model.resetPassword();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
