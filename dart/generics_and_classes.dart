main() {
  WeatherRepository weatherRepository = new WeatherRepository();
  print('fetch 1:');
  print(fetchWeathers(weatherRepository));
  print('local 1:');
  weatherRepository.printLocal(); //example of a simple ext
  print('fetch 2:');
  print(fetchWeathers(weatherRepository));
  print('local 2:');
  weatherRepository.printLocal();
  print('fetch 3:');
  print(fetchWeathers(weatherRepository));
  print('local 3:');
  weatherRepository.printLocal();
}

fetchWeathers(WeatherRepository repo) {
  return repo.getRemote().map((e) => e.toString());
}

//----------------------------------------------------------------
//---------------------------DOMAIN-------------------------------
class City {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  City(this.id, this.name, this.latitude, this.longitude);
}

class Weather {
  final int id;
  final int condition;
  final City city;

  Weather(this.id, this.condition, this.city);

  @override
  String toString() {
    var condition = this.condition.let((it) {
      if (it == 1) return "Windy";
      if (it == 2) return "Rainy";
      if (it == 3) return "Sunny";
    });
    return '[${id}]: Weather in the city of ${city.name} is ${condition}';
  }
}

class Response<T> {
  final int code;
  final String message;
  T? data;

  Response(this.code, this.message, this.data);
}

abstract class Repository<T> {
  List<T> getLocal();
  List<T> getRemote();
}

abstract class Dao<T> {
  List<T> getAll();
  T get(int id);
  void add(T data);
  T update(T data);
  void remove(int id);
}

abstract class HttpInterface<T> {
  Response<List<T>> fetch();
}

//----------------------------------------------------------------
//-----------------------------DATA-------------------------------

class WeatherDao implements Dao<Weather> {
  List<Weather> _weather = List.empty(growable: true);

  @override
  void add(Weather data) => _weather.add(data);

  @override
  Weather get(int id) => _weather.firstWhere((element) => element.id == id);

  @override
  List<Weather> getAll() => _weather;

  @override
  void remove(int id) => _weather.removeWhere((element) => element.id == id);

  @override
  Weather update(Weather data) {
    remove(data.id);
    add(data);
    return get(data.id);
  }
}

class WeatherAPI implements HttpInterface<Weather> {
  // mock data
  List<Weather> _weatherList = [
    Weather(1, 1, City(1, "Bandung", 123, 213)),
    Weather(2, 3, City(2, "Jakarta", 123, 213)),
    Weather(3, 2, City(2, "Jakarta", 123, 213)),
    Weather(4, 3, City(3, "Surabaya", 123, 213)),
    Weather(5, 3, City(2, "Jakarta", 123, 213)),
    Weather(6, 1, City(1, "Bandung", 123, 213)),
  ];

  @override
  Response<List<Weather>> fetch() {
    if (_weatherList.length < 3) {
      return Response(404, "EOF", null);
    }

    var data = _weatherList.take(3).toList();
    _weatherList.removeRange(0, 3);

    return Response(200, "Success", data);
  }
}

class WeatherRepository implements Repository<Weather> {
  final Dao<Weather> _dao = WeatherDao();
  final HttpInterface<Weather> _http = WeatherAPI();

  @override
  List<Weather> getLocal() {
    return _dao.getAll();
  }

  @override
  List<Weather> getRemote() {
    return _http.fetch().data.let((it) {
      if (it == null) return List.empty();

      it.forEach((e) => _dao.add(e));

      return it.map((e) => Weather(e.id, e.condition, e.city)).toList();
    });
  }
}

// extensions
extension DartExt<T> on T {
  R let<R>(R Function(T it) x) => x(this);
}

extension Repo<V> on Repository<V> {
  void printLocal() {
    this.getLocal().map((e) => e.toString()).let((it) => print(it));
  }
}
