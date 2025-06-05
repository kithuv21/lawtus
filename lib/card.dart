import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String img;
  final String name;
  final String topic;
  
  const card({super.key,required this.img,required this.name,required this.topic });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(img),
          Text(topic),
          Text(name)
        ],
      ),
    );
  }
}
    String url='';
    Future getURL(String img)async{
      try{
        final ref =FirebaseStorage.instance.refFromURL(img);
        url=await ref.getDownloadURL();
      }catch(e){
        
      }


    }

Widget card1 ({required img,required name,required topic}){
  getURL(img);
  return Container(
    height: 300,
    
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          spreadRadius: 0.000001,
          offset: Offset(0, 0),
          blurRadius: 3,
          blurStyle: BlurStyle.normal
        )
      ],
      borderRadius: BorderRadius.circular(20),
      color: Colors.white
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.network(url,width: 200,
            loadingBuilder: (context, child, loadingProgress) => Container(child:CircularProgressIndicator(), width: 200,),
            errorBuilder: (context, error, stackTrace) => Container(width:200,child: Center(child: Icon(Icons.error))),
            )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(topic,style: TextStyle(fontWeight: FontWeight.bold),),
              Text(name)
            ],
          ),
          
        ],
      ),
    );
}