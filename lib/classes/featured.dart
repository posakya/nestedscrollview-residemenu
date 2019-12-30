import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../json_model/ezvzjson.dart';
import 'package:url_launcher/url_launcher.dart';

class Featured extends StatefulWidget {
  


//  FirstPage.name(this.filter);

  @override
  _FeaturedState createState() => _FeaturedState();

//  FirstPage();
}

class _FeaturedState extends State<Featured> {
double _crossAxisSpacing = 8, _mainAxisSpacing = 12, _aspectRatio = 2;
int _crossAxisCount = 2;
  List<Datum> widgets = [];
  List<String> items = [];
  String filter;

  @override
  Widget build(BuildContext context) {
    
    return getFirstView();
  }

  Widget getRow(int position) {
    return 
    GestureDetector(
      onTap: (){
        print("clicked $position");
        _launchURL('${widgets[position].phone}');
        _showDialog('${widgets[position].name}');
      },
child : Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
        children: <Widget>[
        
        Card(
           shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(5.0)),
          clipBehavior: Clip.antiAlias,
          elevation: 3.0,
          child: AspectRatio(
        
        aspectRatio: 0.69,
      

        child: FadeInImage.assetNetwork(
                 image: '${widgets[position].image}',
    placeholder:"images/dari.jpg",
    fit: BoxFit.contain,
              ),
                // image: DecorationImage(
                    
                //     fit: BoxFit.scaleDown,
                  
                //     image: NetworkImage('${widgets[position].image}')
                //     )
                //     )
                    // )
                    )
                    ,),
                    Center(
                      child : Container(
                        margin: EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: FittedBox(
                      fit: BoxFit.cover,
                      child : Text('${widgets[position].name}',),
                    )
                      )
                      
                    ),
                     Center(child: FittedBox(
                      fit: BoxFit.fill,
                      child : Text('${widgets[position].phone}',),
                    )
                    ),
                   
              
            
    ],
    ),
    )
    );
    
    


           
    
  }

  Widget getImage(int i) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(60, 0, 0, 0),
                      blurRadius: 3.0,
                      offset: Offset(3.0, 3.0))
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${widgets[i].image}')))));
  }

  _fetchListItem() async {
    String dataURL = "https://ezvz.ofoodesk.com/public/api/getSearchData/a";
    http.Response response = await http.get(dataURL);
    widgets.clear();
    items.clear();
    for (Datum datum in jsonParseFromJson(response.body).data) {
      widgets.add(datum);
      items.add(datum.name);
    }

    return widgets;
  }

  Widget getFirstView(){
     double screenWidth = MediaQuery.of(context).size.width;
double cardWidth = MediaQuery.of(context).size.width / 3;
// double cardHeight = MediaQuery.of(context).size.height / ;
  var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
  var height = width / _aspectRatio;
    return Container(
        child : FutureBuilder(
            future: _fetchListItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  padding: EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: widgets.length,
                         gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        // mainAxisSpacing: 5.0,
         childAspectRatio: 0.55,
                           ),
                         
                        itemBuilder: (BuildContext context, int position) {
                          
                          return getRow(position);
                        }));
              }
            })
    );

  }
   void _showDialog(String name) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("you clicked $name"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _launchURL(String phone) async {

    const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }

// var url = 'tel:$phone';
//   if (await canLaunch(url)) {
//     await launch(url);
//      _showDialog('i am calling $url');
//   } else {
//     throw 'Could not launch $url';
//   }
}
}