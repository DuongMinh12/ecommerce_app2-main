import 'package:ecommerce_app/Widget/Widget.dart';
import 'package:ecommerce_app/Widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/checkout/checkout_bloc.dart';
import '../../constants/add_all.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  static const String routeName = 'checkoutPage';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CheckoutPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emaiController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Checkout',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CheckoutPage.routeName);
                },
                child: Text(
                  'GO TO CHECKOUT',
                  style: txtfont18,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
          ),
        ),
      ), //OrderNow(),
      body: Padding(
        padding: EdgeInsets.all(20),
        // child: BlocBuilder<CheckoutBloc, CheckoutState>(
        //   builder: (context, state) {
        //     if (state is CheckoutLoading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (state is CheckoutLoaded) {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'CUSTOMER INFORMATION',
        //             style: txtfont16,
        //           ),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
        //           }, context, 'Email :'),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(name: value));
        //           }, context, 'Name :'),
        //           Text('DELIVERY INFORMATION', style: txtfont16),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
        //           }, context, 'Address :'),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
        //           }, context, 'City :'),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
        //           }, context, 'Country :'),
        //           _buildTextFormField((value) {
        //             context.read<CheckoutBloc>().add(UpdateCheckout(zipcode: value));
        //           }, context, 'Zip Code :'),
        //           Text('ORDER SUMMARY', style: txtfont16),
        //           OrderSummary(),
        //         ],
        //       );
        //     } else {
        //       return Center(
        //         child: Text('Something went wrong'),
        //       );
        //     }
        //   },
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: txtfont16,
            ),
            _buildTextFormField(
              //(value) {context.read<CheckoutBloc>().add(UpdateCheckout(email: value));}, context, 'Email :'
                 emaiController ,context, 'Email :'
            ),
            _buildTextFormField(
              //(value) {context.read<CheckoutBloc>().add(UpdateCheckout(name: value));}, context, 'Full Name :'
                 nameController, context, 'Name :'
            ),
            Text('DELIVERY INFORMATION', style: txtfont16),
            _buildTextFormField(
                    //(value) {context.read<CheckoutBloc>().add(UpdateCheckout(address: value));}, context, 'Address :'
                 addressController, context, 'Address :'
            ),
            _buildTextFormField(
             // (value) {context.read<CheckoutBloc>().add(UpdateCheckout(city: value));}, context, 'City :'
                cityController, context, 'City :'
            ),
            _buildTextFormField(
              //(value) {context.read<CheckoutBloc>().add(UpdateCheckout(country: value));}, context, 'Country :'
                 countryController, context, 'Country :'
            ),
            _buildTextFormField(
              //(value) {context.read<CheckoutBloc>().add(UpdateCheckout(zipcode: value));}, context, 'Zip Code :'
                 zipCodeController, context, 'Zip Code :'
            ),
            Text('ORDER SUMMARY', style: txtfont16),
            OrderSummary(),
          ],
        ),
      ),
    );
  }
}

 Padding _buildTextFormField(
  // Function(String)? onChanged,
     TextEditingController controller,
  BuildContext context,
  String labelText,
) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: txtfont14,
            ),
          ),
          Expanded(
            child: TextFormField(
               controller: controller,
              //onChanged: onChanged,
              decoration: InputDecoration(isDense: true, contentPadding: EdgeInsets.only(left: 10), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ],
      ),
  );
}
