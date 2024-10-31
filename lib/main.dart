import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ЧЕ ЗЫРИШЬ'),
        backgroundColor: Colors.green[600],
      ),
      body: const App(),
      drawer: const MyDrawer(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBarDrug(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader (
              decoration: const BoxDecoration(color: Colors.green),
              accountName: const Text('Кися'),
              accountEmail: const Text("home@dartflutter.ru"),
              currentAccountPicture: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image : DecorationImage(
                        image: AssetImage('assets/images/avataaar.jpg'),
                        fit: BoxFit.fill,
                    )
                  )
              ),
            ),
          ),
          ListTile(
              title: const Text("О себе"),
              leading: const Icon(Icons.account_box),
              onTap: (){}
          ),
          ListTile(
              title: const Text("Настройки"),
              leading: const Icon(Icons.settings),
              onTap: (){}
          )
        ],
      ),
    );
  }
}


class SearchBarDrug extends StatefulWidget {
  const SearchBarDrug({super.key});

  @override
  State<SearchBarDrug> createState() => _SearchBarDrugState();
}

class _SearchBarDrugState extends State<SearchBarDrug> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
              },
            onChanged: (_) {
              controller.openView();
              },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: isDark,
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                    });
                    },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              )
            ],
          );
          }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
                },
            );
          });
    });
  }
}

