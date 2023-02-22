import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
Future<dynamic> ShowDialogPage(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: SpinKitFadingCube(
          itemBuilder: (context, index) {
            final colors = [Theme.of(context).primaryColor, Colors.black];
            final color = colors[index % colors.length];
            return DecoratedBox(
              decoration: BoxDecoration(color: color),
            );
          },
          size: 140,
          color: Theme.of(context).primaryColor,
          duration: const Duration(seconds: 2),
        ));
      },
    );
  }
