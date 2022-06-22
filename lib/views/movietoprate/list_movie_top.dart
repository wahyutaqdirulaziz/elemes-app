import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/controllers/MovieTopController.dart';
import 'package:movie_app/views/movietoprate/cardmovietop.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListMovieTop extends StatefulWidget {
  const ListMovieTop({Key? key}) : super(key: key);

  @override
  State<ListMovieTop> createState() => _ListMovieTopState();
}

class _ListMovieTopState extends State<ListMovieTop> {
  var count = 1.obs();
  final MovieTopController movieTopController = Get.put(MovieTopController());
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    count -= 1;
    movieTopController.gettopmovie(count);
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    count++;
    _refreshController.loadComplete();
    movieTopController.gettopmovie(count);
  }

  @override
  Widget build(BuildContext context) {
    movieTopController.gettopmovie(count);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Movie Top rate"),
            Text(
              "List Top Movie and Tv show",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (movieTopController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: movieTopController.movie.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardmovieTop(
                    title: movieTopController.movie[index].originalTitle,
                    date: movieTopController.movie[index].releaseDate,
                    overview: movieTopController.movie[index].overview,
                  );
                }),
          );
        }
      }),
    );
  }
}
