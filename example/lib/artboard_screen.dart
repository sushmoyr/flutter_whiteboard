import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/flutter_whiteboard.dart';

class ArtboardScreen extends StatefulWidget {
  const ArtboardScreen({Key? key}) : super(key: key);

  @override
  State<ArtboardScreen> createState() => _ArtboardScreenState();
}

class _ArtboardScreenState extends State<ArtboardScreen> {
  final WhiteboardController controller = WhiteboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draw"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              print(controller.data.toJson());
              Navigator.pop(context, controller.data);
            },
          )
        ],
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Whiteboard(
          controller: controller,
        ),
      ),
      bottomNavigationBar: Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  controller.selectSketch('pen');
                },
                icon: Icon(Icons.draw),
                isSelected:
                    controller.isDrawing && controller.isSketchActive('pen'),
                color: controller.isDrawing && controller.isSketchActive('pen')
                    ? Colors.blue
                    : null,
              ),
              IconButton(
                onPressed: () {
                  controller.selectSketch('marker');
                },
                icon: Icon(Icons.format_paint),
                isSelected:
                    controller.isDrawing && controller.isSketchActive('marker'),
                color:
                    controller.isDrawing && controller.isSketchActive('marker')
                        ? Colors.blue
                        : null,
              ),
              IconButton(
                onPressed: () {
                  controller.selectSketch('eraser');
                },
                icon: Icon(Icons.remove_circle_outline),
                isSelected:
                    controller.isDrawing && controller.isSketchActive('eraser'),
                color:
                    controller.isDrawing && controller.isSketchActive('eraser')
                        ? Colors.blue
                        : null,
              ),
              IconButton(
                onPressed: () {
                  controller.selectMoveMode();
                },
                icon: Icon(Icons.move_down),
                isSelected: true,
                color: controller.isMoving ? Colors.blue : null,
              ),
              IconButton(
                onPressed: () {
                  controller.undo();
                },
                icon: Icon(Icons.undo),
              ),
              IconButton(
                onPressed: () {
                  controller.redo();
                },
                icon: Icon(Icons.redo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
