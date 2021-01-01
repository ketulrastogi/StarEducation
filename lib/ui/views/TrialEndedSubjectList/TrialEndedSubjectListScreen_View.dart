import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/TrialEndedSubjectList/TrialEndedSubjectListScreen_ViewModel.dart';

class TrialEndedSubjectListScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrialEndedSubjectListScreenViewModel>.reactive(
      viewModelBuilder: () => TrialEndedSubjectListScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Subscribe Subject'),
            titleSpacing: 4.0,
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 2.0,
                        ),
                        child: Text(
                          'DEMO Standard Standard',
                          style: Theme.of(context).textTheme.headline6.copyWith(
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
                          'DEMO Board Demo Medium',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Subject Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Exp. Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Buy Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Demo Subject',
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
                                '14/12/2020',
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
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.done_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  model.navigateToSubscriptionService();
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
            ],
          ),
        );
      },
    );
  }
}
