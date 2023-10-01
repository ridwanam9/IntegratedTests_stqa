import 'package:finalproject/view/admin_dashboard.dart';
import 'package:flutter/material.dart';

import '../controller/riwayat_controller.dart';
import '../controller/tokenfirebase_controller.dart';
import '../model/riwayat_model.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key, this.emaillogin});
  final String? emaillogin;

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  RiwayatController riwayatController = RiwayatController();
  List<RiwayatModel> sales = [];
  String itemSales = "0";
  String totalSales = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  void getSales() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    sales = await riwayatController.getSales(token);
    setState(() {
      sales = sales;
    });
  }

  void getItemSales() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    itemSales = (await riwayatController.getItemSales(token))!;
    setState(() {
      itemSales = itemSales;
    });
  }

  void getTotalSaler() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    totalSales = (await riwayatController.getTotalSales(token))!;
    setState(() {
      totalSales = totalSales;
    });
  }

  void getAllData() {
    getItemSales();
    getTotalSaler();
    getSales();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Penjualan')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 190,
                      height: 100,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Item Terjual",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            if (sales.length == 0 || sales.length == null)
                              Text(
                                itemSales,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            else
                              Text(
                                itemSales,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ))),
                  SizedBox(
                      width: 190,
                      height: 100,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Penjualan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            if (totalSales != null)
                              Text(
                                totalSales,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            else
                              Text(
                                totalSales,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      )))
                ],
              ),
              if (sales.length == 0 || sales.length == null)
                Container(
                  child: Text("Tidak Ada Penjualan Selesai Hari Ini",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  margin: EdgeInsets.all(10),
                )
              else
                Container(
                  child: Text("Penjualan Selesai Hari Ini",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  margin: EdgeInsets.all(10),
                ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sales.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(sales[index].status!.toUpperCase()),
                          subtitle: Text(sales[index].total!.toString()),
                          trailing:
                              Text(sales[index].jumlah.toString() + " Item"),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Penjualan",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.blue),
          ],
          onTap: (value) => {
            if (value == 0)
              {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardAdmin(emaillogin: widget.emaillogin)))
              }
            else if (value == 1)
              {getAllData()}
            else if (value == 2)
              {
                Navigator.pushNamed(context, '/profile',
                    arguments: widget.emaillogin)
              }
          },
        ),
      ),
    );
  }
}
