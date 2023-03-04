import 'package:didit/componets/colors.dart';
import 'package:didit/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../componets/primarybutton.dart';
import '../componets/textStyles.dart';

class SelectAvatar extends StatefulWidget {
  const SelectAvatar({super.key});

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  String avatar = "images/avatar0.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DiditColors.fullBlack,
      appBar: AppBar(
        backgroundColor: DiditColors.fullBlack,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Kwesi",
              style: DiditTextStyles.bodyStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 18),
              child: Text(
                "Now select an avatar",
                style: DiditTextStyles.bodyStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              child: RawScrollbar(
                radius: const Radius.circular(4),
                thumbColor: Colors.white,
                thickness: 8,
                interactive: true,
                scrollbarOrientation: ScrollbarOrientation.right,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: 31,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                avatar = "images/avatar$index.svg";
                              });
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: DiditColors.fullWhite.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: avatar == "images/avatar$index.svg"
                                          ? DiditColors.accentBlue
                                          : Colors.transparent,
                                      width: 5)),
                              child: SvgPicture.asset(
                                "images/avatar$index.svg",
                                height: 55,
                                width: 55,
                                color: DiditColors.fullBlack,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: PrimaryButton(
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomePage())));
              },
              title: "Continue",
            ),
          ),
        ),
      ),
    );
  }
}
