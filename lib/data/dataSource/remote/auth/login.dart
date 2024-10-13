

import 'package:quizmopile/core/class/crud_auth.dart';
import 'package:quizmopile/linkapi.dart';

class LoginData{
  CrudAuth crud;
  LoginData(this.crud);
  postData(String email,String password) async{
    var response=await crud.postData(Applink.login,{
      
      "email":email,
      "password":password
    });
    return response.fold((l)=>l,(r)=>r);
  }
}