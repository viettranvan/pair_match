import 'package:flutter/material.dart';
import 'package:pair_match/utils/assets_path.dart';

import 'index.dart';

List<String> _listCard = [
  AssetsPath.common,
  AssetsPath.tsu,
  AssetsPath.cat,
  AssetsPath.king,
  AssetsPath.wasson,
  AssetsPath.yang,
  AssetsPath.meta,
  AssetsPath.wolf,
  AssetsPath.worm,
  AssetsPath.robot,
  AssetsPath.monster,
  AssetsPath.plus1,
  AssetsPath.plus2,
  AssetsPath.special,
  AssetsPath.purple,
  AssetsPath.blue,
  AssetsPath.green,
  AssetsPath.yellow,
];

class SelectCardDialog {
  static Future<String?> show(BuildContext context, String initalPath) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 220,
            width: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 7,
              ),
              itemCount: _listCard.length + 1,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context,
                        index == 0 ? initalPath : _listCard[index - 1]);
                  },
                  child: HoverCard(
                      path: index == 0 ? initalPath : _listCard[index - 1]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
