import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/register/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 48.0,
                    ),
                    Container(
                      child: Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _fNameController,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          labelText: 'First Name',
                          filled: true,
                        ),
                        onSaved: (String value) {
                          model.setFirstName(value);
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'First Name can not be empty';
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
                        controller: _lNameController,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          filled: true,
                        ),
                        onSaved: (String value) {
                          model.setLastName(value);
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Last Name can not be empty';
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
                        controller: _phoneController,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
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
                      height: 8.0,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _emailController,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          filled: true,
                        ),
                        onSaved: (String value) {
                          model.setEmail(value);
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Email can not be empty';
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
                        controller: _passwordController,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
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
                          model.setPassword(value);
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
                      height: 16.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        color: Theme.of(context).accentColor,
                        child: (model.isBusy)
                            ? Container(
                                height: 18.0,
                                width: 18.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                'REGISTER',
                                style:
                                    Theme.of(context).textTheme.button.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                              ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            model.registerUser();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    InkWell(
                      onTap: () {
                        print('SignUp Linked Tapped');
                        model.navigateToLoginView();
                      },
                      child: Container(
                        child: Text(
                          'Already have an account? Sign In',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                // fontSize: 18.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
