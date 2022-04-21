import 'package:carousel_slider/carousel_slider.dart';
import 'package:flooter/config/palette.dart';
import 'package:flooter/data/dart.dart';
import 'package:flooter/widgets/online_tray.dart';
import 'package:flooter/widgets/rooms.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  final List<String> images = [
    'https://www.trustetc.com/wp-content/uploads/2018/09/8crypto.png',
    // 'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://thevrsoldier.com/wp-content/uploads/2021/12/top-metaverse-coins-1b-market-cap.jpg',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToeLOW6CEShYoB1w0ZlhXBjRchMMAtWqouZw&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgGFzic53ZaOG149mudDoS7Cii3nbNFNiApg&usqp=CAU',
    'https://s27389.pcdn.co/wp-content/uploads/2022/02/nft-use-cases-for-businesses.jpeg.optimal.jpeg',
    // 'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDj2TDmRQVE99i2lpkm_s4BmAr5jvXrkqL0w&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWFoztVuEggiIHn-lu5FyqSb06ub_dPxRyrQ&usqp=CAU',
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      body: Column(
        children: [
          Container(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.85),
              // decoration: BoxDecoration(
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
              //         spreadRadius: 2,
              //         blurRadius: 1,
              //         offset: Offset(0, 1), // changes position of shadow
              //       ),
              //     ],
              //     border: Border.all(color: Colors.white, width: 2),
              //     borderRadius: BorderRadius.circular(2)),
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  // enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    child: Center(
                        child: Image.network(images[index],
                            fit: BoxFit.cover, width: width)),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 02, 0, 5.0),
            child: OnlineTray(onlineUsers: onlineUsers),
          ),
          SingleChildScrollView(
            child: Container(
              height: height * 0.62,
              child: ListView.builder(
                  padding: EdgeInsets.all(2),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () {},
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://image.shutterstock.com/image-vector/notification-icon-vector-material-design-260nw-759841507.jpg')),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('You Got a Follow Request',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                              enabled: true,
                              onLongPress: () {},
                              title: Text(
                                'Notification Alert!',
                                style: TextStyle(
                                    color: Colors.black54.withOpacity(0.9)),
                              ),
                              trailing: Text('View',
                                  style: TextStyle(
                                      color: Palette.facebookBlue
                                          .withOpacity(0.9))),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
