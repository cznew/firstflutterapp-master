import 'package:firstflutterapp/purchase_history.dart';
import 'package:firstflutterapp/settings.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int selectedindex = 0;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
    } else {}
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              tooltip: "add an Item!",
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
            appBar: AppBar(
              title: const Text("My app"),
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    }),
                IconButton(
                    icon: const Icon(Icons.notifications), onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('Most recent'),
                ),
                Tab(
                  child: Text('Most wanted'),
                )
              ]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: ((index) {
                setState(() {
                  selectedindex = index;
                });
              }),
              items: const [
                BottomNavigationBarItem(
                    label: "Buy", icon: Icon(Icons.shopping_basket)),
                BottomNavigationBarItem(
                    label: "sell", icon: Icon(Icons.attach_money))
              ],
            ),
            drawerScrimColor: Colors.white.withOpacity(0.5),
            drawer: Drawer(
              child: Column(
                children: [
                  const UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text("GE"),
                      ),
                      accountName: Text("Gerges Elhamy"),
                      accountEmail: Text("gerges@myapp.com")),
                  ListTile(
                    title: const Text("Purchase history"),
                    leading: const Icon(Icons.history),
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PurchaseHistory()));
                    }),
                  ),
                  ListTile(
                    title: const Text("Settings"),
                    leading: const Icon(Icons.settings),
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                    }),
                  ),
                  ListTile(
                    title: const Text("Contact us"),
                    leading: const Icon(Icons.call),
                    onTap: (() {}),
                  ),
                  ListTile(
                    title: const Text("About"),
                    leading: const Icon(Icons.info),
                    onTap: (() {}),
                  ),
                  ListTile(
                    title: const Text("Log out"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: (() {}),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView(
                    children: [
                      Image.asset(
                        'images/steam.jpeg',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'images/u1.jpeg',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'images/volu.jpeg',
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formstate,
                    child: TextFormField(
                      validator: (text) {
                        if (text!.length < 3) {
                          return "Please use more than 3 letters";
                        }
                        return null;
                      },
                      maxLength: 60,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                        ),
                        labelText: "Search",
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: send,
                    child: const Text(
                      "Search",
                    ))
              ],
            )));
  }
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("data");
  }
}
