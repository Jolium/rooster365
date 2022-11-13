import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String image;
// final String tag;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const HeroImage({
    Key? key,
    required this.image,
    // @required this.tag,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: image,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
