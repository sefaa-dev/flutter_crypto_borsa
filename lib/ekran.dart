import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Ekran extends StatefulWidget {
  const Ekran({Key? key}) : super(key: key);

  @override
  _EkranState createState() => _EkranState();
}

class _EkranState extends State<Ekran> {
  bool dataYuklendiMi = false;

  List coins = [];

  getData() async {
    //await Future.delayed(Duration(seconds: 5));

    var response = await Dio().get('https://api.btcturk.com/api/v2/ticker');
    print("Gelen Veri : ${response.data}");
    setState(() {
      coins  = response.data["data"];
      print("COUNT : ${coins.length}");
      dataYuklendiMi = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Ornek"),
        actions: [
          IconButton(onPressed: () {

            https://tuxapp.xyz/test2.apk

            setState(() {
              dataYuklendiMi = false;
            });

            getData();
    }, icon: Icon(Icons.info))
        ],
      ),

      body :
        dataYuklendiMi == false ?
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            ) :

            ListView.builder(
              itemCount: coins.length,
              itemBuilder: (context, index)
              {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("${coins[index]["pair"]}")
                        ),
                        Expanded(
                            flex: 1,
                            child: Text("${coins[index]["bid"]}", textAlign: TextAlign.right,)

                        ),
                        Expanded(
                            flex: 1,
                            child: Text("${coins[index]["ask"]}", textAlign: TextAlign.right,)

                        ),
                      ],
                    ),
                  ),
                );
              },
            )


    );
  }
}
