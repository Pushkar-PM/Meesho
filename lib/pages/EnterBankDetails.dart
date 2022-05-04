

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
    runApp(MaterialApp(
        home: EnterBankDetails(),

    ));
}

class EnterBankDetails extends StatefulWidget {
  const EnterBankDetails({Key? key}) : super(key: key);

  @override
  _EnterBankDetailsState createState() => _EnterBankDetailsState();
}

class _EnterBankDetailsState extends State<EnterBankDetails> {
  @override
  Widget build(BuildContext context) {
    List<String> list=["Account Number","Confirm Account Number","Account Holder's Name","IFSC code"];
    Widget Bank(String s){
        return
          Container(
            margin: EdgeInsets.fromLTRB(10,0,10,0),
            child:Column(
          children: [
              SizedBox(height: 30,),
              TextField(
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration:
                    InputDecoration(
                        labelText: s,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent)
                        ),
                ),

              ),
          ],
        ),
          );
    };
    return Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: RaisedButton(
            child: Text('Submit'),
            onPressed: () {},
            color: Colors.purpleAccent[100],
          ),
        ),
        appBar: AppBar(
            title:Text("My Bank Details"),
            backgroundColor: Colors.purpleAccent[100],
        ),
        body: Column(
          children:[Container(
                  child: Column(
                    children: list.map((e)=>Bank(e)).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Please enter your correct bank details carefully.They will"
                                "be used for all refunds,margins, and bonus payments"
                          ),
                      ),
          ]
        )

    );
  }
}
