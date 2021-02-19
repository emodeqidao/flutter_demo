
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Container(
          child: Column(
            children: [
              _SettingItem(
                  iconData: Icons.thumb_up,
                  iconColor: Colors.blue,
                  title: '点赞',
                  suffix: _Suffix(text:'29')
              ),
              Divider(
                indent: 15.0,
                endIndent: 15.0,
                color: Colors.deepPurple,
              ),
              _SettingItem(
                  iconData: Icons.thumb_down,
                  iconColor: Colors.red,
                  title: '不关机点赞',
                  suffix: _Suffix(text:'28')
              ),
              Divider(),
              _SettingItem(
                  iconData: Icons.message,
                  iconColor: Colors.redAccent,
                  title: '消息',
                  suffix: _NotificationText(text: '100',)
              ),
            ],
          ),
        )
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;
  const _SettingItem(
      {Key key, this.iconData, this.iconColor, this.title, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: Row(
        children: [
          SizedBox(
            width: 30.0,
          ),
          Icon(iconData, color:iconColor),
          SizedBox(
            width: 30.0,
          ),
          Expanded(child: Text('$title')),
          suffix,
          SizedBox(
            width: 15.0,
          )
        ],
      ),
    );
  }
}

class _Suffix extends StatelessWidget {
  final String text;

  const _Suffix({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(color: Colors.grey.withOpacity(.5)),
    );
  }
}

class _NotificationText extends StatelessWidget {
  final String text;

  const _NotificationText({Key key, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.red,
      ),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}




