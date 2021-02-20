import 'package:flutter_application_1/player_selector/Models/PlayerList.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Services{
  Future<PlayerList> fetchPlayerList() async {
    PlayerList result;
    try {
      final response = await http.get(
        "http://localhost:3000/player-list",
        headers: {
          // HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        var item = json.decode(response.body);
        result = PlayerList.fromJson(item);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}