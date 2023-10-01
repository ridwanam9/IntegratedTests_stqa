import 'package:finalproject/controller/auth_controller.dart';
import 'package:finalproject/model/riwayat_model.dart';
import 'package:finalproject/view/admin_penjualan.dart';
import 'package:finalproject/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controller/order_controller.dart';
import '../controller/riwayat_controller.dart';
import '../controller/tokenfirebase_controller.dart';
import 'dashboard.dart';
import 'keranjang.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key, this.emaillogin});
  final String? emaillogin;

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  RiwayatController riwayatController = RiwayatController();
  final uangcustomer = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  OrderController orderController = OrderController();

  List<RiwayatModel> pesananmasuk = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllOrder();
  }

  void getAllOrder() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    pesananmasuk = await riwayatController.getIncoming(token);
    setState(() {
      pesananmasuk = pesananmasuk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard Admin"),
        ),
        drawer: Drawer(
            child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello, " + widget.emaillogin.toString()),
              TextButton(
                  onPressed: () async {
                    // logout
                    TokenFirebaseController tokenFirebaseController =
                        TokenFirebaseController();
                    var token = await tokenFirebaseController
                        .getTokenFirebase(widget.emaillogin!);
                    AuthController authController = AuthController();
                    authController.logout(token);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Logout"))
            ],
          ),
        )),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: pesananmasuk.length,
              itemBuilder: (context, index) {
                if (pesananmasuk[index].status.toString() ==
                    'menunggu pembayaran') {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      onLongPress: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Hapus Pesanan"),
                              content: Text(
                                  "Apakah anda yakin ingin menghapus pesanan ini?"),
                              actions: [
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          TokenFirebaseController
                                              tokenFirebaseController =
                                              TokenFirebaseController();
                                          var token =
                                              await tokenFirebaseController
                                                  .getTokenFirebase(
                                                      widget.emaillogin!);
                                          await orderController.deleteOrder(
                                              token,
                                              pesananmasuk[index]
                                                  .id
                                                  .toString());
                                          Navigator.pop(context);
                                          getAllOrder();
                                        },
                                        child: Text("Ya")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Tidak"))
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                actions: [
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            // validate
                                            if (_formkey.currentState!
                                                .validate()) {
                                              TokenFirebaseController
                                                  tokenFirebaseController =
                                                  TokenFirebaseController();
                                              var token =
                                                  await tokenFirebaseController
                                                      .getTokenFirebase(
                                                          widget.emaillogin!);
                                              bool? check =
                                                  await orderController
                                                      .updateOrder(
                                                          token,
                                                          pesananmasuk[index]
                                                              .id
                                                              .toString(),
                                                          pesananmasuk[index]
                                                              .menu_id
                                                              .toString(),
                                                          pesananmasuk[index]
                                                              .jumlah
                                                              .toString(),
                                                          pesananmasuk[index]
                                                              .status
                                                              .toString());
                                              if (check == true) {
                                                Navigator.pop(context);
                                                getAllOrder();
                                              } else {
                                                print("gagal");
                                              }
                                            }
                                          },
                                          child: Text("Ubah")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Batal")),
                                    ],
                                  )
                                ],
                                title: Text("Ubah Pesanan"),
                                content: SizedBox(
                                  height: 150,
                                  child: Column(children: [
                                    Form(
                                      key: _formkey,
                                      child:
                                          // update
                                          TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Jumlah Item",
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            pesananmasuk[index].jumlah =
                                                int.parse(value);
                                          });
                                        },
                                        initialValue: pesananmasuk[index]
                                            .jumlah
                                            .toString(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Masukkan Jumlah Item';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ]),
                                ));
                          },
                        );
                      },
                      leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pesananmasuk[index].id.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ]),
                      title: Text(
                        pesananmasuk[index].status!.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      subtitle: Text(
                        pesananmasuk[index].total.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Form(
                                key: _formkey,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Masukkan Total Bayar",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan Total Bayar';
                                    } else if (int.parse(uangcustomer.text) <
                                        int.parse(pesananmasuk[index]
                                            .total
                                            .toString())) {
                                      return 'Total Bayar Kurang';
                                    }
                                    return null;
                                  },
                                  controller: uangcustomer,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    uangcustomer.clear();
                                  },
                                  child: Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Text("Kembalian : " +
                                              (int.parse(uangcustomer.text) -
                                                      int.parse(
                                                          pesananmasuk[index]
                                                              .total
                                                              .toString()))
                                                  .toString()),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  uangcustomer.clear();
                                                },
                                                child: Text("OK"))
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text("Bayar"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text("Bayar"),
                      ),
                    ),
                  );
                } else if (pesananmasuk[index].status == 'diproses') {
                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                pesananmasuk[index].id.toString(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ]),
                        title: Text(
                          pesananmasuk[index].status!.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent),
                        ),
                        subtitle: Text(
                          pesananmasuk[index].total.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Dashboard(
                            //       emaillogin: widget.emaillogin,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Text(
                            "Selesai",
                            style: TextStyle(color: Colors.green),
                          ),
                        )),
                  );
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: "Pesanan Masuk",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: "Penjualan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Riwayat",
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              setState(() {
                getAllOrder();
              });
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Penjualan(
                    emaillogin: widget.emaillogin,
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
