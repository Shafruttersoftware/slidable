import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
enum Actions{sharre,delete,archieve}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = allUsers;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
          final user = users[index];

          return
              Slidable(
                key: Key(user.name),
                  startActionPane: ActionPane(
                      motion: StretchMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: ()=> _onDismissed(index,Actions.sharre),
                      ),
                      children: [SlidableAction(
                    backgroundColor: Colors.green,
                    icon: Icons.share,
                    label: "Share",
                    onPressed: (context)=> _onDismissed(index, Actions.sharre),
          ),
                  SlidableAction(
                    backgroundColor: Colors.blue,
                    icon: Icons.archive,
                    label: "Archieve",
                    onPressed: (context)=> _onDismissed(index, Actions.archieve),)
                  ]),
                  endActionPane: ActionPane(motion: BehindMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: ()=> _onDismissed(index,Actions.delete),
                      ),
                      children: [ SlidableAction(
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: "Delete",
                    onPressed: (context)=> _onDismissed(index,Actions.delete),)]),
                  child: buildUserListTile(user));
        },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showSnackBar(BuildContext context,String message,Color color){
    final snackBar = SnackBar(content: Text(message),backgroundColor: color,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUserListTile(User user) => Builder(
    builder:(context)=> ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        radius: 30,
        // backgroundImage: NetworkImage(user.image),model url image: "link"
      ),
      onTap: (){
        final slidable = Slidable.of(context)!;
        final isClosed =
            slidable.actionPaneType.value == ActionPaneType.none;
        if(isClosed){
          slidable.openStartActionPane();
        }else{
          slidable.close();
        }
      },
    ),
  );
  void _onDismissed(int index,Actions action) {
    final user = users[index];
    setState(() => users.removeAt(index));
    //remove {
}



}
class User{
  final String name;
  final String email;
  final String image;

  User(this.name, this.email, this.image,
);
}


final allUsers = [
  User("1", "1", "1"),
  User("16", "1j", "1hgb"),
  User("1kl", "1k", "1klh"),
];
class Agify {
  int? count;
  String? name;
  int? age;

  Agify({this.count, this.name, this.age});}