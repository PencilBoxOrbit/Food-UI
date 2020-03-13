import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController= TabController(vsync: this,length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,color: Colors.black,
                ),
                Container(
                  width: 50.0,height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),//menu and avatar with spaces in between
          Padding(padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'SEARCH FOR',
            style: TextStyle(
              fontSize: 30.0,fontWeight: FontWeight.bold
            ),
          ),
          ),//Search For text
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'RECIPES',
              style: TextStyle(
                  fontSize: 30.0,fontWeight: FontWeight.bold
              ),
            ),
          ),//Recipes text
          SizedBox(height: 20.0),
          Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: Colors.grey.withOpacity(0.5)),
                ),
              ),
            ),
          ),//input decoration with hint text Search
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold,
              ),
            ),
          ),//Recommended text
          SizedBox(height: 25.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('HamBurger','images/burger.png','21',Color(0xFFFFEAC5),Color(0xFF81570E)),
                _buildListItem('Cheese','images/cheese.png','32',Color(0xFFFFEAC5),Color(0xFF81570E)),
                _buildListItem('Taco','images/taco.png','84',Color(0xFFFFEAC5),Color(0xFF81570E)),
                _buildListItem('Popcorn','images/popcorn.png','29',Color(0xFFFFEAC5),Color(0xFF81570E)),
              ],
            ),
          ),//images of foods with their name and price
           SizedBox(height: 20.0),
           Padding(
             padding: EdgeInsets.only(left: 15.0),
              child: TabBar(
                controller: tabController,
                //indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                isScrollable: true,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                tabs: <Widget>[
                 Tab(child: Text('Featured')),
                 Tab(child: Text('Combo')),
                 Tab(child: Text('Favorites')),
                 Tab(child: Text('Recommended Everything')),
               ],
              ),
              ),//bottom options
             ],
      ),
    );
  }
  _buildListItem(String food, String imgPath,String price,Color bgColor, Color textColor){
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Container(
        height: 175.0, width: 150.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: food,
              child: Container (
                height: 75.0,width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(imgPath,height: 50.0,width: 50.0),
                ),
              ),
            ),//animation to swipe left/right
            SizedBox(height: 20.0),
            Text(
              food,
              style: TextStyle(
                fontSize: 20.0, color: textColor,
              ),
            ),//food text
            Text(
              '\$'+price,
              style: TextStyle(
                fontSize: 20.0, color: textColor,
              ),
            ),   //Price text
          ],
        ),
      ),
    );
  }
}

