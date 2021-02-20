import 'package:flutter_application_1/player_selector/Models/Player.dart';

class PlayerList{
  List<Player> list;

  PlayerList({this.list});

  PlayerList.fromJson(Map<String, dynamic> json) {
    list = [];
    json['list'].forEach((v) {
      list.add(Player.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    return data;
  } 
}