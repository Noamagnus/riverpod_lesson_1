import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  late Database _instance; //This is the object returned after we open database
  Database get instance => _instance;
// This is "Flag field" means flagging if something is not right
  bool _hasBeenInitialized = false;

// Thing that we'll do in initState we're gonna do in this init method
// Here we initialize and open database
  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;
    final dbDirectory = await getApplicationDocumentsDirectory();
    // In case that dbDirectory doesn't exist we need to create it
    // and if it already exist than nothing will happen
    dbDirectory.create(recursive: true);
    final dbPath = join(dbDirectory.path, 'db.bandits');
    //Finally we're opening database
    _instance = await databaseFactoryIo.openDatabase(dbPath);
  }
}

// NOTE: late means its that field is not nullable but initially is not gonna 
// contain any value