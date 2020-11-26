import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morse/morse.dart';



void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text('Morse Translator',),
            backgroundColor: Colors.grey,
          ),
          body: SafeArea(
            child: Center(child: MyApp()),
          ),
        ),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var b;
final inputcontroller = TextEditingController();
var message = "";
final Morse morse = new Morse();
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 6,top: 90,
            child: Container(
              child: Container(child: Text('English',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              ),
                alignment: Alignment.topCenter,
              ),
              padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xfffdd835),
              borderRadius: BorderRadius.circular(40.0)
            ),
              constraints: BoxConstraints(maxWidth: 130,maxHeight: 115),
            ),
          ),
          Positioned(
            top: 140,left: 5,
            child: Container(
              child: Container(
                child : Column(
                  children: [
                    TextField(
                      controller: inputcontroller,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 25,color: Colors.white),
                        hintText: 'Enter your Text',
                        suffixIcon: Container(child: IconButton(icon: Icon(Icons.cancel,),
                            onPressed: ()=>inputcontroller.clear(),)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(50),
                      ),
                    ),
                    MaterialButton(onPressed: (){
                      setState(() {
                        b = morse.encode(inputcontroller.text);
                        setState(() {
                          message = b;
                        });
                      });
                    },
                      child: Icon(Icons.send,size: 25,),

                    ),
                  ],
                ),
                alignment: Alignment.topCenter,
              ),
              decoration: BoxDecoration(
                color: Color(0xfffdd835),
                boxShadow: [BoxShadow(
                  color: Color(0xfffbc02d),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(-1.0,-0.5),
                )],
                borderRadius: BorderRadius.circular(50.0)
              ),
              constraints: BoxConstraints(maxWidth: 400,maxHeight: 600),
            ),
          ),

          Positioned(
            top: 115,left: 300,
            child: RaisedButton(
              padding: EdgeInsets.all(12.0),
              shape: CircleBorder(
                side: BorderSide(color: Colors.tealAccent),
              ),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.content_copy,size: 20,),
             ],
           ),
              onPressed: () {},
              color: Color(0xffC9F2DB),
          ),
          ),

          Positioned(
            left: 6,top: 320,
            child: Container(
              child: Container(child: Text(
                'Morse',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 17,
                ),
              ),
                alignment: Alignment.topCenter,
              ),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Color(0xff5B6F73),
                  borderRadius: BorderRadius.circular(40.0)
              ),
              constraints: BoxConstraints(maxWidth: 130,maxHeight: 115),
            ),
          ),

          Positioned(
            top : 370,left: 5,
            child: Container(
              child: Container(
                child : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 0.0),
                     child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      height: 5.5,
                  ),
                ),
              ),
                  ],
                ),
                alignment: Alignment.center,
              ),
              decoration: BoxDecoration(
                 color: Color(0xff546e7a),
                  boxShadow: [
                  BoxShadow( color: Color(0xFF221D0C),
                    blurRadius: 1.0,
                    spreadRadius: 2.0,
                    offset: Offset(1.0,2.7),
                   ),
                  ],
                  borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints(maxWidth: 400,maxHeight: 400),
            )
          ),

          Positioned(
            top: 349,left: 300,
             child: RaisedButton(
               padding: EdgeInsets.all(12.0),
               shape: CircleBorder(
                   side: BorderSide(color: Colors.tealAccent),
               ),
               child: Column( // Replace with a Row for horizontal icon + text
                 children: <Widget>[
                   Icon(Icons.content_copy,size: 20,),
                 ],
               ),
               onPressed: () {},
               color: Color(0xffC9F2DB),
             ),
            ),

          Positioned(
            top: 340,left: 175,
            child: RaisedButton(
              padding: EdgeInsets.all(17.0),
              shape: CircleBorder(
                side: BorderSide(color: Colors.tealAccent),
              ),
              child: Container(
                child: Row(
                children: [
                  Icon(Icons.translate),
                ],
              ),
              ),
              onPressed: () {},
              color: Color(0xffC9F2DB),
                ),

            ),
        ],
      ),
    );
  }
}
