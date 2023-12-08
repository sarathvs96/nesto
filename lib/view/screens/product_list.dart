import 'package:flutter/material.dart';
import 'package:nesto/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeViewModel = Provider.of<ProductProvider>(context);
    if (download1 == 1) {
      employeeViewModel.searchProducts("");
    }
    download1 = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Padding(
            padding: EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon:Icon(Icons.arrow_back_ios,color: Colors.black,))
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/menu.png')
          ),
        ],
        title: Text("Products",style: TextStyle(
            fontWeight: FontWeight.bold,color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              onChanged: (val) async{
                employeeViewModel.searchProducts(val);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.qr_code,size: 30,),
                      SizedBox(width: 8.0), // Adjust spacing between icons
                      Icon(Icons.add_circle,color: Color(0xff17479b),size: 30,),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color here
                    width: 1.0, // Set border width here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
              child: Consumer<ProductProvider>(
                  builder: (context, model, child) {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2
                      ),
                      itemCount: model.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final employee = model.products[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5,right: 5,top: 10,bottom: 10
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(3, 0), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            height: 60,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(employee.name,style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text("\$${employee.price}/-",style: TextStyle(color: Colors.grey),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 60,
                                          height: 27,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color(0xff17479b),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 27,
                                                  child: Center(
                                                    child: Text("+",style: TextStyle(
                                                        color: Colors.white
                                                    ),),
                                                  ),
                                                ),
                                              ),
                                              Text("1",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Expanded(
                                                child: Container(
                                                  height: 27,
                                                  child: Center(
                                                    child: Text("-",style: TextStyle(
                                                        color: Colors.white
                                                    ),),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })
          ),
        ],
      ),
    );
  }
}
