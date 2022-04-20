import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  Widget _listViewContent(width, height) {
    return _glassWidget(
      Container(
        child: Row(
          children: [
            Container(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40),
                child: Column(
                  children: [
                    Text(
                      'Fly with Stars',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Red Rose',
                          fontSize: 26),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Material(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: GlassmorphicContainer(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.7,
                          borderRadius: 20,
                          blur: 15,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                              colors: [
                                Color(0xffBD00FF).withOpacity(0.4),
                                Color(0xffBD00FF).withOpacity(0.4)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderGradient: LinearGradient(colors: [
                            Colors.grey.withOpacity(0.15),
                            Colors.grey.withOpacity(0.15)
                          ]),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                      child: MaterialButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          'Fly',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 6),
                                        ),
                                      ))))),
                    ),
                  ],
                ),
              ),
            ),
            Image(image: AssetImage('assets/images/vr.png'))
          ],
        ),
      ),
      height * 0.250,
      width * 0.9,
    );
  }

////////////
  ///
  ///
  ///
  ///
  ///
  TextEditingController searchController = new TextEditingController();

  List<dynamic> _coins = [];

  final String apiUrl = "https://api.coingecko.com/api/v3/search/trending";

  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(Uri.parse(apiUrl));
  //   if (result.statusCode == 200) {
  //     return jsonDecode(result.body);
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  Future<List> fetchCoins() async {
    var result = await http.get(Uri.parse(apiUrl));

    if (result.statusCode == 200) {
      // _coins = jsonDecode(result.body);
      // print(_coins);
      Map<String, dynamic> map = json.decode(result.body);
      List<dynamic> data = map["coins"];
      print(data[1]['item']['name']);
      return data;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  final String apisearchUrl = 'https://api.coingecko.com/api/v3/coins/';

  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(Uri.parse(apiUrl));
  //   if (result.statusCode == 200) {
  //     return jsonDecode(result.body);
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  Map<String, dynamic> _searchcoin = {};

  void searchCoins() async {
    try {
      var result = await http
          .get(Uri.parse(apisearchUrl + (searchController.text).toString()));

      if (result.statusCode == 200) {
        // Map<String, dynamic> map =
        //

        setState(() {
          _searchcoin = json.decode(result.body);
        });

        print(_searchcoin['id']);

        // Map<String, dynamic> map = json.decode(result.body);
        // List<dynamic> data = map["coins"];
        // print(data[1]['item']['name']);
        // return data;
      } else {
        print('Not');
        _searchcoin = {};
      }
    } catch (e) {
      print(e);
      _searchcoin = {};
    }
  }

  Widget _buildList() {
    return _searchcoin.length != 0
        ? ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white24.withOpacity(0.15),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          // print(_coins[index]['id']);
                        },
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(_searchcoin['image']['small'])),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    '' +
                                        (_searchcoin['id'])
                                            .toString()
                                            .toLowerCase(),
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Developer Score: " +
                                        (_searchcoin['developer_score'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Liquidity Score: " +
                                        (_searchcoin['liquidity_score'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Community Score: " +
                                        (_searchcoin['community_score'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Locked Value: " +
                                        (_searchcoin['market_data']
                                                ['total_value_locked'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 24hr: " +
                                        (_searchcoin['market_data']
                                                ['price_change_24h'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Hashing Algorithm: " +
                                        (_searchcoin['hashing_algorithm'])
                                            .toString(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 24h: " +
                                        (_searchcoin['market_data']
                                                ['price_change_percentage_24h'])
                                            .toString() +
                                        '%',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 7d: " +
                                        (_searchcoin['market_data']
                                                ['price_change_percentage_7d'])
                                            .toString() +
                                        '%',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 14d: " +
                                        (_searchcoin['market_data']
                                                ['price_change_percentage_14d'])
                                            .toString() +
                                        '%',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 30d: " +
                                        (_searchcoin['market_data']
                                                ['price_change_percentage_30d'])
                                            .toString() +
                                        '%',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Price Change 1y: " +
                                        (_searchcoin['market_data']
                                                ['price_change_percentage_1y'])
                                            .toString()
                                            .trimRight() +
                                        '%',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Twitter Followers: " +
                                        (_searchcoin['community_data']
                                                ['twitter_followers'])
                                            .toString()
                                            .trimRight(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Reddit Sub: " +
                                        (_searchcoin['community_data']
                                                ['reddit_subscribers'])
                                            .toString()
                                            .trimRight(),
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),

                            Text(
                                'USD: ' +
                                    (_searchcoin['market_data']['current_price']
                                            ['usd'])
                                        .toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 232, 201, 243)
                                        .withOpacity(0.9))),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                                'BTC: ' +
                                    (_searchcoin['market_data']['current_price']
                                            ['btc'])
                                        .toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 232, 201, 243)
                                        .withOpacity(0.9))),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                                'EUR: ' +
                                    (_searchcoin['market_data']['current_price']
                                            ['eur'])
                                        .toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 232, 201, 243)
                                        .withOpacity(0.9))),
                            // Row(
                            //   children: [
                            //     Text(
                            //         "Trust Score: " +
                            //             (_searchcoin['tickers']['trust_score']
                            //                 .toString(),
                            //         style: TextStyle(color: Colors.white))
                            //   ],
                            // ),
                          ],
                        ),
                        title: Text(
                          '' + _searchcoin['name'],
                          style: TextStyle(
                              color: Color(0xffBD00FF).withOpacity(0.9)),
                        ),
                        trailing: Container(
                          child: Column(
                            children: [],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
        : Column(
            children: [
              Container(
                child: Text('Enter Coin Name to Search'),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _glassWidget(
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      height: height * 0.02,
                      child: Text(
                        '   Top Trends',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0001,
                  ),
                  Container(
                    height: height * 0.12,
                    // color: Color.fromARGB(255, 237, 237, 237).withOpacity(0.1),
                    child: FutureBuilder<List>(
                        future: fetchCoins(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              padding: EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      height: height * 0.2,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 5,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data[index]
                                                          ['item']['small'])),
                                              Container(
                                                child: Text(
                                                    '' +
                                                        snapshot.data[index]
                                                            ['item']['name'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Container(
                                height: height * 0.002,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ));
                          }
                        }),
                  )
                ],
              )),
              MediaQuery.of(context).size.height * 0.16,
              MediaQuery.of(context).size.width * 0.9,
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _glassWidget(
                Container(
                    child: Container(
                  width: width * 0.85,
                  height: height * 0.05,
                  child: TextField(
                      controller: searchController,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 216, 189, 240),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: InkWell(
                            // splashColor: Colors.grey,
                            onTap: () {
                              searchCoins();
                            },
                            child: Container(
                              width: width * 0.2,
                              height: height * 0.05,
                              color: Colors.black.withOpacity(0.1),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.start),
                )),
                MediaQuery.of(context).size.height * 0.06,
                MediaQuery.of(context).size.width * 0.9,
              ),
            )),

            // Container(
            //   height: height * 0.648,
            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     children: <Widget>[
            //       // _listViewContent(width, height),
            //       // _listViewContent(width, height),
            //       // _listViewContent(width, height),
            //     ],
            //   ),
            // ),

            // SingleChildScrollView(
            //   child: Container(
            //     child: ListView(
            //       shrinkWrap: true,
            //       children: <Widget>[
            //         _listViewContent(width, height),
            //         _listViewContent(width, height),
            //       ],
            //     ),
            //   ),
            // )

            Container(
              height: height * 0.648,
              child: _buildList(),
            )
          ],
        ),
      ),
    );
  }
}
