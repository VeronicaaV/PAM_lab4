import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/data/models/models.dart';


class DataProvider {
  Future<Map<String, dynamic>> loadData() async {
    final jsonString = await rootBundle.loadString('assets/v1.json');
    return json.decode(jsonString);
  }

  Future<List<BannerModel>> getBanners() async {
    final data = await loadData();
    return parseBanners(data['banners']);
  }

  Future<List<Category>> getCategories() async {
    final data = await loadData();
    return parseCategories(data['categories']);
  }

  Future<List<NearbyCenter>> getNearbyCenters() async {
    final data = await loadData();
    return parseNearbyCenters(data['nearby_centers']);
  }
}
