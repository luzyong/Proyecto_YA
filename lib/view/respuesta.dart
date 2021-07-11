import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
class Respuesta{
  
  Notificaincorrecto(List tema){
    print('finale $tema');
    for(int i =0;i<tema.length;i++){
      switch(tema[i]){
        case 1:
          Notify1();
          break;
        case 2:
          Notify2();
          break;
        case 3:
          Notify3();
          break;
        case 4:
          Notify4();
          break;
        case 5:
          Notify5();
          break;
        case 6:
          Notify6();
          break;
        case 7:
          Notify7();
          break;
        case 8:
          Notify8();
          break;
        case 9:
          Notify9();
          break;
        case 10:
          Notify10();
          break;
        default:
          break;
      }
     // }
    }
}
    void Notify1()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula del desplazamiento",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
          bigPicture: MediaSourcePrefix.Asset+"images/bad.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        //bigPicture: MediaSourcePrefix.Network+'sites.google.com/site/matematicasfg/_/rsrc/1458183360749/introduccion/FormulaGeneral.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
 
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify2()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 2,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula de la velocidad MRU",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'https://sites.google.com/site/matematicasfg/_/rsrc/1458183360749/introduccion/FormulaGeneral.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify3()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula de la velocidad MRUA",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'https://i2.wp.com/www.profesor10demates.com/wp-content/uploads/2013/08/movimiento-rectilineo-uniformemente-acelerado-ejercicios-resueltos.png?fit=1130%2C435&ssl=1',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 10,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify4()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 4,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula de la fuerza",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'http://4.bp.blogspot.com/-EyUJ65Dwk_0/UdYMLSnE1uI/AAAAAAAAAgs/EJaMvnOu9-4/s532/segunda+ley+de+newton+1.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 40,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify5()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 5,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula de la aceleración",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'http://agrega.juntadeandalucia.es/repositorio/17012017/ca/es-an_2017011712_9120007/formula_aceleracion_constante.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 80,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify6()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 6,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Fórmula de la pendiente",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'http://weeklymathblog.weebly.com/uploads/8/7/5/9/87593848/ola2_orig.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 120,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify7()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 7,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Distancia entre dos puntos",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'http://pspc1.weebly.com/uploads/2/4/5/4/24543920/2278227_orig.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 160,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify8()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 8,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Ecuación ordinaria de la elipse con centro en el origen",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_elipse.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 200,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify9()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 9,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Ecuación de la hipérbola con centro en el origen",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_hiperbola.png',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 240,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
  void Notify10()  async{
      String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      
  
      print('hola');
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'key1',
          title: 'Preparación COLBACH',
          body: "Ecuación general de la circunferencia",
        //bigPicture: 'https://www.fisimat.com.mx/wp-content/uploads/2019/01/ecuacion_de_la_parabola_2.png',
        //bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        //bigPicture: MediaSourcePrefix.Asset+"assets/images/no.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
          bigPicture: 'https://i0.wp.com/cursoparalaunam.com/wp-content/uploads/2020/08/forma-general-de-la-ecuacion-de-la-circunferencia-con-centro-hk.png?resize=300%2C177&ssl=1',
          notificationLayout: NotificationLayout.BigPicture
        ),
    schedule: NotificationInterval(interval: 280,timeZone: timezom,repeats: true),
  //posicion = random.nextInt(3);
  
   //schedule: NotificationCalendar(hour:06,minute: 00,allowWhileIdle:false, repeats:true),
  );
  }
}