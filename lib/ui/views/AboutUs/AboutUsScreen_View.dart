import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html_unescape/html_unescape.dart';

class AboutUsScreenView extends StatelessWidget {
  final unescape = new HtmlUnescape();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
        ),
        titleSpacing: 4.0,
      ),
      body: Container(
        child: Html(
          data: unescape.convert(
            "<h1 style=\"text-align:center\">Welcome to<br />\n" +
                "Star Education</h1>\n" +
                "\n" +
                "<p>A Star Education, a global education group, believes that outstanding academic results are critically important - but just one part of the journey students take to a bright tomorrow.<br />\n" +
                "<br />\n" +
                "Beyond helping students achieve demonstrable educational success, A Star&nbsp;Education is dedicated to equipping each learner with human skills that will become a key differentiating factor in a rapidly changing world.<br />\n" +
                "<br />\n" +
                "Our combined expertise in quality university &amp; career preparation, international education &amp; skill enhancements programs around the globe spans over 100 years. The long legacy and rich experience of A-Star&rsquo;s teams in collaboration with forward-thinking educational experts have created an unparalleled offering of superior academic and experiential programs that support the whole student journey.</p>",
          ),
          style: {
            "div": Style(
                // fontSize: FontSize(24.0),
                // textStyle: TextStyle(
                //   color: Colors.red,
                // ),
                ),
          },
        ),
        // child: Text(
        //   model.currentQuestion['title'],
        //   style: Theme.of(context).textTheme.headline5,
        //   // .copyWith(color: Theme.of(context).primaryColor),
        // ),
      ),
    );
  }
}
