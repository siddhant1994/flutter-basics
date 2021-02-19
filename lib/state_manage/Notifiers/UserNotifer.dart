import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/state_manage/Models/user.dart';

class UserNotifer extends ChangeNotifier{
  User _user; 
  // = User(name: 'siddhant',age: 25);

  setUser(User user){
    _user = user;
    notifyListeners();
  }

  User get getCurrentUser => _user;
}