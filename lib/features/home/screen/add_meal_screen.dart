
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:meals_app/features/home/widget/custom_text_form_field.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptopnController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Add Meal"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Meal Name",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CostumTextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'You Should Add Name';
                    }
                    return null;
                  },
                  hintText: 'add meal',
                  controller: nameController,
                ),

                SizedBox(height: 12.h),
                Text(
                  "Image URL",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CostumTextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'You Should Add Image URL';
                    }
                    return null;
                  },
                  maxLines: 3,
                  hintText: 'image url',
                  controller: imageController,
                ),

                SizedBox(height: 12.h),
                Text(
                  "Rate",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CostumTextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'You Should Add a rate';
                    }
                    return null;
                  },
                  hintText: 'rate',
                  controller: rateController,
                ),

                SizedBox(height: 12.h),
                Text(
                  "Time",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CostumTextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'You Should Add Time';
                    }
                    return null;
                  },
                  hintText: 'time',
                  controller: timeController,
                ),

                SizedBox(height: 12.h),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CostumTextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'You Should Add Description';
                    }
                    return null;
                  },
                  hintText: 'description',
                  maxLines: 3,
                  controller: descriptopnController,
                ),

                SizedBox(height: 22.h),

                SizedBox(
                  height: 50.h,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        MealModel mealModel = MealModel(
                          imageUrl: imageController.text,
                          name: nameController.text,
                          description: descriptopnController.text,
                          time: timeController.text,
                          rate: double.parse(rateController.text),
                        );
                        databaseHelper.insert(mealModel).then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor
                    ),
                    child: Text("Save", style: TextStyle(
                      color: AppColor.titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
