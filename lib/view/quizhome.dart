import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:appnode/view/quizpage.dart';
import 'package:appnode/view/loginPage.dart';
import 'package:appnode/view/signupPage.dart';
import 'package:appnode/view/Quimica.dart';
import 'package:appnode/view/Tareas.dart';
import 'package:appnode/view/Fisica.dart';
import 'package:appnode/view/VideoControlPage.dart';
import 'package:appnode/main.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Preparación COLBACH",
      //debugShowCheckedModeBanner: false,
      home: MainPageQuiz(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPageQuiz extends StatefulWidget {
  @override
  _MainPageQuizState createState() => _MainPageQuizState();
}

class _MainPageQuizState extends State<MainPageQuiz> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preparación COLBACH", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: homepage()),
      drawer: Drawer(
        child: ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: Text("Preparación COLBACH"),
            accountEmail: Text("Curso en línea"),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/negro.png"),
              fit: BoxFit.cover)
              
            ),
         ),
           new ListTile(
             title: Text("Matemáticas"),
             onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPageMate()),
                    );
             },
           ),
           new ListTile(
             title: Text("Física"),
             onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fisi()),
                    );
             },
           ),
           new ListTile(
             title: Text("Química"),
             onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quimi()),
                    );
             },
           ),
           new ListTile(
             title: Text("Tareas"),
             onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tare()),
                    );
             },
           ),
           new ListTile(
             title: Text("Quiz"),
             onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                    );
             },
           ),
        ],
      ),
      ),
    );
  }
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "assets/images/py.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/cpp.png",
    "assets/images/linux.png",
  ];

  List<String> des = [
    "Test 1 Física/Geometría analítica",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file 
            // for a particular language
            builder: (context) => getjson(langname),
          ));
          //Notify1();
          
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz simulacro",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Test 1", images[0], des[0]),
          /*customcard("Java", images[1], des[1]),
          customcard("Javascript", images[2], des[2]),
          customcard("C++", images[3], des[3]),
          customcard("Linux", images[4], des[4]),*/
        ],
      ),
    );
  }
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
        bigPicture: MediaSourcePrefix.Asset+"images/bad.png",
        //bigPicture: 'https://png.pngtree.com/element_our/md/20180626/md_5b321cab44ec7.jpg',
        //bigPicture: ruta[0],
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