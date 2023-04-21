import 'package:flutter/material.dart';

class TabItem {
  String? title;
  Icon? icon;
  TabItem(this.icon, this.title);
}

final List<TabItem> _tabBar = [
  TabItem(const Icon(Icons.home), 'Home'),
  TabItem(const Icon(Icons.chat), 'Chat'),
  TabItem(const Icon(Icons.album), 'Album')
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.person_3_outlined));
          })
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text('1'),
          ),
          Center(
            child: Text('2'),
          ),
          Center(
            child: Text('3'),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                DrawerHeader(
                    child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/avatar.jpg',
                    height: 100,
                  ),
                )),
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  trailing: Icon(Icons.arrow_forward),
                ),
                const ListTile(
                  leading: Icon(Icons.person_rounded),
                  title: Text('Profile'),
                  trailing: Icon(Icons.arrow_forward),
                ),
                const ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Images'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Выход')),
                  TextButton(
                      onPressed: () {}, child: const Text('Регистрация')),
                ],
              ))
        ]),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                 backgroundColor: Colors.white,
                child: Image.asset('assets/images/avatar.jpg'),
              ),
              const Text('Username')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                      child: Column(children: [
                    const ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Сумма'),
                      trailing: Text('200 руб.'),
                    ),
                    ElevatedButton(
                      child: const Text('Оплатить'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ])),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Photo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.album_rounded),
              label: 'Album',
            ),
          ],
        ),
      ),
    );
  }
}
