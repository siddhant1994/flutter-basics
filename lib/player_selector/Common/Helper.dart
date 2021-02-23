
import 'dart:convert';
import 'package:flutter_application_1/player_selector/Common/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  
  Future<SharedPreferences> getSharedPref() async{
    return await SharedPreferences.getInstance();
  }

  getFromStorage(key) async{
    SharedPreferences sharedPref = await this.getSharedPref(); 
    return sharedPref.getString(key);
  }

  setInStorage(key,value) async{
    SharedPreferences sharedPref = await this.getSharedPref(); 
    sharedPref.setString(key, value);
  }

  removeFromStorage(key) async{
    SharedPreferences sharedPref = await this.getSharedPref(); 
    sharedPref.remove(key);
  }
  
  Future<void> setUpBusters() async{
    await this.removeFromStorage('buster_config');
    Map busterConfig = {};

    Constants.BUSTERS_API_MAP.forEach((key, value) {
      value.forEach((entry){
        busterConfig[entry] = DateTime.now().millisecondsSinceEpoch;
      });
    });

    await this.setInStorage('buster_config', jsonEncode(busterConfig));
  }

  updateBuster(String postApi) async{
    var _busterConfig = await this.getFromStorage('buster_config');

    Map busterConfig = jsonDecode(_busterConfig);
    List _getApis = Constants.BUSTERS_API_MAP[postApi];

    _getApis.forEach((endPoint) { 
      busterConfig[endPoint] = DateTime.now().millisecondsSinceEpoch;
    });

    await this.setInStorage('buster_config', jsonEncode(busterConfig));
  }

  getBusterValue(String getApi) async{
    var _busterConfig = await this.getFromStorage('buster_config');
    Map busterConfig = jsonDecode(_busterConfig);
    return busterConfig[getApi].toString();
  }
}