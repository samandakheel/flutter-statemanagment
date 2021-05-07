import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagment/model/counter_model.dart';

void main() {
  runApp(MyPageOne());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// MultiProvider in side it we have providers[ then call ChangeNotifierProvider(create:(context )=>ClassName())]

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeTextSize()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeIconSize()),
      ],
      child: MyPage(),
    );
  }
}

class MyPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // final textSize = Provider.of<ChangeTextSize>(context, listen: false);
    // final iconSize = Provider.of<ChangeIconSize>(context, listen: false);
    print("The widget tree has build ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Notifier "),
      ),
      body: Column(
        children: [
          Selector<ChangeTextSize, double>(
            selector: (context, textsize) => textsize.textsize1,
            builder: (BuildContext context, value, Widget child) {
              print("Text rebuild");
              return Text(
                "Change me ",
                style: TextStyle(
                  fontSize: value,
                  color: Colors.green,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<ChangeTextSize>(
            builder: (BuildContext context, value, Widget child) {
              print("Slider one rebuild");
              return Slider(
                value: 18,
                onChanged: (double newValue) {
                  value.changeSize(newValue);
                },
                min: 18,
                max: 58,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Selector<ChangeIconSize, double>(
            selector: (context, doubleValue) => doubleValue.iconSize1,
            builder: (context, value, widget) {
              print("Icon  rebuild");
              return Icon(
                Icons.face,
                size: value,
                color: Colors.green,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<ChangeIconSize>(
            builder: (context, value, widget) {
              print("Slider two rebuild");
              return Slider(
                value: 40,
                onChanged: (double newValue) {
                  value.changeSize(newValue);
                },
                min: 40,
                max: 80,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
