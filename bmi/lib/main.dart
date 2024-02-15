import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 128, 171),
        title: const Text(
          "BMI Calculator",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 25,
        ),
        const Text(
          "BMI",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 25,
        ),
        TextField(
          controller: wtController,
          decoration: const InputDecoration(
              label: Text("Enter your Weight(in Kgs)"),
              prefixIcon: Icon(Icons.line_weight)),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: ftController,
          decoration: const InputDecoration(
              label: Text("Enter your Height(in Feet)"),
              prefixIcon: Icon(Icons.height)),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: inController,
          decoration: const InputDecoration(
              label: Text("Enter your Height(in Inch)"),
              prefixIcon: Icon(Icons.height)),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
            onPressed: () {
              var wt = wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = inController.text.toString();

              if (wt != "" && ft != "" && inch != "") {
                var iWt = int.parse(wt);
                var iFt = int.parse(ft);
                var iInch = int.parse(inch);
                var tInch = (iFt * 12) + iInch;
                var tCm = tInch * 2.54;
                var tM = tCm / 100;
                var bmi = iWt / (tM * tM);
                setState(() {
                  result = "Your BMI is : $bmi";
                });
              } else {}
            },
            child: const Text("Calculator")),
        SizedBox(
          height: 10,
        ),
        Text(
          result,
          style: const TextStyle(),
        )
      ]),
    );
  }
}
