
import 'package:flutter/material.dart';
import 'dart:math';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _HIghLowGameState();
}

class _HIghLowGameState extends State<MobileView> {

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'CDHS';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
  int randomNumber(int min, int max){
    int random = min + Random().nextInt(max - min);
    return random;
  }
  int attempts = 0;
  int score = 0;
  int cardValue = 0;
  var letter = 'C';
  int cValue1 = 0;
  var cLetter1 = "C";
  int cValue2 = 0;
  var cLetter2 = 'C';
  int cValue3 = 0;
  var cLetter3 = 'C';
  int cValue4 = 0;
  var cLetter4 = 'C';
  int cValue5 = 0;
  var cLetter5 = 'C';
  int cValue6 = 0;
  var cLetter6 = 'C';

  void avoidFirstErorr(){
    if(attempts == 0){
      setState(() {
        cValue1 = randomNumber(1, 13);
        cLetter1 =generateRandomString(1);
      });
    }
    if(attempts > 1){
      attempts = 0;
    }
  }
  void restart(){
    setState(() {
      cValue5 = 0;
      cValue4 = 0;
      cValue3 = 0;
      cValue2 = 0;
      cLetter5 = 'C';
      cLetter4 = 'C';
      cLetter3 = 'C';
      cLetter2 = 'C';
      cardValue = 0;
      letter = 'C';
      score = 0;
    });
  }

  void transfer(){
    cValue5 = cValue4;
    cLetter5 = cLetter4;

    cValue4 = cValue3;
    cLetter4 = cLetter3;

    cValue3 = cValue2;
    cLetter3 = cLetter2;

    cValue2 = cValue1;
    cLetter2 = cLetter1;

    cValue1 = cardValue;
    cLetter1 = letter;

    cardValue = 0;
    letter = 'C';
  }



  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: AlertDialog(
            title: Center(child: Text('YOU WIN')),
        content: Text("Continue"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  transfer();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
            ),
        );
      },
    );
  }
  showAlertGAmeover(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: AlertDialog(
            title: Center(child: Text('GAMEOVER')),
        content: Text("Play Again"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  restart();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
            ),
        );
      },
    );
  }
  void greatEqual(){
    if(cardValue >= cValue1){
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);
      });
    }
    else{
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);
      });
    }
  }
  void lower(){
    if(cardValue < cValue1){
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);
      });
    }
    else{
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    avoidFirstErorr();
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
            Positioned.fill(
                child: Opacity(
                  opacity: 1.0,
                  child: Image.asset('assets/istockphoto.jpg',
                    fit: BoxFit.cover,),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: Column(
                children: [
                  SizedBox(height: 15.0,),
                  Text(
                    'Score: $score',
                    style: TextStyle(git
                      color: Colors.white,
                      fontFamily: 'Anton' ,
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 120.0,
                          width: 80.0,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue2$cLetter2.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 80.0,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue3$cLetter3.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue4$cLetter4.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue5$cLetter5.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue6$cLetter6.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 15.0,),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 240.0,
                          width: 120.0,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //fit: BoxFit.fill,
                                image: AssetImage('assets/$cValue1$cLetter1.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        Container(
                          height: 240.0,
                          width: 120.0,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //fit: BoxFit.fill,
                                image: AssetImage('assets/$cardValue$letter.png')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),

                      ]),
                  SizedBox(height: 30.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.teal,
                                  Colors.lightGreenAccent,
                                ],
                                begin:  Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: FlatButton(
                            onPressed: (){
                              setState((){
                                attempts++;
                                cardValue = randomNumber(1, 13);
                                letter = generateRandomString(1);
                                greatEqual();
                              });
                            },
                            child: Text('Higher\nor\nEqual',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Anton',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),),),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.teal,
                                  Colors.lightGreenAccent,
                                ],
                                begin:  Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: FlatButton(
                            onPressed: (){
                              setState((){
                                attempts++;
                                cardValue = randomNumber(1, 13);
                                letter = generateRandomString(1);
                                lower();
                              });
                            },
                            child: Text(' \nLower\n ',
                              style: TextStyle(
                                fontFamily: 'Anton',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),),),
                        ),
                      ]
                  ),
                ],
              ),
            ),
          ]
      ),
    ));
  }
}
