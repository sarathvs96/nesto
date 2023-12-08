import 'package:flutter/material.dart';
import 'package:nesto/models/customer_creation.dart';
import 'package:nesto/provider/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/customer_creation_provider.dart';

class CustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employeeViewModel = Provider.of<CustomerProvider>(context);
    if (download == 1) {
      employeeViewModel.searchCustomers("");
    }
    download = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,))
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/menu.png')
          ),
        ],
        title: const Text("Customers",style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              onChanged: (val) async{
                employeeViewModel.searchCustomers(val);
              },
              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.qr_code,size: 30,),
                      const SizedBox(width: 8.0), // Adjust spacing between icons
                      IconButton(
                          onPressed: (){
                            _showBottomSheet(context);
                          },
                          icon: Icon(Icons.add_circle,color: Color(0xff17479b),size: 30,)),
                    ],
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    color: Colors.black, // Set border color here
                    width: 1.0, // Set border width here
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
            Expanded(
              child: Consumer<CustomerProvider>(
            builder: (context, model, child) {
              return ListView.builder(
                itemCount: model.customers.length,
                itemBuilder: (context, index) {
                  final employee = model.customers[index];
                  // Build your UI based on the data
                  // return ListTile(
                  //   title: Text(item['name']),
                  //   // Add other fields as needed
                  // );
                  return Container(
                    margin: EdgeInsets.only(top: 15,left: 5,right: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xfff1eeee),
                          offset: Offset(0, 1), // Offset of the shadow
                          blurRadius: 4.0, // Spread of the shadow
                          spreadRadius: 2.0, // Extends the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[200],
                          ),
                          child: const Center(
                            child: Icon(Icons.person),
                            // Icon(Icons.person),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 70,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white70, // Top color
                                Colors.grey,       // Middle color
                                Colors.white70,
                              ], // Define your gradient colors
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 72,
                            margin: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(employee.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),
                                Text("ID : ${employee.idd}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,color: Colors.grey
                                  ),),
                                Text("${employee.streetTwo}, ${employee.city}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,color: Colors.grey
                                  ),),
                                Row(
                                  children: [
                                    const Text("State : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),),
                                    Text(employee.state,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red
                                      ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 72,
                          margin: const EdgeInsets.only(right: 15,left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/phone.png",width: 20,),
                              Image.asset("assets/images/whatsapp.png",width: 20,),
                            ],
                          ),
                        )
                      ],
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
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return  CustomerCreationScreen();
      },
    );
  }
}

class CustomerCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerCreationProvider(),
      child: _CustomerCreationScreen(),
    );
  }
}

class _CustomerCreationScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _profilePicController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _streetTwoController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerCreationProvider>(context);

    return
      Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _nameController.text=value;
                    customerProvider.updateCustomer(
                      customerProvider.customer.copyWith(name: value),
                    );
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Profile Pic';
                    }
                    return null;
                  },
                  controller: _profilePicController,
                  decoration: const InputDecoration(labelText: 'Profile Pic'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Mobile Number';
                    }
                    return null;
                  },
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(labelText: 'Mobile Number'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Street';
                    }
                    return null;
                  },
                  controller: _streetController,
                  decoration: const InputDecoration(labelText: 'Street'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Street Two';
                    }
                    return null;
                  },
                  controller: _streetTwoController,
                  decoration: const InputDecoration(labelText: 'Street Two'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your City';
                    }
                    return null;
                  },
                  controller: _cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Pincode';
                    }
                    return null;
                  },
                  controller: _pincodeController,
                  decoration: const InputDecoration(labelText: 'Pincode'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Country';
                    }
                    return null;
                  },
                  controller: _countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your State';
                    }
                    return null;
                  },
                  controller: _stateController,
                  decoration: const InputDecoration(labelText: 'State'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                    // Handle form submission here
                    // Access the values using _nameController.text, _profilePicController.text, etc.
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      );
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, handle submission logic here
      // Access the values using _nameController.text, _profilePicController.text, etc.
      print('Form submitted successfully!');
    }
  }
}

