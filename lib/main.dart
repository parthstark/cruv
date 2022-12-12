import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberPage(),
    );
  }
}

class NumberPage extends StatelessWidget {
  NumberPage({super.key});
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Enter the details',
                textScaleFactor: 1.25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Number of seats in the coach'),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(text: myController.text))),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Go',
                    textScaleFactor: 1.25,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String text;
  const MyHomePage({super.key, required this.text});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController seatController = TextEditingController();
  int seatNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: seatController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter seat number to look for'),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    seatNum = int.parse(seatController.text);
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Go',
                    textScaleFactor: 1.25,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (int.parse(widget.text) / 8).ceil(),
              itemBuilder: (context, idx) => SeatBox(
                n: idx,
                max: int.parse(widget.text),
                search: seatNum,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SeatBox extends StatelessWidget {
  final int n, max, search;
  const SeatBox(
      {super.key, required this.n, required this.max, required this.search});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (1 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(1 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    '${1 + n * 8}\nLower',
                    textAlign: TextAlign.center,
                  ))),
            if (2 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(2 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    '${2 + n * 8}\nMiddle',
                    textAlign: TextAlign.center,
                  ))),
            if (3 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(3 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    '${3 + n * 8}\nUpper',
                    textAlign: TextAlign.center,
                  ))),
            const Expanded(child: SizedBox()),
            if (7 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(7 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    '${7 + n * 8}\nSide Lower',
                    textAlign: TextAlign.center,
                  )))
          ],
        ),
        const SizedBox(height: 45),
        Row(
          children: [
            if (4 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(4 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    'Lower\n${4 + n * 8}',
                    textAlign: TextAlign.center,
                  ))),
            if (5 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(5 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    'Middle\n${5 + n * 8}',
                    textAlign: TextAlign.center,
                  ))),
            if (6 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(6 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    'Upper\n${6 + n * 8}',
                    textAlign: TextAlign.center,
                  ))),
            const Expanded(child: SizedBox()),
            if (8 + n * 8 <= max)
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(8 + n * 8 == search ? 1 : 0.2)),
                  // margin: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    'Side Upper\n${8 + n * 8}',
                    textAlign: TextAlign.center,
                  )))
          ],
        ),
        const Divider(),
      ],
    );
  }
}
