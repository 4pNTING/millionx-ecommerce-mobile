import 'package:flutter/material.dart';

class HomeNewUserPromoBar extends StatelessWidget {
  const HomeNewUserPromoBar({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: const BoxDecoration(color: Color(0xCC151515)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ເຂົ້າສູ່ລະບົບແລ້ວລຸ້ນຮັບສຶດທິປະໂຫຍດຂາກການ ຄັ້ງແລກ!',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 92,
                  height: 17,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'New User Only',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 87,
            height: 30,
            child: Material(
              color: const Color(0xFFF43F5E),
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(4),
                child: const Center(
                  child: Text(
                    'ເຂົ້າສູ່ລະບົບ',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
