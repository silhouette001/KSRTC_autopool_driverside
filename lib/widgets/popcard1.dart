import 'package:flutter/material.dart';

class PopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(top: 450),
      constraints: BoxConstraints.expand(height: mediaQuery.size.height - 450),
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            new BoxShadow(color: Colors.grey[50], blurRadius: 2.0),
          ]),
      child: Container(
        
        margin: EdgeInsets.only(top:20,bottom:20),
        child: ListView(children: [
          Row(
            children: [
              SizedBox(
                height: 10,
                width: 25,
              ),
              Text("Pick ups"),
            ],
          ),
          SizedBox(
            height: 10,
            width: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            constraints:
                BoxConstraints(maxHeight: 150, maxWidth: 40, minHeight: 120),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    
                    children: [
                      Text("Near Mudavoor Paara,Balaramapuram"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_disabled),
                          Text("1.7km"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.lock_clock),
                          Text("13min"),
                        ],
                      ),
                      Text("56/-"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            constraints:
                BoxConstraints(maxHeight: 150, maxWidth: 40, minHeight: 120),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: Text("Hello"),
            ),
          ),
          SizedBox(
            height: 20,
            width: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(" My Savings"), Text("1200/-")],
          ),
          SizedBox(
            height: 20,
            width: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(" Rides"), Text("")],
          )
        ]),
      ),
    );
  }
}
