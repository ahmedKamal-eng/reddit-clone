
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: 25,child:  Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 30,),),
        SizedBox(width: 30,),
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.grey,
        ),
        SizedBox(width: 10,),
        Text('r/Realme 11 pro unboxing ',style: TextStyle(fontSize: 18),),
        SizedBox(width: 30,),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
      ],
    ),);
  }
}
