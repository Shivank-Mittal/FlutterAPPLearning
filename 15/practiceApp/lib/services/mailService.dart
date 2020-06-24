import '../models/gmailModel.dart';

class MailService{

  Gmail mail1 = new Gmail(1 ,'Test 1','abc@gmail.com');
  Gmail mail2 = new Gmail(2 ,'Test 2','xyz@gmail.com');
  Gmail mail3 = new Gmail(3 ,'Test 3','sbc@gmail.com');
  Gmail mail4 = new Gmail(4 ,'Test 4','abdc@gmail.com');
  Gmail mail5 = new Gmail(5 ,'Test 5','ahgc@gmail.com');
  Gmail mail6 = new Gmail(6 ,'Test 6','klbrt@gmail.com');
  Gmail mail7 = new Gmail(6 ,'Test 6','klbrt@gmail.com');
  Gmail mail8 = new Gmail(6 ,'Test 6','klbrt@gmail.com');

  List <Gmail> mailList = new List();

  MailService(){
    composeMailList();
  }

  // List<Gmail> get  mails{
  //   return composeMailList();
  // }

  composeMailList(){
    mailList.add(mail1);
    mailList.add(mail2);
    mailList.add(mail3);
    mailList.add(mail4);
    mailList.add(mail5);
    mailList.add(mail6);
    mailList.add(mail6);
    mailList.add(mail7);
    mailList.add(mail8);
  }

}