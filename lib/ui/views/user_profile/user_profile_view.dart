import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stareducation/models/app_user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/user_profile/user_profile_viewmodel.dart';

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   if (widget.appUser != null) {
  //     //Controller Update
  //     _nameController.text = widget.appUser.displayName;
  //   }

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final MainCategoryProvider _mainCategoryProvider =
    //     Provider.of<MainCategoryProvider>(context);

    return ViewModelBuilder<UserProfileViewModel>.reactive(
      onModelReady: (model) async {
        await model.setAppUser();
        _fnameController.text = model.appUser.firstName;
        _lnameController.text = model.appUser.lastName;
        _emailController.text = model.appUser.email;
        _birthdateController.text = model.appUser.birthdate;
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _fnameController,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                  onChanged: (value) {
                    model.setFirstName(value);
                  },
                  onSaved: (value) {
                    model.setFirstName(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'First name must not be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    filled: true,
                    labelText: 'First Name',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _lnameController,
                  // initialValue: model.displayName,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                  onChanged: (value) {
                    model.setLastName(value);
                  },
                  onSaved: (value) {
                    model.setLastName(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Last name must not be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    filled: true,
                    labelText: 'Last Name',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _emailController,
                  // initialValue: model.email,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                  onChanged: (value) {
                    model.setEmail(value);
                  },
                  onSaved: (value) {
                    model.setEmail(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email name must not be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    filled: true,
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: TextFormField(
                    controller: _birthdateController,
                    // initialValue: model.birthdate,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                    decoration: InputDecoration(
                      hintText: 'DD/MM/YYYY',
                      labelText: 'Birthdate',
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      model.setBirthdate(value);
                    },
                    onSaved: (value) {
                      model.setBirthdate(value);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Birthdate must not be empty.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: model.isBusy
                      ? Container(
                          height: 16.0,
                          width: 16.0,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        )
                      : Text(
                          'Update',
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      model.updateUserProfile();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => UserProfileViewModel(),
    );
  }
}
