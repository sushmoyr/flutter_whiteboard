import 'package:example/artboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/flutter_whiteboard.dart';
import 'package:flutter_whiteboard/presentation/widgets/whiteboard_preview_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Board? board;
  @override
  Widget build(BuildContext context) {
    void goToDrawingScreen() {
      final route =
          MaterialPageRoute<Board?>(builder: (_) => const ArtboardScreen());
      Navigator.push<Board?>(context, route).then((value) {
        // print(value?.toJson());
        if (board != value) {
          // print("Board changed");
        }
        setState(() {
          board = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Whiteboard Example"),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            if (board != null) ...[
              Text("Preview"),
              WhiteboardPreview(board: board!),
            ],
            ElevatedButton(
                onPressed: goToDrawingScreen, child: Text("Draw Something"))
          ],
        ),
      ),
    );
  }
}
