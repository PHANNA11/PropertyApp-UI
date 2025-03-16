import 'package:flutter/material.dart';
import 'package:property_app/style/colors/app_colors.dart';
import 'package:property_app/widget/botton_cus.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double valueRange = 1000;
  List<String> categorys = ['Real Estate', 'Apartment', 'House', 'Motels'];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors().black54,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Filter Property',
                          style:
                              TextStyle(fontSize: 18, color: AppColors().black),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => FilterScreen(),
                    //     ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors().black54,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.refresh),
                    ),
                  ),
                )
              ],
            ),
            TabBar(tabs: [
              Tab(
                text: 'For rent',
              ),
              Tab(
                text: 'For Sale',
              )
            ]),
            Text(
              'Price Range',
              style: TextStyle(fontSize: 18, color: AppColors().black),
            ),
            Slider(
              max: 5000,
              min: 1000,
              value: valueRange,
              onChanged: (value) {
                setState(() {
                  valueRange = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$1k',
                  style: TextStyle(fontSize: 18, color: AppColors().black),
                ),
                Text(
                  '\$5k',
                  style: TextStyle(fontSize: 18, color: AppColors().black),
                ),
              ],
            ),
            Divider(),
            Text(
              'House Type',
              style: TextStyle(fontSize: 18, color: AppColors().black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listTapCategory(categorys: categorys, context: context),
            ),
            Divider(),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rooms',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors().black,
                          fontWeight: FontWeight.bold),
                    ),
                    listTypeRooms(
                        categorys: ['1', '2', '3', '4+'], context: context)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bathrooms',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors().black,
                          fontWeight: FontWeight.bold),
                    ),
                    listTypeRooms(
                        categorys: ['1', '2', '3', '4+'], context: context)
                  ],
                ),
              )
            ]),
            Divider(),
            Text(
              'Select Option',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors().black,
                  fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text('Garange'),
              value: true,
              groupValue: 'groupValue',
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Garange'),
              value: true,
              groupValue: 'groupValue',
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Garange'),
              value: true,
              groupValue: 'groupValue',
              onChanged: (value) {},
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 14, right: 14, top: 10),
          child: bottonCustom(
              context: context,
              backgrouncolor: Colors.black,
              textColor: AppColors().white,
              title: 'Save Filter'),
        ),
      ),
    );
  }

  Widget listTapCategory({
    required List<String> categorys,
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categorys.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
              print(selectIndex);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectIndex == index
                      ? AppColors().black
                      : AppColors().white,
                  border: Border.all(color: AppColors().background),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Center(
                    child: Text(
                      categorys[index],
                      style: TextStyle(
                          fontSize: 18,
                          color: selectIndex != index
                              ? AppColors().black
                              : AppColors().white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listTypeRooms({
    required List<String> categorys,
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categorys.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
              print(selectIndex);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectIndex == index
                      ? AppColors().black
                      : AppColors().white,
                  border: Border.all(color: AppColors().background),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Center(
                    child: Text(
                      categorys[index],
                      style: TextStyle(
                          fontSize: 14,
                          color: selectIndex != index
                              ? AppColors().black
                              : AppColors().white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
