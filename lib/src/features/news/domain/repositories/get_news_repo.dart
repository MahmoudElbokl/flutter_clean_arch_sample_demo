import '../entities/news_entity.dart';

abstract class GetNewsRepository {
  Future<NewsEntity> getNews();
}
