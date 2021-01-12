import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubjectService {
  Future<Map<String, dynamic>> getBoardMediumStandardData() async {
    http.Response response = await http.get(
      "http://sampleserver.org/starmath/api/medium_standard_board",
    );

    String jsonsDataString = response.body;

    print('SubjectService [13]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getSubjectListData(
    String mediumId,
    String standardId,
    String boardId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/get_subject",
      body: {
        'user_id': userProfile['id'],
        'medium_id': mediumId,
        'standard_id': standardId,
        'board_id': boardId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [38]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> addSubject(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/add_subject",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [58]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getUserSubject() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/home_screen",
      body: {
        'user_id': userProfile['id'],
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [77]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getChapterList(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/chapter_list",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [95]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getReviseQuestion(
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/revise_question",
      body: {
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [114]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getTaskQuestion(
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/task_question",
      body: {
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [133]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getSeeQuestionList(
    String exerciseId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/see_question",
      body: {
        'ex_id': exerciseId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [153]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getTryQuestionList(
    String exerciseId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/try_question",
      body: {
        'user_id': userProfile['id'],
        'ex_id': exerciseId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [172]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getApplyQuestionList(
    String exerciseId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/apply_question",
      body: {
        'user_id': userProfile['id'],
        'ex_id': exerciseId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [192]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getPricePlan(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/price_plan",
      body: {
        'subject_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [211]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> setSubscription(
    String subjectId,
    String paymentId,
    String planId,
    String status,
    String price,
    String wallet,
    String onlinePrice,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/price_plan",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
        'payment_id': paymentId,
        'price_plan_id': planId,
        'status': status,
        'price': price,
        'wallet': wallet,
        'online_price': onlinePrice,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [243]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> questionCheck(
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/topic_question_check",
      body: {
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [262]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getDocuments(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/subject_document_list",
      body: {
        'subject_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [281]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getPopularVideo(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/subject_popular_video_list",
      body: {
        'subject_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [300]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getChapterQuizList(
    String chapterId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/chapter_quiz_list",
      body: {
        'user_id': userProfile['id'],
        'chapter_id': chapterId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [320]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getChapterQuizQuestion(
    String chapterQuizId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/chapter_quiz_questions",
      body: {
        'chapter_quiz_id': chapterQuizId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [340]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> setQuizScore(
    String chapterQuizId,
    String questionType,
    String correctAnswer,
    String wrongAnswer,
    String totalScore,
    List<Map<String, dynamic>> questionList,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    print('setQuizScore: 354');
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/quiz_score",
      body: {
        'user_id': userProfile['id'],
        'cquiz_id': chapterQuizId,
        'question_type': questionType,
        'correct_answer': correctAnswer,
        'wrong_answer': wrongAnswer,
        'total_score':
            '${correctAnswer.toString()}/${questionList.length.toString()}',
        'question_list': jsonEncode(questionList),
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [369]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getResult(
    String chapterQuizId,
    String questionType,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/quiz_result",
      body: {
        'user_id': userProfile['id'],
        'cquiz_id': chapterQuizId,
        'question_type': questionType,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [391]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> setLastTopicDetail(
    String subjectId,
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/set_last_topic_details",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [413]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> lastVisitTopic(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/last_topic_info",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [433]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getSubjectQuizList(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/subject_quiz_list",
      body: {
        'user_id': userProfile['id'],
        'sub_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [453]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getSubjectQuiz(
    String subjectQuizId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/subject_quiz_questions",
      body: {
        'subject_quiz_id': subjectQuizId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [453]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> setFeedback(
    String title,
    String code,
    String description,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/feedback",
      body: {
        'user_id': userProfile['id'],
        'title': title,
        'code': code,
        'description': description,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [496]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getCustomQuizCounter(
    String subjectId,
    String topicIdArray,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/feedback",
      body: {
        'user_id': userProfile['id'],
        'subject_id': subjectId,
        'topic_id_array': topicIdArray,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [518]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getCustomQuiz(
    String subjectId,
    String topicIdArray,
    String multiple,
    String trueFalse,
    String oneWord,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/get_custom_quiz_questions",
      body: {
        'user_id': userProfile['id'],
        'subject_id': subjectId,
        'topic_id_array': topicIdArray,
        'multiple': multiple,
        'true_false': trueFalse,
        'one_word': oneWord
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [546]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getCustomQuizList(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/custom_quiz_list",
      body: {
        'user_id': userProfile['id'],
        'subject_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [566]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getExerciseList(
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/exercise_list",
      body: {
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [585]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getProgress(
    String subjectId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/user_chapter_tracking",
      body: {
        'user_id': userProfile['id'],
        'subject_id': subjectId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [605]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getWallet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/wallet_detail",
      body: {
        'user_id': userProfile['id'],
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [623]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> addScratchCard(
    String scratchCardNumber,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/add_scratch_card",
      body: {
        'user_id': userProfile['id'],
        'scratch_card_no': scratchCardNumber,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [642]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }

  Future<Map<String, dynamic>> getTopicInfo(
    String topicId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userProfile =
        jsonDecode(sharedPreferences.getString('user_profile'));
    http.Response response = await http.post(
      "http://sampleserver.org/starmath/api/topic_info",
      body: {
        'user_id': userProfile['id'],
        'topic_id': topicId,
      },
    );

    String jsonsDataString = response.body;

    print('SubjectService [433]: $jsonsDataString');
    return jsonDecode(jsonsDataString);
  }
}
