import '../entities/news_entity.dart';
import '../repositories/get_news_repo.dart';
import '../../../../core/usecase.dart';

class GetNewsUseCases extends UseCase<NewsEntity, NoParams> {
  final GetNewsRepository repository;

  GetNewsUseCases(this.repository);

  @override
  Future<NewsEntity> call(NoParams params) async {
    return await repository.getNews();
  }
}