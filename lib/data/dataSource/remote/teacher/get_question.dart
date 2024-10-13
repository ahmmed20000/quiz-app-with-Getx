
import 'package:quizmopile/core/class/git.dart';
import 'package:quizmopile/linkapi.dart';

class getQuestion{
  gitDataCore g;
  getQuestion(this.g);
  postt(int unm , int quiz_id)async{
    var response = await g.getData(
    Applink.getExam,
    {
     "uni_num":unm,
     "quiz_id":quiz_id
    },
  );
  return response.fold((l) => l, (r) => r);
}
}