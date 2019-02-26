import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  final String tag;
  final double size;
  final String image;
  final bool shadow;

  AlbumArt({this.tag, this.size, this.image, this.shadow: false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade700,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: shadow ? 5.0 : 0.0, spreadRadius: 0.0, offset: Offset(0.5, 0.5))
            ],
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain)
        ),
        height: size,
        width: size,
      ),
    );
  }
}
