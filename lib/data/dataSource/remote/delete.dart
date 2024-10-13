
import 'package:quizmopile/core/class/delete.dart';
import 'package:quizmopile/linkapi.dart';

class delete {
  deleteFromApi delate;
  delete(this.delate);

  deleteData(int deleteId) async {
    var response = await delate.daleteData("${Applink.delete}/$deleteId");
    return response.fold((l) => l, (r) => r);
  }
}
