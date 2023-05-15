import 'dart:io';

import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Positioned.fill(
        child: Container(
          color: AppColors.primaryBlack,
          child: Center(
            child: Platform.isAndroid
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageName.dota2LogoColor,
                          width: 250,
                          height: 250,
                        )
                      ],
                    ),
                  )
                : const CupertinoActivityIndicator(radius: 16),
          ),
        ),
      ),
    );
  }
}

loadingIndicator(bool isLoading) {}
