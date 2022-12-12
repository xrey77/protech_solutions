import 'dart:async';
import 'dart:convert';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:protech_solutions/models/products.dart';

class SelfService extends StatefulWidget {
  const SelfService({Key? key}) : super(key: key);

  @override
  State<SelfService> createState() => _SelfServiceState();
}

class _SelfServiceState extends State<SelfService> {
  late List prodData = [];

  Future<void> fetchProducts() async {
    var client = http.Client();
    var url = Uri.parse('http://localhost:9000/getproductpages?page=1');

    // var token = await SessionManager().get("TOKEN");
    var _header = {
      // 'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    };

    var response = await client.get(url, headers: _header);

    var statuscode = response.statusCode;

    // final response =
    //     await client.get(url, headers: hdrs, body: jsonbody, encoding: encoding);
    List responseJson = jsonDecode(response.body);
    // debugPrint(responseJson.length.toString());
    // debugPrint(responseJson.toString());
    if (statuscode == 200) {
      // print(response.statusCode);
      // debugPrint(responseJson['ID'].toString());
      // debugPrint(responseJson['Prod_name']);
      setState(() {
        prodData.addAll(responseJson);
      });
      // debugPrint(prodData.length.toString());
    }
    //  else {
    //   print("Failed to load products..");
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load products');
    // }
  }

  @override
  void initState() {
    super.initState();

    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Protech Corporations",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset("assets/images/protech.png"),
          title: const Text(
            'Management Information System',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // actions: [],
          centerTitle: false,
        ),

        body: GridView.builder(
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
          ),
          itemCount: prodData.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 100,
              child: Card(
                shadowColor: Colors.transparent,
                // color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //ALIGN TEXT TO THE LEFT
                        children: <Widget>[
                          Image.network(
                            prodData[index]['Prod_pic'],
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            prodData[index]['Prod_name'] +
                                '\n' +
                                prodData[index]['Prod_desc'],
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                elevation: 20,
                margin: const EdgeInsets.all(20),
              ),
            );
          },
        ),
        // return Text(snapshot.data!.id);
        // }
        // if (snapshot.hasError) {
        //   print('${snapshot.error}');

        //   return Text('${snapshot.error}');
        // }

        // By default, show a loading spinner.
        // return const CircularProgressIndicator();
        // },
        // ),
      ),
    );
  }
}


          // return Card(
          //   child: Row(
          //     children: <Widget>[
          //       Column(
          //         children: <Widget>[
          //           Image.network(prodData[index]['Prod_pic']),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
          // },
