import 'package:dimension/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:responsive_styled_widget/styled_widget.dart';

class ButtonTransform1Page extends StatefulWidget {
  ButtonTransform1Page({this.title = "Button Transform 1"});

  final String title;

  @override
  _ButtonTransform1PageState createState() => _ButtonTransform1PageState();
}

class _ButtonTransform1PageState extends State<ButtonTransform1Page> {
  bool toggleStyle = true;

  late Style beginStyle;
  late Map<ScreenScope, Style> endStyle;

  @override
  void initState() {
    super.initState();

    beginStyle = Style(
      alignment: Alignment.center,
      width: Dimension.min(50.toVWLength, 400.toPXLength),
      height: 120.toPXLength,
      padding: DynamicEdgeInsets.all(1.toPercentLength),
      margin: DynamicEdgeInsets.symmetric(vertical: 10.toPXLength),
      backgroundDecoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent])),
      shapeBorder: MorphableShapeBorder(
        shape: RoundedRectangleShape(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
            borders: RectangleBorders.only(
                top: DynamicBorderSide(
                    gradient: LinearGradient(colors: [
                      Colors.cyanAccent.shade100,
                      Colors.purpleAccent.shade100
                    ]),
                    width: 12),
                bottom: DynamicBorderSide(
                    gradient:
                        LinearGradient(colors: [Colors.cyan, Colors.purple]),
                    width: 28),
                left: DynamicBorderSide(
                    color: Colors.cyanAccent.shade200, width: 12),
                right:
                    DynamicBorderSide(color: Colors.purpleAccent, width: 28))),
      ),
      shadows: [
        DynamicShapeShadow(
            offset: DynamicOffset(0.toPXLength, 0.toPXLength),
            blurRadius: 0.toPXLength)
      ],
      transform: SmoothMatrix4()..scale(1.2),
    );

    endStyle = {
      ScreenScope(): Style(
        alignment: Alignment.center,
        width: 200.toPXLength,
        height: 140.toPXLength,
        margin: DynamicEdgeInsets.symmetric(vertical: 10.toPXLength),
        backgroundDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 210, 243, 224),
          Colors.tealAccent,
        ])),
        shapeBorder: MorphableShapeBorder(
            shape: RectangleShape(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(50.toPXLength)),
                border: DynamicBorderSide(
                    width: 10,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 246, 167, 186),
                      Colors.pinkAccent.shade200
                    ])))),
        childAlignment: Alignment.center,
        transform: SmoothMatrix4()..translate(-5.toPercentLength),
        shadows: [
          DynamicShapeShadow(
              offset: DynamicOffset(10.toPXLength, 10.toPXLength),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 246, 167, 186),
                Colors.pinkAccent.shade200
              ]),
              blurRadius: 20.toPXLength)
        ],
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: AnimatedStyledContainer(
          curve: Curves.elasticInOut,
          duration: Duration(seconds: 1),
          style: toggleStyle ? beginStyle : endStyle,
          child: Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            toggleStyle = !toggleStyle;
          });
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}