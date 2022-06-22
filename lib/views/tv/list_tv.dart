import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/controllers/TvTopController.dart';
import 'package:movie_app/views/tv/cardTvtop.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListTv extends StatefulWidget {
  const ListTv({Key? key}) : super(key: key);

  @override
  State<ListTv> createState() => _ListTvState();
}

class _ListTvState extends State<ListTv> {
  var count = 1.obs();
  final TvTopController tvTopController = Get.put(TvTopController());
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    count -= 1;
    tvTopController.gettopmovie(count);
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    count++;
    _refreshController.loadComplete();
    tvTopController.gettopmovie(count);
  }

  @override
  Widget build(BuildContext context) {
    tvTopController.gettopmovie(count);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tv Populer"),
            Text(
              "List Top Movie and Tv show",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (tvTopController.isLoading.value) {
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
                itemCount: tvTopController.tv.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardTvTop(
                    title: tvTopController.tv[index].name,
                    date: tvTopController.tv[index].firstAirDate,
                    overview: tvTopController.tv[index].overview,
                  );
                }),
          );
        }
      }),
    );
  }
}
