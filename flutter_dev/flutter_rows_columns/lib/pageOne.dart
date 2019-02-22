import 'package:flutter/material.dart';
import 'pageTwo.dart';
import 'pageThree.dart';

// Note: for simplicity, this is a stateless widget but, in a real app,
// a full screen is likely to be a stateful widget.
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> menu = <Widget>[
      new IconButton(
        icon: new Icon(Icons.send),
        tooltip: 'To Example 2',
        onPressed: () => _toExample2(context),
      ),
      new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'To Example 3',
        onPressed: () => _toExample3(context),
      )
    ];


//if you want to specify padding, a background colour, or a fixed height or width for an item, wrap it inside a Container
    Widget subtitle = new Container(
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X33000000),
      child: new Text('Subtitle'),
    );

//if you want a child element of a Row or Column to expand to fill in the available space, wrap it inside an Expanded
    Widget middleSection = new Expanded(
      child: new Container(
        padding: new EdgeInsets.all(8.0),
        color: new Color(0X9900CC00),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text('Some data here'),
            new Text('More stuff here'),
          ],
        ),
      ),
    );

    Widget bottomBanner = new Container(
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X99CC0000),
      height: 48.0,
      child: new Center(
        child: new Text('Bottom Banner'),
      ),
    );

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        subtitle,
        middleSection,
        bottomBanner,
      ],
    );

   return new Scaffold(
    appBar: new AppBar(
      title: new Text("Example 1 Page"),
      actions: menu,
    ),
    body: new Padding(
      padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: body,
    ),
  );
}





  void _toExample2(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new PageTwo();
      },
    ));
  }

  void _toExample3(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new PageThree();
      },
    ));
  }
}
