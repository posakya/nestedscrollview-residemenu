import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sarasmart/json_model/ezvzjson.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {

  List<Datum> widgets = [];
  List<String> items = [];
  String filter;

  @override
  Widget build(BuildContext context) {
    return getFirstView();
  }

  Widget getRow(int position) {
    return Container(
        width: 200,
        child : Card(
          clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0,bottom: 10.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(15.0)),
        // child: Row(
        //   children: <Widget>[
        //      Card(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
             colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.hardLight),
            image: NetworkImage('${widgets[position].image}'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Center(
          child : Container(
            padding: EdgeInsets.all(5),
 child:Text(widgets[position].name,textAlign: TextAlign.center,style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w700
        ),)
          )
         
        )
        
      ),
    // ),
       
    //       ],
    //     )
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
    return Container(
        child : FutureBuilder(
            future: _fetchListItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        itemCount: widgets.length,
                        itemBuilder: (BuildContext context, int position) {
                          return getRow(position);
                        }));
              }
            })
    );

  }
}