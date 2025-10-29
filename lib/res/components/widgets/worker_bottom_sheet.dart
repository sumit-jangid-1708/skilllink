import 'package:flutter/material.dart';

class WorkerBottomSheet extends StatelessWidget {
  final String name;
  final VoidCallback onClose;

  const WorkerBottomSheet({
    super.key,
    required this.name,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(icon: const Icon(Icons.close),
                  onPressed: onClose
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text ("⭐ 4.0   |   ₹10/hour   |   18 min drive",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16,),
          const Expanded(child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/offerImage.png'),
              )
            ],
          ))
        ],
      ),
    );
  }
}
