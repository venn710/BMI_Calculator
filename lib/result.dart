class Result
{
  double height;
  double weight;
  Result({this.height,this.weight});


double result()
{
return ((weight*10000)/(height*height)>0?(weight*10000)/(height*height):0);
}
String remarks()
{
  if(result()<25 && result()!=0)
  {
    return "Normal";
  }
  else if(result()>=25&&result()<=29)
  {
    return "OverWeight";
  }
  else if(result()>=30)
  {
    return "Obese";
  }
  else{
    return "calculate correctly";
  }
}
String inter()
{
  if(result()<25 && result()!=0) 
  {
    return "You Are perfectly Fit";
  }
  else if(result()>=25&&result()<=29.9)
  {
    return "Need to do some Excersise";
  }
  else if(result()>=30)
  {
    return "need to work hard";
  }
else{
  return "Try Again";
}
}
}