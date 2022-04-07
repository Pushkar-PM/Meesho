import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meesho/main.dart';
import 'package:meesho/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp(MaterialApp(
      home: Account(),
  ));
}



class  Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  List<String> account=[
      "My Followed Shops","My Bank Details","My Shared Products","My Payments",
      "Refer & Earn","Spins","Enter Referral Code","Meesho Credits","Help",
    "Business Logo","Become a Supplier"
  ];

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Account",style: TextStyle(
              color: Colors.black,
            ),),
            backgroundColor: Colors.white,
            actions: [
                IconButton(
                    onPressed: (){},
                    icon:Icon(Icons.search),
                    color: Colors.black,
                ),
                IconButton(
                    onPressed: (){},
                    icon:Icon(Icons.shopping_cart_outlined),
                    color: Colors.black,
                ),

            ],
        ),
        body: Column(
            children: [
              Container(
                  child: Row(
                    children: [
                        IconButton(
                            onPressed:() {},
                            icon: Icon(Icons.account_circle_rounded),
                            iconSize: 100,
                        ),
                        FloatingActionButton.extended(
                            onPressed: (){},
                            label: Text("pushkarmavale@gmail.com"),
                            backgroundColor: Color.fromARGB(100, 253, 1, 240),
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.zero
                            ),
                        ),
                    ],
                  ),
              ),
              Expanded(
                  child:ListView.builder(
                      itemCount: account.length,
                      itemBuilder: (context,index){
                          return Card(
                            child: ListTile(
                                onTap:(){},
                                title: Text(account[index]),
                            ),
                          );
                      }
                  ),
              ),
              bottom(context),
            ],
        )
    );
  }
}
