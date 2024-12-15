import 'package:flutter/material.dart';
import 'dart:math' show pi;

class JokeCard extends StatefulWidget {
  final String setup;
  final String punchline;

  const JokeCard({super.key, required this.setup, required this.punchline});

  @override
  _JokeCardState createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final isFlipped = _flipAnimation.value > 0.5;
          return Transform(
            transform: Matrix4.rotationY(_flipAnimation.value * pi),
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 250,
              decoration: BoxDecoration(
                color: isFlipped
                    ? Colors.orangeAccent[200]
                    : Colors.lightGreen[400],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Transform(
                        transform: isFlipped
                            ? Matrix4.rotationY(pi)
                            : Matrix4.identity(),
                        alignment: Alignment.center,
                        child: Text(
                          isFlipped ? widget.punchline : widget.setup,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  if (!isFlipped)
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Text(
                        'Click on the card for the punchline',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
