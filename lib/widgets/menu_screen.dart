import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gnu/ui/advertise.dart';

class MenuScreen extends StatelessWidget{

  //final String imageUrl = "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(FontAwesomeIcons.mailBulk, "کار",0),
    MenuItem(FontAwesomeIcons.home, 'خانواده',1),
//    MenuItem(FontAwesomeIcons.plus, 'سایر',2),
//    MenuItem(FontAwesomeIcons.pen, 'تحصیل',3),
    MenuItem(FontAwesomeIcons.coffee, 'غذا',4),
    MenuItem(FontAwesomeIcons.mailchimp, 'مسافرت',5),
    MenuItem(Icons.person, 'دوستان',6),
//    MenuItem(FontAwesomeIcons.heart, 'رابطه',7),
//    MenuItem(FontAwesomeIcons.memory, 'فعالیت ها',8),
    //MenuItem(Icons.code, 'Prom-codes'),
    //MenuItem(Icons.format_list_bulleted, 'Orders'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 62, left: 32,bottom: 8,
          right: MediaQuery.of(context).size.width/2.9),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(right: 16),
//                child: CircularImage(
//                  NetworkImage(imageUrl),
//                ),
//              ),
              Text('Mahdi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
          Expanded(child: Container(),),

          Column(
            children: options.map((item) {
              return ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return AdvertisePage();
                  }));
                },
                leading: Icon(item.icon, color: Colors.white, size: 20,),
                title: Text(item.title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(child: Container(),),


        ],
      ),
    );
  }
}


class MenuItem{
  String title;
  IconData icon;
  int number;

  MenuItem(this.icon, this.title,this.number);
}