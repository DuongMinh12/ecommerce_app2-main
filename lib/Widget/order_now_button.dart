// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/checkout/checkout_bloc.dart';
// import '../constants/add_all.dart';
//
// class OrderNow extends StatelessWidget {
//   const OrderNow({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.black,
//       child: Container(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             BlocBuilder<CheckoutBloc, CheckoutState>(
//               builder: (context, state) {
//                 if (state is CheckoutLoading) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (state is CheckoutLoaded) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
//                     },
//                     child: Text(
//                       'ORDER NOW',
//                       style: txtfont18,
//                     ),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                   );
//                 } else {
//                   return Center(
//                     child: Text('Something went wrong'),
//                   );
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
