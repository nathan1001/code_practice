import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './album_list.dart';

class LibraryScreen extends StatelessWidget {
  final Function onTap;

  LibraryScreen({this.onTap});

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            children: <Widget>[
              Divider(),
              _makeListItem(context, 'Playlists'),
              Divider(),
              _makeListItem(context, 'Artists'),
              Divider(),
              _makeListItem(context, 'Albums'),
              Divider(),
              _makeListItem(context, 'Songs'),
              Divider(),
              _makeListItem(context, 'Downloaded Music'),
              Divider(),
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
          child: Text(
            'Recently Added',
            style: Theme.of(context).textTheme.headline.copyWith(
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: albumsList.length,
            itemBuilder: (context, index){
              List<Album> albumRowData = albumsList[index];
              return _makeAlbumRow(context, [
                albumRowData.first,
                albumRowData.last,  //TODO: test to see if this exists
              ]);
            },
          ),
        ),
        SizedBox(height: 100.0,),
      ],
    );
  }

  _makeAlbum(BuildContext context, Album album) {
    double size = MediaQuery.of(context).size.width/2 - 40;
    return GestureDetector(
      onTap: () => onTap(album),
      child: Card(
        child: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(album.artwork), fit: BoxFit.cover),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(album.title, style: TextStyle(fontSize: 16.0),),
              ),
              Text(album.artist, style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
        elevation: 0.0,
      ),
    );
  }

  _makeListItem(BuildContext context, String s) {
    return new CupertinoButton(
      pressedOpacity: 0.6,
      onPressed: (){},
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(s,
            style: Theme.of(context).textTheme.headline.copyWith(
              color: Colors.red
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 30.0,),
          )
        ],
      ),
    );
  }

  _makeAlbumRow(BuildContext context, List<Album> albums){
    if(albums.length > 0) {
      Album album1 = albums.first;
      Album album2 = albums.length > 1 ? albums.last : null;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _makeAlbum(context, album1),
          album2 != null ? _makeAlbum(context, album2) : Container(),
        ],
      );
    } else {
      return Container();
    }
  }
}
