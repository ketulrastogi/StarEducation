package com.bugle.stareducation.network;

/**
 * Created by Janak on 06-Feb-18.
 */

public class AppApiEndPoint {

    static final String APIKEY = "rzp_test_I5oi33HRvvTNe4";
    static final String APISECRET = "2oEsSPu1B0bFAAHhRljOngQr";

    public static final String BASE_LOCAL_URL = "http://sampleserver.org/starmath";
    private static final String LOCAL_API_PREFIX = "/Api/";
    private static final String BASE_URL = BASE_LOCAL_URL + LOCAL_API_PREFIX;


    static final String SIGNUP = BASE_URL + "student_register";
    static final String FORGOT_PASSWORD = BASE_URL + "forgot_password";
    static final String RESETPASSWORD = BASE_URL + "change_password";
    static final String LOGIN = BASE_URL + "student_login";
    static final String EDITPROFILE = BASE_URL + "student_profile_edit";
    static final String BOARDSTANDARDMIDUMDATA = BASE_URL + "medium_standard_board";
    static final String GETSUBJECTLIST = BASE_URL + "get_subject";
    static final String ADDSUBJECT = BASE_URL + "add_subject";
    static final String SHOWUSERSUBJECT = BASE_URL + "home_screen";
    static final String CHAPTERLIST = BASE_URL + "chapter_list";
    static final String TOPICINFO = BASE_URL + "topic_info";
    static final String REVISEQUESTION = BASE_URL + "revise_question";
    static final String TASKQUESTION = BASE_URL + "task_question";
    static final String SEEQUESTION = BASE_URL + "see_question";
    static final String TRYQUESTION = BASE_URL + "try_question";
    static final String APPLYQUESTION = BASE_URL + "apply_question";
    static final String PRICEPLAN = BASE_URL + "price_plan";
    static final String SUBSCRIPTION = BASE_URL + "subscription";
    static final String CHECKQUESTION = BASE_URL + "topic_question_check";
    static final String DOCUMENTLIST = BASE_URL + "subject_document_list";
    static final String POPULARVIDEOLIST = BASE_URL + "subject_popular_video_list";
    static final String CHAPTERQUIZLIST = BASE_URL + "chapter_quiz_list";
    static final String CHAPTERQUIZQUESTION = BASE_URL + "chapter_quiz_questions";
    static final String QUIZ_SCORE = BASE_URL + "quiz_score";
    static final String QUIZ_RESULT = BASE_URL + "quiz_result";
    static final String SET_LASTTOPIC_DETIAL = BASE_URL + "set_last_topic_details";
    static final String LAST_TOPIC_INFO = BASE_URL + "last_topic_info";
    static final String SUBJECTQUIZLIST = BASE_URL + "subject_quiz_list";
    static final String SUBJECTQUIZQUESTION = BASE_URL + "subject_quiz_questions";
    static final String FEEDBACK = BASE_URL + "feedback";
    static final String CUSTOM_QUIZ_COUNTER = BASE_URL + "custom_quiz_question_count";
    static final String CUSTOMQUIZQUESTION = BASE_URL + "get_custom_quiz_questions";
    static final String CUSTOMQUIZLIST = BASE_URL + "custom_quiz_list";
    static final String EXERCISELIST = BASE_URL + "exercise_list";
    static final String CHAPTERPROGRESS = BASE_URL + "user_chapter_tracking";
    static final String WALLETDETAIL = BASE_URL + "wallet_detail";
    static final String ADDSCRATCHCARD = BASE_URL + "add_scratch_card";


}
