import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/news_controller.dart';
import '../../../../../injector.dart';
import '../../../../core/response_classify.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController controller = Get.put(NewsController(getNewsUseCases: sl()));

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Explore"),
        ),
        body: GetBuilder<NewsController>(
          builder: (value) {
            if (value.newsList.status == Status.ERROR) {
              return Center(
                child: Text(value.newsList.error!),
              );
            } else if (value.newsList.status == Status.COMPLETED) {
              if (value.newsList.data != null &&
                  value.newsList.data!.articles != null &&
                  value.newsList.data!.articles!.isNotEmpty) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    // articles list
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.newsList.data!.articles!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: Card(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        height: size.height *
                                            ((orientation == Orientation.landscape ? 0.25 : 0.15)),
                                        width: size.width * 0.3,
                                        child: value.newsList.data!.articles![index].urlToImage ==
                                                null
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  bottomLeft: Radius.circular(4),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/news-placeholder.png",
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft: Radius.circular(4)),
                                                child: FadeInImage(
                                                  fit: BoxFit.cover,
                                                  fadeInDuration: Duration(milliseconds: 200),
                                                  fadeOutDuration: Duration(milliseconds: 100),
                                                  placeholder: AssetImage(
                                                      "assets/images/news-placeholder.png"),
                                                  image: NetworkImage(
                                                    value.newsList.data!.articles![index].urlToImage
                                                        .toString(),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 7),
                                        height: size.height *
                                            (orientation == Orientation.landscape ? 0.24 : 0.14),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              value.newsList.data!.articles![index].title
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: size.height > 700 ? 15 : 13,
                                              ),
                                              maxLines: 2,
                                            ),
                                            Text(
                                              value.newsList.data!.articles![index].source!.name!
                                                          .length >
                                                      20
                                                  ? value
                                                      .newsList.data!.articles![index].source!.name!
                                                      .substring(0, 20)
                                                  : value
                                                      .newsList.data!.articles![index].source!.name
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: size.height > 700 ? 12 : 10,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text("There is not any articles now."),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
