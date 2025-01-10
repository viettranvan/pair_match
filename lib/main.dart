import 'package:flutter/material.dart';
import 'package:pair_match/utils/assets_path.dart';
import 'package:pair_match/view/index.dart';

void main() {
  runApp(const MyApp());
}

enum Mode { normal, party }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAIR MATCH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pair Match Mini Game'),
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
  int index = 0;
  List<String> normalModePath =
      List.generate(25, (index) => AssetsPath.normalMode);
  List<String> partyModePath =
      List.generate(25, (index) => AssetsPath.specialMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'PAIR MATCH',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 40),
          IndexedStack(
            index: index,
            children: [
              MatrixView(
                listPath: normalModePath,
                initialPath: AssetsPath.normalMode,
                onUpdateCard: (index, path) {
                  normalModePath[index] = path;
                  setState(() {});
                },
              ),
              MatrixView(
                listPath: partyModePath,
                initialPath: AssetsPath.specialMode,
                onUpdateCard: (index, path) {
                  partyModePath[index] = path;
                  setState(() {});
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              BaseButton(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                title: 'NORMAL MODE',
                color: Colors.green.withOpacity(0.7),
              ),
              const SizedBox(width: 10),
              BaseButton(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                title: 'PARTY MODE',
                color: Colors.amber.withOpacity(0.7),
              ),
              const SizedBox(width: 10),
              BaseButton(
                onTap: () {
                  normalModePath =
                      List.generate(25, (index) => AssetsPath.normalMode);
                  partyModePath =
                      List.generate(25, (index) => AssetsPath.specialMode);
                  index = 0;
                  setState(() {});
                },
                title: 'RESET',
                color: Colors.red.withOpacity(0.7),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
