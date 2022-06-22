import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/controllers/MovieController.dart';
import 'package:movie_app/views/movie/cardmovie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListMovie extends StatefulWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  var count = 1.obs();
  final MovieController movieController = Get.put(MovieController());
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    count-=1;
    movieController.getmovie(count);
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    count++;
    _refreshController.loadComplete();
    movieController.getmovie(count);
  }

  @override
  Widget build(BuildContext context) {
    movieController.getmovie(count);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Movie"),
            Text(
              "List Top Movie and Tv show" + movieController.pagerow.toString(),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
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
                itemCount: movieController.movie.length,
                itemBuilder: (BuildContext context, int index) {
                  return Cardmovie(
                    title: movieController.movie[index].originalTitle,
                    date: movieController.movie[index].releaseDate,
                    overview: movieController.movie[index].overview,
                  );
                }),
          );
        }
      }),
    );
  }
}
