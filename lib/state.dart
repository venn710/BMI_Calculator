import 'package:flutter/cupertino.dart';

class Statelift extends ChangeNotifier
{
// Color activeColor=Color(0xFF1D1E33);
// Color inactiveColor=Color(0xff111328);
Color color_1=Color(0xff111328);
Color color_2=Color(0xff111328);
  double slidvalue=0;
  double weight=0;
  double height=0;
  double age=0;
  void setslidvalue(double x)
  {
    slidvalue=x;
    notifyListeners();
  }
  void setage(double e)
  {
    age=e;
    notifyListeners();
  }
  void setweight(double y)
  {
    weight=y;
    notifyListeners();
  }
  void setheight(double z)
  {
    height=z;
    notifyListeners();
  }
  void setcolor(int tobe)
  {
    if(tobe==1)
    {
    color_1=Color(0xFF1D1E33);
    color_2=Color(0xff111328);
    }
    else
    {
      color_1=Color(0xff111328);
      color_2=Color(0xFF1D1E33);
    }
    slidvalue=0;
    weight=0;
    age=0;
    height=0;
    notifyListeners();
  }
}