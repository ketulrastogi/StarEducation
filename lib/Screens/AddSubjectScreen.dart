import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:stareducation/Screens/HomeScreen.dart';
import 'package:stareducation/Screens/SubscriptionScreen.dart';

class AddSubjectScreen extends StatefulWidget {
  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  String _board;
  String _medium;
  String _standard;
  bool _selectedSubject = false;
  String _boardResult;
  String _mediumResult;
  String _standardResult;
  bool _formValid = false;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _board = '';
    _boardResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _boardResult = _board;
      });
    }
  }

  _selectSubject() {
    setState(() {
      _selectedSubject = !_selectedSubject;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Subject'),
        titleSpacing: 4.0,
      ),
      bottomNavigationBar: _selectedSubject
          ? Container(
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Try Now',
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Subscribe Now',
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SubscriptionScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Container(
              child: DropDownFormField(
                titleText: 'Board',
                hintText: 'Select Board',
                value: _board,
                required: true,
                onSaved: (value) {
                  setState(() {
                    _board = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _board = value;
                  });
                },
                dataSource: [
                  {
                    "display": "GSEB",
                    "value": "GSEB",
                  },
                  {
                    "display": "CSEB",
                    "value": "CSEB",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: DropDownFormField(
                titleText: 'Medium',
                hintText: 'Select Medium',
                value: _medium,
                required: true,
                onSaved: (value) {
                  setState(() {
                    _medium = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _medium = value;
                  });
                },
                dataSource: [
                  {
                    "display": "English",
                    "value": "English",
                  },
                  {
                    "display": "Gujarati",
                    "value": "Gujarati",
                  },
                  {
                    "display": "Hindi",
                    "value": "Hindi",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: DropDownFormField(
                titleText: 'Standard',
                hintText: 'Select Standard',
                value: _standard,
                required: true,
                onSaved: (value) {
                  setState(() {
                    _standard = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _standard = value;
                  });
                },
                dataSource: [
                  {
                    "display": "STD 10",
                    "value": "STD 10",
                  },
                  {
                    "display": "STD 11",
                    "value": "STD 11",
                  },
                  {
                    "display": "STD 12",
                    "value": "STD 12",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.button.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    if (_board != null &&
                        _medium != null &&
                        _standard != null) {
                      setState(() {
                        _formValid = true;
                      });
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            (_formValid)
                ? Container(
                    child: Text(
                      'Search Result (Subjects)',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 12.0,
            ),
            (_formValid)
                ? ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      InkWell(
                        onTap: () {
                          _selectSubject();
                        },
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                height: 120.0,
                                // width: MediaQuery.of(context).size.height / 2,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.network(
                                            'https://i.pinimg.com/474x/3f/d2/1d/3fd21d7f31126441b4e42b1369438cbc.jpg'),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Advance Physics',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Board : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  _board,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Medium : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  _medium,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Standard : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  _standard,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            _selectedSubject
                                ? Positioned(
                                    right: 16.0,
                                    top: 16.0,
                                    child: Icon(
                                      Icons.done,
                                      size: 40.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
