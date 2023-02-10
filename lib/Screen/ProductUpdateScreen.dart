import 'package:api/RestApi/RestClient.dart';
import 'package:api/Screen/ProductShowScreen.dart';
import 'package:api/Style/style.dart';

import 'package:api/Widgets/errorDialog.dart';
import 'package:api/Widgets/textformField.dart';

import 'package:flutter/material.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map updatedProduct;
  const ProductUpdateScreen(this.updatedProduct);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };
  bool Loading = false;

  @override
  void initState() {
    FormValues.update('ProductName', (value) => widget.updatedProduct['ProductName']);
    FormValues.update('Img', (value) => widget.updatedProduct['Img']);
    FormValues.update('TotalPrice', (value) => widget.updatedProduct['TotalPrice']);
    FormValues.update('UnitPrice', (value) => widget.updatedProduct['UnitPrice']);
    FormValues.update(
        'ProductCode', (value) => widget.updatedProduct['ProductCode']);
  }

  InputOnChange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['ProductName']!.length == 0) {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "You must have to give an Product Name.",
          );
        },
      );
    } else if (FormValues['Img']!.length == 0) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "You must have to give an image url",
            );
          });
    } else if (FormValues['UnitPrice']!.length == 0) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "You must have to give an Unit Price.",
            );
          });
    } else if (FormValues['TotalPrice']!.length == 0) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "You must have to give Total Price.",
            );
          });
    } else if (FormValues['ProductCode']!.length == 0) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "You must have to give Product Code.",
            );
          });
    } else if (FormValues['Qty']!.length == 0) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "You must have to give Qty.",
            );
          });
    } else {
      setState(() {
        Loading = true;
      });

      await ProductUpdateRequest(FormValues, widget.updatedProduct['_id']);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex)=> ProductShowScreen()), (Route route) => false);
      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
        ),
        body: Loading
            ? (Center(
                child: CircularProgressIndicator(
                ),
              ))
            : SingleChildScrollView(
                child: (Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      initialValue: FormValues['ProductName'],
                      onChanged: (Textvalue) {
                        InputOnChange('ProductName', Textvalue);
                      },
                      decoration: FormInputDecoration('Product Name',
                          Icon(Icons.precision_manufacturing_rounded)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: FormValues['Img'],
                      onChanged: (Textvalue) {
                        InputOnChange('Img', Textvalue);
                      },
                      decoration: FormInputDecoration('Product Image URL',
                          Icon(Icons.production_quantity_limits)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: FormValues['UnitPrice'],
                      onChanged: (Textvalue) {
                        InputOnChange('UnitPrice', Textvalue);
                      },
                      decoration: FormInputDecoration(
                        'Unit Price',
                        Icon(Icons.ac_unit_sharp),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: FormValues['TotalPrice'],
                      onChanged: (Textvalue) {
                        InputOnChange('TotalPrice', Textvalue);
                      },
                      decoration: FormInputDecoration(
                          'Total Price', Icon(Icons.price_check_rounded)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      initialValue: FormValues['ProductCode'],
                      onChanged: (Textvalue) {
                        InputOnChange('ProductCode', Textvalue);
                      },
                      decoration: FormInputDecoration(
                          'Product Code', Icon(Icons.code_outlined)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    AppDropDownStyle(DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(
                          child: Text('Select Qty'),
                          value: '',
                        ),
                        DropdownMenuItem(
                          child: Text('1'),
                          value: '1',
                        ),
                        DropdownMenuItem(
                          child: Text('2'),
                          value: '2',
                        ),
                        DropdownMenuItem(
                          child: Text('3'),
                          value: '3',
                        ),
                      ],
                      onChanged: (Textvalue) {
                        InputOnChange('Qty', Textvalue);
                      },
                      isExpanded: true,
                      underline: Container(),
                    )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: () {
                            FormOnSubmit();
                          },
                          child: DangerButtonChild('Update Now')),
                    ),
                  ],
                )),
              ));
  }
}
