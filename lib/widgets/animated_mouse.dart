import 'package:flutter/material.dart';

class AnimatedMouse extends StatefulWidget {
  const AnimatedMouse({Key? key}) : super(key: key);

  @override
  State<AnimatedMouse> createState() => _AnimatedMouseState();
}

class _AnimatedMouseState extends State<AnimatedMouse>

    /// We need to use SingleTickerProviderStateMixin
    /// to use AnimationController
    with
        SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);

  /// repeat animation

  ///  And also we need to create Animation<Alignment>
  late final Animation<Alignment> _animation = AlignmentTween(
    begin: Alignment.topCenter,
    end: const Alignment(0, 0.45),
  ).animate(_controller);

  @override
  Widget build(BuildContext context) {
    /// We will use AnimatedBuilder to build our animation
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 30,
            height: 55,

            /// We will use alignment to move our mouse scroll
            alignment: _animation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black, width: 3),
            ),

            /// We also using AnimatedOpacity
            /// to make our mouse scroll more realistic
            /// based on Animation status
            child: AnimatedOpacity(
              opacity: _controller.status == AnimationStatus.forward ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 4,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        });
  }
}
