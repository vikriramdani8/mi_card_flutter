import 'package:http/http.dart' as http;
import 'dart:convert';

class PostResult{
  String lamp;

  PostResult({
    this.lamp
  });

  factory PostResult.cretePostResult(Map<String, dynamic> object){
    return PostResult(
      lamp: object['lamp']
    );
  }

  static Future<PostResult> connectToApi(String lamp, String lampNumber) async{
    String apiUrl = "http://192.168.1.5:3000/"+lampNumber;
    var apiResult = await http.post(apiUrl, body: {
      "lamp": lamp,
    });

    var jsonObject = json.decode(apiResult.body);
    return PostResult.cretePostResult(jsonObject);
  }
}