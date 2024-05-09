import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  int dogruSayisi;


  ResultPage({required this.dogruSayisi});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,

      appBar: AppBar(
        title: const Text("Sonuç Ekranı", style: TextStyle(color: Colors.indigo),),
      ),



      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text("${widget.dogruSayisi} DOĞRU ${10-widget.dogruSayisi} YANLIŞ", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),),
            Text("%${(widget.dogruSayisi*100)~/10} Başarı Oranı", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),),
            widget.dogruSayisi >= 7   ?   Text("TEBRİKLER!", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),)       :      Text("GELİŞMELİSiNİZ!", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),),




            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("TEKRAR OYNA", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),


          ],
        ),



      ),

    );
  }
}
