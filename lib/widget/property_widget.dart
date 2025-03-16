import 'package:flutter/material.dart';
import 'package:property_app/style/colors/app_colors.dart';
import 'package:property_app/widget/botton_cus.dart';

import '../view/property_home_screen.dart';

class PropertyWidget extends AppColors {
  final String _imageGoole =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png';
  final String _facebook =
      'https://www.wavetransit.com/wp-content/uploads/2021/08/Facebook-logo.png';
  final String _apple =
      'https://www.tailorbrands.com/wp-content/uploads/2021/01/apple_logo_1988.jpg';
  Widget authPropertHomeWidget({required BuildContext context}) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/1a/70/c0/1a70c0f312eb47d54fe62dc7e49a3c89.jpg'),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover your',
                          style: TextStyle(
                              color: white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dream Home',
                          style: TextStyle(
                              color: white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        authBottonBody(context: context)
      ],
    );
  }

  Widget authBottonBody({required BuildContext context}) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          //spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottonCustom(
                    backgrouncolor: black,
                    textColor: white,
                    title: 'Log In',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyHomeScreen(),
                          ));
                    },
                    context: context),
                bottonCustom(
                  title: 'Sign Up',
                  context: context,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => FilterScreen(),
                    //     ));
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: background,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                Text('or Login with'),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: background,
                  ),
                ),
              ],
            ),
            loginWithSocialBotton(
                imageUrl: _imageGoole, title: 'Google', context: context),
            loginWithSocialBotton(
                imageUrl: _apple, title: 'Apple', context: context),
            loginWithSocialBotton(
                imageUrl: _facebook, title: 'Facebook', context: context),
          ],
        ),
      ),
    );
  }
}
