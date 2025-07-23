import 'package:flutter/material.dart';

final int mobileSize = 600;

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < mobileSize;
