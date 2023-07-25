import 'package:block_counter/BlOC/container_color_bloc.dart';
import 'package:block_counter/BlOC/container_color_events.dart';
import 'package:block_counter/BlOC/container_color_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc colorBloc = ColorBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<ColorState>(
                  stream: colorBloc.stateStream,
                  builder: (context, snapshot) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: snapshot.data!.color,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  },
                  initialData: ColorState(Colors.amber))
            ],
          ),
        ),
        floatingActionButton: ButtonBar(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                colorBloc.eventSink.add(RedColorEvent());
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                colorBloc.eventSink.add(BlueGreyColorEvent());
              },
            ),
          ],
        ));
  }
}
