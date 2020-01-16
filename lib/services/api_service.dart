import 'package:http/http.dart' as http;
import 'package:wallpapery/models/PhotosModel.dart';

class ApiService {
  final URL =
      "https://pixabay.com/api/?key=14921997-2f305f4f3ccc588248ffad6e2&per_page=5";

  Future<List<String>> getData() async {
    var res = await http.get(URL);
    final photosModel = photosModelFromJson(res.body);
    final List<Hit> hits = photosModel.hits;
    List<String> images = List<String>();

    for (var item in hits) {
      images.add(item.largeImageUrl);
    }

    return images;
  }
}
