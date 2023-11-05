import 'package:get/get.dart';
import 'package:tikchap/news/detail_view.dart';
import 'package:tikchap/news/model/comment_request_model.dart';
import 'package:tikchap/news/model/comment_response_model.dart';
import 'package:tikchap/news/model/news_model.dart';
import 'package:tikchap/news/service/news_service.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends GetxController {
  NewsService? _newsService;

  @override
  void onInit() {
    super.onInit();
    _newsService = Get.put(NewsService());
  }

  Future<List<NewsData?>> getallNewss() async {
    final response = await _newsService!.fetchNews();

    // ignore: unnecessary_null_comparison
    if (response != null) {
      return response;
    } else {
      /// Show user a dialog about the error response
      // print("error");
      return throw Exception();
    }
  }

  Future<List<NewsCommentResponseModel?>> getallNewsComments(
      String data) async {
    final response = await _newsService!.fetchNewsComment(data);

    // ignore: unnecessary_null_comparison
    if (response != null) {
     
      return response;
    } else {
      /// Show user a dialog about the error response
      // print("error");
      return throw Exception();
    }
  }

  Future addcomment(int? newsComment_news, String newsComment_content) async {
    final response = await _newsService!.addNewComment(NewsCommentRequestModel(
        newsComment_content: newsComment_content,
        newsComment_news: newsComment_news));
    if (response != null) {
      final newsList = await _newsService!.fetchNews();

      // Filtrer l'actualité par ID
    final filteredNews = newsList.firstWhere(
      (news) => news!.id == newsComment_news,
     // orElse: () => null,
    );

    if (filteredNews != null) {
     //  print(filteredNews);
     Get.to(DetailsScreen(filteredNews));
    } else {
      // L'actualité avec l'ID spécifié n'a pas été trouvée, vous pouvez gérer cela ici.
      print("Actualité non trouvée");
    }

    } else {

      /// Show user a dialog about the error response
      Get.defaultDialog(
          title: "ERREUR",
          middleText: 'Echec de creation de commentaire',
          textConfirm: 'OK',
          backgroundColor: Color.fromARGB(255, 199, 166, 164),
          confirmTextColor: Colors.white,
          buttonColor: Colors.red,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
