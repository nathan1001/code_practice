import 'package:flutter/material.dart';

// Note: for simplicity, this is a stateless widget but, in a real app,
// a full screen is likely to be a stateful widget.
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget subtitle = new Container(
      padding: new EdgeInsets.all(30.0),
      color: new Color(0X33000000),
      child: new Text('Subtitle'),
      
    );

    Widget listSection = new Expanded(
      flex: 3,
      child: new ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: _generateListItems().map((String value) {
            return _displayListItem(value);
          }).toList()),
    );

    Widget gridSection = new Expanded(
      flex: 1,
      child: new GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _generateGridItems().map((String value) {
            return _displayGridItem(value);
          }).toList()),
    );

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        subtitle,
        listSection,
        gridSection,
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 2 Page"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }

  Widget _displayListItem(String value) {
    return new Container(
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X9900CCCC),
      child: new Text(value),
    );
  }

  Widget _displayGridItem(String value) {
    return new Container(
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X99CCCC00),
      child: new Text(value),
    );
  }

// Note: Placeholder method to generate list data.
  List<String> _generateListItems() {
    List<String> listItems = new List<String>();
    for (int i = 0; i < 20; i++) {
      listItems.add('List Item ' + i.toString() + ' title and description');
    }
    return listItems;
  }

// Note: Placeholder method to generate grid data
  List<String> _generateGridItems() {
    List<String> gridItems = new List<String>();
    for (int i = 0; i < 24; i++) {
      gridItems.add('GI ' + i.toString());
    }
    return gridItems;
  }
}
