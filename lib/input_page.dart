import 'package:bmi_calculator/state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';
import 'package:provider/provider.dart';
const activeColor=Color(0xFF1D1E33);
const inactiveColor=Color(0xff111328);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 @override   
  Widget build(BuildContext context) {
    Statelift st=Provider.of<Statelift>(context);
    return OrientationBuilder(
        builder:(context,orie)=>(orie==Orientation.portrait)?Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          [
          Expanded(
            flex: 2,
          child:Row(
          children:
          [
          Expanded(
              child: GestureDetector(
              onTap:()
              {
                st.setcolor(1);
              },
              child: Ret(
              colour:st.color_1,
              childy: Iconda(val:1,icon:FontAwesomeIcons.mars,test:"Male"),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap:(){st.setcolor(2);},
              child: Ret(
              colour:st.color_2,
              childy: Iconda(val:1,icon:FontAwesomeIcons.venus,test:"Female"),),
            ),
          ),
            ],
            ),
          ),
          Expanded(
            flex: 2,
              child: Ret(
              colour:inactiveColor,
              childy:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Height",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
                  )),
                  Expanded(child: SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Colors.pink,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25)
                      ),
                        child: Slider(
                        inactiveColor: Colors.grey,
                      value: st.slidvalue, 
                      min: 0,
                      max:600,
                      onChanged: (x){
                        st.setslidvalue(x);
                        st.setheight(x);
                      }),
                    ),
                  ),
                  Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(st.slidvalue.toStringAsFixed(0),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50),),
                        Text("cm",style: TextStyle(fontSize:25),)
                      ],
                    ),
                  ),
                  
                ]
              )
            ),),
                  Expanded(
                    flex: 2,
                    child:Row(
                    children:[
                    Expanded(
                    child: Ret(colour:inactiveColor,
                    childy:Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Weight",style: TextStyle(fontSize:25),),
                Text(st.weight.toString(),style:TextStyle(fontSize: 25,fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                  FloatingActionButton(
                      heroTag: null,
                      backgroundColor: activeColor,
                      child: Icon(Icons.add),
                      onPressed: ()
                      {
                        var curr=st.weight;
                        st.setweight(curr+1);
                      }),
                  SizedBox(width: 25,),
                  FloatingActionButton(
                      heroTag: null,
                      backgroundColor: activeColor,
                      child: Icon(Icons.remove),
                      onPressed: ()
                      {
                        var curr=st.weight;
                        (st.weight>1)?
                        st.setweight(curr-1):
                        st.setweight(0);
                      })
                  ]
                )
              ]
            ),
                    )       
            ),
          ),
          Expanded(
              child: Ret(
              colour:inactiveColor,
              childy: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Age",style: TextStyle(fontSize:25),),
                Text(st.age.toStringAsFixed(0),style:TextStyle(fontSize: 25,fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: activeColor,
                    child: Icon(Icons.add),
                    onPressed: ()
                    {
                      var curr=st.age;
                      st.setage(curr+1);
                    }),
                    SizedBox(width: 25,),
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.remove),
                    backgroundColor: activeColor,
                    onPressed: ()
                    {
                      var curr=st.age;
                      (curr>1)?st.setage(curr-1):st.setage(0);
                    })
                  ]
                )
              ]
            ),),
          ),
            ],
            ),
          ),
          Expanded(
            flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.pink,
                //borderRadius:BorderRadius.circular(20)
              ),
              //margin: EdgeInsets.only(top:10),     
              child: FlatButton(
                onPressed: (){
                  Result re=Result(height:st.height,weight:st.weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>SecondRoute(re.result(),re.remarks(),re.inter()),
                    )
                     );
                },
                child:Text("PROCEED",style:TextStyle(color:Colors.blueGrey,fontSize: 45,))
              ),     
            ),
          ))

        ]
  ),
  ):Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
    body:
    SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
            [
            Expanded(
              flex: 3,
            child:Row(
            children:
            [
            Expanded(
                child: GestureDetector(
                onTap:()
                {
                  st.setcolor(1);
                },
                child: Ret(
                colour:st.color_1,
                childy: Iconda(icon:FontAwesomeIcons.mars,test:"Male"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap:(){st.setcolor(2);},
                child: Ret(
                colour:st.color_2,
                childy: Iconda(icon:FontAwesomeIcons.venus,test:"Female"),),
              ),
            ),
              ],
              ),
            ),
              Expanded(
              flex: 4,
                child: Ret(
                colour:inactiveColor,
                childy:Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left:18.0,top:5),
                        child: Text("Height",style: TextStyle(fontSize:26,fontWeight: FontWeight.bold),),
                      ),
                    )),
                    Row(
                      children: [
                        Expanded
                        (
                          flex: 3,
                          child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: SliderTheme(
                              data: SliderThemeData(
                                activeTrackColor: Colors.white,
                                overlayColor: Color(0x29EB1555),
                                thumbColor: Colors.pink,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 25)
                              ),
                                child: Slider(
                                inactiveColor: Colors.grey,
                              value: st.slidvalue, 
                              min: 0,
                              max:600,
                              onChanged: (x){
                                st.setslidvalue(x);
                                st.setheight(x);
                              }),
                            ),
                        ),
                        ),
                        Expanded(
                          flex:1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(st.slidvalue.toStringAsFixed(0),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50),),
                              Text("cm",style: TextStyle(fontSize:25),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
                )
              ),),
              Expanded(
                      flex: 2,
                      child:Row(
                      children:[
                      Expanded(
                      child: Ret(colour:inactiveColor,
                      childy:Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Weight",style: TextStyle(fontSize:25),),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: activeColor,
                        child: Icon(Icons.add),
                        onPressed: ()
                        {
                          var curr=st.weight;
                          st.setweight(curr+1);
                        }),
                      SizedBox(width: 20,),
                      Text(st.weight.toString(),style:TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),
                      SizedBox(width: 20,),
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: activeColor,
                        child: Icon(Icons.remove),
                        onPressed: ()
                        {
                          var curr=st.weight;
                          (st.weight>1)?
                          st.setweight(curr-1):
                          st.setweight(0);

                        })
                      ]
                    ),
                  )
                ]
              )       
              ),
            ),
            Expanded(
                child: Ret(
                colour:inactiveColor,
                childy: Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Age",style: TextStyle(fontSize:25),),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: activeColor,
                        child: Icon(Icons.add),
                        onPressed: ()
                        {
                          var curr=st.age;
                          st.setage(curr+1);
                        }),
                        SizedBox(width: 25,),
                        Text(st.age.toStringAsFixed(0),style:TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),
                        SizedBox(width: 25,),
                        
                      FloatingActionButton(
                        heroTag: null,
                        child: Icon(Icons.remove),
                        backgroundColor: activeColor,
                        onPressed: ()
                        {
                          var curr=st.age;
                          (curr>1)?st.setage(curr-1):st.setage(0);
                        })
                      ]
                    ),
                  )
                ]
              ),),
            ),

              ],
              ),
            ),
            Expanded(
            flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.pink,
                //borderRadius:BorderRadius.circular(20)
              ),
              //margin: EdgeInsets.only(top:10),     
              child: FlatButton(
                onPressed: (){
                  Result re=Result(height:st.height,weight:st.weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>SecondRoute(re.result(),re.remarks(),re.inter()),
                    )
                     );
                },
                child:Text("PROCEED",style:TextStyle(color:Colors.blueGrey,fontSize: 35,))
              ),     
            ),
          ))
            ]
            ),
    ),
    )
    );
    }
  }
