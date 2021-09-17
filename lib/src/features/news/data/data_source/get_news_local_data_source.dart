import 'package:get_storage/get_storage.dart';

import '../models/news_model.dart';

abstract class GetNewsLocalDataSource {
  Future<NewsModel> getCachedNews();

  Future<void> cacheNews(NewsModel cacheNews);
}

class GetNewsLocalDataSourceImpl implements GetNewsLocalDataSource {
  GetNewsLocalDataSourceImpl({required this.localStorage});

  final GetStorage localStorage;

  @override
  Future<void> cacheNews(cacheNews) {
    return localStorage.write("news", cacheNews.toJson());
  }

  @override
  Future<NewsModel> getCachedNews() {
    final jsonNews = localStorage.read("news");
    if (jsonNews != null) {
      return Future.value(NewsModel.fromJson(jsonNews));
    } else {
      throw "Cache Error";
    }
  }
}
