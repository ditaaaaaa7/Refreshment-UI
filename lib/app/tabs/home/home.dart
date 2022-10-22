import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:entertaiment/app/components/entertaiment_card.dart';

class Home extends StatelessWidget {
  final List<Map<String, String>> popularFood = [
    {
      'name': 'NEW KIDS REPACKAGE : THE NEW KIDS',
      'price': 'Rp. 600.000',
      'rate': '5.0',
      'clients': '300.000',
      'image': 'images/ok.png'
    },
    {
      'name': 'CROSS',
      'price': 'Rp. 500.000',
      'rate': '4.9',
      'clients': '100.000',
      'image': 'images/cross.jpeg'
    },
    {
      'name': 'NEWS KIDS : CONTINUE',
      'price': 'RP. 500.000',
      'rate': '4.9',
      'clients': '150.000',
      'image': 'images/new.jpg'
    },
    {
      'name': 'REMEMBER',
      'price': 'Rp. 600.000',
      'rate': '5.0',
      'clients': '200.000',
      'image': 'images/remember.jpg'
    },
    {
      'name': 'KILL THIS LOVE',
      'price': 'RP. 500.000',
      'rate': '4.9',
      'clients': '300.000',
      'image': 'images/kill.jpg'
    }
  ];

  final List<Map<String, String>> foodOptions = [
    {
      'name': 'BIGBANG',
      'image': 'images/big.jpg',
    },
    {
      'name': 'AKMU',
      'image': 'images/akmu.png',
    },
    {
      'name': 'WINNER',
      'image': 'images/winner.png',
    },
    {
      'name': 'iKON',
      'image': 'images/ikon.jpg',
    },
    {
      'name': 'BLACKPINK',
      'image': 'images/bp.png',
    },
    {
      'name': 'TREASURE',
      'image': 'images/treasure.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'images/yg.png',
                    width: 200,
                  ),
                  Icon(Icons.notifications_none, size: 28.0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                'ARTISTS',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
            Container(
              height: 105,
              margin: const EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  itemCount: this.foodOptions.length,
                  itemBuilder: (context, index) {
                    Map<String, String> option = this.foodOptions[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 110.0, left: 40.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 70,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  option['image'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.grey[200],
                                  offset: Offset(6.0, 6.0),
                                )
                              ],
                            ),
                          ),
                          Text(
                            option['name'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Text(
                'POPULAR PRODUCT',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            Container(
              height: 220.0,
              margin: const EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: this.popularFood.length,
                itemBuilder: (context, index) {
                  Map<String, String> product = this.popularFood[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'details',
                        arguments: {
                          'product': product,
                          'index': index,
                        },
                      );
                    },
                    child: Hero(
                      tag: 'detail_food$index',
                      child: FoodCard(
                        width: size.width / 2 - 30.0,
                        primaryColor: theme.primaryColor,
                        productName: product['name'],
                        productPrice: product['price'],
                        productUrl: product['image'],
                        productClients: product['clients'],
                        productRate: product['rate'],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 30.0,
              ),
              child: Text(
                'BEST SELLER',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Map<String, String> localProduct = {
                  'name': 'THE ALBUM',
                  'price': 'Rp. 600.000',
                  'rate': '5.0',
                  'clients': '500.000',
                  'image': 'images/album.jpg'
                };
                Navigator.pushNamed(context, 'details', arguments: {
                  'product': localProduct,
                  'index': this.popularFood.length
                });
              },
              child: Hero(
                tag: 'detail_food${this.popularFood.length}',
                child: Container(
                  width: size.width - 40,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 15.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: size.width - 40,
                            width: size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage('images/album.jpg'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 25.0,
                                color: theme.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 4.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'THE ALBUM',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 4.0,
                                      offset: Offset(3.0, 3.0),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '5.0 \(500.000\)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              'Rp. 600.000',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
