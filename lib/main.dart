import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meesho/pages/account.dart';
import 'package:mdi/mdi.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:meesho/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCsodbZSEhh6gmZilSyrwrbYgtfnCeRdqM",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "meesho-dd6bd",
    ),
  );
  // runApp(const MaterialApp(
  //   home: MainPage(),
  // ));
  runApp(MaterialApp(
    home: MainPage(),
    routes: {
      '/account':(context)=> Account(),
      '/login':(context)=> Login(),
    },
  ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something went Wrong'));
          }
          else if(snapshot.hasData){
            return Home();
          }
          else{
            return Login();
          }
        },
      ),
    );
  }
}






class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  List<String> list1=['boy.jpg','child.jpg','formal.jpg','men.jpg','women.jpg'];
  List<String> pro=['co.jpg','fur.jpg','books.jpg','foot.jpg'];
  List<Best> be=[Best("Sarees",250,"saree.jpg"),Best("Kurtis", 200,"kurti.jpg"),Best("Mens wear", 149,"men_wear.jpg"),Best("Kitchen", 30, "kitchen.jpg")];
  Widget im(String s){
    return  Container(
            margin: EdgeInsets.only(top: 20,right: 20,left: 10),
            height: 80,
            width: 80,
            // color: Colors.blue,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(s),
                fit: BoxFit.fill,
              ),
              // color: Colors.red,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular),
            ),
    );
  }
  Widget Product(String s){
    return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage(s),
                  fit: BoxFit.fill,
              )
            ),
            // color: Colors.red,
          );
  }
  Widget bestSellers(Best s){
    return  Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 20,right: 10,left: 10),
            height: 140,
            width: 140,
            // color: Colors.blue,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(s.image),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                  color: Colors.pinkAccent,
                  width: 8,
              )
              // color: Colors.red,
              // borderRadius: BorderRadius.circular),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child:Column(
                  children: [
                    Text(
                      s.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "From Rs.${s.price}",
                    )
              ]
            )

          )
        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Container(
                        child: Icon(
                          Icons.account_circle_sharp,
                          size: 40,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.fromLTRB(20, 0, 10, 0)
                    ),
                    Container(
                      child: Text(
                        "User",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 40,
                        ),
                        margin: new EdgeInsets.only(right: 10),
                      ),
                      Container(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70),
                    ),
                    margin: new EdgeInsets.only(left: 20),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(
                      Icons.mic,
                    ),
                  ),

                ),

              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: list1.map((e) => im(e)).toList(),
            ),
          ),
          Container(
            child: CarouselSlider(
              items: pro.map((e) => Product(e)).toList(),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 300),
                viewportFraction: 0.8,
              ),
            ),
            margin: EdgeInsets.only(top: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: Container(
                        height: 60,
                        child: Row(
                          children: [
                              Icon(
                                Icons.attach_money_outlined
                              ),
                              Text(
                                "Cash On \n Delivery",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      color: Colors.blue[100],
                    )
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                                Icons.local_shipping,
                            ),
                            margin: EdgeInsets.only(right: 5),
                          ),
                          Text(
                            "Free Delivery,\nFree Returns",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      color: Colors.blue[100],
                    )
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.tag_sharp,
                            ),
                            margin: EdgeInsets.only(right: 5),
                          ),
                          Text(
                            "Lowest,\nPrice",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      color: Colors.blue[100],
                    )
                ),
              ],
            ),
            color: Colors.blue[100],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                  Expanded(
                      flex:1,
                      child: Text(
                          "Best Sellers",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                      )
                  ),
                  Expanded(
                      flex:1,
                      child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.pink,
                          ),
                        textAlign:TextAlign.end,
                      )
                  ),
              ],
            ),
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0)
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: be.map((e) => bestSellers(e)).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey[300],
            height: 10,
          ),
          bottom(context),
        ],
      ),
    );
  }
}


class Best{
    late String name;
    late int price;
    late String image;
    Best(String name,int price,String image){
      this.name=name;
      this.price=price;
      this.image=image;
    }
}


Widget bottom(BuildContext context){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
        BottomNavigationBarItem(icon:Icon(Icons.category_outlined),label:"Categories"),
        BottomNavigationBarItem(icon:Icon(Icons.shopping_bag),label: "Orders"),
        BottomNavigationBarItem(icon:Icon(Icons.people),label: "Community"),
        BottomNavigationBarItem(icon:Icon(Icons.person),label: "Account"),
      ],
      onTap: (value) {
          if(value==4){
            Navigator.pushNamed(context,'/account');
          }
          if(value==0){
            Navigator.pushNamed(context, '/');
          }
      },
      unselectedItemColor: Colors.pink,
      type: BottomNavigationBarType.fixed,
    );

}