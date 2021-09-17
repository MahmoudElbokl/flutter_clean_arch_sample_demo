import 'package:get/get.dart';

import '../../domain/use_cases/get_news_usecase.dart';
import '../../domain/entities/news_entity.dart';
import '../../../../core/usecase.dart';
import '../../../../core/response_classify.dart';

class NewsController extends GetxController {
  final GetNewsUseCases getNewsUseCases;

  NewsController({required this.getNewsUseCases});

  ResponseClassify<NewsEntity?> _newsList = ResponseClassify.loading();

  ResponseClassify<NewsEntity?> get newsList => _newsList;

  @override
  void onInit() async {
    _newsList = ResponseClassify.loading();
    update();
    try {
      _newsList = ResponseClassify.completed(await getNewsUseCases.call(NoParams()));
    } catch (e) {
      _newsList = ResponseClassify.error(e.toString());
    }
    update();
    super.onInit();
  }
}
