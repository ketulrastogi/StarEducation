import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/AddSubject/AddSubjectScreen_ViewModel.dart';
import 'package:stareducation/ui/views/home/HomeScreen_View.dart';

class AddSubjectScreenView extends StatefulWidget {
  @override
  _AddSubjectScreenViewState createState() => _AddSubjectScreenViewState();
}

class _AddSubjectScreenViewState extends State<AddSubjectScreenView> {
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSubjectScreenViewModel>.reactive(
      onModelReady: (model) => model.getBoardMediumStandardData(),
      viewModelBuilder: () => AddSubjectScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add New Subject'),
            titleSpacing: 4.0,
          ),
          bottomNavigationBar: (model.selectedSubject != null)
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'ADD',
                      style: Theme.of(context).textTheme.button.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () async {
                      print(formKey.currentState.validate());
                      await model.addSubject();
                    },
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
                    value: model.board,
                    required: true,
                    onSaved: (value) {
                      model.setBoard(value);
                    },
                    onChanged: (value) {
                      print('Board: $value');
                      model.setBoard(value);
                    },
                    dataSource: (model.boardMediumStandardList != null)
                        ? model.boardMediumStandardList['view_board']
                        : [],
                    textField: 'board_name',
                    valueField: 'id',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: DropDownFormField(
                    titleText: 'Medium',
                    hintText: 'Select Medium',
                    value: model.medium,
                    required: true,
                    onSaved: (value) {
                      model.setMedium(value);
                    },
                    onChanged: (value) {
                      print('Medium: $value');
                      model.setMedium(value);
                    },
                    dataSource: (model.boardMediumStandardList != null)
                        ? model.boardMediumStandardList['view_medium']
                        : [],
                    textField: 'medium_name',
                    valueField: 'mid',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: DropDownFormField(
                    titleText: 'Standard',
                    hintText: 'Select Standard',
                    value: model.standard,
                    required: true,
                    onSaved: (value) {
                      model.setStandard(value);
                    },
                    onChanged: (value) {
                      print('Standard: $value');
                      model.setStandard(value);
                    },
                    dataSource: (model.boardMediumStandardList != null)
                        ? model.boardMediumStandardList['view_standard']
                        : [],
                    textField: 'standard',
                    valueField: 'std_id',
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
                      'SUBMIT',
                      style: Theme.of(context).textTheme.button.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () async {
                      print(formKey.currentState.validate());
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        print(
                            'Board: ${model.board}, Medium: ${model.medium}, Standard: ${model.standard}');
                        if (model.board != null &&
                            model.medium != null &&
                            model.standard != null) {
                          // model.validateForm(true);
                          await model.getSubjectList();
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                (model.subjectList.length > 0)
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
                (model.subjectList.length > 0)
                    ? ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: model.subjectList
                            .map(
                              (data) => InkWell(
                                onTap: () {
                                  model.selectSubject(data);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: ListTile(
                                    // height: 120.0,
                                    // width: MediaQuery.of(context).size.height / 2,
                                    title: Text(data['subject']),
                                    leading: (model.selectedSubject != null &&
                                            data['sub_id'] ==
                                                model.selectedSubject['sub_id'])
                                        ? Icon(
                                            Icons.done,
                                            size: 32.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
