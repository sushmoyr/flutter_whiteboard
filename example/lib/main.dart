import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/flutter_whiteboard.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final WhiteboardController controller = WhiteboardController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener((state) {
      // print("State changed");
      setState(() {});
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // print("Drawing: ${controller.isDrawing}");
    // print("Moving: ${controller.isMoving}");
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
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
