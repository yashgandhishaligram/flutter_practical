import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({Key? key,this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left,color: Colors.black,size: 30,),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(title.toString(),style: TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0.2,
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}