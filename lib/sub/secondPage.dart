//동물추가화면

import 'package:flutter/material.dart';
import 'package:tabbar_example/animalItem.dart';

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondApp();
  List<Animal> list;
  SecondApp({Key? key, required this.list}) : super(key: key);


}

class _SecondApp extends State<SecondApp> {

  final nameController = TextEditingController();
  int _radiovalue =0;
  bool flyExist = false;
  var _imagePath;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(

                children: <Widget> [

                  Radio(value: 0, groupValue: _radiovalue, onChanged: _radioChange),
                  Text('양서류'),
                  Radio(value: 1, groupValue: _radiovalue, onChanged: _radioChange),
                  Text('파충류'),
                  Radio(value: 2, groupValue: _radiovalue, onChanged: _radioChange),
                  Text('포유'),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(value: flyExist, onChanged: (check){
                    setState(() {
                      flyExist = check!;
                    });
                  })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,

              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                  GestureDetector(
                    child: Image.asset('repo/images/cow.png', width:80),
                    onTap: (){
                      _imagePath = 'repo/images/cow.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/pig.png', width:80),
                    onTap: (){
                      _imagePath = 'repo/images/pig.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/bee.png', width:80),
                    onTap: (){
                      _imagePath = 'repo/images/bee.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/cat.png', width:80),
                    onTap: (){
                      _imagePath = 'repo/images/cat.png';
                    },

                  ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png', width:80),
                      onTap: (){
                        _imagePath = 'repo/images/fox.png';
                      },

                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png', width:80),
                      onTap: (){
                        _imagePath = 'repo/images/monkey.png';
                      },

                    ),

                  ],


              ),


              ),
              ElevatedButton(onPressed: () {
                var animal = Animal (
                  animalName: nameController.value.text,
                  kind: getKind(_radiovalue),
                  imagePath: _imagePath,
                  flyExist: flyExist
                );
                AlertDialog dialog = AlertDialog(
                  title: Text('동물추가하기'),
                  content: Text(
                    '이 동물은 ${animal.animalName} 입니다 \n'
                        '또 이 동물의 종류는 ${animal.kind}입니다 .\n 이 동물을 추가하시겠습니까?',
                  style: TextStyle(fontSize: 30),),
                  actions: [
                    ElevatedButton(onPressed: (){
                      widget.list.add(animal);
                      Navigator.of(context).pop();}
    , child: Text("예"),
                    ),
                ElevatedButton(onPressed: (){
                widget.list.add(animal);
                Navigator.of(context).pop();}
                , child: Text("아니"),
                ),
                  ],
                );

                showDialog(context: context, builder: (BuildContext context) => dialog);


              }, child: Text('동물 추가하기'),
              ),
          ],
          )
        ),

      ),
    );
  }

  void _radioChange(int? value) {
  setState(() {
  _radiovalue = value!;
  });

  }

  getKind(radioValue) {

    switch (radioValue){
      case 0:
        return '양서류';
    case 1:
      return '파충류';
    case 2:
      return '포유류';
    }
  }
}



