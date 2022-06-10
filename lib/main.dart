import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myfunction.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mypage(),
  ));
}
class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children:[
            SizedBox(height:20),
            Text('\n\n  High-Low\nCard Game',
            style: TextStyle(
              fontSize:80.0,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 200),
      RaisedButton(onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MobileView())
        );
      },
        child: Text('\nStart Game\n',
        style: TextStyle(
          fontSize:30.0,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.bold,
        )
        ),
      )
          ]
        ),
      ),
    );
  }
}

