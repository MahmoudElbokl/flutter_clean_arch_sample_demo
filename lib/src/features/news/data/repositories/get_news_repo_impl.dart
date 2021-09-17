import '../data_source/get_news_remote_data_source.dart';
import '../data_source/get_news_local_data_source.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/get_news_repo.dart';
import '../../../../core/connection_info.dart';

class GetNewsRepositoryImpl implements GetNewsRepository {
  final GetNewsRemoteDataSource getNewsRemoteDataSource;
  final GetNewsLocalDataSource getNewsLocalDataSource;
  final ConnectionInfo connectionInfo;

  GetNewsRepositoryImpl(
    this.getNewsRemoteDataSource,
    this.getNewsLocalDataSource,
    this.connectionInfo,
  );

  @override
  Future<NewsEntity> getNews() async {
    if (await connectionInfo.isConnected) {
      final remoteNews = await getNewsRemoteDataSource.getNews();
      getNewsLocalDataSource.cacheNews(remoteNews);
      return remoteNews;
    } else {
      return await getNewsLocalDataSource.getCachedNews();
    }
  }
}
