import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quorocare_project/loadingScreens/quicksignIn.dart';

class ProgressSplash extends StatefulWidget {
  const ProgressSplash({super.key});

  @override
  State<ProgressSplash> createState() => _ProgressSplashState();
}

class _ProgressSplashState extends State<ProgressSplash> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _logoOpacity;
  late final AnimationController _secondTitleController;
  late final Animation<double> _secondTitleAnim;
  late final Animation<double> _secondTitleOpacity;

  bool _logoAnimStarted = false;
  bool _isReversing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _slide = Tween<Offset>(begin: const Offset(-1.5, 0), end: const Offset(1.5, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _scaleAnim = Tween<double>(begin: 0.7, end: 1.0)
        .animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeIn));

    _secondTitleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _secondTitleAnim = Tween<double>(begin: 0.7, end: 1.0)
        .animate(CurvedAnimation(parent: _secondTitleController, curve: Curves.easeInOut));
    _secondTitleOpacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _secondTitleController, curve: Curves.easeIn));

    _controller.addListener(() {
      if (_controller.value >= 0.5 && !_logoAnimStarted) {
        _logoAnimStarted = true;
        _scaleController.forward();
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isReversing) {
        setState(() => _isReversing = true);
        _scaleController.reverse(); // Animate first logo out
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed && _isReversing) {
        Timer(const Duration(milliseconds: 500), () {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const QuickSignIn()),
          );
        });
      }
    });
    
    _controller.addListener(() {
      // Animate second title in when reverse is about 50% complete
      if (_isReversing && _controller.value <= 0.5 && _secondTitleController.status != AnimationStatus.forward) {
        _secondTitleController.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    _secondTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Logo fade + scale in (behind car)
              IgnorePointer(
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Opacity(
                    opacity: _logoOpacity.value,
                    child: ScaleTransition(
                      scale: _scaleAnim,
                      child: Image.asset(
                        'assets/quro2.png',
                        fit: BoxFit.contain,
                        height: 200,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
              // Second title fade + scale in (behind car, during reverse)
              IgnorePointer(
                child: AnimatedBuilder(
                  animation: _secondTitleController,
                  builder: (context, child) => Opacity(
                    opacity: _secondTitleOpacity.value,
                    child: ScaleTransition(
                      scale: _secondTitleAnim,
                      child: Image.asset(
                        'assets/qorocare.png',
                        fit: BoxFit.contain,
                        height: 200,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
              // Moving car with shadow (always on top during transition)
              Align(
                alignment: const Alignment(0, 0.0),
                child: SlideTransition(
                  position: _slide,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.diagonal3Values(_isReversing ? -1.0 : 1.0, 1.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/car2.png',
                          height: 150,
                          fit: BoxFit.contain,
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