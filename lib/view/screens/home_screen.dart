import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customer_list.dart';
import 'product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeGridView()
    );
  }
}

class HomeGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
          childAspectRatio: 1.2
      ),
      itemCount: 8, // Number of items in the grid (2 rows x 4 columns)
      itemBuilder: (BuildContext context, int index) {
        return HomeGridItem(index);
      },
    );
  }
}

class HomeGridItem extends StatelessWidget {
  final int index;

  HomeGridItem(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        navigatingScreens(
          index, context
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,right: 5,top: 10,bottom: 10
        ),
        child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index==0?Image.asset("assets/images/home_img1.png",width: 40,color: const Color(0xff17479b),):
                  index==1?Image.asset("assets/images/home_img2.png",width: 40,color: const Color(0xff17479b),):
                  index==2?Image.asset("assets/images/home_img3.png",width: 40,color: const Color(0xff17479b),):
                  index==3?Image.asset("assets/images/home_img4.png",width: 40,color: const Color(0xff17479b),):
                  index==4?Image.asset("assets/images/home_img5.png",width: 40,color: const Color(0xff17479b),):
                  index==5?Image.asset("assets/images/home_img6.png",width: 40,color: const Color(0xff17479b),):
                  index==6?Image.asset("assets/images/home_img7.png",width: 40,color: const Color(0xff17479b),):
                  Image.asset("assets/images/home_img8.png",width: 40,color: const Color(0xff17479b),),
                  index==0?const Text("Customers",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),):index==1?const Text("Products",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):index==2?const Text("New Order",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):index==3?const Text("Return Order",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):index==4?const Text("Add Payment",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):index==5?const Text("Today's Order",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):index==6?const Text("Today's Summary",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),):const Text("Route",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
  navigatingScreens(
      int num,
      BuildContext context
      ){
    if(num==0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomerList()),
      );
    }else if(num==1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductList()),
      );
    }
  }
}
