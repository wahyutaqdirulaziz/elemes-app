import 'package:get/state_manager.dart';
import 'package:movie_app/model/MovieTopRateModel.dart';

import 'package:movie_app/service/ServiceMovieTop.dart';

class MovieTopController extends GetxController {
  var isLoading = true.obs;
  List movie = <Result>[].obs();
  int pagerow = 0.obs();

  void gettopmovie(int page) async {
    try {
      isLoading(true);
      var res = await ProdukApiTopDB.getdata(page.obs());
      if (res != null) {
        movie.assignAll(res.results);
        pagerow = res.totalResults.obs();
      }
    } finally {
      isLoading(false);
    }
  }
}
