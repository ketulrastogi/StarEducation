import 'package:flutter/material.dart';
import 'package:stareducation/ui/widgets/TextContentCard/TextContentCardWidget_ViewModel.dart';
import 'package:stacked/stacked.dart';

class TextContentCardWidgetView extends StatelessWidget {
  final String title;
  final String description;

  const TextContentCardWidgetView({Key key, this.title, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TextContentCardWidgetViewModel>.reactive(
      viewModelBuilder: () => TextContentCardWidgetViewModel(),
      builder: (context, model, child) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Text(
                    'About Hydroponics',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: Text(
                      'The visitors can see how plants grow without soil. Hydroponics Gallery focusses on the unique modern farming technique and the Science behind it. A live working farm has the potential to create awareness about the use of advance technology of farming and provide a platform for the farmers across the state to learn and adopt the techniques of soilless cultivation to harvest more from less.'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
