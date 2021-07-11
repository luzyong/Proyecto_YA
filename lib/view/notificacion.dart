import 'dart:math';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
class Notificaciones{
  String picture;
  void Notifysi(String email)  async{
    String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: 'Hola, $email, acabas de iniciar sesión',
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: 'asset://assets/images/no.png',
        bigPicture: 'https://png.pngtree.com/element_our/20190603/ourlarge/pngtree-illustration-of-a-round-smiley-face-image_1432867.jpg',
        notificationLayout: NotificationLayout.BigPicture
      ),
   //schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
   //schedule: NotificationCalendar.fromDate(date: DateTime(2021,06,11, 00, 20, 00, 00),allowWhileIdle:false, repeats:true),
  );
  print(MediaSourcePrefix.Asset+"assets/images/coronavirus.png");

}
void Notifyno(String email)  async{
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();

 await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: 'Advertencia, este dispositivo no está vinculado a la cuenta $email',
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        notificationLayout: NotificationLayout.BigPicture
      ),
   //schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
   //schedule: NotificationCalendar.fromDate(date: DateTime(2021,06,11, 00, 20, 00, 00),allowWhileIdle:false, repeats:true),
  );
  //print(MediaSourcePrefix.Asset+"assets/images/no.png");

}
void Notify1()  async{
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  List<String> bodys = ['Fórmula General','Fórmula de la Parábola', 'Fórmula del peso', 'Teorema de Pitágoras'];
  List<String> ruta = ['https://sites.google.com/site/matematicasfg/_/rsrc/1458183360749/introduccion/FormulaGeneral.png','https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola.png','https://www.lifeder.com/wp-content/uploads/2020/09/f%C3%B3rmula-del-peso-lifeder-min.jpg','https://miprofe.com/wp-content/uploads/2015/12/Teorema-de-pitagoras-1280x720.png'];
  
  print('hola');
 await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 3,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: bodys[0],
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        bigPicture: ruta[0],
        notificationLayout: NotificationLayout.BigPicture
      ),
   schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
 );
  print(ruta[0]);
 await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 4,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: bodys[1],
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        bigPicture: ruta[1],
        notificationLayout: NotificationLayout.BigPicture
      ),
   //schedule: NotificationInterval(interval: 180,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   schedule: NotificationCalendar(hour: 10,minute: 00,allowWhileIdle:false, repeats:true),
  );
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 5,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: bodys[2],
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        bigPicture: ruta[2],
        notificationLayout: NotificationLayout.BigPicture
      ),
   //schedule: NotificationInterval(interval: 360,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
   //schedule: NotificationCalendar.fromDate(date: DateTime(2021,06,))
   schedule: NotificationCalendar(hour:14,minute: 00,allowWhileIdle:false, repeats:true),
  );
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 6,
        channelKey: 'key1',
        title: 'Preparación COLBACH',
        body: bodys[3],
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        bigPicture: ruta[3],
        notificationLayout: NotificationLayout.BigPicture
      ),
   //schedule: NotificationInterval(interval: 720,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   schedule: NotificationCalendar(hour: 18,minute: 00,allowWhileIdle:false, repeats:true),
  );
}
}
