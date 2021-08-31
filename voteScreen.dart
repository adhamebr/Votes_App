import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votes_app/Data.dart';
import 'package:votes_app/Home.dart';
import 'package:votes_app/resultsPage.dart';
import 'dart:collection';

class voteScreen extends StatefulWidget {
  Data player;
  voteScreen(Data player){
    this.player=player;
  }
  @override
  State<StatefulWidget> createState() {
    return voteScreenState();
  }
}
class  voteScreenState extends State<voteScreen> {
  String selectedValue='';
  bool enabled=true;
  int itr=1;

  @override
  void initState() {
    super.initState();
  selectedValue = widget.player.Choices_.keys.toList()[0];
}
  void dropChange(value){
  setState(() {
    selectedValue = value;
  });
 }

 String dropVal="test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Vote page'),

      ),
    body:Stack(
        children: [

          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.topLeft,
          child:DropdownButton<String>(
            iconEnabledColor: Colors.teal,
            dropdownColor: Colors.purple,
            onChanged:dropChange,
            value:selectedValue,
            items:widget.player.Choices_.keys.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: Text(value,style: TextStyle(color: Colors.white),),
              value: value,
              );

            }).toList(),
          )),
Container(
  alignment: Alignment.center,
          child:FlatButton(
            color: (enabled==true && itr<= widget.player.Players_)? Colors.blue:Colors.red,
            child: Text(" vote! ",style: TextStyle(fontSize: 17,color:Colors.white),),
            onPressed: (){
              if(enabled==true) {
                itr+=1;
                widget.player.Choices_[selectedValue] += 1;
                setState(() {
                  selectedValue = widget.player.Choices_.keys.toList()[0];
                  enabled = false  ;
                });
              }
            },
          )),
          Container(
            padding: EdgeInsets.all(35),
            alignment: Alignment.topRight,
          child:FlatButton(
            color: itr<=widget.player.Players_?Colors.blueGrey:Colors.red,
            child: Text(" next player ",style: TextStyle(color: Colors.white),),
            onPressed: (){
                if(itr<=widget.player.Players_) {
                  setState(() {
                    selectedValue = widget.player.Choices_.keys.toList()[0];
                    enabled = true;
                  });
                }else{
                  setState(() {
                    selectedValue = widget.player.Choices_.keys.toList()[0];
                    enabled = false;
                  });
                }
              },
          ),
          ),
Container(
alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(20),
          child:FlatButton(
            color: Colors.black,
            child: Text(" show results ",style: TextStyle(fontSize: 17,color: Colors.white),),
            onPressed: (){
              var sortedKeys = widget.player.Choices_.keys.toList(growable:false)
                ..sort((k1, k2) => widget.player.Choices_[k1].compareTo(widget.player.Choices_[k2]));
              LinkedHashMap sortedMap = new LinkedHashMap
                  .fromIterable(sortedKeys, key: (k) => k, value: (k) => widget.player.Choices_[k]);

//              widget.player.Choices_.forEach((key, value) {print("$key  $value");});
             print(sortedMap);
             print(sortedMap.length);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>resultsPage(sortedMap),));

            },
          ),
),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            child:FlatButton(
              color: Colors.red,
              child: Text(" Exit  ",style: TextStyle(fontSize: 17,color: Colors.white),),
              onPressed: (){
                widget.player.Choices_.clear();

                widget.player=null;
                //print(" wwwww ${widget.player.Choices_.length}");
                Navigator.pop(context, MaterialPageRoute(builder: (context)=>Home(),));

              },
            ),
          )

        ],
      ),


    );
  }

}