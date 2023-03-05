import 'package:eary/modules/authontication/model/user.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return ModelStreamGetBuilder<UserModel>(
        // query: (q) => q.where('displayName', isLessThanOrEqualTo: searchValue),
        builder: (_, snapshot) {
      return Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                    // print(searchValue.length);
                    // print(searchValue);
                    // print(userModel.toMap);
                  });
                },
                decoration: const InputDecoration(hintText: 'Search'),
              ),
              SizedBox(
                height: 8.h,
              ),
              searchValue.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            String? userName = snapshot.data?[index]?.userName;
                            // print(snapshot.data?[index]?.userName);
                            UserModel? userModel = snapshot.data?[index];
                            return Card(
                              elevation: 4,
                              // margin: EdgeInsets.all(20),
                              color: Theme.of(context).cardColor,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (userName!.contains(searchValue))
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              userModel?.userName ?? '',
                                              style: TextStyle(
                                                  height: 1.5.h,
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            );
                          }),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}