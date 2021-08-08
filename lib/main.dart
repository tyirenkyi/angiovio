import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

//screens
import 'views/Login.dart';
import 'views/SignUp.dart';
import 'views/Home.dart';
import 'views/Error.dart';
import 'views/Loading.dart';

//providers
import 'providers/drug_provider.dart';

Future<void> _messagingBackgroundHandler(RemoteMessage message) async {
  print(message);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  FirebaseMessaging.onBackgroundMessage(_messagingBackgroundHandler);

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    'This channel is used for important notifications',
    importance: Importance.high
  );

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('ic_stat_logo');
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final MacOSInitializationSettings initializationSettingsMacOS =
  MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false);
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(
    ChangeNotifierProvider(
      create: (context) => DrugProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return MaterialApp(home: Error());
        }
        if(snapshot.connectionState == ConnectionState.done) {
          FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
          var homeScreen;
          if(_firebaseAuth.currentUser != null)
            homeScreen = Home();
          else
            homeScreen = Login();
          return MaterialApp(
            title: 'Angiovio',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                accentColor: Colors.black
            ),
            home: homeScreen,
            routes: {
              SignUp.routeName: (context) => SignUp(),
              Login.routeName: (context) => Login(),
              Home.routeName: (context) => Home(),
            },
          );
        }
        return MaterialApp(home: Loading());
      }
    );
  }
}