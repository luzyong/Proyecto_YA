import 'dart:isolate';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';




GetUserName comprueba = GetUserName();
class notificaciones{
  static CollectionReference users = FirebaseFirestore.instance.collection('pushtokens');

  static getToken()  {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    
      _firebaseMessaging.getToken().then((deviceToken)async{
        //String usr ="user${deviceToken?.substring(0,9)}";
        print('Token $deviceToken');
        /*print(usr);
        bool result = await comprueba.comprobeUser(deviceToken,usr);
        if(result){
          print("yap");
        }
        else if(!result){
          addUser(deviceToken,usr);
        }
        else{
          print("error");
        }*/
      });        
    }  

  static showNotification(RemoteMessage msg) async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    String titulo = msg.data['titulo'];
    String body = msg.data['mensaje'];

    
    await flutterLocalNotificationsPlugin.show(
        0, titulo, body, platform);
  }    

 static Future<void> addUser(String token, String usr) {
      // Call the user's CollectionReference to add a new user
      
      return users
          .doc(usr).set({
            'devtoken':token,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }
     
  static configureFirebaseListeners(){
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      showNotification(message);
      //notificaciones.Notify(message);
      print('message ${message.data}');
      
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //showNotification(message);
      print('A new onMessageOpenedApp event was published!');

      print('message ${message.data}');
    });

  }
  static  peticion () async{
    var response = await http.get(Uri.parse('http://192.168.56.1:3000/one-user'));
    print(response.statusCode);
    
  }

  static void Notify(RemoteMessage message)  async{
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  String titulo = message.data['title'];
  
 await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey:'notificacion',
        title: titulo,
        body: message.data['body'],
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/coronavirus.png",
        notificationLayout: NotificationLayout.BigPicture
      ),
   schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: false),
   //schedule: NotificationCalendar.fromDate(date: DateTime(2021,06,11, 00, 20, 00, 00),allowWhileIdle:false, repeats:true),
  );
  print(MediaSourcePrefix.Asset+"assets/images/coronavirus.png");

}

}
class GetUserName{
    CollectionReference users = FirebaseFirestore.instance.collection('pushtokens');
    Future<dynamic> comprobeUser(String token, String usr) async{
      DocumentSnapshot snapshot;
      snapshot= await users.doc(usr).get();
    
      if(snapshot.exists){
        if(snapshot['devtoken']==token){
           return true;
        }
      }
      else{
         return false;
      }
    }
}