import 'package:http/http.dart' as http;
import 'dart:convert';

class AI {
  String url = "127.0.0.1:8000";
  Map<String, dynamic> history = {};

  Future<Map<String, dynamic>> getResponse(String message) async {
    var req = Uri.http(url, "/", {"prompt": "$history User: $message"});
    http.Response response;
    try {
      response = await http.get(req);
    } catch (e) {
      return {"message": e.toString()};
    }

    history["User ${history.length}"] = message;
    history["AI ${history.length}"] = json.decode(response.body)["message"];

    return json.decode(response.body);
  }

  void clearHistory() {
    history = {};
  }
}
