import 'package:flutter/material.dart';

class TYInputWidget extends StatefulWidget {
  const TYInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  @override
  State<TYInputWidget> createState() => _TYInputWidgetState();
}

class _TYInputWidgetState extends State<TYInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 对齐方式
      alignment: Alignment.center,
      // 装饰器
      decoration: const BoxDecoration(
        // 背景颜色
        color: Colors.white,
        // 边框
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: TextField(
        // 输入文本的样式
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        // 控制器
        controller: widget.controller,
        // 是否隐藏正在编辑的文本
        obscureText: widget.obscureText,
        // 输入文本的样式
        decoration: InputDecoration(
          // 输入文本的边距
          contentPadding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
          // 未获得焦点下划线设为透明
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          // 获得焦点下划线设为透明
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          // 输入文本的提示文本
          hintText: widget.hintText,
          // 输入文本的提示文本样式
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          // 输入文本的前缀图标
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
