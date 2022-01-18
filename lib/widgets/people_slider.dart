import 'package:flutter/material.dart';
import 'package:flutter_banking_app/json/user_list.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';

class PeopleSlider extends StatefulWidget {
  const PeopleSlider({Key? key}) : super(key: key);

  @override
  _PeopleSliderState createState() => _PeopleSliderState();
}

class _PeopleSliderState extends State<PeopleSlider> {
  var controller = ScrollController();
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Layouts.getTheme(context);
    final size = Layouts.getSize(context);
    controller.addListener(() {
      setState(() {
        //currentPage = controller.page!.round();
      });
    });
    return _body(size.height, theme);
  }

  _body(double height, ThemeData theme) {
    double _height = height * 0.19;
    return SizedBox(
      height: _height,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final item = userList[index];
          return InkWell(
            onTap: () {
              setState(() {
                currentPage = index;
              });
              print(controller.offset);
              controller.animateTo(470,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.elasticOut);
              //controller.animateToPage(index, duration: Duration(milliseconds: 700), curve: Curves.elasticOut);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: (index == currentPage) ? 100 : 65,
                  width: (index == currentPage) ? 100 : 65,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item['color'],
                  ),
                  child: Transform.scale(
                      scale: 0.55, child: Image.asset(item['avatar'])),
                ),
                const SizedBox(height: 8),
                (index == currentPage)
                    ? Text(item['name'],
                        style: TextStyle(color: Repository.textColor(context), fontSize: 16, fontWeight: FontWeight.w500))
                    : const Text('')
              ],
            ),
          );
        },
      ),
    );
  }

  /*_indicators(theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(userList.length, (int index) {
          return InkWell(
            onTap: () {
              controller.animateToPage(index, duration: Duration(milliseconds: 700), curve: Curves.elasticOut);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: (index == currentPage) ? 60 : 40,
              width: (index == currentPage) ? 50 : 40,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: (index == currentPage) ? Styles.yellowColor:Colors.grey
              ),
            ),
          );
        }),
      ),
    );
  }*/
}
