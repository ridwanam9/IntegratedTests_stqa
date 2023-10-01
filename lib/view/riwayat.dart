import 'package:finalproject/controller/riwayat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controller/tokenfirebase_controller.dart';
import '../model/keranjang_model.dart';
import '../model/riwayat_model.dart';
import 'dashboard.dart';
import 'keranjang.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key, this.emaillogin, this.listCart});
  final List<KeranjangModel>? listCart;
  final String? emaillogin;
  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  RiwayatController riwayatController = RiwayatController();
  List<RiwayatModel> riwayat = [];
  List<KeranjangModel> listCart = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listRiwayat();
    listCart = widget.listCart ?? [];
  }

  void listRiwayat() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    riwayat = await riwayatController.getRiwayat(
      token,
      widget.emaillogin.toString(),
    );
    setState(() {
      riwayat = riwayat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Riwayat"),
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: riwayat.length,
              itemBuilder: (context, index) {
                if (riwayat[index].status == "selesai") {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        riwayat[index].status!.toUpperCase(),
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      trailing:
                          Text(riwayat[index].jumlah.toString() + " item"),
                      subtitle: Text(riwayat[index].total.toString()),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayat[index].id.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (riwayat[index].status == "ditolak") {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(riwayat[index].status!.toUpperCase(),
                          style: TextStyle(color: Colors.red)),
                      subtitle: Text(riwayat[index].total.toString()),
                      trailing:
                          Text(riwayat[index].jumlah.toString() + " item"),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayat[index].id.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (riwayat[index].status == "diproses") {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        riwayat[index].status!.toUpperCase(),
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      subtitle: Text(riwayat[index].total.toString()),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(riwayat[index].jumlah.toString() + " item"),
                          Expanded(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Selesai",
                                    style: TextStyle(color: Colors.green),
                                  ))),
                        ],
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayat[index].id.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (riwayat[index].status == "menunggu pembayaran") {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        riwayat[index].status!.toUpperCase(),
                        style:
                            TextStyle(color: Colors.blue, letterSpacing: 1.5),
                      ),
                      trailing:
                          Text(riwayat[index].jumlah.toString() + " item"),
                      subtitle: Text(riwayat[index].total.toString()),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayat[index].id.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Keranjang",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Riwayat",
            ),
          ],
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            emaillogin: widget.emaillogin,
                            listCart: widget.listCart,
                          )));
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Keranjang(
                    emaillogin: widget.emaillogin,
                    listCart: widget.listCart,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
