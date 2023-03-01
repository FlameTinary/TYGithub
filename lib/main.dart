import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tygithub/pages/login/login_page.dart';
import 'package:tygithub/providers/auth_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tygithub/pages/dynamic/dynamic_page.dart';
import 'package:tygithub/pages/trend/trend_page.dart';
import 'package:tygithub/pages/mine/mine_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Map.fromEntries([
          // 登录页面
          MapEntry('/login', (context) => LoginPage()),
          MapEntry('/', (context) => const MyHomePage(title: 'Github')),
        ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;

  late var _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const DynamicPage(),
      const TrendPage(),
      const MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '动态',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '趋势',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '我的',
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
