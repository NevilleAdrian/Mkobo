import 'package:flutter/material.dart';
import 'package:mkobo/utils/colors.dart';
import 'package:mkobo/utils/padding.dart';

class Background extends StatefulWidget {
  const Background({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.child,
              Container(
                height: 10,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 13,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
