import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static const baseURL = "localhost:3000";
  // static const baseURL = "192.168.1.7:3000";

  static Future<http.Response> fetch(String url,String method,[var payload]) async {
    var uri = Uri.http(baseURL, "/$url");
    if(method=="post"){
      var response = await http.post(uri,headers: {"Content-Type": 'application/x-www-form-urlencoded'},body: jsonDecode(payload));
      return response;
    }
    else if(method=="delete"){
      var response = await http.delete(uri,headers: {"Content-Type": 'application/x-www-form-urlencoded'});
      return response;
    }else if(method=="update"){
      var response = await http.patch(uri,headers: {"Content-Type": 'application/x-www-form-urlencoded'},body: jsonDecode(payload));
      return response;
    }
    var response = await http.get(uri, headers: {"Content-Type": 'application/json'});
    return response;
  }
}
