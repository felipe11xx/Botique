import 'package:intl/intl.dart';

dateFormatter(String date){
  DateTime tempDate = new DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(date);
  String dateFmt = DateFormat("yyyy/MM/dd hh:mm:ss").format(tempDate);
  return dateFmt;
}