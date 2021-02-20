import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/player_selector/Models/Player.dart';
import 'package:flutter_application_1/player_selector/Models/PlayerList.dart';
import 'package:flutter_application_1/player_selector/Notifiers/Services.dart';

class PlayerListNotifer extends ChangeNotifier{
  List<Player> _selected = [];
  double _maxBudget = 100.0;
  double _userBudget = 0;
  PlayerList _players = PlayerList(list: []);
  bool loading = false;
  var _services = Services();
  String team_1 = "";
  
  
  setPlayerList(PlayerList obj){
    _players = obj;
    notifyListeners();
  }

  setLoadingStatus(bool status){
    loading = status;
    notifyListeners();
  }
  
  fetchPlayerList() async {
    loading = true;
    notifyListeners();

    _players = await _services.fetchPlayerList();
    _players.list.sort((a,b)=> b.pr.toInt() - a.pr.toInt());
    team_1 = _players.list[0].tn; 
    loading = false;
  
    setPlayerList(_players);
  }

  bool get isLoading => loading;
  PlayerList get getPlayerList => _players;

  List<Player> get selected => _selected;
  
  getPlayerByIndex(int index){
    _players.list.asMap().keys.toList().map((i){
        if(i == index){
          return _players.list[i];
        }
    });
  }

  getUserBudget(){
    if(_selected.length == 0) return 0.0;
    return _selected.fold(0.0, (previousValue, element) => previousValue + element.pr );
  }

  updatePlayer(int index){
    _players.list[index].toggleSelect();  
    _selected.add(_players.list[index]);
    _userBudget = getUserBudget(); 
    print(_userBudget);
    notifyListeners(); 
  }

  removePlayer(int index){
    _players.list[index].toggleSelect();  
    _selected.remove(_players.list[index]);
    
    print(_selected.length);

    _userBudget = getUserBudget();
    print(_userBudget);
    notifyListeners();
  }

  bool canSelect(Player player){
    if(_selected.length < 11 && (getUserBudget() + player.pr) <= _maxBudget){
      return true;
    }else{
      if(_selected.indexOf(player) == -1) return false;
      else return true;
    }
  }
}