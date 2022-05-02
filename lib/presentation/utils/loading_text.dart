import 'dart:async';
import 'package:flutter/cupertino.dart';

class LoadingText extends StatefulWidget {
  final String inputText;
  const LoadingText({Key? key, required this.inputText}) : super(key: key);

  @override
  State<LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  Timer? timer;
  int dotsAmount = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => updateAmountOfDots());
  }

  updateAmountOfDots(){
    int newDotsAmount = 0;
    if (dotsAmount != 3){
      newDotsAmount = dotsAmount + 1;
    }
    setState(() {
      dotsAmount = newDotsAmount;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.inputText + ("." * dotsAmount));
  }
}