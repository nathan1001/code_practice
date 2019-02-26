import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './album_list.dart';
import './album_art.dart';

class Detail extends StatefulWidget {
  final Album album;

  Detail(this.album);

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  bool showLyrics = false;

  @override
  Widget build(BuildContext context) {
    Album album = widget.album;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Positioned(
          top: 40.0,
          left: 15.0,
          right: 15.0,
          bottom: 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        new Positioned(
          top: 50.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 40.0,)
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      alignment: Alignment.center,
                      child: AlbumArt(tag: album.title, image: album.artwork, shadow: false, size: MediaQuery.of(context).size.width - 100,),
                    ),
                    _makeDetailProgress(),
                    _makeDetailTrackInfo(album.title, album.artist),
                    _makeDetailControls(),
                    _makeVolumeControl(),
                    _makeExtraControls(),
                    Divider(height: 2.0,),
                    _makeDetailButtons(),
                    Divider(height: 2.0,),
                    _makeDetailLyrics(),
                    Divider(height: 2.0,),
                    _makeUpNext(),
                    SizedBox(height: 60.0,),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _makeDetailProgress(){
    return Column(
      children: <Widget>[
        Slider(
          value: 39.0,
          activeColor: Colors.grey.shade700,
          inactiveColor: Colors.grey.shade200,
          min: 0.0,
          max: 157.0,
          onChanged: (double v){},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('0:39', style: Theme.of(context).textTheme.caption,),
              Text('-1:58', style: Theme.of(context).textTheme.caption,),
            ],
          ),
        )
      ],
    );
  }

  _makeDetailTrackInfo(String title, String artist){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(title,
            style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.w600),),
          Text('$artist - $title',
            style: Theme.of(context).textTheme.headline.copyWith(color: Colors.red),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  _makeDetailControls(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CupertinoButton(child: Icon(Icons.fast_rewind, size: 50.0,), pressedOpacity: 0.8, onPressed: (){},),
        CupertinoButton(child: Icon(Icons.play_arrow, size: 75.0,), pressedOpacity: 0.8, onPressed: (){}),
        CupertinoButton(child: Icon(Icons.fast_forward, size: 50.0,), pressedOpacity: 0.8, onPressed: (){}),
      ],
    );
  }

  _makeVolumeControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.volume_down, size: 18.0, color: Colors.grey,),
          Expanded(
            child: CupertinoSlider(
              value: 65.0,
              min: 0.0,
              max: 100.0,
              onChanged: (double v){},
              activeColor: Colors.grey.shade700,
            ),
          ),
          Icon(Icons.volume_up, size: 18.0, color: Colors.grey,),
        ],
      ),
    );
  }

  _makeExtraControls() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(child: Icon(Icons.add, color: Colors.red,), pressedOpacity: 0.8, onPressed: (){}),
          CupertinoButton(child: Icon(Icons.airplay, color: Colors.red,), pressedOpacity: 0.8, onPressed: (){}),
          CupertinoButton(child: Icon(Icons.more_horiz, color: Colors.red,), pressedOpacity: 0.8, onPressed: (){}),
        ],
      ),
    );
  }

  _makeDetailButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(width: 15.0,),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.shuffle, color: Colors.red,),
                  Text('  Shuffle', style: TextStyle(color: Colors.red),)
                ],
              ),
              onPressed: (){},
              color: Colors.grey.shade100,
              pressedOpacity: 0.4,
            ),
          ),
          SizedBox(width: 15.0,),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.repeat, color: Colors.white,),
                  Text('  Repeat', style: TextStyle(color: Colors.white,),)
                ],
              ),
              onPressed: (){},
              color: Colors.red,
              pressedOpacity: 0.4,
            ),
          ),
          SizedBox(width: 15.0,),
        ],
      ),
    );
  }

  _makeDetailLyrics() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Lyrics', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),),
              CupertinoButton(
                child: Text(showLyrics ? 'Hide' : 'Show',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0
                  ),
                ),
                onPressed: (){
                  setState(() {
                    showLyrics = !showLyrics;
                    print(showLyrics);
                  });
                },
              ),
            ],
          ),
          showLyrics ? Divider() : Container(),
          showLyrics ? Container(
            alignment: Alignment.topLeft,
            child: Text('Tu eres la rueda, yo soy el camino\n'+
                'pasas encima de mi dando vueltas\n'+
                'tu rodaras porque ese es tu destino\n'+
                'sin encontrar nadie que te detenga.\n\n'+
                'Quise pararte pero ibas sin frenos\n'+
                'y tus rodadas me hicieron pedazos\n'+
                'porque no quieres los caminos buenos\n'+
                'y agarras todo lo que hay en tus pasos.\n\n'+
                'Yo que soñaba, con ser en tu vida\n'+
                'el terminar de tus vueltas al mundo\n'+
                'te vi pasar como nave perdida\n'+
                'de aquí pa\'lla sin agarrar tu mundo.\n\n'+
                'Ninguna rueda me había lastimado\n'+
                'y me pasaron de las más pesadas\n'+
                'pero contigo quede destrozado\n'+
                'porque no hiciste ninguna parada.',
              style: TextStyle(fontSize: 18.0),
            ),
          ) : Container(),
        ],
      ),
    );
  }

  _makeUpNext(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Up Next', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),),
          Container(),
        ],
      ),
    );
  }
}
