import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    print("menu");
                  },
                ),
              ],
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  print("menu");
                },
              ),
              floating: true,
              flexibleSpace: const Image(
                image: AssetImage(
                  'assets/map.png',
                ),
                fit: BoxFit.cover,
              ),
              expandedHeight: 200,
            ),
            SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildListDelegate([ParkItem()])),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ParkItem() {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "swipe up for more",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const Text(
            "Choose Your Parking Point",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          ListView.separated(
            itemCount: 8,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              padding:
                  const EdgeInsets.only(left: 4, right: 8, top: 5, bottom: 3),
              child: Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: AssetImage(
                            'assets/map.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      height: 100,
                      padding:const EdgeInsets.only(left: 6,right: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Obhoy Das Lana ",
                            style: TextStyle(fontSize: 23, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4,),
                          const Text(
                            "Obhoy Das Lana Obhoy Das LanaObhoy Das LanaObhoy Das Lana",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4,),
                          const Text(
                            "56 \$ /per hr",
                            style: TextStyle(fontSize: 17, color: Colors.blueGrey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
