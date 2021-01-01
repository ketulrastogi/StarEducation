package com.bugle.stareducation.network;

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

import java.io.File;

import io.reactivex.Single;

public interface ApiHelper {
    Single<SignInResponse> signInRequest(SignInRequest signInRequest);

    Single<BaseResponse> signUp(SignUpRequest signUpRequest);

    Single<ForgotPasswordResponse> getUserId(String mobile);

    Single<BaseResponse> resetPassword(String userId, String password);

    Single<SignInResponse> editProfile(EditProfileRequest editProfileRequest);

    Single<SignInResponse> editProfileWithImage(EditProfileRequest editProfileRequest, File file);

    Single<BoardStandardMediumResponse> getBoardDataList();

    Single<SubjectListResponse> getSubject(String medium, String standard, String board, String userId);

    Single<BaseResponse> addSubject(String subId, String userId);

    Single<UserSubjectResponse> showUserSubject(String userId);

    Single<ChapterListResponse> getChapterList(String subId, String userId);

    Single<TopicInfoResponse> getTopicInfo(String topicId);

    Single<QuestionListResponse> getReviseQuestionList(String topicId);

    Single<QuestionListResponse> getTaskQuestionList(String topicId);

    Single<QuestionListResponse> getSeeQuestionList(String topicId);

    Single<QuestionListResponse> getTryQuestionList(String topicId, String userId);

    Single<QuestionListResponse> getApplyQuestionList(String topicId, String userId);

    Single<PricePlanResponse> getPricePlan(String subId);

    Single<BaseResponse> setSubscription(String userId, String subId, String paymentId, String planId,
                                         String status, String price, String wallet, String onlinePrice);

    Single<CheckQuestionResponse> questionCheck(String topicId);

    Single<DocumentResponse> getDocuments(String subId);

    Single<PopularSubjectVideoResponse> getPopularVideo(String subId);

    Single<QuizListResponse> getChapterQuizList(String chapterId, String userId);

    Single<QuestionListResponse> getChapterQuiz(String quizId);

    Single<BaseResponse> setQuizScore(QuizRequest mQuizRequest);

    Single<ResultResponse> getResult(String userId, String quizId, String type);

    Single<BaseResponse> setLastTopicDetail(String userId, String sub_id, String topic_id);

    Single<LastTopicInfo> lastVisitTopic(String userId, String subId);

    Single<QuizListResponse> getSubjectQuizList(String userId, String subId);

    Single<QuestionListResponse> getSubjectQuiz(String quizId);

    Single<BaseResponse> setFeedback(String userId, String title, String code, String description);

    Single<QuizCounter> getCustomQuizCounter(String userId, String subId, String topicIdArray);

    Single<QuestionListResponse> getCustomQuiz(CustomQuizRequest mCustomQuizRequest);

    Single<QuizListResponse> getCustomQuizList(String subId, String userId);

    Single<ExerciseListResponse> getExerciseList(String topicId);

    Single<ProgressResponse> getProgress(String subId, String userId);

    Single<WalletResponse> getWallet(String userId);

    Single<BaseResponse> addScratchCard(String userId, String code);


}
