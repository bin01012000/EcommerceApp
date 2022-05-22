import 'package:flutter/material.dart';
import 'package:fruit_app/screens/home/components/section_title.dart';
import '../../../size_config.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> special = [
      {
        "img": "assets/images/Image Banner 2.png",
        "title": "Smartphone",
        "desc": "18 Brands"
      },
      {
        "img": "assets/images/Image Banner 3.png",
        "title": "Fashion",
        "desc": "24 Brands"
      },
    ];
    return Column(
      children: [
        SectionTitle(
          title: "Special for you",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                special.length,
                (index) => SpecialOfferCard(
                  img: special[index]['img'],
                  title: special[index]['title'],
                  desc: special[index]['desc'],
                  press: () {},
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String img, title, desc;
  final GestureTapCallback press;
  const SpecialOfferCard({
    Key? key,
    required this.img,
    required this.desc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xff343434).withOpacity(0.4),
                        const Color(0xff343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: desc),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
