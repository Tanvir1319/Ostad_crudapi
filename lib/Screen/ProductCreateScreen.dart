import 'package:api/RestApi/RestClient.dart';
import 'package:api/Style/style.dart';

import 'package:api/Widgets/errorDialog.dart';
import 'package:api/Widgets/textformField.dart';

import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> FormValues = {
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };
  
  bool Loading = false;

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

      //form validation complete....data is submitting to api
      await ProductCreateRequest(FormValues);
      setState(() {
        Loading = false;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Product'),
          
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
                          child: DangerButtonChild('Done')),
                    ),
                  ],
                )),
              ));
  }
}
