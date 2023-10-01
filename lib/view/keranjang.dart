import 'package:finalproject/model/keranjang_model.dart';
import 'package:finalproject/view/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controller/order_controller.dart';
import '../controller/tokenfirebase_controller.dart';
import 'dashboard.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key, this.emaillogin, this.listCart});
  final String? emaillogin;
  final List<KeranjangModel>? listCart;

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  String? authtoken;
  OrderController orderController = OrderController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.listCart?.length);
    token();
  }

  void token() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    authtoken =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    setState(() {
      authtoken = authtoken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Keranjang"),
        ),
        body: ListView.builder(
          itemCount: widget.listCart?.length,
          itemBuilder: (context, index) {
            if (widget.listCart!.isEmpty) {
              return Center(
                child: Text("Keranjang Kosong"),
              );
            } else
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      // show dialog
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Proses Pesanan"),
                              content: Text("Apakah Anda Yakin?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak")),
                                TextButton(
                                    onPressed: () async {
                                      bool? check =
                                          await orderController.storeOrder(
                                              authtoken!,
                                              widget.listCart![index].menu_id!,
                                              widget.listCart![index].jumlah!,
                                              widget.listCart![index].total!,
                                              "menunggu pembayaran",
                                              widget.emaillogin!);
                                      if (check == true) {
                                        Navigator.pop(context);
                                        setState(() {
                                          widget.listCart!.removeAt(index);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Keranjang(
                                                        emaillogin:
                                                            widget.emaillogin,
                                                        listCart:
                                                            widget.listCart,
                                                      )));
                                        });
                                        // print(authtoken);
                                        // print(widget.listCart![index].menu_id);
                                        // print(widget.listCart![index].jumlah);
                                        // print(widget.listCart![index].total);
                                        // print(widget.emaillogin);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Gagal Memproses Pesanan")));
                                      }
                                    },
                                    child: Text("Ya")),
                              ],
                            );
                          });
                    },
                    title: Text(widget.listCart![index].name!),
                    subtitle: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Text(
                            widget.listCart![index].total!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(widget.listCart![index].jumlah! + " Item",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.listCart![index].jumlah = (int.parse(
                                                widget
                                                    .listCart![index].jumlah!) +
                                            1)
                                        .toString();
                                    widget.listCart![index].total = (int.parse(
                                                widget
                                                    .listCart![index].total!) +
                                            int.parse(
                                                widget.listCart![index].price!))
                                        .toString();
                                  });
                                },
                                icon: Icon(Icons.add))),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (int.parse(
                                              widget.listCart![index].jumlah!) >
                                          1) {
                                        widget.listCart![index].jumlah =
                                            (int.parse(widget.listCart![index]
                                                        .jumlah!) -
                                                    1)
                                                .toString();
                                        widget.listCart![index].total =
                                            (int.parse(widget.listCart![index]
                                                        .total!) -
                                                    int.parse(widget
                                                        .listCart![index]
                                                        .price!))
                                                .toString();
                                      } else if (int.parse(widget
                                                  .listCart![index].jumlah!) -
                                              1 ==
                                          0) {
                                        widget.listCart!.removeAt(index);
                                      }
                                    },
                                  );
                                },
                                icon: Icon(Icons.remove))),
                      ],
                    ),
                  ),
                ),
              );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.blue),
              label: "Keranjang",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Riwayat",
            ),
          ],
          currentIndex: 1,
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
                          )));
            } else if (index == 2) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Riwayat(
                            emaillogin: widget.emaillogin,
                            listCart: widget.listCart,
                          )));
            }
          },
        ),
      ),
    );
  }
}