class Iconda extends StatelessWidget {
final IconData icon;
final String test;
final val;
Iconda({this.val,this.icon,this.test});
  @override
  Widget build(BuildContext context) {
    // return OrientationBuilder(builder: (context,orie)
      return (val==1)?Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Expanded(flex:5,child: Icon(icon,size: 80,)),
      Expanded(flex:4,child: Text(test,style: TextStyle(fontSize:25,color:Colors.purple),))
      ]
    ):Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Expanded(flex:5,child: Icon(icon,size: 80,)),
      Expanded(flex:4,child: Text(test,style: TextStyle(fontSize:25,color:Colors.purple),))
      ]
    );
    
  }
}
class Ret extends StatelessWidget {

 final Color colour;
 final Widget childy;
 final int val;
 final int gend;
 Ret({this.colour,this.childy,this.gend,this.val});
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
            color:colour,
            borderRadius: BorderRadius.circular(10), ),
            child:childy,      
        );
  }
}
class SecondRoute extends StatelessWidget {
  final double res;
  final String stat;
  final String interp;
  SecondRoute(this.res,this.stat,this.interp);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Status"),
          centerTitle: true,
          leading: FlatButton(
          onPressed:(){Navigator.pop(context);}, child: Icon(Icons.arrow_back)),
        ),
        body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,          
         children:[
           Expanded
           (
             flex: 2,
             child: Padding(
               padding: const EdgeInsets.only(bottom:2.0),
               child: Center(child: Text("Your Status",style: TextStyle(fontSize: 50),)),
             ),
           ),
           Expanded(
             flex: 5,
              child: Container(
                color: inactiveColor,
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                    Text(stat,style: TextStyle(color: Colors.green,fontSize: 25),),
                    Text(res.toStringAsFixed(1),style: TextStyle(fontSize: 100),),
                    Text(interp,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
             ],),
              ),
           ),
           Expanded(
             flex:2,
             child: FlatButton(
               onPressed: (){
                 Navigator.pop(context);
               }, 
               child: Text("CALCULATE AGAIN",style: TextStyle(fontSize:30),)))
         ]
          
        )
    );
  }
}
// [
//             Text('hi'),
//             Text(
//             (
//               (){
//               return 'this'; 
//             })())
//           ]