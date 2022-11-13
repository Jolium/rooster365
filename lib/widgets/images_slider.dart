import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import '../providers/scroll_position_provider.dart';

class ImagesSlider extends ConsumerWidget {
  final List<String> images;
  final double size;

  const ImagesSlider({
    required this.images,
    this.size = 200.0,
  });

  void scroll(ScrollController controller, double scroll, double maxScroll) {
    try {
      final double max = controller.position.maxScrollExtent;
      controller.jumpTo(max * scroll / maxScroll);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final double _scrollPosition = watch(scrollPositionProvider);
    final double _maxScrollPosition = context.read(maxScrollPositionProvider);
    final ScrollController _controller = ScrollController();

    return SizedBox(
      height: size * 9 / 16,
      width: size,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
          scrollbars: false,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          controller: _controller,
          separatorBuilder: (context, _) => const SizedBox(width: 10.0),
          itemBuilder: (context, index) {
            if (_maxScrollPosition > 0.0) {
              scroll(_controller, _scrollPosition, _maxScrollPosition);
            }
            return Card(
              elevation: 5.0,
              shadowColor: Colors.blueAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: GestureDetector(
                  onDoubleTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final Size popupSize = MediaQuery.of(context).size;
                        return AlertDialog(
                          elevation: 12.0,
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            side: BorderSide(
                              color: Colors.blueAccent,
                              width: 4.0,
                            ),
                          ),
                          content: ClipRRect(
                            child: SizedBox(
                              height: popupSize.height,
                              width: popupSize.width,
                              child: PhotoView(
                                backgroundDecoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                imageProvider: AssetImage(images[index]),
                              ),
                            ),
                          ),
                          actions: [
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(
                                'Sluiten',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(images[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
