//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class Records extends StatefulWidget {
//
//
//   Records({
//     Key? key,,
//   }) : super(key: key);
//
//   @override
//   State<Records> createState() => _RecordsState();
// }
//
// class _RecordsState extends State<Records> {
// List? reciptsList;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Container(
//           height: 0.25.sh,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Form(
//             //autovalidateMode: AutovalidateMode.onUserInteraction,
//
//             child: ListView.separated(
//              // itemCount: reciptsList?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final record = reciptsList[index];
//                 return Column(
//                   children: <Widget>[
//                     RecordItem(
//                       key: ValueKey(record.documentNo),
//                       record: record,
//                       deleterecord: () => widget.deleterecord(index),
//                       updateAmount: (newValue) {
//                         // Call the callback function with index and new value
//                         widget.updateAmount(index, newValue);
//                       },
//                       // Pass the callback function
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (context, index) => Divider(
//                 color: Theme.of(context).colorScheme.grey,
//               ),
//             ),
//           ),
//         ));
//   }
// }
