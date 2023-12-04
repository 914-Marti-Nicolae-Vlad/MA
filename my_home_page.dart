import 'package:flutter/material.dart';
import 'package:wimm_flutter/register_anime.dart';

import 'modify_anime.dart';

class MyHomePage extends StatefulWidget {
  final String _title;

  MyHomePage(this._title);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> animes = [
    Transaction(
        id: 0,
        name: '100',
        genre: " brother's birthday ",
        numberOfSeasonsWatched: 2,
        numberOfEpisodesWatched: 2,
        rating: 10),
    Transaction(
        id: 1,
        name: '1500',
        genre: 'rent',
        numberOfSeasonsWatched: 3,
        numberOfEpisodesWatched: 2,
        rating: 9),
    Transaction(
        id: 2,
        name: '300',
        genre: 'jacket',
        numberOfSeasonsWatched: 3,
        numberOfEpisodesWatched: 4,
        rating: 10),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Color.fromRGBO(205, 85, 213, 296),
                ],
              )),
          child: ListView.builder(
            itemCount: animes.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding:  EdgeInsets.only(left: 3, right: 3, top: 10),
                  child: ListTile(
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ModifyAnime(animes[index])))
                          .then((newContact) {
                        if (newContact != null) {
                          setState(() {
                            animes.removeAt(index);
                            newContact.id = index;
                            animes.insert(index, newContact);

                            messageResponse(context,
                                newContact.name + " Has been modified...!");
                          });
                        }
                      });
                    },
                    onLongPress: () {
                      removeAnime(context, animes[index]);
                    },
                    title: Text(animes[index].name),
                    subtitle: Text('from ' + animes[index].numberOfSeasonsWatched.toString() + ' to ' + animes[index].numberOfEpisodesWatched.toString()),
                    leading:  CircleAvatar(
                      backgroundColor: Colors.deepPurple[800],
                      child: Text(animes[index].name.substring(0, 1),style: const TextStyle(color:Colors.white)),
                    ),
                    // trailing: Text.rich(TextSpan(children: [
                    //   TextSpan(text: "${animes[index].rating}/10",style: const TextStyle(color:Colors.white)),
                    //   const WidgetSpan(
                    //       child: Icon(Icons.star_border_purple500_sharp)),
                    // ])),
                  ));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const RegisterAnime()))
              .then((newAnime) {
            if (newAnime != null) {
              setState(() {
                animes.add(newAnime);
                messageResponse(context, newAnime.name + " was added...!");
              });
            }
          });
        },
        tooltip: "Add Transaction",
        child: const Icon(Icons.add),
      ),
    );
  }

  removeAnime(BuildContext context, Transaction anime) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Delete Transaction"),
          content:
          Text("Are you sure you want to delete " + anime.name + "?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  animes.remove(anime);
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }
}

class Transaction {
  var id;
  var name;
  var genre;
  var numberOfSeasonsWatched;
  var numberOfEpisodesWatched;
  var rating;

  Transaction(
      {this.id,
        this.name,
        this.genre,
        this.numberOfSeasonsWatched,
        this.numberOfEpisodesWatched,
        this.rating});
}

messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Update Message...!"),
        content: Text("Transaction $name"),
      ));
}
