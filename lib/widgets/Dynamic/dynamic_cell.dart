import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DynamicCell extends StatelessWidget {
  const DynamicCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            // 阴影
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 头像和昵称，横向排列
                  _avatarAndName(),
                  // 日期
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      '2021-08-01',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // 仓库名
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'tygithub/tygithub',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _avatarAndName() {
    return Row(
      children: [
        // 头像
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://avatars.githubusercontent.com/u/16873751?v=4'),
            ),
          ),
        ),
        // 昵称
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            'tygithub',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
