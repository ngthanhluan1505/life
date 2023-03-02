import 'package:flutter/material.dart';
import 'package:life/utilities/hex_color.dart';
import 'package:life/utilities/responsive.dart';
import 'package:life/utilities/style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          left: Responsive.width(3, context),
          right: Responsive.width(3, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                "ぎのうたろう",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text("(Life Point : 1500 pt)",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
          SizedBox(
            height: Responsive.height(10, context),
            child: const Image(
              image: AssetImage('lib/assets/images/avatar.png'),
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }

  Widget _notifyItem(String data, BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          decoration: BoxStyle.fromBoxDecoration(),
          padding: const EdgeInsets.all(5),
          child: Text(data, style: const TextStyle(color: Colors.blue, fontSize: 15),),
        ),
      ),
    );
  }

  Widget _notify(BuildContext context) {
    final listNotify = <Widget>[
      _notifyItem('監理団体 xxxxさま からお知らせが届いています', context),
      _notifyItem('今日の調査にご協力ください（5 pt進呈）', context),
      _notifyItem('日本語検定奨励金が承認されました', context),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxStyle.fromBoxDecoration(color: HexColor.fromHex('88DDEF')),
        height: Responsive.height(20, context),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text('お知らせ:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Expanded(
            child: ListView(children: listNotify,))
        ],)
      ),
    );
  }

  Widget _iconAction(String pathImg, String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxStyle.fromBoxDecoration(radius: 15),
          width: Responsive.width(40, context),
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
          child: Row(
            children: [
              SizedBox(
                height: Responsive.height(6, context),
                child: Image(
                  image: AssetImage(pathImg),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: Responsive.width(2, context),
              ),
              Flexible(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _action(String name, List<Widget> iconAction, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          left: Responsive.width(3, context),
          right: Responsive.width(3, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black,
            height: Responsive.height(2, context),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: iconAction,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = <Widget>[];
    listView.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        color: HexColor.fromHex('FDD3BC'),
        child: Column(children: [_myInfo(context),_notify(context)]),
      ),
    ));
    listView.add(_action("マネー",
        [_iconAction('lib/assets/images/bank.png', '海外送金', context)], context));
    listView.add(_action(
        "生活",
        [_iconAction('lib/assets/images/light.png', '電気/ガス/水道', context)],
        context));
    listView.add(_action(
        "学習",
        [
          _iconAction('lib/assets/images/hand.png', '生活マナー', context),
          _iconAction('lib/assets/images/book.png', '日本語学習', context)
        ],
        context));
    listView.add(_action("困ったときは",
        [_iconAction('lib/assets/images/school.png', '通院補助', context)], context));
    listView.add(_action(
        "その他",
        [_iconAction('lib/assets/images/book.png', '日本語検定奨励金', context)],
        context));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: Responsive.height(5, context),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: AssetImage('lib/assets/images/mainLogo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ClipOval(
                child: InkWell(
                  onTap: () {},
                  child: Material(
                    color: HexColor.fromHex("EAE3E3"),
                    child: Padding(
                      padding: EdgeInsets.all(Responsive.height(0.3, context)),
                      child: Icon(
                        Icons.settings,
                        size: Responsive.height(3.5, context),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: Responsive.width(3, context),
              right: Responsive.width(3, context)),
          child: ListView(children: listView),
        ));
  }
}
