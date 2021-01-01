package com.bugle.stareducation.network;

import com.androidnetworking.common.Priority;
import com.bugle.stareducation.model.request.CustomQuizRequest;
import com.bugle.stareducation.model.request.EditProfileRequest;
import com.bugle.stareducation.model.request.QuizRequest;
import com.bugle.stareducation.model.request.SignInRequest;
import com.bugle.stareducation.model.request.SignUpRequest;
import com.bugle.stareducation.model.response.BaseResponse;
import com.bugle.stareducation.model.response.boardStandardMedium.BoardStandardMediumResponse;
import com.bugle.stareducation.model.response.chapterlist.ChapterListResponse;
import com.bugle.stareducation.model.response.checkquestion.CheckQuestionResponse;
import com.bugle.stareducation.model.response.documents.DocumentResponse;
import com.bugle.stareducation.model.response.exercise.ExerciseListResponse;
import com.bugle.stareducation.model.response.forgotpassword.ForgotPasswordResponse;
import com.bugle.stareducation.model.response.lasttopicinfo.LastTopicInfo;
import com.bugle.stareducation.model.response.popularvideo.PopularSubjectVideoResponse;
import com.bugle.stareducation.model.response.priceplan.PricePlanResponse;
import com.bugle.stareducation.model.response.progress.ProgressResponse;
import com.bugle.stareducation.model.response.questioncounter.QuizCounter;
import com.bugle.stareducation.model.response.questiondata.QuestionListResponse;
import com.bugle.stareducation.model.response.quizlist.QuizListResponse;
import com.bugle.stareducation.model.response.result.ResultResponse;
import com.bugle.stareducation.model.response.signinresponse.SignInResponse;
import com.bugle.stareducation.model.response.subjectlist.SubjectListResponse;
import com.bugle.stareducation.model.response.topicinfo.TopicInfoResponse;
import com.bugle.stareducation.model.response.usersubject.UserSubjectResponse;
import com.bugle.stareducation.model.response.wallet.WalletResponse;
import com.rx2androidnetworking.Rx2AndroidNetworking;

import java.io.File;

import io.reactivex.Single;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;

public class AppApiHelper implements ApiHelper {

