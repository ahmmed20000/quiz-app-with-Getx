import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'statusrequest.dart';

// ignore: camel_case_types
class gitDataCore {
  late SharedPreferences s;
  Future<Either<StatusRequest, Map>> getData(
      String linkurl, Map<String, dynamic> data) async {
    s = await SharedPreferences.getInstance();
    try {
      print("token in share in getData is  ${s.getString("token")}");
      var headersList = {
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Authorization':
            'Bearer ${s.getString("token")}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var url = Uri.parse(linkurl);

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);
      req.body = json.encode(data);
      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print("before assegn mmmm");
        Map<String, dynamic> m = jsonDecode(resBody);
        return Right(m);
      } else if(res.statusCode == 404){
         Map<String, dynamic> m = jsonDecode(resBody);
        return Right(m);
      }else {
        return const Left(StatusRequest
              .serverfailure); 
      }
    } catch (_) {
      print("=====================crud====================");
      print(_);
      print("========================crud==================");
      return const Left(StatusRequest.serverfailure);
    }
  }
}
