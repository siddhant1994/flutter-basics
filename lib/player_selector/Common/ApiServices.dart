import 'package:flutter_application_1/player_selector/Common/Constants.dart';
import 'package:flutter_application_1/player_selector/Common/Helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiServices{

  isWordLastInString(String url,String getApi){
    var index = url.lastIndexOf(getApi);
    return (index > -1 && index == (url.length - getApi.length));
  }

  isInString(String url,String postApi){
    var index =  url.indexOf(postApi);
    return index > -1;
  }

  /// get api calls
  Future<dynamic> getReq(String url,Map<String,String> headers,Map<String,String> params) async {

    Helper _helper = Helper();
    String buster;
    String _matchedEndpoint;
    Uri _url;
    var responseJson;
    
    Constants.BUSTERS_API_MAP.forEach((key, value) {
      value.forEach((getApi) {
        if(this.isWordLastInString(url, getApi)) {
          _matchedEndpoint = getApi;
        }
      });
    });

    if(_matchedEndpoint != '')buster = await _helper.getBusterValue(_matchedEndpoint);

    Map<String,String> _headers = {
      ...headers,...Constants.DEFAULT_HEADERS
    };

    params['buster'] = buster;

    print('query params $params');
    print('Headers $_headers');
    
    if(Constants.PROTOCALL == 'http'){
      _url = Uri.http(Constants.BASE_URL, url, params);    
    }else{
      _url = Uri.https(Constants.BASE_URL, url, params);    
    }
    
    print(_url.toString());

    try {      
      final http.Response response = await http.get(
        _url, 
        headers:_headers
      );

      responseJson = jsonDecode(response.body);
      print(responseJson);
      
    } catch (e){
      print('error $e');
    }

    print('api get recieved!');
    return responseJson;
  }

  /// post api calls
  postReq(url,payload,headers) async{
    Helper _helper = Helper();
    String _matchedEndpoint;
    Uri _url;
    var responseJson;

    Map<String,String> _headers = {
      ...headers,...Constants.DEFAULT_HEADERS
    };

    if(Constants.PROTOCALL == 'http'){
      _url = Uri.http(Constants.BASE_URL, url);    
    }else{
      _url = Uri.https(Constants.BASE_URL, url);    
    }

    try {      
      final http.Response response = await http.post(
        _url, 
        headers:_headers
      );
      responseJson = jsonDecode(response.body);
      print(responseJson);

      Constants.BUSTERS_API_MAP.forEach((key, value) {
        if(this.isInString(url, key)){
          _matchedEndpoint = key;
        }
      });

      if(_matchedEndpoint != '') await _helper.updateBuster(_matchedEndpoint);
    
    } catch (e){
      print('error $e');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}
class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}