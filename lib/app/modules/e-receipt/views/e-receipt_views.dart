import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../controllers/e-receipt_controller.dart';

class EreceiptView extends GetView<EreceiptController> {
  const EreceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('E-Receipt'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BarcodeWidget(
                barcode: Barcode.code128(),
                data: controller.transactionId,
                height: 100,
              ),
              const SizedBox(height: 20),
              _buildSection('Service', [
                _buildInfoRow('Service Name', controller.serviceName),
                _buildInfoRow('Service Provider', controller.serviceProvider),
                _buildInfoRow('Booking Date', controller.bookingDate),
              ]),
              _buildDivider(),
              _buildSection('Amount', [
                _buildInfoRow('Amount', '\$${controller.amount}'),
                _buildInfoRow('Tax & Fees', '\$${controller.taxAndFees}'),
              ]),
              _buildDivider(),
              _buildInfoRow('Total', '\$${controller.total}', isBold: true),
              _buildDivider(),
              _buildSection('', [
                _buildInfoRow('Name', controller.name),
                _buildInfoRow('Phone Number', controller.phoneNumber),
                _buildInfoRow('Transaction ID', controller.transactionId),
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.downloadReceipt,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Download E-Receipt'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...children,
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 20, thickness: 1);
  }
}
