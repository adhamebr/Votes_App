import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votes_app/Data.dart';
import 'package:votes_app/voteScreen.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController choiceController =  TextEditingController();
  TextEditingController questionController =  TextEditingController();
  TextEditingController playersNumberController =  TextEditingController();
  var Choice;
  var playersNumbers;
  var question ;
  Data playerData=Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#0077C8"),
      appBar: AppBar(
//        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("votes application"),
      ),
      body: Container(
          child: ListView(
        children: [
          Container(
            //how many players? and textfield
            padding: EdgeInsets.only(left: 10, right: 10,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1 - How many players will participate?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: playersNumberController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(

                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      )),
                )),
              ],
            ),
          ),
          Container(
            // what is your Question ? and textfield
            padding: EdgeInsets.only(left: 10, right: 10,top: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2 - What is your question?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(

                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(

                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.chat,
                          color: Colors.black,
                        ),
                      )),
                )),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
     margin: EdgeInsets.only(left: 10, right: 10,top: 20),
            color: Colors.black,
            //how many players? and textfield
            //padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top:15),
               child: Text(

                  "3 - Enter your choices ?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
                Container(
                    padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: choiceController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.format_list_numbered,
                          color: Colors.black,
                        ),
                      )),
                )),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10),
              child:
                  Builder(
                    builder:(context)=>Container(
              child: FlatButton(
shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8)),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text('Add'),
                onPressed: (){

                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(
                        'You added ${playerData.Choices_.length} choices'),
                    backgroundColor: Colors.deepPurpleAccent,));

                  setState(() {
                    Choice=choiceController.text;
                  });
                  playerData.add_Choice(Choice);
                choiceController.clear();
                  },
                colorBrightness: Brightness.dark,
                //padding:EdgeInsets.all(10),
                splashColor: Colors.green,
              )),
                  ) ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: FlatButton(
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: (){

                setState(() {
                  question=questionController.text;
                  playersNumbers=int.parse(playersNumberController.text);

                });
                playerData.Question_=question;
                playerData.Players_=playersNumbers;
                print(playerData.Question_);
                print(playerData.Players_);
                print(playerData.Choices_.length);
                questionController.clear();
                playersNumberController.clear();
                },
              colorBrightness: Brightness.dark,
              //padding:EdgeInsets.all(10),
              splashColor: Colors.green,
            ),
          ),
          Container(
           padding: EdgeInsets.all(40),
            child: FlatButton(
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Hexcolor("#FEEFD4"),
              child: Text("Start Voting!"),
              onPressed: (){
              if(playerData.Choices_.length==0){
              showDialog(context: context,barrierDismissible: false ,builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(" no data "),
                  content: Text(" please enter data "),
                  actions: [
                    FlatButton(
                      child: Text("ok"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );

              });
              }else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => voteScreen(playerData),));
              }
                },
            ),
          )
        ],)

    ),
    );
  }
}
//snackbar