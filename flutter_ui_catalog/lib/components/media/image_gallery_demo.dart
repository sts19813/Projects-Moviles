import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class ImageGalleryDemo extends StatefulWidget {
  const ImageGalleryDemo({super.key});

  @override
  State<ImageGalleryDemo> createState() => _ImageGalleryDemoState();
}

class _ImageGalleryDemoState extends State<ImageGalleryDemo> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final backgrounds = <Color>[
      colors.primaryContainer,
      colors.secondaryContainer,
      colors.tertiaryContainer,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 340,
          height: 190,
          child: PageView.builder(
            itemCount: backgrounds.length,
            onPageChanged: (page) => setState(() => _page = page),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              child: ColoredBox(
                color: backgrounds[index],
                child: Center(
                  child: Image.asset(
                    'assets/branding/app_icon.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text('${_page + 1} / ${backgrounds.length}'),
      ],
    );
  }
}
