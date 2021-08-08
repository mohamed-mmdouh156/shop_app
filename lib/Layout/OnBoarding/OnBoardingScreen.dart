import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Module/LoginScreen/LoginScreen.dart';
import 'package:shop_app/Shared/Companent/companents.dart';
import 'package:shop_app/Shared/Network/local/cacheHelper.dart';
import 'package:shop_app/Shared/Style/colors.dart';
import 'package:shop_app/Model/BoardingModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'screen 1',
        body: 'screen body 1',
        image: "assets/images/shopping_card.png",
    ),
    BoardingModel(
      title: 'screen 2',
      body: 'screen body 2',
      image: "assets/images/shopping_card2.png",
    ),
    BoardingModel(
      title: 'screen 3',
      body: 'screen body 3',
      image: "assets/images/shopping_card3.png",
    ),
  ];

  void submit ()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value == true)
        {
          navigateAndRemove(context: context, widget: LoginScreen());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: submit,
              child: Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (index){
                  if(index == boarding.length - 1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }else
                    {
                      setState(() {
                        isLast = false;
                      });
                    }
                },
                itemBuilder: (context, index) => pageViewItemBuilder(boarding[index]),
                itemCount: 3,
                controller: pageController,
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast == true)
                      {
                        submit();
                      }else
                        {
                          pageController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }

                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


