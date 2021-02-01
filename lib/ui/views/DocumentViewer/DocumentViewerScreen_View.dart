import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/DocumentViewer/DocumentViewerScreen_ViewModel.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class DocumentViewerScreenView extends StatelessWidget {
  final String title;
  final String url;

  const DocumentViewerScreenView({Key key, this.title, this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewerScreenViewModel>.reactive(
      viewModelBuilder: () => DocumentViewerScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                '$title',
              ),
              titleSpacing: 4.0,
            ),
            body: PDF().cachedFromUrl(
              '$url',
              placeholder: (progress) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (error) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
            ));
      },
    );
  }
}
