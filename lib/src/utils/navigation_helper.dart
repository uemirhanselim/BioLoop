import 'package:flutter/material.dart';

void navigatorPop(BuildContext context, String result) =>
    Navigator.pop(context, result);
Future navigatorPush(BuildContext context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
Future navigatorPushReplacement(
        BuildContext context, Widget screen, String result) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => screen),
        result: result);
void navigatorPushAndRemoveUntil(BuildContext context, Widget screen,
        bool Function(Route route) predicate) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => screen), predicate);