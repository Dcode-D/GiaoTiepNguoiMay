import 'package:doangtnm/pages/SearchResultPage.dart';
import 'package:flutter/material.dart';

class SearchingDelegate extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
        onPressed: (){
      query ='';
    }, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, query);
        }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return
        query.isEmpty
        ?
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 2,
                    child:
                Container(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child:
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child:
                  ListTile(
                    onTap: (){
                      showResults(context);
                    },
                    leading: Icon(Icons.history),
                    title: Text(historyList[index]),
                    trailing: Icon(Icons.clear),
                  )
                ),
                  itemCount: historyList.length,
                )
                )
                ),
                Flexible(
                    flex: 1,
                    child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                children:[
                Container(
                  margin: EdgeInsets.only(top: 10),
    child:
                Align(
                  alignment: Alignment.centerLeft,
    child:
                Container(
                  margin: EdgeInsets.only(left: 5,bottom: 3),
                  child: Text("You may also like",
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                  ),
                )
                )
                ),
                Flexible(child:
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>
                  Container(
                    margin: EdgeInsets.only(top:5),
    child:
                        ListTile(
                          minVerticalPadding: 0,
                          onTap: (){
                            showResults(context);
                          },

                          leading: Icon(Icons.circle,color: Colors.black,size: 12,),
                          title: Text(maylikeList[index]),
                        )
                    ),
                  itemCount: maylikeList.length,
                )
                )
              ],
            )
                )
                ]
            )
            :
            Container(
              child:
              Column(
                children: [
                  Expanded(child:
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>
                        Container(
                            margin: EdgeInsets.only(top:5),
                            child:
                                ListTile(
                                  onTap: (){
                                    showResults(context);
                                  },
                                  leading: Icon(Icons.circle,color: Colors.black,size: 10,),
                                  title: Text(suggestList[index],style: TextStyle(fontSize: 20),),
                                )
                            ),
                    itemCount: suggestList.length,
                  )
                  )
                ],
              )
              ,
            );
  }
}

List historyList = ["Phim hay","Vl conheo","Giap cham thoi","Ghe dit bu","Iem la bad girl","Meo rot duoi","ko choi 420 dau"];
List maylikeList = ["Ba cu may man", "Anh tho sua ong nuoc","Happy new year"];
List suggestList = ["Ba cu may man", "Anh tho sua ong nuoc","Happy new year"];