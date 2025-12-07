import 'package:flutter/material.dart';

class MyListTiles extends StatelessWidget {
  // declare variables to enable changing components per tile
  final String iconImagePath;
  final String Tile_title;
  final String Tile_SubTitle;

  //Use now and mae a construct for the parameters and arguments
  const MyListTiles (
    {Key? key,
    required this.iconImagePath,
    required this.Tile_title,
    required this.Tile_SubTitle
    }
    ) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // icon
                        Row(
                          children: [
                            Container(
                              height: 80,
                              padding:EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                                ),
                              child: Image.asset(iconImagePath),
                            ),
                            
                            SizedBox(width: 20.0,),
                            
                            //text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Tile_title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey[800]
                                ),
                                ),
                                SizedBox(height: 10,),
                                Text(Tile_SubTitle)
                              ],
                            ),
                          ],
                        ),

                        // SizedBox(width: 70,),
                        // icon
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    );
  }

  
}