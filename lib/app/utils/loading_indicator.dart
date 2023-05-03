import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

loadingIndicator(bool isLoading) {
  return Visibility(
    visible: isLoading,
    child: Positioned.fill(
      child: Container(
        color: Colors.white70,
        child: Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator()
              : const CupertinoActivityIndicator(radius: 16),
        ),
      ),
    ),
  );
}
