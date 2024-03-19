// To parse this JSON data, do
//
//     final match = matchFromJson(jsonString);

import 'dart:convert';

MatchDm matchFromJson(String str) => MatchDm.fromJson(json.decode(str));

class MatchDetailDm {
  MatchDetailDm({required this.match});

  final MatchDm match;

  factory MatchDetailDm.fromJson(Map<String, dynamic> json) {
    return MatchDetailDm(
      match: MatchDm.fromJson(json["Matchdetail"]['Match']),
    );
  }
}

class MatchDm {
  final List<Team>? teams;

  MatchDm({
    this.teams,
  });

  factory MatchDm.fromJson(Map<String, dynamic> json) {
    return MatchDm(
      teams: (json["Teams"] as Map<String, dynamic>)
          .entries
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Inning {
  final String? number;
  final String? battingteam;
  final String? total;
  final String? wickets;
  final String? overs;
  final String? runrate;
  final String? byes;
  final String? legbyes;
  final String? wides;
  final String? noballs;
  final String? penalty;
  final String? allottedOvers;
  final List<InningBatsman>? batsmen;
  final PartnershipCurrent? partnershipCurrent;
  final List<Bowler>? bowlers;
  final List<FallofWicket>? fallofWickets;
  final PowerPlay? powerPlay;
  final String? target;

  Inning({
    this.number,
    this.battingteam,
    this.total,
    this.wickets,
    this.overs,
    this.runrate,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.allottedOvers,
    this.batsmen,
    this.partnershipCurrent,
    this.bowlers,
    this.fallofWickets,
    this.powerPlay,
    this.target,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
        number: json["Number"],
        battingteam: json["Battingteam"],
        total: json["Total"],
        wickets: json["Wickets"],
        overs: json["Overs"],
        runrate: json["Runrate"],
        byes: json["Byes"],
        legbyes: json["Legbyes"],
        wides: json["Wides"],
        noballs: json["Noballs"],
        penalty: json["Penalty"],
        allottedOvers: json["AllottedOvers"],
        batsmen: json["Batsmen"] == null
            ? []
            : List<InningBatsman>.from(
                json["Batsmen"]!.map((x) => InningBatsman.fromJson(x))),
        partnershipCurrent: json["Partnership_Current"] == null
            ? null
            : PartnershipCurrent.fromJson(json["Partnership_Current"]),
        bowlers: json["Bowlers"] == null
            ? []
            : List<Bowler>.from(
                json["Bowlers"]!.map((x) => Bowler.fromJson(x))),
        fallofWickets: json["FallofWickets"] == null
            ? []
            : List<FallofWicket>.from(
                json["FallofWickets"]!.map((x) => FallofWicket.fromJson(x))),
        powerPlay: json["PowerPlay"] == null
            ? null
            : PowerPlay.fromJson(json["PowerPlay"]),
        target: json["Target"],
      );

  Map<String, dynamic> toJson() => {
        "Number": number,
        "Battingteam": battingteam,
        "Total": total,
        "Wickets": wickets,
        "Overs": overs,
        "Runrate": runrate,
        "Byes": byes,
        "Legbyes": legbyes,
        "Wides": wides,
        "Noballs": noballs,
        "Penalty": penalty,
        "AllottedOvers": allottedOvers,
        "Batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "Partnership_Current": partnershipCurrent?.toJson(),
        "Bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "FallofWickets": fallofWickets == null
            ? []
            : List<dynamic>.from(fallofWickets!.map((x) => x.toJson())),
        "PowerPlay": powerPlay?.toJson(),
        "Target": target,
      };
}

class InningBatsman {
  final String? batsman;
  final String? runs;
  final String? balls;
  final String? fours;
  final String? sixes;
  final String? dots;
  final String? strikerate;
  final String? dismissal;
  final String? howout;
  final String? bowler;
  final String? fielder;
  final bool? isonstrike;

  InningBatsman({
    this.batsman,
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.dots,
    this.strikerate,
    this.dismissal,
    this.howout,
    this.bowler,
    this.fielder,
    this.isonstrike,
  });

  factory InningBatsman.fromJson(Map<String, dynamic> json) => InningBatsman(
        batsman: json["Batsman"],
        runs: json["Runs"],
        balls: json["Balls"],
        fours: json["Fours"],
        sixes: json["Sixes"],
        dots: json["Dots"],
        strikerate: json["Strikerate"],
        dismissal: json["Dismissal"],
        howout: json["Howout"],
        bowler: json["Bowler"],
        fielder: json["Fielder"],
        isonstrike: json["Isonstrike"],
      );

  Map<String, dynamic> toJson() => {
        "Batsman": batsman,
        "Runs": runs,
        "Balls": balls,
        "Fours": fours,
        "Sixes": sixes,
        "Dots": dots,
        "Strikerate": strikerate,
        "Dismissal": dismissal,
        "Howout": howout,
        "Bowler": bowler,
        "Fielder": fielder,
        "Isonstrike": isonstrike,
      };
}

class Bowler {
  final String? bowler;
  final String? overs;
  final String? maidens;
  final String? runs;
  final String? wickets;
  final String? economyrate;
  final String? noballs;
  final String? wides;
  final String? dots;
  final bool? isbowlingtandem;
  final bool? isbowlingnow;
  final List<ThisOver>? thisOver;

  Bowler({
    this.bowler,
    this.overs,
    this.maidens,
    this.runs,
    this.wickets,
    this.economyrate,
    this.noballs,
    this.wides,
    this.dots,
    this.isbowlingtandem,
    this.isbowlingnow,
    this.thisOver,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        bowler: json["Bowler"],
        overs: json["Overs"],
        maidens: json["Maidens"],
        runs: json["Runs"],
        wickets: json["Wickets"],
        economyrate: json["Economyrate"],
        noballs: json["Noballs"],
        wides: json["Wides"],
        dots: json["Dots"],
        isbowlingtandem: json["Isbowlingtandem"],
        isbowlingnow: json["Isbowlingnow"],
        thisOver: json["ThisOver"] == null
            ? []
            : List<ThisOver>.from(
                json["ThisOver"]!.map((x) => ThisOver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Bowler": bowler,
        "Overs": overs,
        "Maidens": maidens,
        "Runs": runs,
        "Wickets": wickets,
        "Economyrate": economyrate,
        "Noballs": noballs,
        "Wides": wides,
        "Dots": dots,
        "Isbowlingtandem": isbowlingtandem,
        "Isbowlingnow": isbowlingnow,
        "ThisOver": thisOver == null
            ? []
            : List<dynamic>.from(thisOver!.map((x) => x.toJson())),
      };
}

class ThisOver {
  final String? t;
  final String? b;

  ThisOver({
    this.t,
    this.b,
  });

  factory ThisOver.fromJson(Map<String, dynamic> json) => ThisOver(
        t: json["T"],
        b: json["B"],
      );

  Map<String, dynamic> toJson() => {
        "T": t,
        "B": b,
      };
}

class FallofWicket {
  final String? batsman;
  final String? score;
  final String? overs;

  FallofWicket({
    this.batsman,
    this.score,
    this.overs,
  });

  factory FallofWicket.fromJson(Map<String, dynamic> json) => FallofWicket(
        batsman: json["Batsman"],
        score: json["Score"],
        overs: json["Overs"],
      );

  Map<String, dynamic> toJson() => {
        "Batsman": batsman,
        "Score": score,
        "Overs": overs,
      };
}

class PartnershipCurrent {
  final String? runs;
  final String? balls;
  final List<PartnershipCurrentBatsman>? batsmen;

  PartnershipCurrent({
    this.runs,
    this.balls,
    this.batsmen,
  });

  factory PartnershipCurrent.fromJson(Map<String, dynamic> json) =>
      PartnershipCurrent(
        runs: json["Runs"],
        balls: json["Balls"],
        batsmen: json["Batsmen"] == null
            ? []
            : List<PartnershipCurrentBatsman>.from(json["Batsmen"]!
                .map((x) => PartnershipCurrentBatsman.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Runs": runs,
        "Balls": balls,
        "Batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
      };
}

class PartnershipCurrentBatsman {
  final String? batsman;
  final String? runs;
  final String? balls;

  PartnershipCurrentBatsman({
    this.batsman,
    this.runs,
    this.balls,
  });

  factory PartnershipCurrentBatsman.fromJson(Map<String, dynamic> json) =>
      PartnershipCurrentBatsman(
        batsman: json["Batsman"],
        runs: json["Runs"],
        balls: json["Balls"],
      );

  Map<String, dynamic> toJson() => {
        "Batsman": batsman,
        "Runs": runs,
        "Balls": balls,
      };
}

class PowerPlay {
  final String? pp1;
  final String? pp2;

  PowerPlay({
    this.pp1,
    this.pp2,
  });

  factory PowerPlay.fromJson(Map<String, dynamic> json) => PowerPlay(
        pp1: json["PP1"],
        pp2: json["PP2"],
      );

  Map<String, dynamic> toJson() => {
        "PP1": pp1,
        "PP2": pp2,
      };
}

class Matchdetail {
  final String? teamHome;
  final String? teamAway;
  final MatchClass? match;
  final Series? series;
  final Venue? venue;
  final Officials? officials;
  final String? weather;
  final String? tosswonby;
  final String? status;
  final String? statusId;
  final String? playerMatch;
  final String? result;
  final String? winningteam;
  final String? winmargin;
  final String? equation;

  Matchdetail({
    this.teamHome,
    this.teamAway,
    this.match,
    this.series,
    this.venue,
    this.officials,
    this.weather,
    this.tosswonby,
    this.status,
    this.statusId,
    this.playerMatch,
    this.result,
    this.winningteam,
    this.winmargin,
    this.equation,
  });

  factory Matchdetail.fromJson(Map<String, dynamic> json) => Matchdetail(
        teamHome: json["Team_Home"],
        teamAway: json["Team_Away"],
        match:
            json["Match"] == null ? null : MatchClass.fromJson(json["Match"]),
        series: json["Series"] == null ? null : Series.fromJson(json["Series"]),
        venue: json["Venue"] == null ? null : Venue.fromJson(json["Venue"]),
        officials: json["Officials"] == null
            ? null
            : Officials.fromJson(json["Officials"]),
        weather: json["Weather"],
        tosswonby: json["Tosswonby"],
        status: json["Status"],
        statusId: json["Status_Id"],
        playerMatch: json["Player_Match"],
        result: json["Result"],
        winningteam: json["Winningteam"],
        winmargin: json["Winmargin"],
        equation: json["Equation"],
      );

  Map<String, dynamic> toJson() => {
        "Team_Home": teamHome,
        "Team_Away": teamAway,
        "Match": match?.toJson(),
        "Series": series?.toJson(),
        "Venue": venue?.toJson(),
        "Officials": officials?.toJson(),
        "Weather": weather,
        "Tosswonby": tosswonby,
        "Status": status,
        "Status_Id": statusId,
        "Player_Match": playerMatch,
        "Result": result,
        "Winningteam": winningteam,
        "Winmargin": winmargin,
        "Equation": equation,
      };
}

class MatchClass {
  final String? livecoverage;
  final String? id;
  final String? code;
  final String? league;
  final String? number;
  final String? type;
  final String? date;
  final String? time;
  final String? offset;
  final String? daynight;

  MatchClass({
    this.livecoverage,
    this.id,
    this.code,
    this.league,
    this.number,
    this.type,
    this.date,
    this.time,
    this.offset,
    this.daynight,
  });

  factory MatchClass.fromJson(Map<String, dynamic> json) => MatchClass(
        livecoverage: json["Livecoverage"],
        id: json["Id"],
        code: json["Code"],
        league: json["League"],
        number: json["Number"],
        type: json["Type"],
        date: json["Date"],
        time: json["Time"],
        offset: json["Offset"],
        daynight: json["Daynight"],
      );

  Map<String, dynamic> toJson() => {
        "Livecoverage": livecoverage,
        "Id": id,
        "Code": code,
        "League": league,
        "Number": number,
        "Type": type,
        "Date": date,
        "Time": time,
        "Offset": offset,
        "Daynight": daynight,
      };
}

class Officials {
  final String? umpires;
  final String? referee;

  Officials({
    this.umpires,
    this.referee,
  });

  factory Officials.fromJson(Map<String, dynamic> json) => Officials(
        umpires: json["Umpires"],
        referee: json["Referee"],
      );

  Map<String, dynamic> toJson() => {
        "Umpires": umpires,
        "Referee": referee,
      };
}

class Series {
  final String? id;
  final String? name;
  final String? status;
  final String? tour;
  final String? tourName;

  Series({
    this.id,
    this.name,
    this.status,
    this.tour,
    this.tourName,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["Id"],
        name: json["Name"],
        status: json["Status"],
        tour: json["Tour"],
        tourName: json["Tour_Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Status": status,
        "Tour": tour,
        "Tour_Name": tourName,
      };
}

class Venue {
  final String? id;
  final String? name;

  Venue({
    this.id,
    this.name,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["Id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}

class Teams {
  Teams({
    required this.teams,
  });

  final List<Team> teams;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        teams: (json['Teams'] as Map<String, dynamic>).values.map((e) {
          final players = (e['Players'] as Map<String, dynamic>)
              .values
              .map((e) => Player.fromJson(e as Map<String, dynamic>))
              .toList();
          return Team(
            players: players,
            nameFull: e['Name_Full'],
            nameShort: e['Name_Short'],
          );
        }).toList(),
      );

// Teams(
//   teams: (json['Teams'] as Map<String, dynamic>).entries.map((e) {
//     return Team.fromJson(e as Map<String, dynamic>);
//   }).toList(),
// );
}

class Team {
  final String? nameFull;
  final String? nameShort;
  final List<Player> players;

  Team({
    this.nameFull,
    this.nameShort,
    this.players = const [],
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    final players = (json["Players"] as Map<String, dynamic>?)
        ?.entries
        .map((e) => Player(
              isCaptain: e.value['Iscaptain'],
              isKeeper: e.value['Iskeeper'],
              nameFull: e.value['Name_Full'],
            ))
        .toList();
    return Team(
      nameFull: json["Name_Full"],
      nameShort: json["Name_Short"],
      players: players ?? [],
    );
  }
}

class Player {
  final String? nameFull;
  final bool isKeeper;
  final bool isCaptain;

  Player({
    required this.nameFull,
    this.isKeeper = false,
    this.isCaptain = false,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        nameFull: json["Name_Full"],
        isKeeper: json["Iskeeper"] == true,
        isCaptain: json["Iscaptain"] == true,
      );
}

class Batting {
  final Style? style;
  final String? average;
  final String? strikerate;
  final String? runs;

  Batting({
    this.style,
    this.average,
    this.strikerate,
    this.runs,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
        style: styleValues.map[json["Style"]]!,
        average: json["Average"],
        strikerate: json["Strikerate"],
        runs: json["Runs"],
      );

  Map<String, dynamic> toJson() => {
        "Style": styleValues.reverse[style],
        "Average": average,
        "Strikerate": strikerate,
        "Runs": runs,
      };
}

enum Style { LHB, RHB }

final styleValues = EnumValues({"LHB": Style.LHB, "RHB": Style.RHB});

class Bowling {
  final String? style;
  final String? average;
  final String? economyrate;
  final String? wickets;

  Bowling({
    this.style,
    this.average,
    this.economyrate,
    this.wickets,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
        style: json["Style"],
        average: json["Average"],
        economyrate: json["Economyrate"],
        wickets: json["Wickets"],
      );

  Map<String, dynamic> toJson() => {
        "Style": style,
        "Average": average,
        "Economyrate": economyrate,
        "Wickets": wickets,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
