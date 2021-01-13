import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/Feedback/FeedbackScreen_ViewModel.dart';

class FeedbackScreenView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackScreenViewModel>.reactive(
      viewModelBuilder: () => FeedbackScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Feedback',
            ),
            titleSpacing: 4.0,
          ),
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
                      height: 32.0,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Title can not be empty.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.setTitle(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expert Code',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Expert Code can not be empty.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.setExpertCode(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                        minLines: 4,
                        maxLines: 4,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Description can not be empty.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.setDescription(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.all(16.0),
                      child: (model.isBusy)
                          ? Container(
                              height: 20.0,
                              width: 20.0,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            )
                          : Text(
                              'Submit',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          await model.submitFeedback();
                        }
                      },
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
