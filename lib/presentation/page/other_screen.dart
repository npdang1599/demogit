import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/application/color_app.dart';
import 'package:scheduleapp/presentation/atom/bottom_navigation_bar.dart';
class OtherScreen extends StatefulWidget{
  OtherState createState() => OtherState();
}
class OtherState extends State<OtherScreen>{
  List<String> item = ["Tài khoản","Thời khóa biểu","Sự kiện","Đọc báo"];
  List <IconData> iconItem = [Icons.account_circle, Icons.calendar_today, Icons.today,Icons.collections_bookmark];
  ScrollController controller =  ScrollController();
  int _selectedItem = 0;
  Widget build(BuildContext context)
  {

    return Scaffold(appBar: AppBar(title: Text("Khác",style: TextStyle(
      fontSize: 22, color: Colors.white,fontWeight: FontWeight.w400
    ),),
    backgroundColor: ColorApp.backgroundColor,),
      bottomNavigationBar:CustomBottomNavigationBar(
    iconList: [
    Icons.home,
    Icons.assessment,
    Icons.note,
    Icons.dashboard,
        ],
        onChange: (val) {
      setState(() {
        _selectedItem = val;
      });
    },
    defaultSelectedIndex: 1,
    btnName: ["Tổng quan","Điểm","Ghi chú","Khác"],
    ),
    body: ListView.builder(itemCount: 4,itemBuilder: (context,index){
        return listItem(context, item[index], iconItem[index]);
    }) ,
    );
  }
  Widget listItem(BuildContext context, String title, IconData icon)
  {
    double w = MediaQuery.of(context).size.width / 100;
    double h = MediaQuery.of(context).size.height / 100;
    return GestureDetector(
      child: Container(width: w*100,
        height: h*7,
        padding: EdgeInsets.only(left: w*5),
        child: Row(mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 36,color: Colors.grey,),
            SizedBox(width: 18),
            Text(title, style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }

}