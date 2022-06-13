import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_2/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter_2/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter_2/responsive/web_screen_layout.dart';
import 'package:instagram_flutter_2/screens/login_screen.dart';
import 'package:instagram_flutter_2/screens/signup_screen.dart';
import 'package:instagram_flutter_2/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDXXM38d4l2oHGCGRrG7BNUVz_TUIbeHC0",
          appId: "1:768823901456:web:320c61e645759d168fb995",
          messagingSenderId: "768823901456",
          projectId: "instagram-clone-647f0",
          storageBucket: "instagram-clone-647f0.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //     webScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),

      home: SignupScreen(),
    );
  }
}
