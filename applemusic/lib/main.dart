import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fluids/utils/md_icons.dart'; //custom icons
import './library.dart';
import './album_art.dart';
import './detail.dart';
import './album_list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      home: AppleMusicMain(),  
    );
  }
}

class AppleMusicMain extends StatefulWidget {
  AppleMusicMain({Key key}) : super(key: key);

  @override
  _AppleMusicMainState createState() => new _AppleMusicMainState();
}

class _AppleMusicMainState extends State<AppleMusicMain> {
  int selectedTab = 0;
  String title = 'Library';
  bool showTitle = false;
  Album _selectedAlbum;

  @override
  initState() {
    _selectedAlbum = albumsList[0][0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
      ),
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: AnimatedOpacity(
            opacity: showTitle ? 1.0 : 0.0,
            duration: Duration(milliseconds: showTitle ? 200 : 500),
            child: Text('Library', style: TextStyle(color: Colors.black),),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.red,
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Text('Edit',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0
                ),
              ),
              onPressed: (){},
            )
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Positioned.fill(
              child: new NotificationListener(
                child: new SingleChildScrollView(
                  child: new Container(
                    color: Colors.white,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _makeHeader('Library', hide: showTitle,),
                        LibraryScreen(onTap: (Album album){
                          setState(() {
                            _selectedAlbum = album;
                          });
                        },),
                      ],
                    ),
                  ),
                ),
                onNotification: (ScrollUpdateNotification notification){
                  setState(() {
                    if(notification.metrics.pixels > 52 && !showTitle){
                      showTitle = true;
                    } else if(notification.metrics.pixels < 52 && showTitle){
                      showTitle = false;
                    }
                  });
                },
              ),
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _makeNowPlaying(context),
            )
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            _makeNavButton(title: 'Library', icon: Icons.library_music),
            _makeNavButton(title: 'For You', icon: Icons.favorite),
            _makeNavButton(title: 'Browse', icon: Icons.music_note),
            _makeNavButton(title: 'Radio', icon: Icons.radio),
            _makeNavButton(title: 'Search', icon: Icons.search),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedTab,
          onTap: (int value){
            setState(() {
              selectedTab = value;
            });
          },
          fixedColor: Colors.red,
        ),
      ),
    );
  }

  _makeHeader(String title, {bool hide: false}) {
    return new Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: new Text(
        title,
        style: Theme.of(context).textTheme.display2.copyWith(
            color: hide ? Colors.transparent : Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0
        ),
      ),
    );
  }

  _makeNavButton({String title, IconData icon}) {
    return new BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
      backgroundColor: Colors.white,
    );
  }

  _makeNowPlaying(BuildContext context) {
    return CupertinoButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context){
            return Detail(_selectedAlbum);
          }
        ));
      },
      pressedOpacity: 0.9,
      color: Colors.grey.shade200.withAlpha(280).withOpacity(0.9),
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.0),
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            AlbumArt(tag: _selectedAlbum.title, size: 50.0, image: _selectedAlbum.artwork, shadow: true),
            Expanded(
              child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  _selectedAlbum.title,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                    fontWeight: FontWeight.normal
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            new Container(
              width: 40.0,
              child: IconButton(
                icon: Icon(Icons.pause),
                onPressed: (){},
                iconSize: 35.0,
              ),
            ),
            new Container(
              width: 40.0,
              child: IconButton(
                icon: Icon(Icons.fast_forward),
                onPressed: (){},
                iconSize: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
