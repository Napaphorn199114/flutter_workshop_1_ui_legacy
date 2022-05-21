import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart'; // เรียกใช้ animation picture

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _title = "WorkShop_UI";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView(
          children: [headerSection, titleSection, buttonSection, courseSection],
        ),
      ),
    );
  }
}

Widget headerSection = Image.network(
    "https://static2.thetravelimages.com/wordpress/wp-content/uploads/2019/11/Japan-2107x1406-Cropped.jpg");

Widget titleSection = Padding(
  padding: EdgeInsets.all(50),
  child: Row(
    children: [
      Expanded(
        //ขยายพื้นที่
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Travel Japan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Fuji,Japan",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      Icon(
        Icons.thumb_up,
        color: Colors.blue,
      ),
      Container(
        margin: EdgeInsets.only(left: 8),
        child: Text("99"),
      ),
    ],
  ),
);

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //space เท่าๆกัน
  children: [
    _buildButtonColumn(icon: Icons.thumb_up, label: "Like"),
    _buildButtonColumn(icon: Icons.comment, label: "Comment"),
    _buildButtonColumn(icon: Icons.share, label: "Share"),
  ],
);

Column _buildButtonColumn({IconData? icon, required String label}) {
  var icColor = Colors.grey.shade500;
  return Column(
    children: [
      Icon(
        icon,
        color: icColor,
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 13, color: icColor),
        ),
      ),
    ],
  );
}

Widget courseSection = Container(
  margin: EdgeInsets.only(top: 70),
  padding: EdgeInsets.all(8),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(8),
        child: Text("Japan Picture"),
      ),
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal, //scroll แนวนอน
          children: [
            _buildCardListView(
                url:
                    'https://travelyourway.net/wp-content/uploads/2020/01/visit-to-sensoji-temple-tokyo-japan-1024x684.jpg'),
            _buildCardListView(
                url:
                    'https://www.countrywalkers.com/content/uploads/2019/05/cherry-blossom-season-japan.jpg'),
            _buildCardListView(
                url:
                    'https://external-preview.redd.it/2xGywSqiQPjwm6kt90jEhgpmTMgdmYrWaBH_wO6QxNY.jpg?auto=webp&s=96912f7d650d441d8bc03f08702e6af4e95751f6'),
            _buildCardListView(
                url:
                    'https://leaveyourdailyhell.com/wp-content/uploads/2014/04/Tokyo-Japan1.jpg'),
          ],
        ),
      ),
    ],
  ),
);

Card _buildCardListView({required String url}) {
  return Card(
    //child: Image.network(url),
    child:
        FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: url),    //package transparent_image flutter animation
  );
}
