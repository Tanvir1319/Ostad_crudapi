import 'package:api/RestApi/RestClient.dart';
import 'package:api/Screen/ProductCreateScreen.dart';
import 'package:api/Screen/ProductUpdateScreen.dart';
import 'package:api/Style/style.dart';
import 'package:api/Utility/Utility.dart';
import 'package:flutter/material.dart';

class ProductShowScreen extends StatefulWidget {
  const ProductShowScreen({super.key});

  @override
  State<ProductShowScreen> createState() => _ProductShowScreenState();
}

class _ProductShowScreenState extends State<ProductShowScreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

//api call function
  CallData() async {
    Loading = true;
    var data = await ProductReadRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

//Delete product method
  DeleteProduct(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(' Do you want to delete it?'),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    Loading = true;
                  });
                  await ProductDeleteRequest(id);
                  await CallData();
                },
                child: Text('Yes'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
            ],
          );
        });
  }

  //update
  Update(context,updatedProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) =>
       ProductUpdateScreen(updatedProduct),
       ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud APi Show Screen'),
      ),
      body: Container(
        child: Loading
            ? (Center(
                child: CircularProgressIndicator(
                    ),
              ))
            : RefreshIndicator(
                onRefresh: () async {
                  CallData();
                },
                child: (GridView.builder(
                  gridDelegate: ProductGrid(),
                  itemCount: ProductList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              ProductList[index]['image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(6, 2, 5, 9),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ProductList[index]['title']),
                                SizedBox(
                                  height: 3,
                                ),
                                Text("Price: " +
                                    ProductList[index]['price'] +
                                    " BDT"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Update(context,ProductList[index]);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: EditIconColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        DeleteProduct(
                                            ProductList[index]['_id']);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: CommonRedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ProductCreateScreen()
            )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
   