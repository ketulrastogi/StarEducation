import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stareducation/ui/views/ChapterList/ChapterListScreen_ViewModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:stareducation/ui/widgets/PopularVideoList/PopularVideoListWidget_View.dart';

class ChapterListScreenView extends StatelessWidget {
  final Map<String, dynamic> subjectDetails;

  const ChapterListScreenView({Key key, this.subjectDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChapterListScreenViewModel>.reactive(
      onModelReady: (model) => model.loadData(subjectDetails),
      viewModelBuilder: () => ChapterListScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Chapters',
            ),
            titleSpacing: 4.0,
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        subjectDetails['subject'],
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${subjectDetails['chapters']} Chapters',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            // fontWeight: FontWeight.bold,
                            // color: Colors.grey.shade800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Previous learning Topic',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              // color: Colors.grey.shade800,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          onTap: () async {
                            await model.navigateToTopicDetailsScreen(
                                model.lastTopicDetails);
                          },
                          leading: Container(
                            height: 64.0,
                            width: 64.0,
                            child: (model.lastTopicDetails != null)
                                ? Image.network(
                                    '${model.imageBaseUrl}${model.lastTopicDetails['top_thumbnail']}',
                                    fit: BoxFit.fill,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                          ),
                          title: Text(
                            '${(model.lastTopicDetails != null) ? model.lastTopicDetails['topic_name'] : ''}',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          subtitle: Text(
                            '${(model.lastTopicDetails != null) ? model.lastTopicDetails['chapter_name'] : ''}',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.0),
                                color: Theme.of(context).accentColor),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            // onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      child: ListView.separated(
                        itemCount: model.chapterList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, cindex) {
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        model.chapterList[cindex]
                                            ['chapter_name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.grey.shade800,
                                            ),
                                      ),
                                      MaterialButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        textColor: Colors.white,
                                        child: Text('Quiz'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                (model.chapterList[cindex]['topic'].length > 0)
                                    ? Container(
                                        height: 160.0,
                                        child: ListView.builder(
                                          // padding: EdgeInsets.only(left: 8.0),
                                          itemCount: model.chapterList.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, tindex) {
                                            return Card(
                                              child: InkWell(
                                                onTap: () async {
                                                  await model.setLastTopicInfo(
                                                      subjectDetails,
                                                      model.chapterList[cindex]
                                                          ['topic'][tindex]);
                                                  await model
                                                      .navigateToTopicDetailsScreen(
                                                          model.chapterList[
                                                                      cindex]
                                                                  ['topic']
                                                              [tindex]);
                                                },
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        width: 180.0,
                                                        child: Image.network(
                                                          '${model.imageBaseUrl}${model.chapterList[cindex]['topic'][tindex]['top_thumbnail']}',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    16.0),
                                                        child: Text(
                                                          '${model.chapterList[cindex]['topic'][tindex]['topic_name']}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    // color: Colors.grey.shade800,
                                                                  ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            indent: 16.0,
                            endIndent: 16.0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    model.navigateToChapterProgressScreen(subjectDetails);
                  },
                  child: Card(
                    color: Colors.green,
                    child: Container(
                      height: 64.0,
                      child: Center(
                        child: Text(
                          'Chapter Progress',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Card(
                        color: Colors.green.shade800,
                        child: InkWell(
                          onTap: () {
                            model.navigateToSubjectQuizListScreen(
                                subjectDetails);
                          },
                          child: Container(
                            height: 128.0,
                            child: Center(
                              child: Text(
                                'Subject Quiz',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        color: Colors.orange,
                        child: Container(
                          height: 128.0,
                          child: Center(
                            child: Text(
                              'Custom Test',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              PopularVideoListWidgetView(),
            ],
          ),
        );
      },
    );
  }
}
