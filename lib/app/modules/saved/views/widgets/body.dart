import 'package:flutter/cupertino.dart';
import 'package:jobs_flutter_app/app/modules/saved/views/widgets/saved_jobs.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SavedJobs()

    );
  }
}
