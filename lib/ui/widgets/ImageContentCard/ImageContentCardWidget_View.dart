import 'package:flutter/material.dart';
import 'package:stareducation/ui/widgets/ImageContentCard/ImageContentCardWidgetView_ViewModel.dart';
import 'package:stacked/stacked.dart';

class ImageContentCardWidgetView extends StatelessWidget {
  final String imageUrl;

  const ImageContentCardWidgetView({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageContentCardWidgetViewModel>.reactive(
      viewModelBuilder: () => ImageContentCardWidgetViewModel(),
      builder: (context, model, child) {
        return Card(
          child: InteractiveViewer(
            child: Image.network('https://physics.aps.org/assets/bb70290a-ab2a-45ba-9040-6053a1e15d60/e24_1.png'),
          ),
        );
      },
    );
  }
}
