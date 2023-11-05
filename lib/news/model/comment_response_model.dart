class NewsCommentResponseModel {
  String? newsComment_content;
  String? newsComment_authorFn;
  String? newsComment_authorLn;
  String? createAt;
  int? newsComment_news;
  int? newsComment_id;

  NewsCommentResponseModel(
      {this.newsComment_content,
      this.newsComment_authorFn,
      this.newsComment_authorLn,
      this.newsComment_news,
      this.newsComment_id,
      this.createAt});

  NewsCommentResponseModel.fromJson(Map<String, dynamic> json) {
    newsComment_id = json['newsComment_id'];
    newsComment_authorFn = json["user"]['user_firstname'];
    newsComment_authorLn = json["user"]['user_lastname'];
    newsComment_content = json['newsComment_content'];
    newsComment_news = json['newsComment_news'];
    createAt = json['createdAt'];
  }
}