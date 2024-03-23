import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'dart:developer';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController pageController = PageController(
    viewportFraction: 0.85, //how much viewport space will page occupy
  );
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  // double _height = Dimensions.pageViewContainer;
  double _height = 200;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  ///From PageController we can access page property and page property is
  ///actually page value
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, index) {
                return _pageItemBuid(index);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.toInt(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        TextButton(
          child: Text('hit me'),
          onPressed: () {
          },
        )
      ],
    );
  }

  Widget _pageItemBuid(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      // this condition reffers to the middle tile
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans,
            0); //This means after scaling happens then it will tralnslate upon values from scaling
    } else if (index == _currentPageValue.floor() + 1) {
      // this condition refers to right tile
      var currScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      // this refers to the left tile
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // height: Dimensions.pageViewContainer,
            // height: Dimensions.pageViewContainer,
            height: 200,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('images/Cerro-Torre.jpeg'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: Dimensions.pageViewTextContainer,
              height: 200,
              margin: const EdgeInsets.only(
                // left: Dimensions.width40,
                left: 40,
                // right: Dimensions.width40,
                right: 40,
                // bottom: Dimensions.height20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFFe8e8e8), blurRadius: 5, offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
