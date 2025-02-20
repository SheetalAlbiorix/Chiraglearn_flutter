import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intern_project/model/product_model.dart';
import 'package:intern_project/view/interface/add_product.dart';
import 'package:intern_project/view/interface/login.dart';

abstract class User {
  void login();

  void logout();
}

class Owner implements User {
  @override
  void logout() {}

  @override
  void login() {}
}

class Customer implements User {
  @override
  void login() {}

  @override
  void logout() {}
}

class Employee implements User {
  @override
  void login() {}

  @override
  void logout() {}
}

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = [];

  bool isLoading = false;

  Future<void> loadProductsJson() async {
    setState(() => isLoading = true);
    try {
      String jsonString = await rootBundle.loadString('assets/product.json');
      var jsonList = jsonDecode(jsonString) as List;

      products = jsonList.map<ProductModel>(
        (e) {
          return ProductModel.fromJson(e);
        },
      ).toList();
    } catch (e) {
      print('Error $e');
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    loadProductsJson();
    widget.user.login();
  }

  void _addProduct(ProductModel newProduct) {
    setState(() {
      products.add(newProduct);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${newProduct.name} added.")),
      );
    });
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                widget.user.logout();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Logout successfully."),
                  ),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
        floatingActionButton: Visibility(
          visible: widget.user is Owner,
          child: FloatingActionButton(
            onPressed: () async {
              final newProduct = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductScreen(),
                ),
              );

              _addProduct(newProduct);
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : products.isEmpty
                ? const Center(child: Text("No products"))
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 60),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var product = products[index];
                        return Card(
                          child: ListTile(
                              leading: Text("${index + 1}"),
                              // Display item number
                              title: Text(product.name!),
                              subtitle: Text(product.price!.toString()),
                              // Display individual item
                              trailing: Visibility(
                                visible: widget.user is! Customer,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      var current = products.removeAt(index);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text("${current.name} Deleted."),
                                        ),
                                      );
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ));
  }
}
