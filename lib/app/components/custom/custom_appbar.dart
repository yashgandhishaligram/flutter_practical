import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({Key? key,this.title,this.centerTitle,this.button,this.onTap});
  String? title;
  bool? centerTitle;
  bool? button;
  List<Widget>? actions;
  GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left,color: Colors.black,size: 30,),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: centerTitle,
        title: Text(title.toString(),style: TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0.2,
        actions: [button! ?
        TextButton(
            onPressed: onTap ,
            child: Text("DONE",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.lightBlue[500]))):
        SizedBox()],
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}