import 'package:flutter/material.dart';
import 'package:my_first_riverpod/ui/action_page/action_widget.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/widgets/app_circular_icon_button.dart';
import 'package:my_first_riverpod/widgets/buttons_container.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.4,
              // height: Dimensions.imageActionScreen,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/Cerro-Torre.jpeg'),
              )),
            ),
          ),
          Positioned(
            top: 45,
            left: 25,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: AppCirularIconButton(
                      backgroundColor: AppColors.buttonBackgroundColor.withOpacity(0.6),
                      icon: Icons.arrow_back_ios_new,
                    )),
                AppCirularIconButton(
                  backgroundColor: AppColors.buttonBackgroundColor.withOpacity(0.6),
                  icon: Icons.menu,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height * 0.4 - 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child:const  ActionWidget(),
            ),
            
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30 ),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child:ButtonsContainer()
        ),
      ), // bottomNavigationBar:,
    );
  }
}

