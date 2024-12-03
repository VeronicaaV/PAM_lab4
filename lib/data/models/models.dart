

// Banner Model
class BannerModel {
  final String title;
  final String description;
  final String image;

  BannerModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}

// Category Model
class Category {
  final String title;
  final String icon;

  Category({
    required this.title,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      icon: json['icon'],
    );
  }
}

// Nearby Center Model
class NearbyCenter {
  final String image;
  final String title;
  final String locationName;
  final double reviewRate;
  final int countReviews;
  final double distanceKm;
  final int distanceMinutes;

  NearbyCenter({
    required this.image,
    required this.title,
    required this.locationName,
    required this.reviewRate,
    required this.countReviews,
    required this.distanceKm,
    required this.distanceMinutes,
  });

  factory NearbyCenter.fromJson(Map<String, dynamic> json) {
    return NearbyCenter(
      image: json['image'],
      title: json['title'],
      locationName: json['location_name'],
      reviewRate: json['review_rate'].toDouble(),
      countReviews: json['count_reviews'],
      distanceKm: json['distance_km'].toDouble(),
      distanceMinutes: json['distance_minutes'],
    );
  }
}

// Function to parse JSON data
List<BannerModel> parseBanners(List<dynamic> data) =>
    data.map((json) => BannerModel.fromJson(json)).toList();

List<Category> parseCategories(List<dynamic> data) =>
    data.map((json) => Category.fromJson(json)).toList();

List<NearbyCenter> parseNearbyCenters(List<dynamic> data) =>
    data.map((json) => NearbyCenter.fromJson(json)).toList();
