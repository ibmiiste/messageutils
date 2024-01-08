**FREE
//*************************************************************************
//                                                                       **
//  Message                                                              **
//                                                                       **
//*************************************************************************
DCL-DS Message qualified template;
  id char(7);
  file char(20);
  fileName char(10) overLay(Message);
  libName  char(10) overLay(Message:*Next);
  text char(132);
  data char(3000);
  key char(4);
END-DS;  