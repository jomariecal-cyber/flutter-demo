import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;

  const MyButtons({
    super.key,
    required this.iconImagePath,
    required this.buttonText,
    
    });

  @override
  Widget build(BuildContext context) {
    return Column(
                   children: [
                      Container(                        
                        height: 90,
                        padding: EdgeInsets.all(18), 
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20,
                              spreadRadius: 2,
                            )                            
                          ]                   
                        ),

                        // icon
                        child: Center(
                          child: Image.asset(                                                             
                            iconImagePath, // the icon image
                          ),
                        ),                                                                    
                      ),
                      SizedBox(height: 10,),
                        //text under the icons
                        Text(buttonText, // the text button label
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]
                        ),
                        ) 
                    ],
                  );
  }

}