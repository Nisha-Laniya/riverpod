import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/api_services.dart';

//FutureProvider(API CALLING)
final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final userDataProvider = FutureProvider<List<UserModel>>((ref) => ref.read(apiProvider).getUser());

class Example6 extends ConsumerWidget {
  const Example6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('User data'),
        ),
      body: userData.when(data: (data) {
        return ListView.builder(
         itemCount: data.length,
          itemBuilder: (context,index) {
           return ListTile(
             title: Text('${data[index].firstName} ${data[index].lastName}'),
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
