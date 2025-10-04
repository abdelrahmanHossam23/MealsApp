import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home/screen/add_meal_screen.dart';
import 'package:meals_app/features/home/screen/meal_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 230.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pngs/home_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15.h,
                  left: 36.w,
                  child: Container(
                    width: 190.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                    child: Center(
                      child: Text(
                        "Welcome\n dd A New\n Recipe",
                        style: TextStyle(
                          color: AppColor.titleColor,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 16.sp),
              child: Text(
                "Your Food",
                style: TextStyle(
                  color: AppColor.descriptionColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
            FutureBuilder(
              future: databaseHelper.getMeals(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        mainAxisSpacing: 10.h,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MealDetailScreen(
                                    mealModel: snapshot.data![index],
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 5.sp,
                            ),
                            margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 16.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: snapshot.data![index].imageUrl,
                                  placeholder:
                                      (context, url) =>
                                          CircularProgressIndicator(
                                            color: AppColor.primaryColor,
                                          ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error, color: Colors.red),
                                ),
                                // Image.asset("assets/pngs/item.png"),
                                SizedBox(height: 5.h),
                                Text(snapshot.data![index].name),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    // Icon(
                                    //   Icons.star,
                                    //   color: AppColor.primaryColor,
                                    // ),
                                    SvgPicture.asset("assets/svgs/star.svg"),
                                    SizedBox(width: 5.w),
                                    Text(snapshot.data![index].rate.toString()),
                                    Spacer(),
                                    // Icon(
                                    //   Icons.timer,
                                    //   color: AppColor.primaryColor,
                                    // ),
                                    SvgPicture.asset("assets/svgs/time.svg"),
                                    SizedBox(width: 5.w),
                                    Text(snapshot.data![index].time),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text("Something went wrong"));
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddMealScreen();
              },
            ),
          );
        },
        backgroundColor: AppColor.titleColor,
        shape: CircleBorder(
          side: BorderSide(color: AppColor.primaryColor, width: 1.w),
        ),
        child: Icon(Icons.add, color: AppColor.primaryColor),
      ),
    );
  }
}
