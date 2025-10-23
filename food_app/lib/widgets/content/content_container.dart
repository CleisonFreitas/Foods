import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_texts.dart';

class ContentContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? child;
  const ContentContainer({
    super.key,
    required this.title,
    required this.subtitle, this.child,
  });

  @override
  Widget build(BuildContext context) {
    final heighScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: widthScreen,
        height: heighScreen,
        decoration: BoxDecoration(color: Colors.black),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: heighScreen * 0.3,
              alignment: Alignment.center,
              width: widthScreen,
              color: Colors.transparent,
              child: ListTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTexts.regular32.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  height: heighScreen * 0.7,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
