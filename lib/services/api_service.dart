import 'package:http/http.dart' as http;
import 'package:wallpapery/models/PhotosModel.dart';

class ApiService {
  static int pageCount = 6; //default
  String category = 'travel'; //default
  static final String API_KEY = '14921997-2f305f4f3ccc588248ffad6e2';
  final String baseurl =
      "https://pixabay.com/api/?key=$API_KEY&per_page=$pageCount";

  Future<List<Hit>> getData() async {
    var res = await http.get(baseurl);
    final photosModel = photosModelFromJson(res.body);
    final List<Hit> hits = photosModel.hits;

    return hits;
  }

  Future<List<Hit>> getCategoryData({String search}) async {
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
