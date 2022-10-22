import 'package:flutter/material.dart';
import 'package:entertaiment/app/components/entertaiment_card.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with TickerProviderStateMixin {
  TabController _tabController;
  bool switchValue = true;
  final List<Map<String, String>> favoriteFoods = [
    {
      'name': 'CROSS',
      'price': 'Rp. 500.000',
      'rate': '4.9',
      'clients': '100.000',
      'image': 'images/cross.jpeg'
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

  @override
  void initState() {
    this._tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Profile',
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              bottom: 15.0,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 35.0,
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'Dita Amany',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Icon(
                    Icons.location_on,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Bogor, Indonesia',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '250K',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      'Follower',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '500',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '540',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      'Taste Master',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: this._tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: theme.primaryColor,
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(text: 'Your Favorite'),
                Tab(text: 'Account Setting'),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: this._tabController,
            children: <Widget>[
              Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: ((size.width / 2) / 230),
                  children: this.favoriteFoods.map((product) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: FoodCard(
                        width: size.width,
                        primaryColor: theme.primaryColor,
                        productName: product['name'],
                        productPrice: product['price'],
                        productUrl: product['image'],
                        productClients: product['clients'],
                        productRate: product['rate'],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Location',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Shipping',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Payment',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Location Tracking',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Switch(
                            onChanged: (bool value) {
                              setState(() {
                                this.switchValue = value;
                              });
                            },
                            value: this.switchValue,
                            activeColor: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 65.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
