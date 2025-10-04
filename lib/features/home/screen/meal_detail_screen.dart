import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 2.5,
                child: CachedNetworkImage(
                  imageUrl: mealModel.imageUrl,
                  
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16.w,
                height: 130.h,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/svgs/back.svg'))
                ),
            ],
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mealModel.name, style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400,
                ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 30.h,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColor.primaryColor.withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8.w,),
                      SvgPicture.asset("assets/svgs/time.svg"),
                      SizedBox(width: 5.w,),
                      Text(mealModel.time),
                      Spacer(),
                      SvgPicture.asset("assets/svgs/star.svg"),
                      SizedBox(width: 5.w,),
                      Text(mealModel.rate.toString()),
                      SizedBox(width: 8.w,),
                    ]
                    
                  ),
                ),
                SizedBox(height: 20.h,),
                Divider(
                  thickness: 1,
                  color: AppColor.dotColor,
                ),
                SizedBox(height: 15.h,),
                Text("Descrition", style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 5.h,),
                Text(mealModel.description, style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.textColor
                ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
