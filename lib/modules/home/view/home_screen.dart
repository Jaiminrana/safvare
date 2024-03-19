import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sofvare/modules/home/store/home_store.dart';
import 'package:sofvare/utils/common_widget/text_body_large.dart';
import 'package:sofvare/utils/common_widget/text_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final HomeStore store;

  late final team = store.teamsList;

  @override
  void initState() {
    store = context.read<HomeStore>()..getMatchDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (context) {
          return Text(store.appBarTitle);
        }),
      ),
      body: Observer(builder: (context) {
        if (store.teamState.isSuccessful && team.isNotEmpty) {
          return DefaultTabController(
            length: team.length,
            child: Column(
              children: [
                TabBar(
                  tabs: List.generate(
                    team.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextBodyLarge(
                        team[index].nameFull.toString(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      team.length,
                      (index) {
                        return ListView.separated(
                          itemCount: team[index].players.length,
                          itemBuilder: (context, playerIndex) {
                            final player = team[index].players[playerIndex];

                            return TextTile(
                              title: player.nameFull.toString(),
                              subTitle: player.isCaptain
                                  ? 'Captain'
                                  : player.isKeeper
                                      ? 'Keeper'
                                      : null,
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.black26,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (store.teamState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (store.teamState.isFailed) {
          return const Center(child: Text('Error while fetching teams.'));
        }

        return const Text('No data found!');
      }),
    );
  }
}
