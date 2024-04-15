import 'package:ai_assistant/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    //initializing device screen
    mq = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: Center(
        child: Text('Welcome to Home Screen'),
      ),
    );
  }
}
