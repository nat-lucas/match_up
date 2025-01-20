class Score {
  List<Leagues>? leagues;
  Season? season;
  Day? day;
  List<Events>? events;

  Score({this.leagues, this.season, this.day, this.events});

  Score.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues!.add(Leagues.fromJson(v));
      });
    }
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leagues != null) {
      data['leagues'] = leagues!.map((v) => v.toJson()).toList();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leagues {
  String? id;
  String? uid;
  String? name;
  String? abbreviation;
  String? slug;
  Season? season;
  List<Logos>? logos;
  String? calendarType;
  bool? calendarIsWhitelist;
  String? calendarStartDate;
  String? calendarEndDate;
  List<String>? calendar;

  Leagues(
      {this.id,
      this.uid,
      this.name,
      this.abbreviation,
      this.slug,
      this.season,
      this.logos,
      this.calendarType,
      this.calendarIsWhitelist,
      this.calendarStartDate,
      this.calendarEndDate,
      this.calendar});

  Leagues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    slug = json['slug'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['logos'] != null) {
      logos = <Logos>[];
      json['logos'].forEach((v) {
        logos!.add(Logos.fromJson(v));
      });
    }
    calendarType = json['calendarType'];
    calendarIsWhitelist = json['calendarIsWhitelist'];
    calendarStartDate = json['calendarStartDate'];
    calendarEndDate = json['calendarEndDate'];
    calendar = json['calendar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['slug'] = slug;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (logos != null) {
      data['logos'] = logos!.map((v) => v.toJson()).toList();
    }
    data['calendarType'] = calendarType;
    data['calendarIsWhitelist'] = calendarIsWhitelist;
    data['calendarStartDate'] = calendarStartDate;
    data['calendarEndDate'] = calendarEndDate;
    data['calendar'] = calendar;
    return data;
  }
}

class Season {
  int? year;
  String? startDate;
  String? endDate;
  String? displayName;
  Type? type;

  Season(
      {this.year, this.startDate, this.endDate, this.displayName, this.type});

  Season.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    displayName = json['displayName'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['displayName'] = displayName;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type {
  String? id;
  int? type;
  String? name;
  String? abbreviation;

  Type({this.id, this.type, this.name, this.abbreviation});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Logos {
  String? href;
  int? width;
  int? height;
  String? alt;
  List<String>? rel;
  String? lastUpdated;

  Logos(
      {this.href,
      this.width,
      this.height,
      this.alt,
      this.rel,
      this.lastUpdated});

  Logos.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    width = json['width'];
    height = json['height'];
    alt = json['alt'];
    rel = json['rel'].cast<String>();
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['width'] = width;
    data['height'] = height;
    data['alt'] = alt;
    data['rel'] = rel;
    data['lastUpdated'] = lastUpdated;
    return data;
  }
}

class Season2 {
  int? type;
  int? year;

  Season2({this.type, this.year});

  Season2.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['year'] = year;
    return data;
  }
}

class Day {
  String? date;

  Day({this.date});

  Day.fromJson(Map<String, dynamic> json) {
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    return data;
  }
}

class Events {
  String? id;
  String? uid;
  String? date;
  String? name;
  String? shortName;
  Season? season;
  List<Competitions>? competitions;
  List<Links>? links;
  Status? status;

