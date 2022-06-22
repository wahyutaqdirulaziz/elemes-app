import 'package:get/state_manager.dart';
import 'package:movie_app/model/MovieTopModel.dart';
import 'package:movie_app/service/ServiceMovie.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  List movie = <Result>[].obs();
  int pagerow = 0.obs();

  void getmovie(int page) async {
    try {
      isLoading(true);
      var res = await ProdukApiDB.getdata(page.obs());
      if (res != null) {
        movie.assignAll(res.results);
        pagerow = res.totalResults.obs();
      }
    } finally {
      isLoading(false);
    }
  }
}
