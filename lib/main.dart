

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
  
}

class MainPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    
    body: Column(
      
      children: [
     
 Container(
  
  color: Colors.blue,
  height: MediaQuery.of(context).size.height/2,
  width: double.infinity,
  child: Center(child: MaterialButton(onPressed: (){

 Navigator.push(context, MaterialPageRoute(builder: ((context) => GamePage())));

  },
      
      child: Text("Start",style: TextStyle(color: Colors.black),), 
      color: Colors.white,
      shape: CircleBorder(),
      height: 150,
      minWidth: 150,
    
      ), 
      ),
  
 ),
 Container(
  color: Colors.red,
  height: MediaQuery.of(context).size.height/2,
  width: double.infinity,
  child:  Center(child: MaterialButton(onPressed: (){

Navigator.push(context, MaterialPageRoute(builder: ((context) => GamePage())));

  },
      
      child: Text("Start",style: TextStyle(color: Colors.black),), 
      color: Colors.white,
      shape: CircleBorder(),
      height: 150,
      minWidth: 150,
    
      ),
      ),
 ),

    ],)
   );
    
  }
}

 
class GamePage extends StatefulWidget{

   
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  double blueCardHeight = 0;
  double redCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool intialized = false;

  Widget build(BuildContext context) {

   

    if(intialized==false){
    blueCardHeight = MediaQuery.of(context).size.height/2;
    redCardHeight = MediaQuery.of(context).size.height/2;

    intialized = true;
    }

   

    return Scaffold(
      body: Column(children: [
        
        MaterialButton(
          onPressed: (){
            print(redCardHeight);
             setState(() {
    blueCardHeight = blueCardHeight + 30;
    redCardHeight = redCardHeight - 30;

    playerBScore = playerBScore + 5;
 });

  double maxHeight = MediaQuery.of(context).size.height - 60;

  if(blueCardHeight > maxHeight){

    Navigator.push(context, MaterialPageRoute(builder: ((context) => ResultPage(playerBScore,"PLAYER B WON"))));
    print("Player B win");
   
    
  }
   

          },
          padding: EdgeInsets.zero,
          child: Container(
            color: Colors.blue,
            height: blueCardHeight,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Row(children: [
          
              Expanded(child: Text("Player B",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              Text(playerAScore.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],),
          ),
        ),

        
    MaterialButton(
      onPressed: () {
        setState(() {
        redCardHeight = redCardHeight + 30;
        blueCardHeight = blueCardHeight - 30;

        playerAScore = playerAScore + 5;
        });

         double screenHeight = MediaQuery.of(context).size.height;
    double maxHeight = MediaQuery.of(context).size.height - 60;

    print(redCardHeight);
    print(maxHeight);

    if(redCardHeight > maxHeight){
      Navigator.push(context,MaterialPageRoute(builder: ((context) => ResultPage(playerAScore, "PLAYER A WON"))));
      print("Player A win");
    }
    
        
      },
      padding: EdgeInsets.zero,
      child: Container(
      color: Colors.red,
      height: redCardHeight,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
            child: Row(children: [
      
              Expanded(child: Text("Player A",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              Text(playerBScore.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],),
      
          ),
    ),
      ],),
    );
 }
}


class ResultPage extends StatelessWidget{

int score = 0;
String player = "";

ResultPage(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "PLAYER A WON" ? Colors.red : Colors.blue,
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
         Text(player,style: TextStyle(fontSize: 35),),
         MaterialButton(onPressed: (){
    Navigator.pop(context);
    Navigator.pop(context);

         },
         color: Colors.white,
         child: Text("Restart Game"),
         ),
        ],
        ),
      ),
    );
  }
}