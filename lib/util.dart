import 'package:http/http.dart' as http;

Future<bool> isImageUrlWorking(String imageUrl) async {
  var response = await http.get(imageUrl);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
