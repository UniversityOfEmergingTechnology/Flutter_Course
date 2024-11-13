import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../providers/is_pressed_provider.dart';
import 'package:provider/provider.dart';

import '../widget_animations/gift_box_wiggle_animation.dart';
import '../widget_animations/git_box_opacity_animation.dart';
import '../widget_animations/sin_wave.dart';

class GiftBoxScreen extends StatefulWidget {
  const GiftBoxScreen({super.key, required this.indexClicked});

  final int indexClicked;

  @override
  State<GiftBoxScreen> createState() => _GiftBoxScreenState();
}

class _GiftBoxScreenState extends State<GiftBoxScreen>
    with TickerProviderStateMixin {
  double _opacity = 0;
  double endValue = 0;
  late final AnimationController _controller;
  late final AnimationController _sinController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> opacityAnimation;
  late final Animation<double> sinAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _sinController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));
    opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInSine));
    sinAnimation = Tween<double>(begin: 0, end: 8*pi).animate(
        CurvedAnimation(parent: _sinController, curve: Curves.easeInOutQuad));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _sinController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGrey,
      appBar: AppBar(
        backgroundColor: kDarkPink,
        title: Text(
          'Gift Box Screen ${widget.indexClicked + 1}',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: kLightPink,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = 1;
              endValue = 2 * pi;
            });
            _controller.repeat();
            _sinController.repeat();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SinWave(sinAnimation: sinAnimation, forward: false),
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Transform.flip(
                    flipY: true,
                    child: SinWave(sinAnimation: sinAnimation, forward: true,),
                  ),
                ),
              ),
              FadeTransition(
                opacity: opacityAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kLightPink,
                    ),
                  ),
                ),
              ),
              GiftBoxWiggleAnimation(
                endValue: endValue,
                child: Hero(
                  tag: widget.indexClicked,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kDarkGrey,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.question_mark,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        GiftBoxOpacityAnimation(
                          opacity: _opacity,
                          child: Image.asset(
                              'images/gift${widget.indexClicked + 1}.png'),
                        ),
                      ],
                    ),
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