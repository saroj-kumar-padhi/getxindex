import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/pages/arti_page.dart';

import '../models/samples.dart';
class NavigationDrawer extends StatelessWidget {
  var item_no = 0.obs;
   NavigationDrawer(int p_item_no) : item_no = p_item_no.obs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: artis.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                   // Within the `FirstRoute` widget
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AartiDetails(
      item_no.value


    )),
  );
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
                                      Radius.circular(17)),
                                  color: Colors.white,
                                ),
                                height: 65,
                                width: 65.0,
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
        )

    );
  }
}
