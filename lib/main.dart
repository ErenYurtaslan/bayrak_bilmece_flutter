import 'package:bayrak_bilmece_flutter/QuizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Anasayfa'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,

      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.indigo),),
      ),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            Text("BİLMECEYE HOŞ GELDİNİZ!", style: TextStyle(fontSize: 31, color: Colors.cyanAccent.shade100),),



            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
                },
                child: Text("BAŞLA", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),

            
            
            
          ],
        ),
      ),

    );
  }
}
