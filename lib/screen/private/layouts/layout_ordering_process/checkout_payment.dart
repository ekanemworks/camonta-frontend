import 'package:flutter/material.dart';

class CheckoutPayment extends StatefulWidget {
  @override
  _CheckoutPaymentState createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Check Out',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          Container(
            width: 60,
            height: 120,
            margin: const EdgeInsets.only(top: 3, bottom: 3, right: 10),
            // color: Colors.purple,
            // child: Image.asset('assets/default.png'),

            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    'assets/default_dp.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 5.0,
                  child: Container(
                    child:
                        Icon(Icons.more_horiz, color: Colors.white, size: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Wallet Card : START
                  // Wallet Card : START
                  Container(
                    height: 300,
                    // color: Colors.grey,
                    child: Column(
                      children: [
                        // top section
                        // top section
                        Container(
                          padding: EdgeInsets.all(18),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff343434), Color(0xff5C031D)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, Janet',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              // wallet balance section
                              Container(
                                alignment: Alignment.centerLeft,
                                width: double.maxFinite,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Color(0xff730B0B)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Wallet Balance',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      '₦ 200,700',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              // wallet balance section
                              Container(
                                alignment: Alignment.centerLeft,
                                width: double.maxFinite,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Cash Balance',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        const Text(
                                          '₦ 200,700',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Bonus Balance',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        const Text(
                                          '₦ 700',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // bottom section
                        // bottom section
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff000000), Color(0xff490318)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffC50303),
                                  borderRadius: BorderRadius.circular(23.0),
                                  border: Border.all(
                                    color: Color(0xffC50303),
                                  ),
                                ),
                                child: SizedBox(
                                  width: double.maxFinite, // <-- Your width
                                  height: 50,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Fund Wallet',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Wallet Card: END
                  // Wallet Card: END,

                  // Name of Food/ Item
                  // Name of Food/ Item
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Summary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number of Item(s)',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 150,
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item(s) price:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 150,
                        child: Text(
                          '₦ 1,100',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery (standard-fee):',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 150,
                        child: Text(
                          '₦ 500',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaction fee:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 150,
                        child: Text(
                          '₦ 0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // THE DOUBLE HORIZONTAL LINE
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchase total: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 150,
                        child: Text(
                          '₦ 1,100',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 30),
              // bottom: 0
              child: Container(
                height: 50,
                // width: 150,
                decoration: BoxDecoration(
                  color: Color(0xffC50303),
                  borderRadius: BorderRadius.circular(23.0),
                  border: Border.all(
                    color: Color(0xffC50303),
                  ),
                ),
                child: SizedBox(
                  width: double.maxFinite, // <-- Your width
                  height: 50,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Place Order',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Icon(
                        //   Icons.thumb_up_rounded,
                        //   color: Colors.white,
                        // )
                      ],
                    ),
                    onPressed: () {
                      openConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // START OF ORDER CONFIRMATION DIALOG
  // START OF ORDER CONFIRMATION DIALOG
  openConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xff411414),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 480,
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    image: DecorationImage(
                      image: AssetImage('assets/placeorder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Success',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: 180,
                  width: 350,
                  padding: EdgeInsets.only(bottom: 20),
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your order has been placed.',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Order ID',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Contact Support on WhatsApp +234',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffC50303),
                    borderRadius: BorderRadius.circular(23.0),
                    border: Border.all(
                      color: Color(0xffC50303),
                    ),
                  ),
                  child: SizedBox(
                    width: double.maxFinite, // <-- Your width
                    height: 50,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'okay',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onPressed: () {
                        openConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // END OF ORDER CONFIRMATION DIALOG
  // END OF ORDER CONFIRMATION DIALOG
}