  Events(
      {this.id,
      this.uid,
      this.date,
      this.name,
      this.shortName,
      this.season,
      this.competitions,
      this.links,
      this.status});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    date = json['date'];
    name = json['name'];
    shortName = json['shortName'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['competitions'] != null) {
      competitions = <Competitions>[];
      json['competitions'].forEach((v) {
        competitions!.add(Competitions.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['date'] = date;
    data['name'] = name;
    data['shortName'] = shortName;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (competitions != null) {
      data['competitions'] = competitions!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Season1 {
  int? year;
  int? type;
  String? slug;

  Season1({this.year, this.type, this.slug});

  Season1.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    type = json['type'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['type'] = type;
    data['slug'] = slug;
    return data;
  }
}

class Competitions {
  String? id;
  String? uid;
  String? date;
  int? attendance;
  Type? type;
  bool? timeValid;
  bool? neutralSite;
  bool? conferenceCompetition;
  bool? playByPlayAvailable;
  bool? recent;
  Venue? venue;
  List<Competitors>? competitors;
  List<Null>? notes;
  Status? status;
  List<Broadcasts>? broadcasts;
  Format? format;
  String? startDate;
  String? broadcast;
  List<GeoBroadcasts>? geoBroadcasts;
  List<Highlights>? highlights;
  List<Headlines>? headlines;

  Competitions(
      {this.id,
      this.uid,
      this.date,
      this.attendance,
      this.type,
      this.timeValid,
      this.neutralSite,
      this.conferenceCompetition,
      this.playByPlayAvailable,
      this.recent,
      this.venue,
      this.competitors,
      this.notes,
      this.status,
      this.broadcasts,
      this.format,
      this.startDate,
      this.broadcast,
      this.geoBroadcasts,
      this.highlights,
      this.headlines});

  Competitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    date = json['date'];
    attendance = json['attendance'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    timeValid = json['timeValid'];
    neutralSite = json['neutralSite'];
    conferenceCompetition = json['conferenceCompetition'];
    playByPlayAvailable = json['playByPlayAvailable'];
    recent = json['recent'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    if (json['competitors'] != null) {
      competitors = <Competitors>[];
      json['competitors'].forEach((v) {
        competitors!.add(Competitors.fromJson(v));
      });
    }
    if (json['notes'] != null) {
      notes = <Null>[];
      json['notes'].forEach((v) {});
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['broadcasts'] != null) {
      broadcasts = <Broadcasts>[];
      json['broadcasts'].forEach((v) {
        broadcasts!.add(Broadcasts.fromJson(v));
      });
    }
    format = json['format'] != null ? Format.fromJson(json['format']) : null;
    startDate = json['startDate'];
    broadcast = json['broadcast'];
    if (json['geoBroadcasts'] != null) {
      geoBroadcasts = <GeoBroadcasts>[];
      json['geoBroadcasts'].forEach((v) {
        geoBroadcasts!.add(GeoBroadcasts.fromJson(v));
      });
    }
    if (json['highlights'] != null) {
      highlights = <Highlights>[];
      json['highlights'].forEach((v) {
        highlights!.add(Highlights.fromJson(v));
      });
    }
    if (json['headlines'] != null) {
      headlines = <Headlines>[];
      json['headlines'].forEach((v) {
        headlines!.add(Headlines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['date'] = date;
    data['attendance'] = attendance;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['timeValid'] = timeValid;
    data['neutralSite'] = neutralSite;
    data['conferenceCompetition'] = conferenceCompetition;
    data['playByPlayAvailable'] = playByPlayAvailable;
    data['recent'] = recent;
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    if (competitors != null) {
      data['competitors'] = competitors!.map((v) => v.toJson()).toList();
    }
    if (notes != null) {}
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (broadcasts != null) {
      data['broadcasts'] = broadcasts!.map((v) => v.toJson()).toList();
    }
    if (format != null) {
      data['format'] = format!.toJson();
    }
    data['startDate'] = startDate;
    data['broadcast'] = broadcast;
    if (geoBroadcasts != null) {
      data['geoBroadcasts'] = geoBroadcasts!.map((v) => v.toJson()).toList();
    }
    if (highlights != null) {
      data['highlights'] = highlights!.map((v) => v.toJson()).toList();
    }
    if (headlines != null) {
      data['headlines'] = headlines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type1 {
  String? id;
  String? abbreviation;

  Type1({this.id, this.abbreviation});

  Type1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Venue {
  String? id;
  String? fullName;
  Address? address;
  bool? indoor;

  Venue({this.id, this.fullName, this.address, this.indoor});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    indoor = json['indoor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['indoor'] = indoor;
    return data;
  }
}

class Address {
  String? city;
  String? state;

  Address({this.city, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}

class Competitors {
  String? id;
  String? uid;
  String? type;
  int? order;
  String? homeAway;
  bool? winner;
  Venue? team;
  String? score;
  List<Linescores>? linescores;
  List<Statistics>? statistics;
  List<Leaders>? leaders;
  List<Records>? records;

  Competitors(
      {this.id,
      this.uid,
      this.type,
      this.order,
      this.homeAway,
      this.winner,
      this.team,
      this.score,
      this.linescores,
      this.statistics,
      this.leaders,
      this.records});

  Competitors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    type = json['type'];
    order = json['order'];
    homeAway = json['homeAway'];
    winner = json['winner'];
    team = json['team'] != null ? Venue.fromJson(json['team']) : null;
    score = json['score'];
    if (json['linescores'] != null) {
      linescores = <Linescores>[];
      json['linescores'].forEach((v) {
        linescores!.add(Linescores.fromJson(v));
      });
    }
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(Statistics.fromJson(v));
      });
    }
    if (json['leaders'] != null) {
      leaders = <Leaders>[];
      json['leaders'].forEach((v) {
        leaders!.add(Leaders.fromJson(v));
      });
    }
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['type'] = type;
    data['order'] = order;
    data['homeAway'] = homeAway;
    data['winner'] = winner;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['score'] = score;
    if (linescores != null) {
      data['linescores'] = linescores!.map((v) => v.toJson()).toList();
    }
    if (statistics != null) {
      data['statistics'] = statistics!.map((v) => v.toJson()).toList();
    }
    if (leaders != null) {
      data['leaders'] = leaders!.map((v) => v.toJson()).toList();
    }
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? id;
  String? uid;
  String? location;
  String? name;
  String? abbreviation;
  String? displayName;
  String? shortDisplayName;
  String? color;
  String? alternateColor;
  bool? isActive;
  Venue? venue;
  List<Links>? links;
  String? logo;

  Team(
      {this.id,
      this.uid,
      this.location,
      this.name,
      this.abbreviation,
      this.displayName,
      this.shortDisplayName,
      this.color,
      this.alternateColor,
      this.isActive,
      this.venue,
      this.links,
      this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    location = json['location'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    displayName = json['displayName'];
    shortDisplayName = json['shortDisplayName'];
    color = json['color'];
    alternateColor = json['alternateColor'];
    isActive = json['isActive'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['location'] = location;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['displayName'] = displayName;
    data['shortDisplayName'] = shortDisplayName;
    data['color'] = color;
    data['alternateColor'] = alternateColor;
    data['isActive'] = isActive;
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['logo'] = logo;
    return data;
  }
}

class Venue1 {
  String? id;

  Venue1({this.id});

  Venue1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Links {
  List<String>? rel;
  String? href;
  String? text;
  bool? isExternal;
  bool? isPremium;

  Links({this.rel, this.href, this.text, this.isExternal, this.isPremium});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'].cast<String>();
    href = json['href'];
    text = json['text'];
    isExternal = json['isExternal'];
    isPremium = json['isPremium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rel'] = rel;
    data['href'] = href;
    data['text'] = text;
    data['isExternal'] = isExternal;
    data['isPremium'] = isPremium;
    return data;
  }
}

class Linescores {
  int? value;

  Linescores({this.value});

  Linescores.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    return data;
  }
}

class Statistics {
  String? name;
  String? abbreviation;
  String? displayValue;

  Statistics({this.name, this.abbreviation, this.displayValue});

  Statistics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abbreviation = json['abbreviation'];
    displayValue = json['displayValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['displayValue'] = displayValue;
    return data;
  }
}

class Leaders {
  String? name;
  String? displayName;
  String? shortDisplayName;
  String? abbreviation;
  List<Leaders>? leaders;

  Leaders(
      {this.name,
      this.displayName,
      this.shortDisplayName,
      this.abbreviation,
      this.leaders});

  Leaders.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    shortDisplayName = json['shortDisplayName'];
    abbreviation = json['abbreviation'];
    if (json['leaders'] != null) {
      leaders = <Leaders>[];
      json['leaders'].forEach((v) {
        leaders!.add(Leaders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['shortDisplayName'] = shortDisplayName;
    data['abbreviation'] = abbreviation;
    if (leaders != null) {
      data['leaders'] = leaders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leaders1 {
  String? displayValue;
  double? value;
  Athlete? athlete;
  Venue? team;

  Leaders1({this.displayValue, this.value, this.athlete, this.team});

  Leaders1.fromJson(Map<String, dynamic> json) {
    displayValue = json['displayValue'];
    value = json['value'];
    athlete =
        json['athlete'] != null ? Athlete.fromJson(json['athlete']) : null;
    team = json['team'] != null ? Venue.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayValue'] = displayValue;
    data['value'] = value;
    if (athlete != null) {
      data['athlete'] = athlete!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}

class Athlete {
  String? id;
  String? fullName;
  String? displayName;
  String? shortName;
  List<Links>? links;
  String? headshot;
  String? jersey;
  Position? position;
  Venue? team;
  bool? active;

  Athlete(
      {this.id,
      this.fullName,
      this.displayName,
      this.shortName,
      this.links,
      this.headshot,
      this.jersey,
      this.position,
      this.team,
      this.active});

  Athlete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    displayName = json['displayName'];
    shortName = json['shortName'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    headshot = json['headshot'];
    jersey = json['jersey'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    team = json['team'] != null ? Venue.fromJson(json['team']) : null;
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['displayName'] = displayName;
    data['shortName'] = shortName;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['headshot'] = headshot;
    data['jersey'] = jersey;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['active'] = active;
    return data;
  }
}

class Links1 {
  List<String>? rel;
  String? href;

  Links1({this.rel, this.href});

  Links1.fromJson(Map<String, dynamic> json) {
    rel = json['rel'].cast<String>();
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rel'] = rel;
    data['href'] = href;
    return data;
  }
}

class Position {
  String? abbreviation;

  Position({this.abbreviation});

  Position.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Records {
  String? name;
  String? abbreviation;
  String? type;
  String? summary;

  Records({this.name, this.abbreviation, this.type, this.summary});

  Records.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abbreviation = json['abbreviation'];
    type = json['type'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abbreviation'] = abbreviation;
    data['type'] = type;
    data['summary'] = summary;
    return data;
  }
}

class Status {
  int? clock;
  String? displayClock;
  int? period;
  Type? type;

  Status({this.clock, this.displayClock, this.period, this.type});

  Status.fromJson(Map<String, dynamic> json) {
    clock = json['clock'];
    displayClock = json['displayClock'];
    period = json['period'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clock'] = clock;
    data['displayClock'] = displayClock;
    data['period'] = period;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type2 {
  String? id;
  String? name;
  String? state;
  bool? completed;
  String? description;
  String? detail;
  String? shortDetail;

  Type2(
      {this.id,
      this.name,
      this.state,
      this.completed,
      this.description,
      this.detail,
      this.shortDetail});

  Type2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    completed = json['completed'];
    description = json['description'];
    detail = json['detail'];
    shortDetail = json['shortDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state'] = state;
    data['completed'] = completed;
    data['description'] = description;
    data['detail'] = detail;
    data['shortDetail'] = shortDetail;
    return data;
  }
}

class Broadcasts {
  String? market;
  List<String>? names;

  Broadcasts({this.market, this.names});

  Broadcasts.fromJson(Map<String, dynamic> json) {
    market = json['market'];
    names = json['names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['names'] = names;
    return data;
  }
}

class Format {
  Regulation? regulation;

  Format({this.regulation});

  Format.fromJson(Map<String, dynamic> json) {
    regulation = json['regulation'] != null
        ? Regulation.fromJson(json['regulation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (regulation != null) {
      data['regulation'] = regulation!.toJson();
    }
    return data;
  }
}

class Regulation {
  int? periods;

  Regulation({this.periods});

  Regulation.fromJson(Map<String, dynamic> json) {
    periods = json['periods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['periods'] = periods;
    return data;
  }
}

class GeoBroadcasts {
  Type? type;
  Market? market;
  Media? media;
  String? lang;
  String? region;

  GeoBroadcasts({this.type, this.market, this.media, this.lang, this.region});

  GeoBroadcasts.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    market = json['market'] != null ? Market.fromJson(json['market']) : null;
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    lang = json['lang'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (market != null) {
      data['market'] = market!.toJson();
    }
    if (media != null) {
      data['media'] = media!.toJson();
    }
    data['lang'] = lang;
    data['region'] = region;
    return data;
  }
}

class Type3 {
  String? id;
  String? shortName;

  Type3({this.id, this.shortName});

  Type3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shortName'] = shortName;
    return data;
  }
}

class Market {
  String? id;
  String? type;

  Market({this.id, this.type});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Media {
  String? shortName;

  Media({this.shortName});

  Media.fromJson(Map<String, dynamic> json) {
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shortName'] = shortName;
    return data;
  }
}

class Highlights {
  int? id;
  String? cerebroId;
  String? source;
  String? headline;
  String? description;
  String? lastModified;
  String? originalPublishDate;
  int? duration;
  TimeRestrictions? timeRestrictions;
  DeviceRestrictions? deviceRestrictions;
  GeoRestrictions? geoRestrictions;
  String? thumbnail;
  Links? links;
  Ad? ad;
  Tracking? tracking;

  Highlights(
      {this.id,
      this.cerebroId,
      this.source,
      this.headline,
      this.description,
      this.lastModified,
      this.originalPublishDate,
      this.duration,
      this.timeRestrictions,
      this.deviceRestrictions,
      this.geoRestrictions,
      this.thumbnail,
      this.links,
      this.ad,
      this.tracking});

  Highlights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cerebroId = json['cerebroId'];
    source = json['source'];
    headline = json['headline'];
    description = json['description'];
    lastModified = json['lastModified'];
    originalPublishDate = json['originalPublishDate'];
    duration = json['duration'];
    timeRestrictions = json['timeRestrictions'] != null
        ? TimeRestrictions.fromJson(json['timeRestrictions'])
        : null;
    deviceRestrictions = json['deviceRestrictions'] != null
        ? DeviceRestrictions.fromJson(json['deviceRestrictions'])
        : null;
    geoRestrictions = json['geoRestrictions'] != null
        ? GeoRestrictions.fromJson(json['geoRestrictions'])
        : null;
    thumbnail = json['thumbnail'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    ad = json['ad'] != null ? Ad.fromJson(json['ad']) : null;
    tracking =
        json['tracking'] != null ? Tracking.fromJson(json['tracking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cerebroId'] = cerebroId;
    data['source'] = source;
    data['headline'] = headline;
    data['description'] = description;
    data['lastModified'] = lastModified;
    data['originalPublishDate'] = originalPublishDate;
    data['duration'] = duration;
    if (timeRestrictions != null) {
      data['timeRestrictions'] = timeRestrictions!.toJson();
    }
    if (deviceRestrictions != null) {
      data['deviceRestrictions'] = deviceRestrictions!.toJson();
    }
    if (geoRestrictions != null) {
      data['geoRestrictions'] = geoRestrictions!.toJson();
    }
    data['thumbnail'] = thumbnail;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (ad != null) {
      data['ad'] = ad!.toJson();
    }
    if (tracking != null) {
      data['tracking'] = tracking!.toJson();
    }
    return data;
  }
}

class TimeRestrictions {
  String? embargoDate;
  String? expirationDate;

  TimeRestrictions({this.embargoDate, this.expirationDate});

  TimeRestrictions.fromJson(Map<String, dynamic> json) {
    embargoDate = json['embargoDate'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embargoDate'] = embargoDate;
    data['expirationDate'] = expirationDate;
    return data;
  }
}

class DeviceRestrictions {
  String? type;
  List<String>? devices;

  DeviceRestrictions({this.type, this.devices});

  DeviceRestrictions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    devices = json['devices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['devices'] = devices;
    return data;
  }
}

class GeoRestrictions {
  String? type;
  List<String>? countries;

  GeoRestrictions({this.type, this.countries});

  GeoRestrictions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    countries = json['countries'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['countries'] = countries;
    return data;
  }
}

class Links2 {
  Web? web;
  Mobile? mobile;
  Api? api;
  Source? source;
  Dsi? sportscenter;

  Links2({this.web, this.mobile, this.api, this.source, this.sportscenter});

  Links2.fromJson(Map<String, dynamic> json) {
    web = json['web'] != null ? Web.fromJson(json['web']) : null;
    mobile = json['mobile'] != null ? Mobile.fromJson(json['mobile']) : null;
    api = json['api'] != null ? Api.fromJson(json['api']) : null;
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    sportscenter = json['sportscenter'] != null
        ? Dsi.fromJson(json['sportscenter'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (web != null) {
      data['web'] = web!.toJson();
    }
    if (mobile != null) {
      data['mobile'] = mobile!.toJson();
    }
    if (api != null) {
      data['api'] = api!.toJson();
    }
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (sportscenter != null) {
      data['sportscenter'] = sportscenter!.toJson();
    }
    return data;
  }
}

class Web {
  String? href;
  Dsi? self;
  Dsi? seo;

  Web({this.href, this.self, this.seo});

  Web.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    self = json['self'] != null ? Dsi.fromJson(json['self']) : null;
    seo = json['seo'] != null ? Dsi.fromJson(json['seo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (self != null) {
      data['self'] = self!.toJson();
    }
    if (seo != null) {
      data['seo'] = seo!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;
  Dsi? dsi;

  Self({this.href, this.dsi});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    dsi = json['dsi'] != null ? Dsi.fromJson(json['dsi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (dsi != null) {
      data['dsi'] = dsi!.toJson();
    }
    return data;
  }
}

class Dsi {
  String? href;

  Dsi({this.href});

  Dsi.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Mobile {
  String? href;
  Source? source;
  Dsi? alert;
  Dsi? streaming;
  Dsi? progressiveDownload;

  Mobile(
      {this.href,
      this.source,
      this.alert,
      this.streaming,
      this.progressiveDownload});

  Mobile.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    alert = json['alert'] != null ? Dsi.fromJson(json['alert']) : null;
    streaming =
        json['streaming'] != null ? Dsi.fromJson(json['streaming']) : null;
    progressiveDownload = json['progressiveDownload'] != null
        ? Dsi.fromJson(json['progressiveDownload'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (alert != null) {
      data['alert'] = alert!.toJson();
    }
    if (streaming != null) {
      data['streaming'] = streaming!.toJson();
    }
    if (progressiveDownload != null) {
      data['progressiveDownload'] = progressiveDownload!.toJson();
    }
    return data;
  }
}

class Api {
  Dsi? self;
  Dsi? artwork;

  Api({this.self, this.artwork});

  Api.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Dsi.fromJson(json['self']) : null;
    artwork = json['artwork'] != null ? Dsi.fromJson(json['artwork']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    if (artwork != null) {
      data['artwork'] = artwork!.toJson();
    }
    return data;
  }
}

class Source {
  String? href;
  Dsi? mezzanine;
  Dsi? flash;
  Dsi? hds;
  HLS? hLS;
  Dsi? hD;
  Dsi? full;

  Source(
      {this.href,
      this.mezzanine,
      this.flash,
      this.hds,
      this.hLS,
      this.hD,
      this.full});

  Source.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    mezzanine =
        json['mezzanine'] != null ? Dsi.fromJson(json['mezzanine']) : null;
    flash = json['flash'] != null ? Dsi.fromJson(json['flash']) : null;
    hds = json['hds'] != null ? Dsi.fromJson(json['hds']) : null;
    hLS = json['HLS'] != null ? HLS.fromJson(json['HLS']) : null;
    hD = json['HD'] != null ? Dsi.fromJson(json['HD']) : null;
    full = json['full'] != null ? Dsi.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (mezzanine != null) {
      data['mezzanine'] = mezzanine!.toJson();
    }
    if (flash != null) {
      data['flash'] = flash!.toJson();
    }
    if (hds != null) {
      data['hds'] = hds!.toJson();
    }
    if (hLS != null) {
      data['HLS'] = hLS!.toJson();
    }
    if (hD != null) {
      data['HD'] = hD!.toJson();
    }
    if (full != null) {
      data['full'] = full!.toJson();
    }
    return data;
  }
}

class HLS {
  String? href;
  Dsi? hD;

  HLS({this.href, this.hD});

  HLS.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    hD = json['HD'] != null ? Dsi.fromJson(json['HD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (hD != null) {
      data['HD'] = hD!.toJson();
    }
    return data;
  }
}

class Ad {
  String? sport;
  String? bundle;

  Ad({this.sport, this.bundle});

  Ad.fromJson(Map<String, dynamic> json) {
    sport = json['sport'];
    bundle = json['bundle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sport'] = sport;
    data['bundle'] = bundle;
    return data;
  }
}

class Tracking {
  String? sportName;
  String? leagueName;
  String? coverageType;
  String? trackingName;
  String? trackingId;

  Tracking(
      {this.sportName,
      this.leagueName,
      this.coverageType,
      this.trackingName,
      this.trackingId});

  Tracking.fromJson(Map<String, dynamic> json) {
    sportName = json['sportName'];
    leagueName = json['leagueName'];
    coverageType = json['coverageType'];
    trackingName = json['trackingName'];
    trackingId = json['trackingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sportName'] = sportName;
    data['leagueName'] = leagueName;
    data['coverageType'] = coverageType;
    data['trackingName'] = trackingName;
    data['trackingId'] = trackingId;
    return data;
  }
}

class Headlines {
  String? type;
  String? description;
  String? shortLinkText;
  List<Video>? video;

  Headlines({this.type, this.description, this.shortLinkText, this.video});

  Headlines.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    description = json['description'];
    shortLinkText = json['shortLinkText'];
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['description'] = description;
    data['shortLinkText'] = shortLinkText;
    if (video != null) {
      data['video'] = video!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  int? id;
  String? source;
  String? headline;
  String? thumbnail;
  int? duration;
  Tracking? tracking;
  DeviceRestrictions? deviceRestrictions;
  GeoRestrictions? geoRestrictions;
  Links? links;

  Video(
      {this.id,
      this.source,
      this.headline,
      this.thumbnail,
      this.duration,
      this.tracking,
      this.deviceRestrictions,
      this.geoRestrictions,
      this.links});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    headline = json['headline'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
    tracking =
        json['tracking'] != null ? Tracking.fromJson(json['tracking']) : null;
    deviceRestrictions = json['deviceRestrictions'] != null
        ? DeviceRestrictions.fromJson(json['deviceRestrictions'])
        : null;
    geoRestrictions = json['geoRestrictions'] != null
        ? GeoRestrictions.fromJson(json['geoRestrictions'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    data['headline'] = headline;
    data['thumbnail'] = thumbnail;
    data['duration'] = duration;
    if (tracking != null) {
      data['tracking'] = tracking!.toJson();
    }
    if (deviceRestrictions != null) {
      data['deviceRestrictions'] = deviceRestrictions!.toJson();
    }
    if (geoRestrictions != null) {
      data['geoRestrictions'] = geoRestrictions!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Links3 {
  String? language;
  List<String>? rel;
  String? href;
  String? text;
  String? shortText;
  bool? isExternal;
  bool? isPremium;

  Links3(
      {this.language,
      this.rel,
      this.href,
      this.text,
      this.shortText,
      this.isExternal,
      this.isPremium});

  Links3.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    rel = json['rel'].cast<String>();
    href = json['href'];
    text = json['text'];
    shortText = json['shortText'];
    isExternal = json['isExternal'];
    isPremium = json['isPremium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    data['rel'] = rel;
    data['href'] = href;
    data['text'] = text;
    data['shortText'] = shortText;
    data['isExternal'] = isExternal;
    data['isPremium'] = isPremium;
    return data;
  }
}
