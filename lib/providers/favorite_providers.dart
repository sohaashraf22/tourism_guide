import 'package:flutter/material.dart';
import '../models/attraction.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Attraction> favorites = [];

  void addFavorite(Attraction attraction) {
    favorites.add(attraction);
    notifyListeners();
  }

  void removeFavorite(Attraction attraction) {
    favorites.removeWhere(
          (item) => item.title == attraction.title,
    );
    notifyListeners();
  }

  bool isFavorite(Attraction attraction) {
    return favorites.any(
          (item) => item.title == attraction.title,
    );
  }

  void toggleFavorite(Attraction attraction) {
    if (isFavorite(attraction)) {
      removeFavorite(attraction);
    } else {
      addFavorite(attraction);
    }
  }
}