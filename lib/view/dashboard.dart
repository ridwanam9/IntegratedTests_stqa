import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/controller/auth_controller.dart';
import 'package:finalproject/controller/menu_controller.dart';
import 'package:finalproject/controller/tokenfirebase_controller.dart';
import 'package:finalproject/model/keranjang_model.dart';
import 'package:finalproject/model/menu_model.dart';
import 'package:finalproject/view/riwayat.dart';
import 'package:flutter/material.dart';

import 'keranjang.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, this.emaillogin, this.listCart});
  final String? emaillogin;
  final List<KeranjangModel>? listCart;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final firestore = FirebaseFirestore.instance;
  final AuthController authController = AuthController();
  final MenuMakananController menuMakananController = MenuMakananController();
  List<MenuModel> listMenu = [];
  List<KeranjangModel> listCart = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMenu();
    listCart = widget.listCart ?? [];
    print(widget.listCart);
  }

  void getMenu() async {
    TokenFirebaseController tokenFirebaseController = TokenFirebaseController();
    var token =
        await tokenFirebaseController.getTokenFirebase(widget.emaillogin!);
    listMenu = await menuMakananController.getAllMenu(token);
    setState(() {
      listMenu = listMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            // appbar with logout button
            AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
              onPressed: () async {
                TokenFirebaseController tokenFirebaseController =
                    TokenFirebaseController();
                var token = await tokenFirebaseController
                    .getTokenFirebase(widget.emaillogin!);
                authController.logout(token);
                tokenFirebaseController.removeTokenFirebase(widget.emaillogin!);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // body with listview menu
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: listMenu.length,
            itemBuilder: (context, index) {
              if (listMenu[index].is_available == 0)
                return Card(
                    color: Colors.grey,
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: ListTile(
                          leading:
                              Image.network(listMenu[index].image.toString()),
                          title: Text(listMenu[index].name.toString()),
                          subtitle: Text(listMenu[index].price.toString()),
                          trailing: FittedBox(
                            fit: BoxFit.fill,
                            child:
                                // button add to cart
                                ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Menu tidak tersedia saat ini")));
                              },
                              child: Text("SOLD OUT"),
                            ),
                          ),
                        ),
                      ),
                    ));
              else
                return Card(
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: ListTile(
                        leading:
                            Image.network(listMenu[index].image.toString()),
                        title: Text(listMenu[index].name.toString()),
                        subtitle: Text(listMenu[index].price.toString()),
                        trailing: FittedBox(
                          fit: BoxFit.fill,
                          child:
                              // button add to cart
                              ElevatedButton(
                            onPressed: () {
                              setState(() {
                                // listCart[listMenu[index].id.toString()] =
                                //     KeranjangModel(
                                //         user_id: widget.emaillogin!,
                                //         menu_id: listMenu[index].id.toString(),
                                //         total: listMenu[index].price,
                                //         jumlah: "1",
                                //         status: "");
                                listCart.add(KeranjangModel(
                                  user_id: widget.emaillogin!,
                                  menu_id: listMenu[index].id.toString(),
                                  total: listMenu[index].price,
                                  jumlah: "1",
                                  status: "",
                                  name: listMenu[index].name.toString(),
                                  price: listMenu[index].price.toString(),
                                ));
                                print(listCart);
                              });
                            },
                            child: Text("Add to Cart"),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            },
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
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              setState(() {
                getMenu();
              });
            } else if (index == 1) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Keranjang(
                            emaillogin: widget.emaillogin,
                            listCart: listCart,
                          )));
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Riwayat(
                    emaillogin: widget.emaillogin,
                    listCart: listCart,
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
