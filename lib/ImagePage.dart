
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image(
            image: AssetImage("lib/images/order_list@2x.png"),
            width: 100.0,
            height: 200.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            repeat: ImageRepeat.repeatY,
          ),
          Image.asset('lib/images/order_list@2x.png'),
          Image(
            image: NetworkImage(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2349859212,1053714951&fm=26&gp=0.jpg"
            ),
            width: 400.0,
            height: 100.0,
            color: Colors.yellow,
            colorBlendMode: BlendMode.difference,
            repeat: ImageRepeat.repeatX,

          )
        ],
      ),
    );
  }
}
