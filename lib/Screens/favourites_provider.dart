import 'package:flutter/material.dart';
import 'package:myapp/Data/travel_destination.dart';


class FavoritesProvider with ChangeNotifier {
  final List<TravelDestination> _favorites = [];

  List<TravelDestination> get favorites => _favorites;

  void addFavorite(TravelDestination destination) {
    _favorites.add(destination);
    notifyListeners();
  }

  void removeFavorite(TravelDestination destination) {
    _favorites.remove(destination);
    notifyListeners();
  }

  bool isFavorite(TravelDestination destination) {
    return _favorites.contains(destination);
  }
}
