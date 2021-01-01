import 'package:flutter/material.dart';
import 'package:stareducation/Screens/AddSubjectScreen.dart';
import 'package:stareducation/Screens/ProfileScreen.dart';
import 'package:stareducation/ui/widgets/Drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // drawer: buildDrawer(context),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Welcome Back \n Bansi',
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
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
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
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
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddSubjectScreen(),
                                ),
                              );
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
                    color: Colors.grey.shade700,
                  ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: 150.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.height / 2,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                                'https://i.pinimg.com/474x/3f/d2/1d/3fd21d7f31126441b4e42b1369438cbc.jpg'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'Advance Physics',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Board : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Demo Board',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Medium : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Demo Medium',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Standard : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Demo Standard',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Daily Contents',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              10,
              (index) => Card(
                child: Container(
                  height: 128.0,
                  child: Center(
                    child: Text('Item $index'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
