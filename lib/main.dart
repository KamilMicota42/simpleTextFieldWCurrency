import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Auto Currency into textfield'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  int replaceMaskedToIntForm(String og) {
    String afterChanges = og;
    afterChanges = afterChanges.replaceAll(',', '');
    afterChanges = afterChanges.replaceAll('.', '');
    return int.parse(afterChanges);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(suffix: Text('zł')),
                controller: textController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 50,
                width: 150,
                child: FloatingActionButton(
                  onPressed: () {
                    print(replaceMaskedToIntForm(textController.text));
                  },
                  child: const Text('Print the value'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
