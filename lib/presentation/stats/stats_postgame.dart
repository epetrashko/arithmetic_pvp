// place | rating change | coins change

import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:arithmetic_pvp/presentation/stats/stats_appbar_postgame.dart';
import 'package:arithmetic_pvp/presentation/utils/rain_particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostgameStatsPage extends StatefulWidget {
  const PostgameStatsPage({Key? key}) : super(key: key);

  @override
  State<PostgameStatsPage> createState() => _PostgameStatsPageState();
}

class _PostgameStatsPageState extends State<PostgameStatsPage>
    with SingleTickerProviderStateMixin {
  late Future futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatsAppBarPostgame(),
      body: SafeArea(
        child: AnimatedBackground(
          behaviour: RainParticleBehaviour(
            options: ParticleOptions(
              baseColor: Theme.of(context).primaryColor,
              spawnOpacity: 0.0,
              opacityChangeRate: 0.25,
              minOpacity: 0.1,
              maxOpacity: 1,
              particleCount: 70,
              spawnMaxRadius: 3.0,
              spawnMinRadius: 1.0,
              spawnMaxSpeed: 100.0,
              spawnMinSpeed: 30,
            ),
          ),
          vsync: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'The Leaderboard',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/pedestal.svg',
                          width: MediaQuery.of(context).size.width),
                      Transform.translate(
                        offset: Offset(
                            -(MediaQuery.of(context).size.width) / 3.3,
                            -(MediaQuery.of(context).size.width) / 3.3 + 40),
                        child: const Text(
                          '123',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0.0,
                            -(MediaQuery.of(context).size.width) / 3.3 - 30),
                        child: const Text(
                          'You',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            (MediaQuery.of(context).size.width) / 3.3,
                            -(MediaQuery.of(context).size.width) / 3.3 + 70),
                        child: const Text(
                          'Player2',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/coins.svg', width: 70),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Coin reward',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              '+ or - 27 ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset('assets/currency.svg', height: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/rating.svg', width: 70),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Rating',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              '+ 10 ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset('assets/rating_up.svg',
                                height: 26),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'or - 10 ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset('assets/rating_down.svg',
                                height: 26),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
