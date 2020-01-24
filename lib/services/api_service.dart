import 'package:http/http.dart' as http;
import 'package:wallpapery/models/PhotosModel.dart';

class ApiService {
  int pageCount = 6; //default
  String category = 'travel'; //default
  String order = 'popular'; //default

  final String API_KEY = 'YOUR_API_KEY';
  String baseurl;

  ApiService() {
    baseurl =
        "https://pixabay.com/api/?key=$API_KEY&per_page=$pageCount&order=$order";
  }
  Future<List<Hit>> getData() async {
    var res = await http.get(baseurl);
    final photosModel = photosModelFromJson(res.body);
    final List<Hit> hits = photosModel.hits;

    return hits;
  }

  Future<List<Hit>> getCategoryData({String search}) async {
    baseurl =
        "https://pixabay.com/api/?key=$API_KEY&per_page=$pageCount&order=$order";
    print('ordered by ' + order);
    print('Page count ' + pageCount.toString());
    String url = baseurl + '&category=$category';
    if (search != null) {
      // add the search query to the url
      url = url + '&q=$search';
    }
    var res = await http.get(url);
    final photosModel = photosModelFromJson(res.body);
    final List<Hit> hits = photosModel.hits;
    return hits;
  }

  setCategory(String newcategory) {
    category = newcategory;
  }

  void setPageCount(int newPageCount) {
    pageCount = newPageCount;
  }
}
