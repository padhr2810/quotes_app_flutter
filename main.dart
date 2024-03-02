import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: QuoteGenerator(),
    );
  }
}

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  State<QuoteGenerator> createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final String quoteURL = "https://api.adviceslip.com/advice";
  String quote = 'Success loves speed';

  generateQuote() async {
    // var res = await http.get(Uri.parse(quoteURL));
    // var result = jsonDecode(res.body);
    // print(result["slip"]["advice"]);
    // setState(() {
    //  quote = result["slip"]["advice"];
    //
    List quoteList = [
      "You are poor, you are poor... YOU ARE POOR.",
      "I don't need to be motivated because I'm a disciplined person. \nIf I allocate X amount of time to do something, I'm going to do exactly that \nwith complete and absolute vigor for the allocated amount of time.",
      "Every action you take is molding who you are as a person. \nEvery time that you sleep in. \nEvery time you are undisciplined, you are training yourself that it's okay. \nA downward spiral towards mediocrity.",
      "You are exactly where you deserve to be. \nChange who you are and you will change how you live.",
      "If I'm not doing something which is either extremely difficult or \nextremely stressful I am in a perpetual state of crippling boredom. \nTherefore I constantly seek difficulty to solve and forever succeed.",
      "Men are not designed to be comfortable. \nThey want to achieve. \nThey want to feel pain and suffering. \nThey want to conquer something.",
      "The person who goes to the gym every day regardless of how they feel \nwill always beat the person who goes to the gym when they feel like going to the gym.",
      "Emotional control isn’t a lack of emotion \nit's a necessary function of maturity",
      "I could never stop fighting even if I lost 100 fights \nbecause I'm not built to live a normal existence",
      "For 12 years I trained 5 hours per day, six days per week \nand I was motivated to train probably 25% of the time. \nThe rest of the time I went because I am disciplined.",
      "You're going to have to work when you don't feel like working. \nThat's how it's going to have to be \nor you're never going to be important.",
      "Sadness is a warning. \nYou feel it for a reason. \nYour mind is telling you that you need to work harder.",
      "The temporary satisfaction of quitting is outweighed \nby the eternal suffering of being a nobody.",
      "Close your eyes. \nFocus on making yourself feel excited, powerful.\nImagine destroying every goal with ease.\nSoon - a smile will appear.\nNow open your eyes.\nGet to work.",
      "The amount of stress you can tolerate while remaining effective \nis directly correlated to the level of success you will enjoy.",
      "If you want people to care about who you are \nbecome familiar with pain.",
      "Being sloppy in one area of your life \nresults in sloppiness in all areas of your life. \nStart with the way you make a cup of coffee \nor the way you handle an argument. \nBe systematic and professional in ALL things.",
      "Success loves speed",
      "Optimism is a prerequisite to genuine efforts"
    ];
    int randomIndex = Random().nextInt(quoteList.length);
    var result = quoteList[randomIndex];
    setState(() {
      quote = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text('Tate Quote Generator'),
          backgroundColor: Colors.blue[200],
          centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      generateQuote();
                    },
                    child: Text('Next Quote'),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SequentialWidget()),
                      );
                    },
                    child: Text('Switch to Ordered Mode'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SequentialWidget extends StatefulWidget {
  @override
  _SequentialWidgetState createState() => _SequentialWidgetState();
}

class _SequentialWidgetState extends State<SequentialWidget> {
  List weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weekdays[index]),
        ElevatedButton(
          onPressed: () {
            if (index < weekdays.length - 1) {
              setState(() {
                index++;
              });
            } else {
              setState(() {
                index = 0;
              });
            }
          },
          child: Text("Next item"),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Switch to Random order')),
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Switch to Random order'),
            ),
          ),
        ),
      ),
    );
  }
}
