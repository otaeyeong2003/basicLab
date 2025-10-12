import 'dart:math';
import 'dart:convert';

class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }

  void setAvg() => avg = (kor + eng + math) / 3.0;
}

void main() {
  var alist = List.empty(growable: true);
  for (int i = 0; i < 10; i++) {
    Student s = Student();
    s.name = AsciiDecoder().convert([65 + i]);
    alist.add(s);
  }

  String strTable = "이름 국어 영어 수학 평균";
  // print("이름, 국어, 영어, 수학, 평균");
  for (int i = 0; i < 10; i++) {
    alist[i].avg = (alist[i].kor + alist[i].eng + alist[i].math) / 3.0;
    alist[i].setAvg();
  }
  print(strTable);
  for (int i = 0; i < 10; i++) {
    String str = '';
    str += alist[i].name.padLeft(4);
    str += alist[i].kor.toString().padLeft(5);
    str += alist[i].eng.toString().padLeft(5);
    str += alist[i].math.toString().padLeft(5);
    str += alist[i].avg.toStringAsFixed(2).padLeft(8);
    print(str);
  }

  print("\n평균으로 정렬:");
  print(strTable + " 비고");
  List newList = List.from(alist);
  newList.sort((a, b) => a.avg.compareTo(b.avg));

  for (var i in newList) {
    String str = '';
    str += i.name.padLeft(4);
    str += i.kor.toString().padLeft(5);
    str += i.eng.toString().padLeft(5);
    str += i.math.toString().padLeft(5);
    str += i.avg.toStringAsFixed(2).padLeft(8);
    if (i.avg > 50.0) {
      str += " PASS".padLeft(5);
    } else {
      str += " FAIL".padLeft(5);
    }
    print(str);
  }
}