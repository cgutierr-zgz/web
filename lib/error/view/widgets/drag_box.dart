import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DragBox extends StatefulWidget {
  const DragBox({
    super.key,
    required this.initPos,
    required this.child,
  });

  final Offset initPos;
  final Widget child;

  @override
  State<DragBox> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  Offset position = Offset.zero;
  bool isVisible = true;
  int boredGuy = 0;

  @override
  void initState() {
    position = widget.initPos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        onDragStarted: () {
          setState(() {
            boredGuy += 1;
            isVisible = false;
          });
          _imBoredAf();
        },
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            isVisible = true;
            position = offset;
          });
        },
        feedback: widget.child,
        child: Visibility(
          visible: isVisible,
          child: widget.child,
        ),
      ),
    );
  }

  void _imBoredAf() {
    String? message;

    switch (boredGuy) {
      case 1:
        message = 'hi';

        break;

      case 10:
        message = 'u are bored af';

        break;

      case 25:
        message = 'so am I';

        break;
      case 50:
        message = 'VGV please hire me';

        break;

      case 100:
        message = 'this is the last message :(';

        break;
      case 1000:
        message = '<3';

        break;
    }

    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: GoogleFonts.gloriaHallelujah()),
        ),
      );
    }
  }
}
