class NewsCommentRequestModel {
  String? newsComment_content;
  int? newsComment_news;

  NewsCommentRequestModel({this.newsComment_content, this.newsComment_news});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newsComment_content'] = this.newsComment_content;
    data['newsComment_news'] = this.newsComment_news;
    return data;
  }
}
