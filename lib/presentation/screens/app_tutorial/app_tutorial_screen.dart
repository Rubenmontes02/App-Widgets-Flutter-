import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Slideinfo {
  final String title;
  final String caption;
  final String imageUrl;

  Slideinfo(this.title, this.caption, this.imageUrl);
}

final slides = <Slideinfo>[
  Slideinfo(
      'Busca la comida',
      'Occaecat et sunt deserunt Lorem duis amet ipsum mollit culpa fugiat.',
      'assets/images/1.png'),
  Slideinfo(
      'Entrega rapida',
      'Ut non cillum ipsum nulla ut qui labore ad magna veniam.',
      'assets/images/2.png'),
  Slideinfo(
      'Disfruta la comida',
      'Excepteur non sunt aute quis adipisicing nulla sunt.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  child: const Text('Salir'), onPressed: () => context.pop())),
          endReach ? 
            Positioned(
                  bottom: 30,
                  right: 10,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}
