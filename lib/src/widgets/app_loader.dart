import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .8,
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.orange,
          size: 50,
        ),
      ),
    );
  }
}
