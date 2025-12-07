import 'package:flutter/material.dart';

class MyCards extends StatelessWidget{
  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;


  // make a constructor
  const MyCards({
    Key? key,
    required this.balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this. color, 

   } 
  ) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
                  padding: EdgeInsets.all(20),
                  width: 365,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(17)
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 15,),
                          Image.asset(
                            'lib/components/icons/visa.png',
                            height: 25,
                          ),
                            
                        ],
                      ),
                      
                     // SizedBox(height: 5),                    
                      
                      Row(
                        children: [
                          Text(
                            '   Php ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,                            
                            ),
                          ),
                          Text(
                        balance.toString(), // money field
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                        ],
                      ),
                      
        
                   SizedBox(height: 50,),
        
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        // the crad number
                        Text(cardNumber.toString(), // cardNumber field,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        // card expiry date
                        Text('Expire: $expiryMonth / $expiryYear',
                        style: TextStyle(
                          color: Colors.white
                         ),
                        )
                      ],)
                  ],
                  ),
                ),
      );
    }
}