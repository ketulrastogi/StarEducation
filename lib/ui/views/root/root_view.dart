import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/constants/const.dart';
import 'package:stareducation/ui/views/root/root_viewmodel.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      onModelReady: (model) => model.checkAuthStatus(),
      viewModelBuilder: () => RootViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            // child: CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(kWhiteColor),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size:64.0, color: Colors.white,),
                Container(
                  height:64.0,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.white),
                  ),
                ),
                SizedBox(width:4.0),
                Text('Star\nEducation',
              style:Theme.of(context).textTheme.headline5.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),),
              ]
            ),
            
          ),
        );
      },
    );
  }
}
