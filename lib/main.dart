import 'package:flutter/material.dart';
import 'package:flutterpeshwar/first.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int count = 0;
  final checkIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 35,
  );
  final crossIcon = Icon(Icons.clear, color: Colors.red, size: 35);
  List<Icon> iconsList = [];

  final List<Question> questionList = [
    Question("Imran khan is Prime Minister OF PAKISTAN", true),
    Question("Nawaz Sharif is Prime Minister OF PAKISTAN", false),
    Question("IS PAKISTAN MOST BEAUTIFUL?", true),
    Question("PAKISTAN IS WEAK?", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  questionList[count].text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    _checkAns(true);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.white12, width: 8)),
                    child: Center(
                      child: Text(
                        "True",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _checkAns(false);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Colors.white12, width: 8)),
                  child: Center(
                    child: Text(
                      "False",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: iconsList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkAns(selectAns) {
    if (selectAns == questionList[count].ans) {
      setState(() {
        iconsList.add(checkIcon);
        if (count < questionList.length - 1) count++;
      });
    } else {
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionList.length - 1) count++;
      });
    }
  }
}
