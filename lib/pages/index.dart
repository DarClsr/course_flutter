import 'package:courses/pages/home/home.dart';
import 'package:courses/pages/mine/mine.dart';
import 'package:courses/pages/study/study.dart';
import 'package:courses/provider/currentIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // final List<BottomNavigationBarItem> navs = [
  //   BottomNavigationBarItem(
  //       icon: Icon(Icons.home), backgroundColor: Colors.purple, label: "首页"),
  //   BottomNavigationBarItem(
  //       icon: Icon(Icons.star_outline),
  //       backgroundColor: Colors.green,
  //       label: "学习"),
  //   BottomNavigationBarItem(
  //       icon: Icon(Icons.supervised_user_circle),
  //       backgroundColor: Colors.green,
  //       label: "我的")
  // ];
  final List pages = [
    {
      "appBar":AppBar(
        title: Text("首页"),
        centerTitle: true,
        elevation: 0,
      ),
      "page":HomePage()
    },
    {
      "appBar":AppBar(
        title: Text("学习"),
        centerTitle: true,
        elevation: 0,
      ),
      "page":StudyPage()
    },
    {
      "appBar":AppBar(
        title: Text("我的"),
        centerTitle: true,
        elevation: 0,
      ),
      "page":MinePage()
    },
  ];

  // late int current;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int current=Provider.of<CurrentIndexProvider>(context,listen: false).current;
    return Scaffold(
      appBar: pages[current]['appBar'] ,
      body: pages[current]['page'],
      // bottomNavigationBar: BottomNavigationBar(
      //   items: navs,
      //   currentIndex: current,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {
      //     changePage(index);
      //   },
      // ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: Offset(0, 25),
              )
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0,vertical: 3),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              tabBorderRadius: 15,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: '首页',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: '学习',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: '我的',
                ),
              ],
              selectedIndex: current,
              onTabChange: (index) {
                setState(() {
                  // current = index;
                   Provider.of<CurrentIndexProvider>(context,listen: false).changeCurrent(index);
                });
              },
            ),
          )
        ),
      )
    );
  }

  // void changePage(int index) {
  //   if (index != current) {
  //     setState(() {
  //       current = index;
  //     });
  //   }
  // }
}
