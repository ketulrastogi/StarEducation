import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ForgotPassword/ForgotPassword_ViewModel.dart';

class ForgotPasswordView extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
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
                            controller: _phoneController,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                            decoration: InputDecoration(
                              hintText: '9876543210',
                              labelText: 'Phone Number',
                              prefixText: '+ 91  ',
                              filled: true,
                            ),
                            keyboardType: TextInputType.phone,
                            onSaved: (String value) {
                              model.setPhoneNumber(value);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Phone number can not be empty';
                              } else if (value.length != 10) {
                                return 'Phone number must be of 10 digits';
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
                                    'SEND',
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
                                await model.sendOtp();
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
