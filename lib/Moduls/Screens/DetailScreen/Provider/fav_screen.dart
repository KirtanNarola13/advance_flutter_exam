import 'package:advance_flutter_exam/Components/Lists/all_list.dart';
import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier {
  void addToFav(var e) {
    favData.add(e);
    notifyListeners();
  }
}
