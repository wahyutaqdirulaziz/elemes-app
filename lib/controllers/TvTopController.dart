import 'package:get/state_manager.dart';
import 'package:movie_app/model/TopTvModel.dart';
import 'package:movie_app/service/TvTop.dart';

class TvTopController extends GetxController {
  var isLoading = true.obs;
  List tv = <Result>[].obs();
  int pagerow = 0.obs();

  void gettopmovie(int page) async {
    try {
      isLoading(true);
      var res = await TvApiTopDB.getdata(page.obs());
      if (res != null) {
        tv.assignAll(res.results);
        pagerow = res.totalResults.obs();
      }
    } finally {
      isLoading(false);
    }
  }
}
