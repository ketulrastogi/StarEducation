import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/TrialEndedSubjectList/TrialEndedSubjectListScreen_ViewModel.dart';

class TrialEndedSubjectListScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrialEndedSubjectListScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(),
      viewModelBuilder: () => TrialEndedSubjectListScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Subscribe Subject'),
            titleSpacing: 4.0,
          ),
          body: (model.subjectList.length > 0)
              ? ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    ...model.subjectList
                        .map(
                          (data) => Card(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 2.0,
                                    ),
                                    child: Text(
                                      '${data['standard']} Standard',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                      '${data['board_name']} ${data['medium_name']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              // fontWeight: FontWeight.bold,
                                              ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  ...data['subject']
                                      .map(
                                        (subject) => Container(
                                          margin: EdgeInsets.only(bottom: 16.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'Subject Name',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Exp. Date',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              '  Status  ',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        '${subject['subject']}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1
                                                            .copyWith(
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.white,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '${model.formatDate(subject['expire_date'])}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1
                                                            .copyWith(
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.white,
                                                                ),
                                                      ),
                                                    ),
                                                    (!model.isSubscriptionActive(
                                                            subject[
                                                                'expire_date']))
                                                        ? MaterialButton(
                                                            color: Colors
                                                                .redAccent,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                24.0,
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 0.0,
                                                                    left: 0.0),
                                                            child: Text(
                                                              'Expired',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            onPressed: () {
                                                              model.navigateToSubscriptionService(
                                                                  subject[
                                                                      'sub_id'],
                                                                  subject[
                                                                      'subject']);
                                                            },
                                                          )
                                                        : MaterialButton(
                                                            color: Colors.green,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                24.0,
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 0.0,
                                                                    left: 0.0),
                                                            child: Text(
                                                              'Active',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()
                  ],
                )
              : Center(
                  child: Text('No subjects available.'),
                ),
        );
      },
    );
  }
}
