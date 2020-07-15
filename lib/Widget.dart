import 'package:flutter/material.dart';
import 'package:login_app/WidgetHome.dart';

void main() {
  runApp(MaterialApp(
    home: WidgetHomePage(),
  ));
}

class WidgetHomePage extends StatefulWidget {
  @override
  _WidgetHomePageState createState() => _WidgetHomePageState();
}

class _WidgetHomePageState extends State<WidgetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WidgetHomePage',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Container(
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetAlertDialog()));
                      },
                      child: Center(
                        child: Text(
                          "Alert dialog",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.orangeAccent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetRichText()));
                    },
                    child: Center(
                      child: Text(
                        "Rich Text",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WidgetSelectableText()));
                      },
                      child: Center(
                        child: Text(
                          "Selectable Text",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.indigo,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetFlexible()));
                    },
                    child: Center(
                      child: Text(
                        "Flexible",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.deepPurpleAccent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WidgetSpacer()));
                      },
                      child: Center(
                        child: Text(
                          "Spacer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.blueAccent[300],
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetDivider()));
                    },
                    child: Center(
                      child: Text(
                        "Divider",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amberAccent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WidgetIgnorePointer()));
                      },
                      child: Center(
                        child: Text(
                          "Ignore Pointer",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.lightGreenAccent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetColouredFiltered()));
                    },
                    child: Center(
                      child: Text(
                        "Coloured Filter",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amberAccent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WidgetToolTip()));
                      },
                      child: Center(
                        child: Text(
                          "Tool Tip",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.redAccent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetAspectRatio()));
                    },
                    child: Center(
                      child: Text(
                        "Aspect Ratio",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.teal,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetSizedBox()));
                      },
                      child: Center(
                        child: Text(
                          "Sized Box",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  WidgetSizedBox() {}

  WidgetAlertDialog() {}

  WidgetAspectRatio() {}

  WidgetRichText() {}

  WidgetSelectableText() {}

  WidgetFlexible() {}

  WidgetSpacer() {}

  WidgetDivider() {}

  WidgetIgnorePointer() {}

  WidgetColouredFiltered() {}

  WidgetToolTip() {}
}
