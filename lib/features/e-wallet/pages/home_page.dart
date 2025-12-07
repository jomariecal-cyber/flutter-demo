import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utilities/my_buttons.dart';
import '../utilities/my_cards.dart';
import '../utilities/my_list_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage> {
    // page controller setup
    final _controller = PageController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, //Button allignment
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           // 
          },
          backgroundColor: Colors.purple.shade400,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white,),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: 
              BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            )
          ),
          // padding: EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, 
                icon: Icon(
                  Icons.home,
                  size: 40
                  )
                ),
            
                IconButton(onPressed: (){}, 
                icon:Icon(
                  Icons.settings,
                  size: 40
                  )
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,), //Space between status bar and appbar
              // Appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(               
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [                   
                    Row(            
                      children: [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            ),           
                          ),
                          Text(
                          ' Cards',
                          style: TextStyle(fontSize: 26),
                          ),
                      ],
                    ),

                      Container(
                        padding: EdgeInsets.all(8),
                        // plus button
                        decoration: BoxDecoration(color: Colors.grey[400],
                        shape: BoxShape.circle
                        ),                       
                        child: Icon(Icons.add),
                      )

                  ],
                ),
              ),
              
              SizedBox(height: 25),

              // cards
              //MyCards(),
              Container(
                height: 180,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller, // add the page controller here inside the page view
                  children: [
                    MyCards(
                      balance: 5000.00,
                      cardNumber: 0064526955463,
                      expiryMonth: 09,
                      expiryYear: 2028,
                      color: Colors.lightBlue[300],
                    ),
                    MyCards(
                      balance: 7250.00,
                      cardNumber: 4246145719437,
                      expiryMonth: 08,
                      expiryYear: 2030,
                      color: Colors.green,
                    ),
                    MyCards(
                      balance: 8492.25,
                      cardNumber: 4757891322567,
                      expiryMonth: 12,
                      expiryYear: 2035,
                      color: Colors.deepOrange,
                    )
                  ],
                ),
              ),
              
              SizedBox(height: 20,),
              // place the page indicator
              SmoothPageIndicator(controller: _controller,
                count: 3, 
                effect: JumpingDotEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  jumpScale: 2,
                  activeDotColor: Colors.black87
                ),
              ),

              SizedBox(height: 25,),

              // 3 buttons -> send + pay + bills
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row( //mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButtons(iconImagePath: 'lib/components/icons/send-money.png', buttonText: 'Send'),
                    MyButtons(iconImagePath: 'lib/components/icons/bills.png', buttonText: 'Bills'),
                    MyButtons(iconImagePath: 'lib/components/icons/credit_cards.png', buttonText: 'Pay'),
                  ],
                ),
              ),
              
              SizedBox(height: 25),
              // column -> stats + transactions 
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // tiles
                     MyListTiles(
                        iconImagePath: 'lib/components/icons/stats.png',
                        Tile_title: 'Statistics',
                        Tile_SubTitle: 'Payments and Income',
                      ),
                      SizedBox(height: 15,),
                      MyListTiles(
                        iconImagePath: 'lib/components/icons/transaction.png',
                        Tile_title: 'Transactions',
                        Tile_SubTitle: 'Your previous transactions',
                      ),
                      //SizedBox(height: 10,),
                      // MyListTiles(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

}