import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryChips extends StatefulWidget {
  CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  List CategoriesList = [
    ["cat 1", false],
    ["cat 2", true],
    ["cat 3", true],
    ["cat 4", false],
    ["cat 5", true],
    ["cat 6", false],
    ["cat 7", false],
    ["cat 8", false],
    ["cat 9", true],
  ];

  void updateCategoryList(String name) {
    print(name);
    for (final cat in CategoriesList) {
      if (cat[0] == name) {
        print(cat[1]);

        setState(() {
          cat[1] = !cat[1];
        });
        print(cat[1]);
        Get.appUpdate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', textAlign: TextAlign.start),
          Container(
            constraints: BoxConstraints(maxHeight: 40),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final cat in CategoriesList)
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(cat[0] ?? ""),
                      onSelected: (i) {
                        updateCategoryList(cat[0]);
                        cat[1] = !cat[1];
                      },
                      selected: cat[1],
                    ),
                  )
                // CategoryChip(cat[0], cat[1]),

                // CategoryChip("name1", true),
                // CategoryChip("name2", true),
                // CategoryChip("name3", false),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  String chipName;
  bool isSelected;
  CategoryChip(this.chipName, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        child: FilterChip(
          label: Text(chipName),
          onSelected: (i) {
            isSelected = !isSelected;
          },
          selected: isSelected,
        ));
  }
}
