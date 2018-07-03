import "package:flutter/material.dart";

class RecentTopicsScene extends StatelessWidget{
  final List topics;

  RecentTopicsScene({Key key, this.topics}):super(key: key);

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          brightness: Brightness.dark,
          elevation: 0.0,
          title: new Text('最近主题', style: new TextStyle(color: Colors.white, fontSize: 18.0)),
          leading: new IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20.0), onPressed: () {
            Navigator.maybePop(context);
          }),
        ),
        body: new ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int i) => _renderRow(context, topics[i])
        )
      );
    }

    Widget _renderRow(BuildContext context, Map item) {
      ListTile title = new ListTile(
        leading: new SizedBox(
          width: 30.0,
          height: 30.0,
          child: new Image.network(item["authorAvatar"].startsWith('//') ? 'http:${item["authorAvatar"]}' : item["authorAvatar"])
        ),
        title: new Text(item["authorName"]),
        subtitle: new Row(
          children: <Widget>[
            new Text(item["lastReplyAt"])
          ],
        ),
      );
      return new InkWell(
        child: new Column(
          children: <Widget>[
            title,
            new Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: new Text(item["title"])
            )
          ],
        ),
      );
    }
}