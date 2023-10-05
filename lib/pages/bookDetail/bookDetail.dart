import 'package:courses/model/book.dart';
import 'package:courses/themes/app_color.dart';
import 'package:courses/utils/global.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
   final Book book;

  const BookDetail({required this.book});

  @override
  State<BookDetail> createState() => _BookDetailState(this.book);
}

class _BookDetailState extends State<BookDetail> {
  late final Book book;

  _BookDetailState(this.book);


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
       body:Stack(
         children: [
           Container(
             child: Hero(
               tag:book.title,
               child: Image.asset(book.image,fit:BoxFit.fitWidth),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(
               top:48,
                 left: 32
             ),
             child: GestureDetector(
               onTap: (){
                 G.router!.pop(context);
               },
               child: Align(
                 alignment: Alignment.topLeft,
                 child: Container(
                   width: 42,
                   height: 42,
                   decoration: BoxDecoration(
                     color: G.isDarkMode(context)?AppColor.accentColorDark:Colors.white,
                     shape: BoxShape.circle
                   ),
                   child: Center(
                     child: Icon(
                       Icons.arrow_back,
                       color:G.isDarkMode(context)?Colors.white:Colors.black,

                     ),

                   ),
                 ),
               ),
             ),

           ),
           
           Align(
             alignment: Alignment.bottomCenter,
             child: Container(
               height: size.height * 0.5,
               padding: EdgeInsets.only(
                 top: 64
               ),
               decoration: BoxDecoration(
                 color: G.isDarkMode(context)?AppColor.bodyColorDark:  Colors.grey[200],
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30)
                 )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Expanded(
                     child: Container(
                       padding: EdgeInsets.only(
                         right: 32,
                         left: 32
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Text(
                               book.title,
                             style: TextStyle(
                               fontSize: 28,
                               fontWeight: FontWeight.bold,
                               height: 1
                             ),

                           ),
                           SizedBox(
                             height: 8,
                           ),
                           Text(
                             book.author.fullname,
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 height: 1,
                               color: Colors.grey
                             ),

                           ),

                           Padding(
                             padding: EdgeInsets.symmetric(
                               vertical: 8
                             ),
                             child: Row(
                               children: [
                                 Row(
                                   children: [
                                     Icon(Icons.star,size: 20,color:Colors.amber ,),
                                     Icon(Icons.star,size: 20,color:Colors.amber ,),
                                     Icon(Icons.star,size: 20,color:Colors.amber ,),
                                     Icon(Icons.star,size: 20,color:Colors.amber ,),
                                     Icon(Icons.star_half,size: 20,color:Colors.amber ),
                                   ],
                                 ),
                                 SizedBox(
                                   width: 12,
                                 ),
                                 Text(
                                   book.score,
                                   style: TextStyle(
                                     fontSize: 18,
                                     color: Colors.grey,
                                     fontWeight: FontWeight.bold
                                   ),
                                 )
                               ],
                             ),

                           ),

                           Expanded(
                             child: SingleChildScrollView(
                               physics: BouncingScrollPhysics(),
                               child: Text(
                                 book.description,
                                 style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.grey
                                 ),
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                   ),

                   Container(
                     height: 100,
                     width: double.infinity,
                     padding: EdgeInsets.only(
                         top: 16,
                         left: 32,
                         right: 32,
                         bottom: 32
                     ),
                     decoration: BoxDecoration(
                       color:G.isDarkMode(context)?AppColor.accentColorDark: Colors.white,
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(30)
                       ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         Container(
                           width: size.width /2 -44,
                           decoration: BoxDecoration(
                             color:AppColor.bodyColorDark,
                             borderRadius: BorderRadius.all(
                               Radius.circular(15)
                             ),
                             boxShadow: [
                               BoxShadow(
                                 color: AppColor.accentColorDark.withOpacity(.4),
                                 spreadRadius: 2,
                                 blurRadius: 2,
                                 offset: Offset(0,0)
                               )
                             ]
                           ),
                           child: Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("阅读书籍",
                                 style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold
                                 ),
                                 ),
                                 SizedBox(
                                   width: 8,
                                 ),
                                 Icon(
                                     Icons.keyboard_arrow_right,
                                  color:Colors.white
                                 )
                               ],
                             ),
                           ),
                         ),
                         Container(
                           width: size.width /2 -44,
                           decoration: BoxDecoration(
                               color:AppColor.accentColor,
                               borderRadius: BorderRadius.all(
                                   Radius.circular(15)
                               ),
                               boxShadow: [
                                 BoxShadow(
                                     color: AppColor.accentColor.withOpacity(.4),
                                     spreadRadius: 2,
                                     blurRadius: 2,
                                     offset: Offset(0,0)
                                 )
                               ]
                           ),
                           child: Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("收藏书籍",
                                   style: TextStyle(
                                       fontSize: 18,
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 SizedBox(
                                   width: 8,
                                 ),
                                 Icon(
                                     Icons.favorite_border,
                                     color:Colors.black54
                                 )
                               ],
                             ),
                           ),
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
           ),
           Align(
             alignment: Alignment.bottomLeft,
             child:Padding(
               padding: EdgeInsets.only(
                 left: 32,
                 bottom: size.height * 0.5 - (75 /2)
               ),
               child:  Card(
                 elevation: 4,
                 margin: EdgeInsets.all(0),
                 clipBehavior: Clip.antiAlias,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(
                         Radius.circular(15)
                     )
                 ),
                 child: Container(
                   width: 75,
                   height: 75,
                   decoration: BoxDecoration(
                       image: DecorationImage(
                           image:AssetImage(book.author.image),
                           fit: BoxFit.cover
                       )
                   ),
                 ),
               ),
             ),
           )
         ],
       )
    );
  }
}
