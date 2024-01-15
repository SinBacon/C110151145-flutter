import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance?.imageCache?.clear();
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.png',width:40,height:40): Image.asset('images/f1.png',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='        我的名字是朱峻賢，年齡20歲，住處位於高雄市的衛武營附近，至今未婚。'
                  '從出生至今，一直都在高雄執行我的升學路程，從鳳山區的國小國中，到三民區的高職科大。目前的我在「國立高雄科技大學建功校區的資訊工程系」上課，幾乎每天都會去健身房報到或是上班，不吸菸，酒也是淺嘗輒止，凌晨三四點上床，保證不到八個小時的不合理睡眠，睡前都會聽一遍春日影，再滑三十分鐘社群軟體助眠，然後再睡覺，基本可以熟睡到天亮。像社畜一樣留下一堆疲勞與壓力，迎來第二天的生活，inbody檢查結果也顯示我很健康(應該吧XD'
                  '  從小到大，最喜歡的科目是數學、歷史、程式，因為我喜歡科目三，所以舉例了三個，我也在這三項科目中獲得許多成就，使我求學過程中偶爾能一笑江湖'
                  '我的意思是我是一個隨時都想追求躺平生活的人，不拘泥於勝負與煩惱，不樹立令我夜不能寐的教授，不強求人生的榮華富貴，只求安穩度過這一生。這就是我對於這個社會的生活態度，我也清楚這就是我的幸福，並希望人生可以這樣一直下去，直到老去時還能與廣場大媽一起跳科目三。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f2.png'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/f1.png'), // 背景圖片
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/f1.png'), // 背景圖片
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  final String s2='從國三開始找尋自己的志願，發現自己對於遊戲的研發很感興趣，因此踏入了高雄高工的資訊科就讀三年\n\r'
      '在雄工時期學了VB,C++,C#，也與同學大佬們學到關於AI模型的相關知識，讀了三年之後發現自己對於寫程式熱情沒有減少，與同儕相比也還不錯，因此繼續往高科大的資訊工程系發展\n\r'
      '就讀高科大後又學了C,Java,組合語言,python，又在這堂課學到了Flutter，透過這六年的程式之旅，學習到了許多知識，又在Chatgpt上研究到更多的程式知識';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('程式之旅', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s2, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.blue,
            child:Image.asset('images/f3.png'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  image: DecorationImage(
                    image: AssetImage('images/f3.png'), // 背景圖片
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  image: DecorationImage(
                    image: AssetImage('images/f3.png'), // 背景圖片
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期:'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:80,
              width: 320,
              child: ListView(
                children: [
                  Text('1. 考好成績'),
                  Text('2. 研究未來'),
                  Text('3. 交到朋友'),
                  Text('4. 減肥健康'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:80,
              width: 320,
              child: ListView(
                children: [
                  Text('1. 英文及格'),
                  Text('2. 專題成功'),
                  Text('3. 狂修學分'),
                  Text('4. 修練愛情'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:80,
              width: 320,
              child: ListView(
                children: [
                  Text('1. 全部及格'),
                  Text('2. 想好專題'),
                  Text('3. 去考多益'),
                  Text('4. 工作養己'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:80,
              width: 320,
              child: ListView(
                children: [
                  Text('1. 順利畢業'),
                  Text('2. 找到工作'),
                  Text('3. 整理社交'),
                  Text('4. 規劃人生'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('出社會'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:50,
                width: 320,
                child: ListView(
                  children: [
                    Text('1. 穩定工作'),
                    Text('2. 盡量躺平'),
                  ],
                ),
              ),
            ],),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('高中時期:'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 320,
              child: ListView(
                children: [
                  Text('1. C++'),
                  Text('2. C'),
                  Text('3. C#'),
                  Text('4. VB'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 320,
              child: ListView(
                children: [
                  Text('1. C'),
                  Text('2. JAVA'),
                  Text('3. Python'),
                  Text('4. 組合語言'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('未來方向'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 320,
              child: ListView(
                children: [
                  Text('1. 軟體開發'),
                  Text('2. 資訊安全'),
                  Text('3. 數據科學與大數據'),
                  Text('4. 人工智慧（AI）'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}