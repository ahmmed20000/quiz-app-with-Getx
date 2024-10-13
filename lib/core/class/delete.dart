import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'statusrequest.dart';

class deleteFromApi {
  // late SharedPreferences sharedDelete;
  Future<Either<StatusRequest, Map>> daleteData(
    String linkurl,
  ) async {
    // sharedDelete = await SharedPreferences.getInstance();
    //print("token in DeleteFromApi is ${sharedDelete.getString("token")}");
    try {
      if (/*await checkInternet()*/ true) {
        print("response in beforeeee in delete from api");
        var response = await http.delete(
          Uri.parse(linkurl),
          headers: <String, String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzgyYTE2MzA1Y2ZkZWM0ZTdkYjk2YjM1ODc2OWI1Zjg2MDQ2MzY1YWM3ODg2ZDk2ODlkN2ZhMDM0MzMwNjI5MGU0ZTg4MGNlZWNlYWQ5YTIiLCJpYXQiOjE3MjM0MTIwNjQuNDI2MjE5LCJuYmYiOjE3MjM0MTIwNjQuNDI2MjIzLCJleHAiOjE3NTQ5NDgwNjQuMTQ4MzAyLCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.ABT6EJdFibMunD8DGzautjooTHKk9DqctQMU8hZp70SQL34xRTif84VlDlTS3WdYJJF9OcL2u5L_MfwgZYTytDhPL77VM3hpYG8ny5i9uNfSvhJZiAmz3iAAprbyBUnzg2_qLibGW_cvLVgeq7eoETTab7S-YFlH9gFk82qMMHcztIR8IHzqQto11G4nA6eBZ8Yt5zpDHSkjehpZR8EHBL5V_xGNysQMrucaV9MuP-HAYmwSdTi_e1J_PFkXr5rNkPSjLdNqKChYf-o5ZUTqsLRaOMTsBScLNFViw4sbIq11oROLhLvwmPQC79CdTpYApP0NKWKNuZDt980TtpsiGD6TXEMPdntEVauXPXuaxo4irKM3I009fQ3HuI-KKkpJyWEZQzKqu-VDGj0bkSXKti3Bc-EnJR8l7AKOWtOZ5VebM7Gfb6I_cyvh_DBDBgOphT1DTtgYDDyREWTIHSopU59ED8qfcJf-MkuQi9qtSlM3Ba2Mdbrwm-wnjiRfGPQj19T0_Pm9D43N0VLuPLxm4O_sybA6vt6aZU-lv_D4lx4cirbN3qqRSz_6-iOn35iZANb5NtOmOZ7Yy-TgqGXyzj0HNyWBom4w7r65SOTTqQLMxvNOKp_eXSVmaYhHDF46UWuP3SoC3exJv2Giak98KJ4ocUtw2ctLbb93bVSQm1c',
          },
        );
        print("response in afterrr in delete from api");

        if (response.statusCode == 200 ||
            response.statusCode == 201) //الاتصال بالصفحة تم بنجاح
        {
          
          Map responsebody = jsonDecode(response.body);
          print("response in body in delete from api is ${responsebody}");
          return Right(responsebody);
        } else {
          return const Left(StatusRequest
              .serverfailure); // استخدمنا ليفت لان الحالات موجودة باليسار
        }
        // ignore: dead_code
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print("=====================crud====================");
      print(_);
      print("========================crud==================");
      return const Left(StatusRequest.serverfailure);
    }
  }
}
