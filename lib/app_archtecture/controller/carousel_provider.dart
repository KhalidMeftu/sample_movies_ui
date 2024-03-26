import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarouselProvider with ChangeNotifier {
  List<CarouselItem> _carouselItems = [];
  int _currentIndex = 0;

  List<CarouselItem> get carouselItems => _carouselItems;
  int get currentIndex => _currentIndex;

  void setCarouselItems(List<CarouselItem> items) {
    _carouselItems = items;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> loadCarouselItems(CarouselProvider carouselProvider) async {
    try {
      String jsonString = await rootBundle.loadString(
          'assets/json/movies.json');
      final jsonData = json.decode(jsonString)['movies'] as List;
      List<CarouselItem> carouselItems = jsonData.map((item) {
        return CarouselItem(
          title: item['title'],
          type: item['type'],
          genre: item['genre'],
          year: item['year'],
          season: item['season'],
          image: item['image'],
        );
      }).toList();
      setCarouselItems(carouselItems);
    } catch (e) {
      print('Erro');
    }
  }

}


class BottomNavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  List<Color> _itemColors = [
    Colors.blue, // Home
    Colors.blue, // Home
    Colors.blue, // Home
  ];

  int get currentIndex => _currentIndex;
  List<Color> get itemColors => _itemColors;

  void updateIndex(int index) {
    _currentIndex = index;
    _itemColors = List.generate(_itemColors.length, (i) => i == index ? Colors.red : Colors.black);
    notifyListeners();
  }
}
class CarouselItem {
  final String title;
  final String type;
  final String genre;
  final int year;
  final int season;
  final String image;

  CarouselItem({
    required this.title,
    required this.type,
    required this.genre,
    required this.year,
    required this.season,
    required this.image,
  });
}