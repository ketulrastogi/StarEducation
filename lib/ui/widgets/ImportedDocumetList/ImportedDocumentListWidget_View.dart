import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/widgets/ImportedDocumetList/ImportedDocumentListWidget_ViewModel.dart';

class ImportedDocumentListWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImportedDocumentListWidgetViewModel>.reactive(
      onModelReady: (model) => model.getImportedDocumetns(),
      viewModelBuilder: () => ImportedDocumentListWidgetViewModel(),
      builder: (context, model, child) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Imported Documents',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey.shade700,
                      ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 150.0,
                child: ListView.builder(
                  // padding: EdgeInsets.only(left: 16.0),
                  itemCount: model.importedDocumentList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.pinkAccent,
                      child: InkWell(
                        onTap: () {
                          model.navigateToDocumentViewerScreen(
                              model.importedDocumentList[index]);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 48,
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '${model.importedDocumentList[index]['title']}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
