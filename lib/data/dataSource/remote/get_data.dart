
import 'package:quizmopile/core/class/git.dart';
import 'package:quizmopile/linkapi.dart';

class getData {
  gitDataCore get;
  getData(this.get);
  GetData(
    int un , 
    int quiz_id
  )async{
var response = await get.getData(Applink.getExam , 
{
  "uni_num":un,
     "quiz_id":quiz_id
}
);
     }
}
