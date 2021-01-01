import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        titleSpacing: 4.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Full Name',
                labelText: 'Full Name',
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Birthdate',
                labelText: 'Birthdate',
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Update',
              style: Theme.of(context).textTheme.button.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => SubscriptionScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
