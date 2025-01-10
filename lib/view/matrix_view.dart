import 'package:flutter/material.dart';
import 'package:pair_match/utils/index.dart';
import 'package:pair_match/view/index.dart';

class MatrixView extends StatelessWidget {
  const MatrixView({
    super.key,
    required this.listPath,
    required this.onUpdateCard,
    required this.initialPath,
  });

  final List<String> listPath;
  final Function(int, String) onUpdateCard;
  final String initialPath;

  bool isDefault(String path) {
    return path == AssetsPath.normalMode || path == AssetsPath.specialMode;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 5,
        ),
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              final path = await SelectCardDialog.show(context, initialPath);
              if (path != null) {
                onUpdateCard(index, path);
              }
            },
            child: HoverCard(path: listPath[index]),
          );
        },
      ),
    );
  }
}
