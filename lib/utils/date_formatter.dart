import 'package:intl/intl.dart';

dateFormatter(String date){
  DateTime tempDate = new DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(date);
  String dateFmt = DateFormat("yyyy/MM/dd HH:mm:ss").format(tempDate);
  return dateFmt;
}

dateNow(){

  var now = DateTime.now();
  var dateNow = DateFormat("yyyy/MM/dd HH:mm:ss").format(now);
  return dateNow;
}