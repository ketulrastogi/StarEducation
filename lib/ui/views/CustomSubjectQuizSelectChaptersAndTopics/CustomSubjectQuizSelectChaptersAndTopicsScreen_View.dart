import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/CustomSubjectQuizSelectChaptersAndTopics/CustomSubjectQuizSelectChaptersAndTopicsScreen_ViewModel.dart';

class CustomSubjectQuizSelectChaptersAndTopicsScreenView
    extends StatelessWidget {
  final Map<String, dynamic> subjectDetails;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  CustomSubjectQuizSelectChaptersAndTopicsScreenView(
      {Key key, this.subjectDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<
        CustomSubjectQuizSelectChaptersAndTopicsScreenViewModel>.reactive(
      onModelReady: (model) => model.getChapterListFromBackend(subjectDetails),
      viewModelBuilder: () =>
          CustomSubjectQuizSelectChaptersAndTopicsScreenViewModel(),
      builder: (context, model, child) {
        print('View:28 - TopicList: ${model.topicList}');
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Select Chapters & Topics',
            ),
            titleSpacing: 4.0,
          ),
          // bottomNavigationBar: MaterialButton(
          //   child: Text(
          //     'Previous Custom Quiz Result',
          //     style: Theme.of(context).textTheme.headline6.copyWith(
          //           color: Theme.of(context).primaryColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //   ),
          //   onPressed: () {
          //     model.navigateToCustomQuizOldResultScreen(
          //         subjectDetails['sub_id']);
          //   },
          // ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                MultiSelectFormField(
                  autovalidate: false,
                  chipBackGroundColor: Theme.of(context).accentColor,
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  fillColor: Colors.grey.shade200,
                  // checkBoxActiveColor: Colors.red,
                  // checkBoxCheckColor: Colors.green,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Chapters",
                    style: TextStyle(fontSize: 16),
                  ),
                  dataSource:
                      (model.chapterList.length == 0) ? [] : model.chapterList,

                  textField: 'chapter_name',
                  valueField: 'chap_id',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please Select Chapters'),
                  initialValue: model.selectedChapterIdList,
                  // change: (value) {
                  //   if (value == null) return;
                  //   model.setSelectedChapterTextList([...value]);
                  // },
                  onSaved: (value) {
                    if (value == null) return;
                    model.setSelectedChapterTextList([...value]);
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                (model.topicList.length > 0)
                    ? MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Theme.of(context).accentColor,
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        fillColor: Colors.grey.shade200,
                        // checkBoxActiveColor: Colors.red,
                        // checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "Topics",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: model.topicList,

                        textField: 'topic_name',
                        valueField: 'top_id',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('Please Select Topics'),
                        // initialValue: model.selectedTopicIdList,
                        onSaved: (value) {
                          if (value == null) return;
                          model.setSelectedTopicTextList([...value]);
                        },
                      )
                    : SizedBox(),
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
                    onPressed: (model.selectedTopicList.length == 0)
                        ? null
                        : () async {
                            print(formKey.currentState.validate());
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              if (model.selectedChapterIdList.length > 0 &&
                                  model.selectedTopicIdList.length > 0) {
                                model.navigateToGetCustomQuizScreen(
                                    subjectDetails['sub_id']);
                              }
                            }
                          },
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
