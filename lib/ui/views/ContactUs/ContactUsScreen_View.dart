import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreenView extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
        ),
        titleSpacing: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.network(
                'https://i.pinimg.com/originals/5d/2d/95/5d2d955df2895ca18dec554b0e716042.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Need Help?',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                '+91 12345 12345',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'test@gmail.com',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await launchURL('http://www.facebook.com');
                    },
                    child: Container(
                      height: 64.0,
                      width: 64.0,
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/174/174848.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  InkWell(
                    onTap: () async {
                      await launchURL('http://www.twitter.com');
                    },
                    child: Container(
                      height: 64.0,
                      width: 64.0,
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/124/124021.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  InkWell(
                    onTap: () async {
                      await launchURL('http://www.instagram.com');
                    },
                    child: Container(
                      height: 64.0,
                      width: 64.0,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/240px-Instagram_logo_2016.svg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
