import 'package:agro/custom/custom_button.dart';
import 'package:agro/info.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rice',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Rice',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.fill,
                height: 200,
              ),
              Button(
                text: 'Rice Info',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Info()),
                      ));
                },
              ),
              Button(
                text: 'Rice Diseases',
                onPressed: () {
                  print('Rice Diseases');
                },
              ),
              Button(
                text: 'Rice Provider',
                onPressed: () {
                  print('Rice Provider');
                },
              ),
              Button(
                text: 'Rice Price',
                onPressed: () {
                  print('Rice Price');
                },
              ),
              Button(
                text: 'Rice Summary',
                onPressed: () {
                  print('Rice Summary');
                },
              ),
              Button(
                text: 'About',
                onPressed: () {
                  print('About');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
