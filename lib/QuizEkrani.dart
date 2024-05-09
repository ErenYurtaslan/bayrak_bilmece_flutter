import 'dart:collection';

import 'package:bayrak_bilmece_flutter/Bayraklar.dart';
import 'package:bayrak_bilmece_flutter/BayraklarDao.dart';
import 'package:bayrak_bilmece_flutter/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var questions = <Bayraklar>[];
  var wrongAnswers = <Bayraklar>[];
  late Bayraklar correctAnswer;
  var allAnswers = HashSet<Bayraklar>();

  int questionCounter = 0;
  int correctCounter = 0;
  int wrongCounter = 0;

  String flagImageName = "placeholder.png";
  String aButtonText = "";
  String bButtonText = "";
  String cButtonText = "";
  String dButtonText = "";



  @override
  void initState() {
    super.initState();
    getQuestions();
  }




  Future<void> getQuestions() async{
    questions = await BayraklarDao().randomlyFetch();
    uploadQuestion();
  }


  Future<void> uploadQuestion() async{
    correctAnswer = questions[questionCounter];

    flagImageName = correctAnswer.bayrak_resim;

    wrongAnswers = await BayraklarDao().randomlyBringWrongOnes(correctAnswer.bayrak_id);




    allAnswers.clear();

    allAnswers.add(correctAnswer);

    allAnswers.add(wrongAnswers[0]);
    allAnswers.add(wrongAnswers[1]);
    allAnswers.add(wrongAnswers[2]);


    aButtonText = allAnswers.elementAt(0).bayrak_ad;
    bButtonText = allAnswers.elementAt(1).bayrak_ad;
    cButtonText = allAnswers.elementAt(2).bayrak_ad;
    dButtonText = allAnswers.elementAt(3).bayrak_ad;

    setState(() {});

  }



  void questionCounterControlling(){
    questionCounter++;

    if(questionCounter != 10){
      uploadQuestion();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(dogruSayisi: correctCounter)));
    }

  }




  void correctControlling(String buttonText){
    if(correctAnswer.bayrak_ad == buttonText){
      correctCounter++;
    }else{
      wrongCounter++;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,

      appBar: AppBar(
        title: const Text("Bilmece Ekranı", style: const TextStyle(color: Colors.indigo),),
      ),




      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $correctCounter", style: TextStyle(fontSize: 18, color: Colors.cyanAccent.shade100),),
                Text("Yanlış : $wrongCounter", style: TextStyle(fontSize: 18, color: Colors.cyanAccent.shade100),),
              ],
            ),




            questionCounter != 10     ?      Text("${questionCounter+1}. SORU", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),)         :        Text("$questionCounter. SORU", style: TextStyle(fontSize: 30, color: Colors.cyanAccent.shade100),),

            Image.asset("bayraklar/$flagImageName"),




            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  correctControlling(aButtonText);
                  questionCounterControlling();
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(dogruSayisi: 3,)));
                },
                child: Text("A) $aButtonText", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),




            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  correctControlling(bButtonText);
                  questionCounterControlling();
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(dogruSayisi: 3,)));
                },
                child: Text("B) $bButtonText", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),




            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  correctControlling(cButtonText);
                  questionCounterControlling();
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(dogruSayisi: 3,)));
                },
                child: Text("C) $cButtonText", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),





            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  correctControlling(dButtonText);
                  questionCounterControlling();
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(dogruSayisi: 3,)));
                },
                child: Text("D) $dButtonText", style: TextStyle(color: Colors.indigo.shade900),),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
