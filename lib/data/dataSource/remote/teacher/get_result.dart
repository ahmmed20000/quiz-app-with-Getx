import 'package:quizmopile/core/class/curd.dart';
import 'package:quizmopile/linkapi.dart';

class getResult{

 Crud crud;
  getResult(this.crud);
  
      
            
    
postData( int unii,  int id_quiz, List<Map<String, dynamic>> ans) async {

  var response = await crud.postData(
    Applink.getResult,
    {
      "uni_num": unii,
    "quiz_id": id_quiz,
    "answers":ans
    },
    
  );
  return response.fold((l) => l, (r) => r);
}

}