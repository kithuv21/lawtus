import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lawtus/card.dart';
import 'package:lawtus/videopage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('Latest lectures',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: FirebaseFirestore.instance.collection('videos').where('showinnew',isEqualTo: true).get(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Align(child: Center(child: CircularProgressIndicator()),alignment: Alignment.center,);
                      }
                      if(snapshot.hasData==false){
                        return Center(child: Text('Nothing'),);
                      }
                      
                      if(snapshot.hasData)
                      print(snapshot.data!.docs.length);
                      {return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
              
              
                            var dataAcquired=snapshot.data!.docs[index].data();
                          
                            return GestureDetector(
                              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>videopage(name: dataAcquired['name'],videourl: dataAcquired['videourl'],topic: dataAcquired['topic'],),)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: card1(img: snapshot.data!.docs[index].data()['img'], name: dataAcquired['name'], topic: dataAcquired['topic']),
                              ));
                        },
                        ),
                      );}
                      
                    },
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text('Recently watched',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
          ],
        ),
      ),

    );
  }
}