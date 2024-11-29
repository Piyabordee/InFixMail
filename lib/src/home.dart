import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min, // ทำให้ Row ใช้แค่พื้นที่ที่จำเป็น
          children: [
            Container(
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://lh3.googleusercontent.com/fife/ALs6j_GosQH_wnSZ2TOMzlrcdN1rGMsz6PfDXOfi2C8z_SQ0EplAf6u6lfPcGYaG7yr9qMBeD-kJXGbAM3dcCbhq-a6WWwoXG14-gQeAO_trvawDEId4bqolR1miT0VpmTDHEPZfWCT2QBKGOpDOvw1Utr5pIIYDvo0way1FoXfKRQSpbefeIqpBjWoKD_bodGFFarFzQw31s5Dd9gxYxbyqZlyStcVUqbflApIgeu7MFxc1hqjCdVP6u7JgO40OxFCbxTX7x8aTw-1D1jREh2vXF8s2tXYQonY6jZUcKmADvmFcau1XTJDdw4SdYewChs-T3JfBYoWjNHGopL74n2W5nRb99e6TvzPPeAni1odJzvg6eWV1ZHak2aUoZi9he8CxSzeCOmabf2S0L3CTRTv2yxr5wp7Ddl7EzHRMbtcdwBm9WAHxARZlp1WqBIEKhrcr1-G3XuYFj2lzGrxDWV6to1ilfsXHOUjUc_qP5B3NgVMwaNpF-26L-GnrFektOnfHu9_biV3diELYq7AfD-eIVRZ_8fqg7oA-CHmGyijRUMgqnNrzQyZA7x-0u_stAcsFed3EuKrj8bdusZibs0PsVh5d2AEDJHUJpZqXiMVMPD194TeHfRYHnF-PG6-OilPHat5CbuV4ow0OT17JcdfK_dh60Bk5jX_rub-7L0a7OOHYe2eB76t3BVGdHbzoATf8nOzKE0oLywrIZ-qon10YbJ7s7NIw-vBCTzMl8npXwoDQrOdh0NJUp6QJswWzikIzNKpiV4KXftNA2_nXDpfgGuDXUARd1Wz-zPvbMt6m6MacI7e-IgfUWPuBWIfmphigF5v8otW-d_kMRlUMAN16admIh-q1xXn-aZejleOYG0RBNCn7GYiMA_o9ryssNreprji6x-sHCyEUAlenDA_HoGP1Zo0Lav76OVjfTSJRib_7fk-fgREVwBpFvpjhf23BIBvYfJi6Q3f0Ce4poqPh7MZO7HRm8JHuJbW73CoOv-N2ZaqSSumQGnkwaVHyBSu1y6Lc9D6u5XqMEzrjN5GFMfbguRq5web6cx5S6EHVyfDAh90m4qJ1OoLqCDHYyr82RG40Ayv6JVbhNB3q3e9xNtx_1f1A-jneFejzWiT_WTWarBDzGsZwZlLU5mlV_vAhGTalzhINCv4KCkwk7Yb6Qetf2XsLUbbuKkb76hKA14LKIXEyFgbpi8C1D3IWOeQ5VggAjliYe1sjBJPl3_2QGRLMqhv8jcO0zzqAL6Mjja5bC5kluSGEdDPNv0Yf6YHzzU6qi6BUNLGsKmsI2VKs7g9HWY9vgqytb5_7QzdCTUBzwTWx7WkKvrE6L-XOKH9UzFgBca3KqcntOWuN6EE0j27uNZwEv_8CC-U3v0POg7FbtC4KIgt4o5cBlY1rTwXvDmVC8t4K20rkLnKKdSttFWPSHMwNhwXpnxwy7d9G2b98pUKLAObSAGJKA81ExmEP-cwjuixvRDd1zaQyk7bnkUwHKnxR3KwzHqjky0T3u66_1gv46loUiUCQnLtms9IoFY_lXI2v8aiohY3juCH6MBML78PmCloLi2sUY209M66pvU3hysXlD3363R32XCbFZ6YeW3OGD3xghLUfShDVWhd_Cez-ynRFsPbgv5mhq3sCvYor_F-3QupLvZ59K99RkGmd1t-UMi1BuuWj6A3cX2ej8AwDDB3iLBGOuF1Fe2rRXeIPgM1Qr0bsjc51"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              width: 90,
              height: 90,
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              mainAxisSize:
                  MainAxisSize.min, // ทำให้ Column ใช้แค่พื้นที่ที่จำเป็น
              children: [
                Text(
                  "เข้าสู่ระบบ",
                  style: GoogleFonts.kanit(
                    color: const Color(0xFF7FD858),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'INMAILFIX',
                  style: GoogleFonts.kanit(
                    color: const Color(0xFFFF96D5),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                        color: Color.fromARGB(255, 255, 2, 154),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false; // ตัวแปรของ checkbox

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 80, 0, 10),
                child: Text("รหัสประจำตัว",
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "ใส่รหัสประจำตัวของคุณ",
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2), // สีพื้นหลังใส
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))))
        ],
      ),
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 220, 0, 10),
                child: Text("รหัสสถานศึกษา",
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "ใส่รหัสสถานศึกษาของคุณ",
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2), // สีพื้นหลังใส
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))))
        ],
      ),
      Column(children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 330, 0, 0),
                child: Checkbox(
                    value: isChecked, // ตัวแปรอยู่บรรทัด 74
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? true;
                      });
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 331, 0, 0),
                child: Text('Rememebr me',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.white,
                    )))
          ],
        ),
      ]),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 390),
          child: Container(
            height: 57.0,
            width: 309,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 2, 152, 176), Color.fromARGB(255, 124, 216, 89)])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text("เข้าสู่ระบบ",style: GoogleFonts.kanit(color: Colors.white),),
            ),
          ),
        ),
      ),
            ],
          );
  }
}
