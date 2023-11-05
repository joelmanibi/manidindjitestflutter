class NewsData {
  int? id;
  String? title;
  String? author;
  String? content;
  String? source;
  String? image;
  int? vue;
  String? createdAt;

  //let's create the constructor
  NewsData(
    this.id,
    this.title,
    this.author,
    this.content,
    this.source,
    this.image,
    this.vue,
    this.createdAt,
  );
  NewsData.fromJson(Map<String, dynamic> json) {
    id = json['news_id'];
    title = json['news_title'];
    author = json['user']['user_lastname'];
    content = json['news_content'];
    source = json['news_source'];
    image = json['news_image'];
    vue = json['news_vue'];
    createdAt = json['createdAt'];
  }
}
