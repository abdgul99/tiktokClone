import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/utils/icons.dart';
import 'package:tiktok/utils/size_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final AnimationController toneController1;
  late final AnimationController toneController2;
  late final AnimationController toneController3;
  double animationValue = 0.0;
  double animationTone1 = 1.0;
  double animationTone2 = 1.0;
  double animationTone3 = 1.0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    toneController1 = AnimationController(
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      duration: Duration(seconds: 7),
    );

    animationController.repeat();
    toneController1.reverse(from: 1.0);

    animationController.addListener(() {
      setState(() {
        animationValue = animationController.value;
      });
    });
    toneController1.addListener(() {
      setState(() {
        animationTone1 = toneController1.value;
        if (animationTone1 == 0.0) {
          toneController1.reverse(from: 1.0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      //?Main Stack
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fitWidth,
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConstants.screenheight * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Following',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: SizeConstants.screenwidth * 0.02),
              Text(
                '|',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: SizeConstants.screenwidth * 0.02),
              Text(
                'For You',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        //!tones
        Positioned(
          bottom: SizeConstants.screenheight * 0.01 + (70 * animationValue),
          right: SizeConstants.screenwidth * 0.16,
          child: Column(
            children: [
              Opacity(
                  opacity: animationTone1,
                  child: SvgPicture.asset(Kicons.doubleTone1)),
              SizedBox(height: SizeConstants.screenheight * 0.02),
              Opacity(
                  opacity: animationTone1,
                  child: SvgPicture.asset(Kicons.doubleTone2)),
              SizedBox(height: SizeConstants.screenheight * 0.02),
              Opacity(
                  opacity: animationTone1,
                  child: SvgPicture.asset(Kicons.singleTone,
                      height: SizeConstants.screenheight * 0.02)),
            ],
          ),
        ),

        Positioned(
          bottom: SizeConstants.screenheight * 0.01,
          right: SizeConstants.screenwidth * 0.015,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConstants.screenheight * 0.007),
                    child: CircleAvatar(
                      radius: SizeConstants.screenwidth * 0.055,
                      foregroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbGwbT0JwZhylAqGBMoUHJBQ02FBMh5HPlLzjVfUuH&s'),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      width: SizeConstants.screenwidth * 0.05,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: KColors.redColor),
                      child: const FittedBox(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConstants.screenheight * 0.03),
              SvgPicture.asset(Kicons.heart),
              SizedBox(height: SizeConstants.screenheight * .01),
              const Text(
                '338.7k',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: SizeConstants.screenheight * 0.03),
              SvgPicture.asset(Kicons.comment),
              SizedBox(height: SizeConstants.screenheight * .01),
              const Text(
                '338.7k',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: SizeConstants.screenheight * 0.03),
              SvgPicture.asset(Kicons.share),
              SizedBox(height: SizeConstants.screenheight * .01),
              const Text(
                'Share',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: SizeConstants.screenheight * 0.03),
              Transform.rotate(
                angle: animationValue * 6.3,
                child: Image.asset(
                  'assets/images/Disc.png',
                  height: SizeConstants.screenheight * 0.065,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: SizeConstants.screenheight * 0.01,
          left: SizeConstants.screenwidth * 0.02,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@craig_love',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: SizeConstants.screenheight * 0.02),
              const Text(
                'The Most Satisfying job #fyp #Satisfying #roadMaking',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: SizeConstants.screenheight * 0.01),
              Row(
                children: [
                  SvgPicture.asset(Kicons.music),
                  SizedBox(width: SizeConstants.screenwidth * 0.03),
                  const Text(
                    'Roddy Roundicch-Roddy Roundicch',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
