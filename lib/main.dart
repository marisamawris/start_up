import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class Actor {
  final String name;
  final String description;
  final int usia;
  final String image;
  Actor(this.name, this.description, this.usia, this.image);
  static List<Actor> getActor() {
    List<Actor> items = <Actor>[];
    items.add(Actor(
        "Bae Suzy", "Menjadi pemain drama korea start up sebagai Seo Dal-Mi", 20,
        "baesuzy.jpg"));
    items.add(Actor("Kang Hanna", "Menjadi pemain drama korea start up sebagai Won In-Jae",
        26, "kanghanna.jpg"));
    items.add(Actor(
        "Kim Do-Wan",
        "Menjadi pemain drama korea start up sebagai Kim Yong-San",
        24,
        "kimdowan.jpg"));
    items.add(Actor(
        "Nam Joo-Hyuk", "Menjadi pemain drama korea start up sebagai Nam Do-San", 25,
        "namjoohyuk.jpg"));
    items.add(Actor(
        "Kim Sun-Ho", "Menjadi pemain drama korea start up sebagai Han Ji-Pyeong", 27,
        "sunho.jpg"));
    return items;
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list of Movie Players in Movie Start Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Actor Navigation demo home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title=''}) : super(key: key);
  final String title;
  final items = Actor.getActor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Actor Navigation")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ActorBox(item: items[index]),
              onTap: () {
                //here is navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActorPage(item:
                    items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}
class ActorPage extends StatelessWidget {
  ActorPage({Key? key, required this.item}) : super(key: key);
  final Actor item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image, height:
                300,width: 200,),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(3),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight:
                                FontWeight.bold)),
                            Text(this.item.description),
                            Text("Usia: " +
                                this.item.usia.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}
class ActorBox extends StatelessWidget {
  ActorBox({Key? key, required this.item}) : super(key: key);
  final Actor item;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        //height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image, height:
                100),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight:
                                FontWeight.bold)),
                            Text(this.item.description),
                            Text("Usia: " + this.item.usia.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
