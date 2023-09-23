import 'package:localstorage/localstorage.dart';

import '../models/User.dart';

class VofoStorage {
  final LocalStorage storage = new LocalStorage('vofo.json');

  saveToStorage(User user) async {
    storage.setItem('user', user.toJSONEncodable());
    await storage.ready;
  }

  getUserFromStorage() async {
    var jsonUser =  storage.getItem('user');
    await storage.ready;
    print(jsonUser);
    if(jsonUser != null){
      print('if');
      return User.toUserObject(jsonUser);
    }else {
      print('else');
      return null;
    }
  }

  getToken() {
    return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2IzNmE1NzhkNjFjMzNlOGFkMDU4YiIsIm5hbWUiOiJzaG9haWIzIiwidXNlcm5hbWUiOiJzaG9haWJ1c2VybmFtZTMiLCJlbWFpbCI6IiIsImlhdCI6MTY5NTQ2NDMyMH0.1L_3U_ijNGBi8igNghFWp3dmO3e5v45UQ_N4MNfSnZU";
  }


}