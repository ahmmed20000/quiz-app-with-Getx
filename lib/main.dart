import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quizmopile/binding/initialbinding.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/language/local.dart';
import 'package:quizmopile/core/language/localController.dart';
import 'package:quizmopile/core/services/settingServices.dart';
import 'package:quizmopile/routs.dart';
import 'package:quizmopile/view/QuistionPage.dart';
import 'package:quizmopile/view/auth/login_page.dart';
import 'package:quizmopile/view/auth/sign_up.dart';
import 'package:quizmopile/view/cc.dart';
import 'package:quizmopile/view/resultPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices(); // مرقت التابع بالمين مشان اقدر اوصله من كل مكان
  runApp(const MyApp());
}

Future initServices() async {
  //تابع مشان الخدمات
  await Get.putAsync(() => settingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    localController controller = Get.put(localController());
    double m = MediaQuery.of(context).size.width ;
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      locale:controller.language ,//هون اخذ اللغة 
      theme: ThemeData(
        textTheme: TextTheme(//هون ثيم الخطوط الي عندي بكل لتطبيق
        
          headlineLarge:TextStyle(
                fontSize: m*0.02 ,
                fontWeight: FontWeight.bold , 
                color: appColors.primaryColor
              ),
          headlineMedium:  TextStyle(
                fontSize: m*0.02 ,
                fontWeight: FontWeight.bold , 
                color: appColors.secondColor
              ),
          headlineSmall:  TextStyle(
                fontSize: m*0.02 ,
                fontWeight: FontWeight.bold , 
                color: appColors.secondaryColor
              ),
          bodyMedium:  TextStyle(
                fontSize: m*0.04 ,
                //fontWeight: FontWeight.w500 , 
                color: appColors.secondColor
              ),
           bodyLarge:  TextStyle(
                fontSize: m*0.05,
                fontWeight: FontWeight.w500 , 
                color: appColors.primaryColor
              ),
           bodySmall:  TextStyle(
                fontSize: m*0.05 ,
                fontWeight: FontWeight.w500 , 
                color: appColors.secondaryColor
              ),     
        )
      ),
      translations: local(),
      home: Login(),
      routes: routs,
      initialBinding: InitialBindings(),
    );
  }
}
