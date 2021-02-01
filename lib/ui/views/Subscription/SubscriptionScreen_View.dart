import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/Subscription/SubscriptionScreen_ViewModel.dart';

class SubscriptionScreenView extends StatelessWidget {
  final String subjectId;
  final String subjectName;

  const SubscriptionScreenView({Key key, this.subjectId, this.subjectName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubscriptionScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(subjectId),
      viewModelBuilder: () => SubscriptionScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Subscribe Now',
            ),
            titleSpacing: 4.0,
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    'DEMO Subject Plans',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Price',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: model.yearSelected,
                                        onChanged: (value) {
                                          model.setYearSelected(value);
                                        },
                                      ),
                                      Text('1 Year')
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text('Rs. ${model.price}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 2.0,
                      color: Theme.of(context).primaryColor,
                      thickness: 2.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total'),
                          Text(
                              'Rs. ${model.yearSelected ? model.price.toString() : 0.0}'),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST (18%)',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            'Rs. ${model.yearSelected ? model.gst : 0.0}',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
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
                          Text(
                            'Use Wallet\n (Credit Balance: Rs.${model.walletBalance})',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            'Rs. -${model.useWallet}',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 2.0,
                      color: Theme.of(context).primaryColor,
                      thickness: 2.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            'Rs. ${model.grandTotal}',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    'PAY',
                    style: Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: model.yearSelected
                      ? () {
                          if ((model.walletDetails != null &&
                              double.parse(model.walletDetails['balance']) >
                                  ((model.planDetails != null)
                                      ? double.parse(model.planDetails['price'])
                                      : 0.0))) {}
                          model.checkout(
                              subjectId, subjectName, model.grandTotal);
                        }
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
