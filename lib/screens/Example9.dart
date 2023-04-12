import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model2(fullmodel).dart';
import '../services/api_service2(fullmodel).dart';

final apiProvider = Provider<ApiServices2>((ref) => ApiServices2());

final userDataProvider = FutureProvider<UserModel2>((ref) => ref.read(apiProvider).getUserData());

class Example9 extends ConsumerWidget {
  const Example9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User data'),
      ),
      body: userData.when(data: (data) {
        return ListView.builder(
          itemCount: data.data!.length,
          itemBuilder: (context,index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: data.data![index].avatar.toString(), name: '${data.data![index].firstName} ${data.data![index].lastName}', email: data.data![index].email.toString(),)));
              },
              child: ListTile(
                title: Text('${data.data![index].firstName} ${data.data![index].lastName}'),
                subtitle: Text(data.data![index].email.toString()),
                leading: CircleAvatar(backgroundImage: NetworkImage(data.data![index].avatar.toString()),),
              ),
            );
          },
        );
      },
          error: ((error, stackTrace) => Text(error.toString())), loading: () {
            return Center(child: CircularProgressIndicator(),);
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  const DetailScreen({Key? key, required this.image, required this.name, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail screen'),),
      body: Center(
        child: Column(
          children: [
            Image.network(image),
            Text('Name : $name'),
            Text('Email : $email'),
          ],
        ),
      ),
    );
  }
}

