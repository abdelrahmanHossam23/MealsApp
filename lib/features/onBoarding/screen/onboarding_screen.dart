import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> titles = [
    'Save Your\n Meals\n Ingredient',
    'Use Our App\n The Best\n Choice',
    'Our App\nYour Ultimate\n Choice',
  ];

  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will Save it For You',
    'the best choice for your kitchen do not hestitate',
    'All the best restaurants and their top menus are ready for you',
  ];

  double currentPage = 0;
  CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pngs/Onboarding.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 36.w,
            right: 36.w,
            child: Container(
              width: 320.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: 350.h,
                  viewportFraction: 1,
                  onPageChanged: (index, _) {
                    setState(() {
                      currentPage = index.toDouble();
                    });
                  },
                ),
                items: List.generate(titles.length, (index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: AppColor.titleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            descriptions[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.titleColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          DotsIndicator(
                            dotsCount: titles.length,
                            position: currentPage,
                            onTap: (index) {
                              controller.animateToPage(index);
                            },
                            decorator: DotsDecorator(
                              color: AppColor.dotColor,
                              activeColor: AppColor.titleColor,
                              size: Size(24.w, 6.h),
                              activeSize: Size(24.w, 6.h),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.sp),
                            child:
                                currentPage == 2
                                    ? CircleAvatar(
                                      backgroundColor: AppColor.titleColor,
                                      radius: 35.r,
                                      child: IconButton(
                                        onPressed: () async {
                                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool("pass_onBoarding", true);
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                              return HomeScreen();
                                            }));
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    )
                                    : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async{
                                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                                            await prefs.setBool("pass_onBoarding", true);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                              return HomeScreen();
                                            }));
                                          },
                                          child: Text(
                                            "Skip",
                                            style: TextStyle(
                                              color: AppColor.titleColor,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (currentPage < 2) {
                                              currentPage++;
                                              controller.nextPage();
                                            }
                                          },
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                              color: AppColor.titleColor,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
