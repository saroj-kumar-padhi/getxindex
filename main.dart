import 'package:flutter/material.dart';

void main(){
  runApp(
    GetMaterialApp(
      title :"Application",
      initialRoute: AppPages.INITIAL,
      getPages : AppPages.routes,
      debugShowCheckedModeBanner : false
    ),
  );
}