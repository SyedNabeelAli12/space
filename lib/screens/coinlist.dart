import 'dart:convert';

import 'package:glassmorphism/glassmorphism.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CoinLists extends StatefulWidget {
  const CoinLists({Key? key}) : super(key: key);

  @override
  State<CoinLists> createState() => _CoinListsState();
}

class _CoinListsState extends State<CoinLists> {
  Widget _glassWidget(Container _container, size1, size2) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: GlassmorphicContainer(
          height: size1,
          width: size2,
          borderRadius: 20,
          blur: 15,
          alignment: Alignment.center,
          border: 0,
          linearGradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.1),
            Colors.white38.withOpacity(0.1)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderGradient: LinearGradient(colors: [
            Colors.white24.withOpacity(0.15),
            Colors.white70.withOpacity(0.15)
          ]),
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: _container)))),
    );
  }

  List<dynamic> _coins = [];

  final String apiUrl =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h";

  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(Uri.parse(apiUrl));
  //   if (result.statusCode == 200) {
  //     return jsonDecode(result.body);
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  void fetchCoins() async {
    var result = await http.get(Uri.parse(apiUrl));

    if (result.statusCode == 200) {
      // setState(() {
      //   _coins = jsonDecode(result.body);
      //   print(_coins);
      // });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _coins = [];
  }

  Widget _buildList() {
    return _coins.length != 0
        ? RefreshIndicator(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _coins.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              print(_coins[index]['id']);
                            },
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(_coins[index]['image'])),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        '' +
                                            (_coins[index]['id'])
                                                .toString()
                                                .toLowerCase(),
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: (_coins[index]
                                                        ['market_cap_rank'] <
                                                    4)
                                                ? Icon(
                                                    Icons.star,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.04,
                                                    color: Color.fromARGB(
                                                        255, 146, 132, 8),
                                                  )
                                                : Icon(
                                                    Icons.star,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.04,
                                                    color: Color.fromARGB(
                                                        255, 150, 150, 150),
                                                  ),
                                          ),
                                          TextSpan(
                                            text: '  ' +
                                                (_coins[index]
                                                        ['market_cap_rank'])
                                                    .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            enabled: true,
                            onLongPress: () {
                              showLoaderDialog1(
                                context,
                                (_coins[index]['current_price']).toString(),
                                _coins[index]['image'],
                                (_coins[index]['market_cap']).toString(),
                                (_coins[index]['high_24h']).toString(),
                                (_coins[index]['low_24h']).toString(),
                                (_coins[index]['price_change_24h']).toString(),
                                (_coins[index]['price_change_percentage_24h'])
                                    .toString(),
                                (_coins[index]['total_supply']).toString(),
                                (_coins[index]['max_supply']).toString(),
                                (_coins[index]['market_cap_rank']).toString(),
                              );
                            },
                            isThreeLine: true,
                            title: Text(
                              '' +
                                  ((_coins[index]['symbol']))
                                      .toString()
                                      .toUpperCase(),
                              style: TextStyle(
                                  color: Color(0xffBD00FF).withOpacity(0.9)),
                            ),
                            trailing: Text(
                                'USD: ' +
                                    (_coins[index]['current_price']).toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 232, 201, 243)
                                        .withOpacity(0.9))),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            onRefresh: _getData,
          )
        : Center(child: CircularProgressIndicator());
  }

  Future<void> _getData() async {
    setState(() {
      fetchCoins();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCoins();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: Container(
//         child: _buildList(),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          _glassWidget(
              Container(
                height: height * 0.05,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Image",
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Symbol ",
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Price ",
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                  ],
                ),
              ),
              height * 0.05,
              width * 0.95),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              height: height * 0.8,
              color: Colors.transparent,
              //     child: FutureBuilder<List<dynamic>>(
              //       future: fetchUsers(),
              //       builder: (BuildContext context, AsyncSnapshot snapshot) {
              //         if (snapshot.hasData) {
              //           // print(_age(snapshot.data[0]));
              //           return ListView.builder(
              //               padding: EdgeInsets.all(8),
              //               itemCount: snapshot.data.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Container(
              //                   child: Card(
              //                     color: Colors.transparent,
              //                     child: Column(
              //                       children: <Widget>[
              //                         ListTile(
              //                           onTap: () {
              //                             print(snapshot.data[index]['id']);
              //                           },
              //                           leading: CircleAvatar(
              //                               radius: 30,
              //                               backgroundImage: NetworkImage(
              //                                   snapshot.data[index]['image'])),
              //                           subtitle: Text(
              //                               '' +
              //                                   (snapshot.data[index]['id'])
              //                                       .toString()
              //                                       .toLowerCase(),
              //                               style: TextStyle(color: Colors.white)),
              //                           title: Text(
              //                             '' +
              //                                 ((snapshot.data[index]['symbol']))
              //                                     .toString()
              //                                     .toUpperCase(),
              //                             style: TextStyle(
              //                                 color: Color(0xffBD00FF)
              //                                     .withOpacity(0.9)),
              //                           ),
              //                           trailing: Text(
              //                               'USD: ' +
              //                                   (snapshot.data[index]
              //                                           ['current_price'])
              //                                       .toString(),
              //                               style: TextStyle(
              //                                   color: Color.fromARGB(
              //                                           255, 232, 201, 243)
              //                                       .withOpacity(0.9))),
              //                         )
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               });
              //         } else {
              //           return Center(child: CircularProgressIndicator());
              //         }
              //       },
              //     ),

              child: _buildList(),
            ),
          ),
        ],
      ),
    );
  }
}

showLoaderDialog1(
    BuildContext context,
    String price,
    String image,
    String marketcap,
    String _hr24low,
    String _hr24high,
    String pricechange,
    String pricechangepercent,
    String totalsupply,
    String maxSupply,
    String rank) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    backgroundColor: Color.fromARGB(0, 81, 89, 245).withOpacity(0.85),
    // insetPadding: EdgeInsets.symmetric(
    //     horizontal: MediaQuery.of(context).size.width / 1,
    // vertical: MediaQuery.of(context).size.height / 3),
    content: SizedBox(
      height: 300,
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 61, 59, 61).withOpacity(0.2),
              radius: 40.0,

              // ),
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: [
                Text(
                  'Rank: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(rank),
              ],
            ),
            Row(
              children: [
                Text('Price: ', style: TextStyle(fontWeight: FontWeight.w600)),
                Text(price)
              ],
            ),
            Row(
              children: [
                Text('Market Cap: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(marketcap)
              ],
            ),
            Row(
              children: [
                Text('24 hr Low: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(_hr24low)
              ],
            ),
            Row(
              children: [
                Text('24 hr High',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(_hr24high)
              ],
            ),
            Row(
              children: [
                Text('Price Change: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(pricechange)
              ],
            ),
            Row(
              children: [
                Text('Price Change %: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(pricechangepercent)
              ],
            ),
            Row(
              children: [
                Text('Total Supply: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(totalsupply)
              ],
            ),
            Row(
              children: [
                Text('Max Supply: ',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(maxSupply)
              ],
            ),
          ],
        ),

        // ]),
      ),
    ),
    actions: [
      // TextButton(
      //     onPressed: () {
      //       Navigator.of(context, rootNavigator: true).pop();
      //     },
      //     child: Text('Cancel'))
      Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
          child: MaterialButton(
            minWidth: (MediaQuery.of(context).size.width),
            // padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ))
    ],
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