    @Override
    public Single<SignInResponse> signInRequest(SignInRequest signInRequest) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.LOGIN)
                .addBodyParameter(signInRequest)
                .build()
                .getObjectSingle(SignInResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> signUp(SignUpRequest signUpRequest) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SIGNUP)
                .addBodyParameter(signUpRequest)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<ForgotPasswordResponse> getUserId(String mobile) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.FORGOT_PASSWORD)
                .addBodyParameter("mobile", mobile)
                .build()
                .getObjectSingle(ForgotPasswordResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> resetPassword(String userId, String password) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.RESETPASSWORD)
                .addBodyParameter("id", userId)
                .addBodyParameter("password", password)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<SignInResponse> editProfile(EditProfileRequest editProfileRequest) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.EDITPROFILE)
                .addBodyParameter(editProfileRequest)
                .build()
                .getObjectSingle(SignInResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<SignInResponse> editProfileWithImage(EditProfileRequest editProfileRequest, File file) {
        return Rx2AndroidNetworking.upload(AppApiEndPoint.EDITPROFILE)
                .addMultipartFile("profile_img", file)
                .addMultipartParameter(editProfileRequest)
                .setPriority(Priority.HIGH)
                .build()
                .getObjectSingle(SignInResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BoardStandardMediumResponse> getBoardDataList() {
        return Rx2AndroidNetworking.get(AppApiEndPoint.BOARDSTANDARDMIDUMDATA)
                .build()
                .getObjectSingle(BoardStandardMediumResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<SubjectListResponse> getSubject(String medium, String standard, String board, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.GETSUBJECTLIST)
                .addBodyParameter("medium_id", medium)
                .addBodyParameter("standard_id", standard)
                .addBodyParameter("board_id", board)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(SubjectListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> addSubject(String subId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.ADDSUBJECT)
                .addBodyParameter("sub_id", subId)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<UserSubjectResponse> showUserSubject(String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SHOWUSERSUBJECT)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(UserSubjectResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<ChapterListResponse> getChapterList(String subId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CHAPTERLIST)
                .addBodyParameter("sub_id", subId)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(ChapterListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<TopicInfoResponse> getTopicInfo(String topicId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.TOPICINFO)
                .addBodyParameter("topic_id", topicId)
                .build()
                .getObjectSingle(TopicInfoResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getReviseQuestionList(String topicId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.REVISEQUESTION)
                .addBodyParameter("topic_id", topicId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getTaskQuestionList(String topicId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.TASKQUESTION)
                .addBodyParameter("topic_id", topicId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getSeeQuestionList(String exerciseId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SEEQUESTION)
                .addBodyParameter("ex_id", exerciseId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getTryQuestionList(String exerciseId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.TRYQUESTION)
                .addBodyParameter("ex_id", exerciseId)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getApplyQuestionList(String exerciseId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.APPLYQUESTION)
                .addBodyParameter("ex_id", exerciseId)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<PricePlanResponse> getPricePlan(String subid) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.PRICEPLAN)
                .addBodyParameter("subject_id", subid)
                .build()
                .getObjectSingle(PricePlanResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> setSubscription(String userId, String subId, String paymentId,
                                                String planId, String status, String price,
                                                String wallet, String onlinePrice) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SUBSCRIPTION)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("sub_id", subId)
                .addBodyParameter("payment_id", paymentId)
                .addBodyParameter("price_plan_id", planId)
                .addBodyParameter("status", status)
                .addBodyParameter("price", price)
                .addBodyParameter("wallet", wallet)
                .addBodyParameter("online_price", onlinePrice)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<CheckQuestionResponse> questionCheck(String topicId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CHECKQUESTION)
                .addBodyParameter("topic_id", topicId)
                .build()
                .getObjectSingle(CheckQuestionResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<DocumentResponse> getDocuments(String subId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.DOCUMENTLIST)
                .addBodyParameter("subject_id", subId)
                .build()
                .getObjectSingle(DocumentResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<PopularSubjectVideoResponse> getPopularVideo(String subId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.POPULARVIDEOLIST)
                .addBodyParameter("subject_id", subId)
                .build()
                .getObjectSingle(PopularSubjectVideoResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuizListResponse> getChapterQuizList(String chapterId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CHAPTERQUIZLIST)
                .addBodyParameter("chapter_id", chapterId)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(QuizListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getChapterQuiz(String quizId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CHAPTERQUIZQUESTION)
                .addBodyParameter("chapter_quiz_id", quizId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> setQuizScore(QuizRequest mQuizRequest) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.QUIZ_SCORE)
                .addBodyParameter(mQuizRequest)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<ResultResponse> getResult(String userId, String quizId, String type) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.QUIZ_RESULT)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("cquiz_id", quizId)
                .addBodyParameter("question_type", type)
                .build()
                .getObjectSingle(ResultResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> setLastTopicDetail(String userId, String sub_id, String topic_id) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SET_LASTTOPIC_DETIAL)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("sub_id", sub_id)
                .addBodyParameter("topic_id", topic_id)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<LastTopicInfo> lastVisitTopic(String userId, String subId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.LAST_TOPIC_INFO)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("sub_id", subId)
                .build()
                .getObjectSingle(LastTopicInfo.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuizListResponse> getSubjectQuizList(String userId, String subId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SUBJECTQUIZLIST)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("sub_id", subId)
                .build()
                .getObjectSingle(QuizListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getSubjectQuiz(String quizId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.SUBJECTQUIZQUESTION)
                .addBodyParameter("subject_quiz_id", quizId)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> setFeedback(String userId, String title, String code, String description) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.FEEDBACK)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("title", title)
                .addBodyParameter("code", code)
                .addBodyParameter("description", description)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuizCounter> getCustomQuizCounter(String userId, String subId, String topicIdArray) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CUSTOM_QUIZ_COUNTER)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("subject_id", subId)
                .addBodyParameter("topic_id_array", topicIdArray)
                .build()
                .getObjectSingle(QuizCounter.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuestionListResponse> getCustomQuiz(CustomQuizRequest mCustomQuizRequest) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CUSTOMQUIZQUESTION)
                .addBodyParameter(mCustomQuizRequest)
                .build()
                .getObjectSingle(QuestionListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<QuizListResponse> getCustomQuizList(String subId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CUSTOMQUIZLIST)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("subject_id", subId)
                .build()
                .getObjectSingle(QuizListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<ExerciseListResponse> getExerciseList(String topicId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.EXERCISELIST)
                .addBodyParameter("topic_id", topicId)
                .build()
                .getObjectSingle(ExerciseListResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<ProgressResponse> getProgress(String subId, String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.CHAPTERPROGRESS)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("subject_id", subId)
                .build()
                .getObjectSingle(ProgressResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<WalletResponse> getWallet(String userId) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.WALLETDETAIL)
                .addBodyParameter("user_id", userId)
                .build()
                .getObjectSingle(WalletResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    @Override
    public Single<BaseResponse> addScratchCard(String userId, String code) {
        return Rx2AndroidNetworking.post(AppApiEndPoint.ADDSCRATCHCARD)
                .addBodyParameter("user_id", userId)
                .addBodyParameter("scratch_card_no", code)
                .build()
                .getObjectSingle(BaseResponse.class)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }
}