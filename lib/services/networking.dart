import 'package:http/http.dart' as http;
import 'dart:convert'; // Used for jsonDecode.

/// This classed is used to process the url and pass it to the LoadingScreen class.
/// This class was created so other API urls can be accessed.
class NetworkHelper {
  // Instance variable
  final String url;
  // Constructor to initialise variable
  NetworkHelper(this.url);

  // 7. A method that returns a Future, the url gets passed in the response variable, if statement checks if stat code is 200 or error if its ok
  // response body of API is stored in data variable.
  // response will only receive the data once url is captured as its a await type.
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      //  8. jsonDecode takes data as a parameter which is stored in decodedData.
      var decodedData = jsonDecode(data);
      // 9. decodedData is returned as a future.
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
