import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TrendCell extends StatelessWidget {
  const TrendCell({super.key});

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
            // 头像、昵称、日期
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 头像和昵称，横向排列
                Row(
                  children: [
                    // 头像
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/14831261?v=4'),
                        ),
                      ),
                    ),
                    // 昵称和仓库名，纵向排列
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        // 仓库名
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'tygithub/tygithub',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
            // 仓库描述
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
            const SizedBox(
              height: 10,
            ),
            // 点赞、评论、分享
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 点赞
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Text(
                        '100',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                // 分享
                Row(
                  children: [
                    const Icon(
                      Icons.share,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Text(
                        '100',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                // star
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Text(
                        '100',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
