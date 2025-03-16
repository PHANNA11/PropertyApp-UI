import 'package:flutter/material.dart';
import 'package:property_app/style/colors/app_colors.dart';
import 'package:property_app/view/filter_screen.dart';
import 'package:property_app/widget/property_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categorys = ['Real Estate', 'Apartment', 'House', 'Motels'];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 28,
                          ),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterScreen(),
                        ));
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
                      child: Icon(Icons.filter_list_outlined),
                    ),
                  ),
                )
              ],
            ),
            listTapCategory(
              context: context,
              categorys: categorys,
            ),
            listHomeImage(images: [
              'https://images.ctfassets.net/n2ifzifcqscw/OSTi1cHly2G3ss817Ub0N/064ff717582bafa0f9cc61d8a124fcf4/Rockcrest_a11__1_.jpg',
              'https://dreamhouseinteriors.in/assets/img/about.jpg',
              'https://i.pinimg.com/736x/e5/67/90/e56790efc7348ef81a593e385ca5155e.jpg'
            ]),
            priceWidget(),
            displayImageGridViewByWrap()
          ],
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

  Widget listHomeImage({required List<String> images}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          images.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
                fit: BoxFit.cover,
                height: 280,
                width: 380,
                image: NetworkImage(images[index])),
          ),
        ),
      ),
    );
  }

  Widget priceWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$440,000',
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors().black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '\$420',
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors().black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '123 Main St, Tulsa, OK 74136',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors().background,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '101 Willow',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors().background,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }

  Widget displayImageGridViewByWrap() {
    final size = MediaQuery.of(context).size;
    return Wrap(
        children: List.generate(
      7,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 220,
          width: (size.width / 2.1) - 12,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://dreamhouseinteriors.in/assets/img/about.jpg'),
            ),
          ),
          child: Center(
            child: Text(
              'New Project',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors().black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ));
  }
}
