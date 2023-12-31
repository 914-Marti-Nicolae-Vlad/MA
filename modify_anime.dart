import 'package:flutter/material.dart';
import 'my_home_page.dart';

class ModifyAnime extends StatefulWidget {
  final Transaction _anime;

  const ModifyAnime(this._anime, {super.key});

  @override
  State<StatefulWidget> createState() => _ModifyAnime();
}

class _ModifyAnime extends State<ModifyAnime> {
  late TextEditingController controllerName;
  late TextEditingController controllerGenre;
  late TextEditingController controllerSeasons;
  late TextEditingController controllerEpisodes;
  late TextEditingController controllerRating;

  @override
  void initState() {
    Transaction a = widget._anime;
    controllerName = TextEditingController(text: a.name);
    controllerGenre = TextEditingController(text: a.genre);
    controllerSeasons =
        TextEditingController(text: a.numberOfSeasonsWatched.toString());
    controllerEpisodes =
        TextEditingController(text: a.numberOfEpisodesWatched.toString());
    controllerRating = TextEditingController(text: a.rating.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Transaction"),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Color.fromRGBO(205, 85, 213, 296),
                ],
              )),
          child: ListView(
            children: [
              Text("SUM"),
              TextField(controller: controllerName),
              Text("DETAILS"),
              TextField(controller: controllerGenre),
              Text("FROM"),
              TextField(controller: controllerSeasons),
              Text("TO"),
              TextField(controller: controllerEpisodes),
              Text("DATE"),
              TextField(controller: controllerRating),
              ElevatedButton(
                  onPressed: () {
                    String name = controllerName.text;
                    String genre = controllerGenre.text;
                    String seasons = controllerRating.text;
                    String episodes = controllerEpisodes.text;
                    String rating = controllerRating.text;

                    if (name.isNotEmpty &&
                        genre.isNotEmpty &&
                        seasons.isNotEmpty &&
                        episodes.isNotEmpty &&
                        rating.isNotEmpty) {
                      Navigator.pop(
                          context,
                          Transaction(
                              name: name,
                              genre: genre,
                              numberOfSeasonsWatched: int.parse(seasons),
                              numberOfEpisodesWatched: int.parse(episodes),
                              rating: int.parse(rating)));
                    }
                  },
                  child: const Text("Save Transaction")),
            ],
          ),
        ));
  }
}
