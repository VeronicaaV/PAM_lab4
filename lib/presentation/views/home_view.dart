import 'package:flutter/material.dart';
import '../controllers/data_controller.dart';
import '../../data/models/models.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DataProvider _dataProvider = DataProvider();

  List<BannerModel> banners = [];
  List<Category> categories = [];
  List<NearbyCenter> nearbyCenters = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final fetchedBanners = await _dataProvider.getBanners();
      final fetchedCategories = await _dataProvider.getCategories();
      final fetchedNearbyCenters = await _dataProvider.getNearbyCenters();

      setState(() {
        banners = fetchedBanners;
        categories = fetchedCategories;
        nearbyCenters = fetchedNearbyCenters;
      });
    // ignore: empty_catches
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: banners.isEmpty || categories.isEmpty || nearbyCenters.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const Text('Banners', style: TextStyle(fontSize: 20)),
                ...banners.map((banner) => ListTile(
                      title: Text(banner.title),
                      subtitle: Text(banner.description),
                      leading: Image.network(
                        banner.image,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                      ),
                    )),
                const Text('Categories', style: TextStyle(fontSize: 20)),
                ...categories.map((category) => ListTile(
                      title: Text(category.title),
                      leading: Image.network(
                        category.icon,
                        errorBuilder: (_, __, ___) => const Icon(Icons.category),
                      ),
                    )),
                const Text('Nearby Centers', style: TextStyle(fontSize: 20)),
                ...nearbyCenters.map((center) => ListTile(
                      title: Text(center.title),
                      subtitle: Text(center.locationName),
                      leading: Image.network(
                        center.image,
                        errorBuilder: (_, __, ___) => const Icon(Icons.local_hospital),
                      ),
                    )),
              ],
            ),
    );
  }
}
