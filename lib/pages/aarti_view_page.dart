import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/pages/aarti_page_drawer.dart';

import '../models/samples.dart';
import '../utils/arti_reader.dart';
import 'arti_page.dart';




class MobileViewAartiPage extends StatelessWidget {
  var item_no = 0.obs;
   MobileViewAartiPage(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      drawer:
      // IconButton( icon: Icon(Icons.dehaze),
      //     onPressed: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>
            NavigationDrawer(item_no.value),
        // ));
      // },
      // appBar: AppBar(
      //   title: Text('Aarti Page'),
      // ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children:[
         Obx(()=>
           
          Expanded(child: AartiDetails(item_no.value)),

         ), ]),
      ),

    );
  }
}


class WideScreenAartiPage extends StatelessWidget {
  var item_no = 0.obs;

  WideScreenAartiPage(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Row(children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: artis.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              item_no.value = index;
                            },
                            child: Card(
                              elevation: 7.0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: const Color(0xffFFF3E2),
                              // margin: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        height: 80,
                                        width: 80.0,
                                        child: CircleAvatar(
                                          // radius: 16,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                            artis[index].imagePath,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 25.0,
                                      ),
                                      // RichText(text: TextSpan())
                                      Expanded(
                                        child: Text(
                                          artis[index].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const VerticalDivider(
                thickness: 0.3,
                color: Colors.black,
              ),
              Obx(
                    () =>
                    Expanded(
                      flex: 4,
                      child: AartiDetails(item_no.value),
                    ),
              ),
              const VerticalDivider(
                thickness: 0.5,
                color: Colors.black,
              ),
              Obx(
                    () =>
                    Expanded(
                      flex: 3,
                      child: Container(child: ArtiAudioPlayer(item_no.value)),
                    ),
              )
            ])));
  }
}