



import 'package:quizmopile/core/class/curd.dart';
import 'package:quizmopile/linkapi.dart';

class addExcel{
  Crud crud;
  addExcel(this.crud);
  
  postData(List uni , int quiz_id

  ) async{
    var response=await crud.postData(Applink.add1, {
    "uni_num": uni,
        "quiz_id": quiz_id
    }
    );
   return response.fold((l)=>l,(r)=>r);
  }
}