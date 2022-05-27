import 'dart:ui';
import 'package:flutter/material.dart';

class animationMarker extends StatefulWidget {
  const animationMarker({Key? key}) : super(key: key);

  @override
  animationMarkerState createState() => animationMarkerState();
}

class animationMarkerState extends State<animationMarker>
    with SingleTickerProviderStateMixin {
  //Dies Class wird bei verwendeung ein Animation verwendet

  static late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds: 1300)); //Eigenschaften von animationController
    animationController.repeat(reverse: true); //wiederholung
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return locationMarker(animationController);
  }
}

class locationMarker extends AnimatedWidget {
  const locationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(
        0.4, 1.2, value)!; //linear Interpolieren zwischen zwei Zahlen.
    var size = 40.0; //außenKreis größe

    return Center(
        child: Stack(
      children: [
        Center(
          child: Container(
            height: size * newValue,
            width: size * newValue,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    ));
  }
}
