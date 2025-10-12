import 'package:basiclab2/basiclab2.dart' as basiclab2;
import 'dart:io';


void main() {
  stdout.write('');
  int sum = 0;
  int num = int.parse(stdin.readLineSync()!);
  if (num<0) {
    print (num);
  } else {
    while (num>0) {
      sum += num%10;
      num = num~/10;
    }
  }
  print(sum); 
}
