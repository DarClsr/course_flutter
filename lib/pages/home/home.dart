import 'package:courses/model/book.dart';
import 'package:courses/routes/routes.dart';
import 'package:courses/themes/app_color.dart';
import 'package:courses/utils/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List adList = [];

  List<Filter> filters = getFilterList();
  List<Author> authors = getAuthorList();
  List<Book> books = getBookList();
  // List<Book> books = [];
  Filter? selctedFilter;

  getList() {
    G.api.ad.adList().then((value) {
      print(value);
      print('get list');
    });
  }

  get isDarkMode {
    var mode = Theme.of(context).brightness == Brightness.dark;
    return mode;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print(filters[0]);
      selctedFilter = filters[0];
    });
    // getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: isDarkMode ? AppColor.accentColorDark : Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode?Color(0xff161823).withOpacity(.05):Colors.grey.withOpacity(0.1),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "发现书籍",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildFilters(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: books.length>0?ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildBooks(),
                ):Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book,
                        size: 68,
                        color:isDarkMode?AppColor.accentColor:Colors.grey
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "empty book",
                        style: TextStyle(
                          fontSize: 18,
                            color:isDarkMode?AppColor.accentColor:Colors.grey
                        ),


                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color:isDarkMode? AppColor.accentColorDark:Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40)
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('作者',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyMedium?.color
                      ),
                      ),

                      Row(
                        children: [
                          Text("全部",
                           style:Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                              color: isDarkMode?Colors.white:Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),

              //   作者

                Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    bottom: 16
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: buildAuthors(),
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];


    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }

    return list.toList();
  }

  Widget buildFilter(Filter item) {
    print(selctedFilter);
    return GestureDetector(
      onTap: (){
        setState(() {
          selctedFilter=item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color: selctedFilter == item
                    ? (isDarkMode? AppColor.accentColor:AppColor.accentColorDark)
                    : Colors.transparent,
              ),
            ),
            Center(
              child: Text(
                item.name,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ],
        ),
      ),

    );
  }

  List<Widget> buildAuthors(){
    List<Widget> list = [];

    for (var i = 0; i < authors.length; i++) {
      list.add(buildAuthor(authors[i],i));
    }

    return list.toList();
  }

  Widget buildAuthor(Author item,int index){

    return Container(
      decoration: BoxDecoration(
        color:isDarkMode?Colors.black:Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        )
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(
        right: 16,
        left: index==0?16:0
      ),
      width: 255,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Container(
              width: 75,
                height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover
                )
              ),
            )
            ,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.fullname,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.library_books,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    item.books.toString()+ " books",
                    style: TextStyle(
                      fontSize: 14,
                      color:Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );

  }

  List<Widget> buildBooks(){
    List<Widget> list = [];

    for (var i = 0; i < books.length; i++) {
      list.add(buildBook(books[i],i));
    }

    return list.toList();
  }

  Widget buildBook(Book book,int index){

    return GestureDetector(
      onTap: (){
         G.router!.navigateTo(
             context,
             '/book_detail',
             routeSettings: RouteSettings(
               arguments: book
             )
         );
      },
      child:  Container(
        margin: EdgeInsets.only(
          right: 32,
          left: index==0?16:0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:isDarkMode?Color(0xff161823).withOpacity(.05) : Colors.grey.withOpacity(.5),
                          spreadRadius: 8,
                          blurRadius: 12,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                margin: EdgeInsets.only(
                    bottom: 16,
                    top: 24
                ),
                child: Hero(
                  tag:book.title,
                  child: Image.asset(
                    book.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Text(
              book.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              book.author.fullname,
              style: TextStyle(
                  fontSize: 14,
                  color:Colors.grey
              ),
            )
          ],
        ),
      ),
    );


  }


}
