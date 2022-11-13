import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  final List<String> images;
  final double aspectRatio;

  const DestinationCarousel({
    required this.images,
    this.aspectRatio = 16 / 8,
  });

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  List<Widget> generateImageTiles() {
    return widget.images
        .map(
          (element) => GestureDetector(
            onDoubleTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    elevation: 12.0,
                    buttonPadding: const EdgeInsets.all(16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      side: BorderSide(color: Colors.blueAccent, width: 4),
                    ),
                    content: Card(
                      elevation: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(element),
                      ),
                    ),
                  );
                },
              );
            },
            child: Card(
              elevation: 5.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(element),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _images = generateImageTiles();

    return CarouselSlider(
      items: _images,
      options: CarouselOptions(
        enlargeCenterPage: true,
        aspectRatio: widget.aspectRatio,
        autoPlay: true,
      ),
    );
  }
}
