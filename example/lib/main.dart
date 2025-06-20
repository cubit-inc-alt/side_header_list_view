import 'package:flutter/material.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HeaderList Demo',
      theme: new ThemeData(),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  bool isHorizontal = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("HeaderList Demo"),
        actions: [
          IconButton(
            icon: Icon(isHorizontal ? Icons.view_list : Icons.view_column),
            onPressed: () {
              setState(() {
                isHorizontal = !isHorizontal;
              });
            },
            tooltip:
                isHorizontal ? 'Switch to Vertical' : 'Switch to Horizontal',
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: new SideHeaderListView(
              itemCount: names.length,
              padding: new EdgeInsets.all(16.0),
              itemExtend: isHorizontal ? 120.0 : 48.0,
              isHorizontal: isHorizontal,
              headerBuilder: (BuildContext context, int index) {
                return new Container(
                  width: isHorizontal ? 32.0 : 32.0,
                  height: isHorizontal ? 32.0 : 48.0,
                  alignment: Alignment.center,
                  child: new Text(
                    names[index].substring(0, 1),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  width: isHorizontal ? 120.0 : double.infinity,
                  height: isHorizontal ? double.infinity : 48.0,
                  alignment: Alignment.center,
                  child: new Text(
                    names[index],
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
              dividerBuilder: (BuildContext context, int index) {
                return isHorizontal
                    ? new Container(
                        width: 1.0,
                        height: double.infinity,
                        color: Colors.grey.shade300,
                      )
                    : new Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade300,
                      );
              },
              hasSameHeader: (int a, int b) {
                return names[a].substring(0, 1) == names[b].substring(0, 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

const List<dynamic> tideInformation = [
  {
    "heading": "Today",
    "tides": [
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
    ]
  },
  {
    "heading": "Tomorrow",
    "tides": [
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
    ]
  },
  {
    "heading": "Sunday",
    "tides": [
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
      {
        "type": "Low",
        "time": "11:56AM",
        "amplitude": "0.42M",
      },
    ]
  },
];
const names = const <String>[
  'Annie',
  'Arianne',
  'Bertie',
  'Bettina',
  'Bradly',
  'Caridad',
  'Carline',
  'Cassie',
  'Chloe',
  'Christin',
  'Clotilde',
  'Dahlia',
  'Dana',
  'Dane',
  'Darline',
  'Deena',
  'Delphia',
  'Donny',
  'Echo',
  'Else',
  'Ernesto',
  'Fidel',
  'Gayla',
  'Grayce',
  'Henriette',
  'Hermila',
  'Hugo',
  'Irina',
  'Ivette',
  'Jeremiah',
  'Jerica',
  'Joan',
  'Johnna',
  'Jonah',
  'Joseph',
  'Junie',
  'Linwood',
  'Lore',
  'Louis',
  'Merry',
  'Minna',
  'Mitsue',
  'Napoleon',
  'Paris',
  'Ryan',
  'Salina',
  'Shantae',
  'Sonia',
  'Taisha',
  'Zula',
];
