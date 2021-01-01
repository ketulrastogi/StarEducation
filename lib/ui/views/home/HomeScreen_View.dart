import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/widgets/Drawer.dart';
import 'package:stareducation/ui/views/home/HomeScreen_ViewModel.dart';
import 'package:stareducation/ui/widgets/PopularVideoList/PopularVideoListWidget_View.dart';

class HomeScreenView extends StatelessWidget {
  final Map<String, dynamic> userProfile;

  const HomeScreenView({Key key, this.userProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      onModelReady: (model) => model.getUserSubject(),
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Star Education'),
            titleSpacing: 4.0,
            iconTheme: IconThemeData(
              size: 40.0,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                ),
                onPressed: () {
                  model.navigateToUserProfileScreen();
                },
              ),
            ],
          ),
          drawer: buildDrawer(context, userProfile),
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 - 20,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.6,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(64.0),
                            bottomRight: Radius.circular(64.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                'Welcome Back \n${userProfile['first_name']} ${userProfile['last_name']}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              height: 130.0,
                              width: 130.0,
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset('assets/reading.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          // initialValue: 'Input text',
                          decoration: InputDecoration(
                            hintText: 'Search Subject',
                            // labelText: 'Label text',
                            // labelStyle: TextStyle(
                            //   color: Color(0xFF6200EE),
                            // ),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                            // isDense: true,
                            contentPadding: EdgeInsets.only(left: 24.0),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(16.0),

                                ),
                            enabledBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 24.0,
                      right: 24.0,
                      child: Container(
                        height: 96.0,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                'Do you want to add\n new subjects ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              child: RaisedButton(
                                padding: EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                color: Colors.indigo,
                                child: Text(
                                  'Click Here',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                onPressed: () {
                                  model.navigateToAddSubjectScreen();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Enrolled Subjects',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey.shade700,
                      ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                // height: 150.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.userSubjectList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 100.0,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    model.userSubjectList[index]['board_name'],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                ),
                                Container(
                                  child: Text(
                                    model.userSubjectList[index]['medium_name'],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                ),
                                Container(
                                  child: Text(
                                    model.userSubjectList[index]['standard'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100.0,
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 8.0),
                              itemCount: model
                                  .userSubjectList[index]['subject'].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, sindex) {
                                return InkWell(
                                  onTap: () {
                                    // print(model.userSubjectList[index]
                                    //     ['subject'][sindex]);
                                    model.navigateToChapterListScreen(
                                        model.userSubjectList[index]['subject']
                                            [sindex]);
                                  },
                                  child: Card(
                                    color: Theme.of(context).primaryColor,
                                    child: Container(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          model.userSubjectList[index]
                                              ['subject'][sindex]['subject'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
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
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: PopularVideoListWidgetView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
