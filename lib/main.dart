import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:pinterest2/homeview.dart';




void main(){
  runApp(
    DevicePreview(builder: (context) =>MyApp(),
    )
   );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     locale: DevicePreview.locale(context), 
     builder: DevicePreview.appBuilder,

     home: HomeView(),
    );
    
  }
}