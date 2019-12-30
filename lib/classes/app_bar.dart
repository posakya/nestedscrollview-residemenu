import 'package:flutter/material.dart';
import 'package:sarasmart/classes/brands.dart';
import 'package:sarasmart/classes/image_slider.dart';
import 'package:sarasmart/classes/residemenu.dart';
import '../classes/text_box.dart';
import '../classes/curve_box.dart';
import 'featured.dart';


class AppBarClass extends StatefulWidget {
  @override
  _AppBarClassState createState() => _AppBarClassState();
}

class _AppBarClassState extends State<AppBarClass>
    with TickerProviderStateMixin {
  MenuController _menuController;
  AnimationController _controller;

  Widget buildItem(String msg, Widget img) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: ResideMenuItem(
          title: msg,
          icon: img,
        ),
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(new SnackBar(content: new Text('Clicked : $msg')));
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResideMenu.scafford(
      direction: ScrollDirection.LEFT,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: new AssetImage("images/dari.jpg"),
            fit: BoxFit.cover),
      ),
      controller: _menuController,
      leftScaffold: new MenuScaffold(
        header: new ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
          child: new CircleAvatar(
            backgroundImage: new AssetImage('images/dari.jpg'),
            radius: 40.0,
          ),
        ),
        children: <Widget>[
          buildItem(
              "Home",
              Icon(
                Icons.home,
                color: Colors.white,
              )),
          buildItem("Cart", Icon(Icons.shopping_cart, color: Colors.white)),
          buildItem("Restaurant", Icon(Icons.restaurant, color: Colors.white)),
          buildItem("About Us", Icon(Icons.info, color: Colors.white)),
          buildItem("Share", Icon(Icons.share, color: Colors.white)),
          buildItem("Rate Us", Icon(Icons.star_border, color: Colors.white)),
          buildItem("LogOut", Icon(Icons.exit_to_app, color: Colors.white))
        ],
      ),
      child: new Scaffold(
          backgroundColor: Colors.white,
          body: 
          
          Stack(
            children: <Widget>[
              PreferredSize(
                  child: AppBar(
//                backgroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      // hides leading widget
                      flexibleSpace: CurveBox(),
                      actions: <Widget>[
//          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                      ],
                      leading: new GestureDetector(
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                                margin: EdgeInsets.all(10.0),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(60, 0, 0, 0),
                                          blurRadius: 5.0,
                                          offset: Offset(5.0, 5.0))
                                    ],
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage('images/dari.jpg'))))),
                        onTap: () {
                          _menuController.openMenu(true);
                        },
                      ),
                      title: TextBox()),
                  preferredSize: Size.fromHeight(200.0)),
      
      SingleChildScrollView(
        // children: <Widget>[
          
child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    ImageSlide(),
                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Brands Products",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.orange[700]),
                        )),
                        

        SizedBox(
          // width: double.infinity,
          height: 100,
            child: Brands()
        ),
                 Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Featured Products",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.orange[700]),
                        )),
       
                   SizedBox(
                     height: MediaQuery.of(context).size.height,
                    child:  Featured(),
                   ),

                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment(-1, 0),
                        child: Text(
                          "Exclusive Products",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.orange[700]),
                        )),
                         SizedBox(
                     height: MediaQuery.of(context).size.height,
                    child:  Featured(),
                   ),
                  ],
                ),
        // ],
          
      )
      
                
              // )


            ],
            overflow: Overflow.visible,

          ),

      ),
      onClose: () {},
      onOpen: (left) {},
      onOffsetChange: (offset) {},
    );
  }
}
