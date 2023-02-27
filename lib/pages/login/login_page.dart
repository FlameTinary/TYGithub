import 'package:flutter/material.dart';
import 'package:tygithub/widgets/ty_input_widget.dart';
import 'package:tygithub/common/ty_webview.dart';

class LoginPage extends StatefulWidget {
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
            child: Column(
              children: [
                // 账号输入框
                TYInputWidget(
                  controller: accountController,
                  hintText: "account",
                  icon: Icons.login,
                  obscureText: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                // 密码输入框
                TYInputWidget(
                  controller: passwordController,
                  hintText: "password",
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                Row(
                  children: [
                    // 登录按钮
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            print(accountController.text);
                            print(passwordController.text);
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                    // 忘记密码按钮
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            print(accountController.text);
                            print(passwordController.text);
                            Navigator.pushNamed(context, 'webview');
                          },
                          child: const Text('Forget Password'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
