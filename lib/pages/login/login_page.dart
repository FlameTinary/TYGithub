import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tygithub/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 账号输入控制器
  final TextEditingController accountController = TextEditingController();
  //密码输入控制器
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        // 对齐方式
        alignment: Alignment.center,
        // 装饰器
        decoration: const BoxDecoration(
          // 背景颜色
          color: Colors.red,
        ),
        child: Container(
          alignment: Alignment.center,
          // 装饰器
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          // 限制最大宽高
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 200,
          ),
          // 内边距
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) => authProvider.isLoggedIn
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You are logged in!'),
                        ElevatedButton(
                          onPressed: () async {
                            await authProvider.logout();
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        await authProvider.login(context);
                      },
                      child: const Text('Login with GitHub'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
