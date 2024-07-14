import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:task6/screens/custom_buttons_cubit.dart';
import 'package:task6/screens/custom_buttons_state.dart';
import 'package:task6/screens/fast_filter_bar_setstate.dart';
import 'package:task6/screens/radio.dart';
import 'package:task6/screens/fast_filter_bar_cubit.dart';
import 'package:task6/screens/password_hide.dart';
// this for filter bar using cubit...(task 1 )

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fast Filter Bar'),
//         ),
//         body: Center(
//           child: FastFilterBarUsingCubit(
//             items: ['تمت', 'تحت المراجعة', 'المكتملة', 'المعلقة', 'قيد التفيذ'],
//           ),
//         ),
//       ),
//     ),
//   );
// }

//this is for filter bar using setstate...

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fast Filter Bar using state'),
//         ),
//         body: Center(
//           child: FastFilterBarUsingState(
//             items: const [
//               'قيد التفيذ',
//               'المعلقة',
//               'المكتملة',
//               'تحت المراجعة',
//               'تمت'
//             ],
//             onItemTap: (item) {
//               if (kDebugMode) {
//                 print('Selected item: $item');
//               }
//             },
//           ),
//         ),
//       ),
//     ),
//   );
// }

// this for password_hide...

// void main() {
//   runApp(const PasswordHidden());
// }

// this for radio...

// void main() {
//   runApp(MaterialApp(
//     home: RadioSelectionScreen(),
//   ));
// }

// this for custom button. using state..

// void main(){
//   runApp(options());
// }

// this for custom button. using cubit ...

void main(){
  runApp(option());
}