import 'package:flutter/cupertino.dart';

import '../../ApiHelper/api.dart';
import '../modal/news_Modal.dart';

class Newsprovider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  late Newsmodal newsmodal;

  void favouriteData(int index) {
    listOfFavourite.add(index);
    notifyListeners();
  }

  void removeFavourite(int index) {
    listOfFavourite.removeAt(index);
    notifyListeners();
  }

  Future<Newsmodal> fromJson() async {
    final Map data = await apiHelper.fetchNewsData();
    newsmodal = Newsmodal.fromJson(data);
    notifyListeners();
    return newsmodal;
  }
}

List listOfFavourite = [];
