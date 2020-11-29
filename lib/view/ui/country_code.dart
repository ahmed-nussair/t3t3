import 'package:flutter/material.dart';
import 'screen_util.dart';

class CountryCode extends StatefulWidget {
  final Function(String, String) onCountryCodeSelected;

  CountryCode({@required this.onCountryCodeSelected});

  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  List _list;

  @override
  void initState() {
    _list = countryCodes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setWidth(50)),
                topRight: Radius.circular(ScreenUtil().setWidth(50)),
              ),
              color: Color(0xff9b7448),
            ),
            child: Text(
              'Select Country Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(50),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              if (value.trim().isEmpty) {
                setState(() {
                  _list = countryCodes;
                });
                return;
              }
              List newList = List();
              for (var item in countryCodes) {
                String name = item['name'];

                if (name.toLowerCase().contains(value.toLowerCase())) {
                  newList.add(item);
                }

                setState(() {
                  _list = newList;
                });
              }
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                hintText: 'Search'),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(_list.length, (index) {
                return _countryCodeItem(index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _countryCodeItem(int index) {
    return GestureDetector(
      onTap: () {
        widget.onCountryCodeSelected(
            '${_list[index]['name']}', '+${_list[index]['code']}');
        Navigator.of(context).pop();
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  child: Image.asset(
                    _list[index]['flag'],
                    width: ScreenUtil().setWidth(100),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text(
                      _list[index]['name'],
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(40),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '+${_list[index]['code']}',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

final countryCodes = [
  {"name": "Afghanistan", "code": "93", "flag": "assets/flags/afg.png"},
  {"name": "Åland Islands", "code": "358", "flag": "assets/flags/ala.png"},
  {"name": "Albania", "code": "355", "flag": "assets/flags/alb.png"},
  {"name": "Algeria", "code": "213", "flag": "assets/flags/dza.png"},
  {"name": "American Samoa", "code": "1684", "flag": "assets/flags/asm.png"},
  {"name": "Andorra", "code": "376", "flag": "assets/flags/and.png"},
  {"name": "Angola", "code": "244", "flag": "assets/flags/ago.png"},
  {"name": "Anguilla", "code": "1264", "flag": "assets/flags/aia.png"},
  {"name": "Antarctica", "code": "672", "flag": "assets/flags/ata.png"},
  {
    "name": "Antigua and Barbuda",
    "code": "1268",
    "flag": "assets/flags/atg.png"
  },
  {"name": "Argentina", "code": "54", "flag": "assets/flags/arg.png"},
  {"name": "Armenia", "code": "374", "flag": "assets/flags/arm.png"},
  {"name": "Aruba", "code": "297", "flag": "assets/flags/abw.png"},
  {"name": "Australia", "code": "61", "flag": "assets/flags/aus.png"},
  {"name": "Austria", "code": "43", "flag": "assets/flags/aut.png"},
  {"name": "Azerbaijan", "code": "994", "flag": "assets/flags/aze.png"},
  {"name": "Bahamas", "code": "1242", "flag": "assets/flags/bhs.png"},
  {"name": "Bahrain", "code": "973", "flag": "assets/flags/bhr.png"},
  {"name": "Bangladesh", "code": "880", "flag": "assets/flags/bgd.png"},
  {"name": "Barbados", "code": "1246", "flag": "assets/flags/brb.png"},
  {"name": "Belarus", "code": "375", "flag": "assets/flags/blr.png"},
  {"name": "Belgium", "code": "32", "flag": "assets/flags/bel.png"},
  {"name": "Belize", "code": "501", "flag": "assets/flags/blz.png"},
  {"name": "Benin", "code": "229", "flag": "assets/flags/ben.png"},
  {"name": "Bermuda", "code": "1441", "flag": "assets/flags/bmu.png"},
  {"name": "Bhutan", "code": "975", "flag": "assets/flags/btn.png"},
  {"name": "Bolivia", "code": "591", "flag": "assets/flags/bol.png"},
  {
    "name": "BosniaandHerzegovina",
    "code": "387",
    "flag": "assets/flags/bih.png"
  },
  {"name": "Botswana", "code": "267", "flag": "assets/flags/bwa.png"},
  {"name": "Brazil", "code": "55", "flag": "assets/flags/bra.png"},
  {
    "name": "British Indian Ocean Territory",
    "code": "246",
    "flag": "assets/flags/iot.png"
  },
  {"name": "Brunei Darussalam", "code": "673", "flag": "assets/flags/brn.png"},
  {"name": "Bulgaria", "code": "359", "flag": "assets/flags/bgr.png"},
  {"name": "Burkina Faso", "code": "226", "flag": "assets/flags/bfa.png"},
  {"name": "Burundi", "code": "257", "flag": "assets/flags/bdi.png"},
  {"name": "Cabo Verde", "code": "238", "flag": "assets/flags/cpv.png"},
  {"name": "Cambodia", "code": "855", "flag": "assets/flags/khm.png"},
  {"name": "Cameroon", "code": "237", "flag": "assets/flags/cmr.png"},
  {"name": "Canada", "code": "1", "flag": "assets/flags/can.png"},
  {
    "name": "Caribbean Netherlands",
    "code": "5997",
    "flag": "assets/flags/bes.png"
  },
  {"name": "Cayman Islands", "code": "1345", "flag": "assets/flags/cym.png"},
  {"name": "CÃ´ted'Ivoire", "code": "225", "flag": "assets/flags/civ.png"},
  {
    "name": "Central African Republic",
    "code": "236",
    "flag": "assets/flags/caf.png"
  },
  {"name": "Chad", "code": "235", "flag": "assets/flags/tcd.png"},
  {"name": "Chile", "code": "56", "flag": "assets/flags/chl.png"},
  {"name": "China", "code": "86", "flag": "assets/flags/chn.png"},
  {"name": "Christmas Island", "code": "61", "flag": "assets/flags/cxr.png"},
  {"name": "Cocos Islands", "code": "61", "flag": "assets/flags/cck.png"},
  {"name": "Colombia", "code": "57", "flag": "assets/flags/col.png"},
  {"name": "Comoros", "code": "269", "flag": "assets/flags/com.png"},
  {"name": "Congo", "code": "242", "flag": "assets/flags/cog.png"},
  {"name": "Cook Islands", "code": "682", "flag": "assets/flags/cok.png"},
  {"name": "Costa Rica", "code": "506", "flag": "assets/flags/cri.png"},
  {"name": "Croatia", "code": "385", "flag": "assets/flags/hrv.png"},
  {"name": "Cuba", "code": "53", "flag": "assets/flags/cub.png"},
  {"name": "Cura Ã§ao", "code": "599", "flag": "assets/flags/cuw.png"},
  {"name": "Cyprus", "code": "357", "flag": "assets/flags/cyp.png"},
  {"name": "Czech Republic", "code": "420", "flag": "assets/flags/cze.png"},
  {
    "name": "Democratic Republic of the Congo",
    "code": "243",
    "flag": "assets/flags/cod.png"
  },
  {"name": "Denmark", "code": "45", "flag": "assets/flags/dnk.png"},
  {"name": "Djibouti", "code": "253", "flag": "assets/flags/dji.png"},
  {"name": "Dominica", "code": "1767", "flag": "assets/flags/dma.png"},
  {
    "name": "Dominican Republic",
    "code": "1809",
    "flag": "assets/flags/dom.png"
  },
  {"name": "Ecuador", "code": "593", "flag": "assets/flags/ecu.png"},
  {"name": "Egypt", "code": "20", "flag": "assets/flags/egy.png"},
  {"name": "El Salvador", "code": "503", "flag": "assets/flags/slv.png"},
  {"name": "Equatorial Guinea", "code": "240", "flag": "assets/flags/gnq.png"},
  {"name": "Eritrea", "code": "291", "flag": "assets/flags/eri.png"},
  {"name": "Estonia", "code": "372", "flag": "assets/flags/est.png"},
  {"name": "Ethiopia", "code": "251", "flag": "assets/flags/eth.png"},
  {
    "name": "Falkland Islands (Malvinas)",
    "code": "500",
    "flag": "assets/flags/flk.png"
  },
  {"name": "Faroe Islands", "code": "298", "flag": "assets/flags/fro.png"},
  {"name": "Fiji", "code": "679", "flag": "assets/flags/fji.png"},
  {"name": "Finland", "code": "358", "flag": "assets/flags/fin.png"},
  {"name": "France", "code": "33", "flag": "assets/flags/fra.png"},
  {"name": "French Guiana", "code": "594", "flag": "assets/flags/guf.png"},
  {"name": "French Polynesia", "code": "689", "flag": "assets/flags/pyf.png"},
  {"name": "Gabon", "code": "241", "flag": "assets/flags/gab.png"},
  {"name": "Gambia", "code": "220", "flag": "assets/flags/gmb.png"},
  {"name": "Georgia", "code": "995", "flag": "assets/flags/geo.png"},
  {"name": "Germany", "code": "49", "flag": "assets/flags/deu.png"},
  {"name": "Ghana", "code": "233", "flag": "assets/flags/gha.png"},
  {"name": "Gibraltar", "code": "350", "flag": "assets/flags/gib.png"},
  {"name": "Greece", "code": "30", "flag": "assets/flags/grc.png"},
  {"name": "Greenland", "code": "299", "flag": "assets/flags/grl.png"},
  {"name": "Grenada", "code": "1473", "flag": "assets/flags/grd.png"},
  {"name": "Guadeloupe", "code": "590", "flag": "assets/flags/glp.png"},
  {"name": "Guam", "code": "1671", "flag": "assets/flags/gum.png"},
  {"name": "Guatemala", "code": "502", "flag": "assets/flags/gtm.png"},
  {"name": "Guernsey", "code": "44", "flag": "assets/flags/ggy.png"},
  {"name": "Guinea", "code": "224", "flag": "assets/flags/gin.png"},
  {"name": "Guinea-Bissau", "code": "245", "flag": "assets/flags/gnb.png"},
  {"name": "Guyana", "code": "592", "flag": "assets/flags/guy.png"},
  {"name": "Haiti", "code": "509", "flag": "assets/flags/hti.png"},
  {"name": "HolySee", "code": "379", "flag": "assets/flags/vat.png"},
  {"name": "Honduras", "code": "504", "flag": "assets/flags/hnd.png"},
  {"name": "HongKong", "code": "852", "flag": "assets/flags/hkg.png"},
  {"name": "Hungary", "code": "36", "flag": "assets/flags/hun.png"},
  {"name": "Iceland", "code": "354", "flag": "assets/flags/isl.png"},
  {"name": "India", "code": "91", "flag": "assets/flags/ind.png"},
  {"name": "Indonesia", "code": "62", "flag": "assets/flags/idn.png"},
  {"name": "Iran", "code": "98", "flag": "assets/flags/irn.png"},
  {"name": "Iraq", "code": "964", "flag": "assets/flags/irq.png"},
  {"name": "Ireland", "code": "353", "flag": "assets/flags/irl.png"},
  {"name": "Isle of Man", "code": "44", "flag": "assets/flags/imn.png"},
  {"name": "Israel", "code": "972", "flag": "assets/flags/isr.png"},
  {"name": "Italy", "code": "39", "flag": "assets/flags/ita.png"},
  {"name": "Jamaica", "code": "1876", "flag": "assets/flags/jam.png"},
  {"name": "Japan", "code": "81", "flag": "assets/flags/jpn.png"},
  {"name": "Jersey", "code": "44", "flag": "assets/flags/jey.png"},
  {"name": "Jordan", "code": "962", "flag": "assets/flags/jor.png"},
  {"name": "Kazakhstan", "code": "76", "flag": "assets/flags/kaz.png"},
  {"name": "Kenya", "code": "254", "flag": "assets/flags/ken.png"},
  {"name": "Kiribati", "code": "686", "flag": "assets/flags/kir.png"},
  {"name": "Korea", "code": "850", "flag": "assets/flags/prk.png"},
  {"name": "Korea", "code": "82", "flag": "assets/flags/kor.png"},
  {"name": "Kosovo", "code": "383", "flag": "assets/flags/kos.png"},
  {"name": "Kuwait", "code": "965", "flag": "assets/flags/kwt.png"},
  {"name": "Kyrgyzstan", "code": "996", "flag": "assets/flags/kgz.png"},
  {
    "name": "Lao People's Democratic Republic",
    "code": "856",
    "flag": "assets/flags/lao.png"
  },
  {"name": "Latvia", "code": "371", "flag": "assets/flags/lva.png"},
  {"name": "Lebanon", "code": "961", "flag": "assets/flags/lbn.png"},
  {"name": "Lesotho", "code": "266", "flag": "assets/flags/lso.png"},
  {"name": "Liberia", "code": "231", "flag": "assets/flags/lbr.png"},
  {"name": "Libya", "code": "218", "flag": "assets/flags/lby.png"},
  {"name": "Liechtenstein", "code": "423", "flag": "assets/flags/lie.png"},
  {"name": "Lithuania", "code": "370", "flag": "assets/flags/ltu.png"},
  {"name": "Luxembourg", "code": "352", "flag": "assets/flags/lux.png"},
  {"name": "Macao", "code": "853", "flag": "assets/flags/mac.png"},
  {"name": "Macedonia", "code": "389", "flag": "assets/flags/mkd.png"},
  {"name": "Madagascar", "code": "261", "flag": "assets/flags/mdg.png"},
  {"name": "Malawi", "code": "265", "flag": "assets/flags/mwi.png"},
  {"name": "Malaysia", "code": "60", "flag": "assets/flags/mys.png"},
  {"name": "Maldives", "code": "960", "flag": "assets/flags/mdv.png"},
  {"name": "Mali", "code": "223", "flag": "assets/flags/mli.png"},
  {"name": "Malta", "code": "356", "flag": "assets/flags/mlt.png"},
  {"name": "MarshallIslands", "code": "692", "flag": "assets/flags/mhl.png"},
  {"name": "Martinique", "code": "596", "flag": "assets/flags/mtq.png"},
  {"name": "Mauritania", "code": "222", "flag": "assets/flags/mrt.png"},
  {"name": "Mauritius", "code": "230", "flag": "assets/flags/mus.png"},
  {"name": "Mayotte", "code": "262", "flag": "assets/flags/myt.png"},
  {"name": "Mexico", "code": "52", "flag": "assets/flags/mex.png"},
  {"name": "Micronesia", "code": "691", "flag": "assets/flags/fsm.png"},
  {"name": "Moldova", "code": "373", "flag": "assets/flags/mda.png"},
  {"name": "Monaco", "code": "377", "flag": "assets/flags/mco.png"},
  {"name": "Mongolia", "code": "976", "flag": "assets/flags/mng.png"},
  {"name": "Montenegro", "code": "382", "flag": "assets/flags/mne.png"},
  {"name": "Montserrat", "code": "1664", "flag": "assets/flags/msr.png"},
  {"name": "Morocco", "code": "212", "flag": "assets/flags/mar.png"},
  {"name": "Mozambique", "code": "258", "flag": "assets/flags/moz.png"},
  {"name": "Myanmar", "code": "95", "flag": "assets/flags/mmr.png"},
  {"name": "Namibia", "code": "264", "flag": "assets/flags/nam.png"},
  {"name": "Nauru", "code": "674", "flag": "assets/flags/nru.png"},
  {"name": "Nepal", "code": "977", "flag": "assets/flags/npl.png"},
  {"name": "Netherlands", "code": "31", "flag": "assets/flags/nld.png"},
  {"name": "New Caledonia", "code": "687", "flag": "assets/flags/ncl.png"},
  {"name": "New Zealand", "code": "64", "flag": "assets/flags/nzl.png"},
  {"name": "Nicaragua", "code": "505", "flag": "assets/flags/nic.png"},
  {"name": "Niger", "code": "227", "flag": "assets/flags/ner.png"},
  {"name": "Nigeria", "code": "234", "flag": "assets/flags/nga.png"},
  {"name": "Niue", "code": "683", "flag": "assets/flags/niu.png"},
  {"name": "Norfolk Island", "code": "672", "flag": "assets/flags/nfk.png"},
  {
    "name": "Northern Mariana Islands",
    "code": "1670",
    "flag": "assets/flags/mnp.png"
  },
  {"name": "Norway", "code": "47", "flag": "assets/flags/nor.png"},
  {"name": "Oman", "code": "968", "flag": "assets/flags/omn.png"},
  {"name": "Pakistan", "code": "92", "flag": "assets/flags/pak.png"},
  {"name": "Palau", "code": "680", "flag": "assets/flags/plw.png"},
  {"name": "Palestine", "code": "970", "flag": "assets/flags/pse.png"},
  {"name": "Panama", "code": "507", "flag": "assets/flags/pan.png"},
  {"name": "Papua New Guinea", "code": "675", "flag": "assets/flags/png.png"},
  {"name": "Paraguay", "code": "595", "flag": "assets/flags/pry.png"},
  {"name": "Peru", "code": "51", "flag": "assets/flags/per.png"},
  {"name": "Philippines", "code": "63", "flag": "assets/flags/phl.png"},
  {"name": "Pitcairn", "code": "64", "flag": "assets/flags/pcn.png"},
  {"name": "Poland", "code": "48", "flag": "assets/flags/pol.png"},
  {"name": "Portugal", "code": "351", "flag": "assets/flags/prt.png"},
  {"name": "Puerto Rico", "code": "1787", "flag": "assets/flags/pri.png"},
  {"name": "Qatar", "code": "974", "flag": "assets/flags/qat.png"},
  {"name": "RÃ©union", "code": "262", "flag": "assets/flags/reu.png"},
  {"name": "Romania", "code": "40", "flag": "assets/flags/rou.png"},
  {"name": "Russian Federation", "code": "7", "flag": "assets/flags/rus.png"},
  {"name": "Rwanda", "code": "250", "flag": "assets/flags/rwa.png"},
  {"name": "Saint BarthÃ©lemy", "code": "590", "flag": "assets/flags/blm.png"},
  {"name": "Saint Helena", "code": "290", "flag": "assets/flags/shn.png"},
  {
    "name": "Saint Kitts and Nevis",
    "code": "1869",
    "flag": "assets/flags/kna.png"
  },
  {"name": "Saint Lucia", "code": "1758", "flag": "assets/flags/lca.png"},
  {"name": "Saint Martin", "code": "590", "flag": "assets/flags/maf.png"},
  {
    "name": "Saint Pierre and Miquelon",
    "code": "508",
    "flag": "assets/flags/spm.png"
  },
  {
    "name": "Saint Vincent and the Grenadines",
    "code": "1784",
    "flag": "assets/flags/vct.png"
  },
  {"name": "Samoa", "code": "685", "flag": "assets/flags/wsm.png"},
  {"name": "San Marino", "code": "378", "flag": "assets/flags/smr.png"},
  {
    "name": "Sao Tome and Principe",
    "code": "239",
    "flag": "assets/flags/stp.png"
  },
  {"name": "Saudi Arabia", "code": "966", "flag": "assets/flags/sau.png"},
  {"name": "Senegal", "code": "221", "flag": "assets/flags/sen.png"},
  {"name": "Serbia", "code": "381", "flag": "assets/flags/srb.png"},
  {"name": "Seychelles", "code": "248", "flag": "assets/flags/syc.png"},
  {"name": "Sierra Leone", "code": "232", "flag": "assets/flags/sle.png"},
  {"name": "Singapore", "code": "65", "flag": "assets/flags/sgp.png"},
  {"name": "Sint Maarten", "code": "1721", "flag": "assets/flags/sxm.png"},
  {"name": "Slovakia", "code": "421", "flag": "assets/flags/svk.png"},
  {"name": "Slovenia", "code": "386", "flag": "assets/flags/svn.png"},
  {"name": "Solomon Islands", "code": "677", "flag": "assets/flags/slb.png"},
  {"name": "Somalia", "code": "252", "flag": "assets/flags/som.png"},
  {"name": "South Africa", "code": "27", "flag": "assets/flags/zaf.png"},
  {
    "name": "South Georgia and the South Sandwich Islands",
    "code": "500",
    "flag": "assets/flags/sgs.png"
  },
  {"name": "SouthSudan", "code": "211", "flag": "assets/flags/ssd.png"},
  {"name": "Spain", "code": "34", "flag": "assets/flags/esp.png"},
  {"name": "SriLanka", "code": "94", "flag": "assets/flags/lka.png"},
  {"name": "Sudan", "code": "249", "flag": "assets/flags/sdn.png"},
  {"name": "Suriname", "code": "597", "flag": "assets/flags/sur.png"},
  {
    "name": "Svalbard and Jan Mayen",
    "code": "4779",
    "flag": "assets/flags/sjm.png"
  },
  {"name": "Swaziland", "code": "268", "flag": "assets/flags/swz.png"},
  {"name": "Sweden", "code": "46", "flag": "assets/flags/swe.png"},
  {"name": "Switzerland", "code": "41", "flag": "assets/flags/che.png"},
  {"name": "Syria", "code": "963", "flag": "assets/flags/syr.png"},
  {"name": "Taiwan", "code": "886", "flag": "assets/flags/twn.png"},
  {"name": "Tajikistan", "code": "992", "flag": "assets/flags/tjk.png"},
  {"name": "Tanzania", "code": "255", "flag": "assets/flags/tza.png"},
  {"name": "Thailand", "code": "66", "flag": "assets/flags/tha.png"},
  {"name": "Timor-Leste", "code": "670", "flag": "assets/flags/tls.png"},
  {"name": "Togo", "code": "228", "flag": "assets/flags/tgo.png"},
  {"name": "Tokelau", "code": "690", "flag": "assets/flags/tkl.png"},
  {"name": "Tonga", "code": "676", "flag": "assets/flags/ton.png"},
  {
    "name": "Trinidad and Tobago",
    "code": "1868",
    "flag": "assets/flags/tto.png"
  },
  {"name": "Tunisia", "code": "216", "flag": "assets/flags/tun.png"},
  {"name": "Turkey", "code": "90", "flag": "assets/flags/tur.png"},
  {"name": "Turkmenistan", "code": "993", "flag": "assets/flags/tkm.png"},
  {
    "name": "Turks and Caicos Islands",
    "code": "1649",
    "flag": "assets/flags/tca.png"
  },
  {"name": "Tuvalu", "code": "688", "flag": "assets/flags/tuv.png"},
  {"name": "UAE", "code": "971", "flag": "assets/flags/are.png"},
  {"name": "Uganda", "code": "256", "flag": "assets/flags/uga.png"},
  {"name": "UK", "code": "44", "flag": "assets/flags/gbr.png"},
  {"name": "Ukraine", "code": "380", "flag": "assets/flags/ukr.png"},
  {"name": "Uruguay", "code": "598", "flag": "assets/flags/ury.png"},
  {"name": "USA", "code": "1", "flag": "assets/flags/usa.png"},
  {"name": "Uzbekistan", "code": "998", "flag": "assets/flags/uzb.png"},
  {"name": "Vanuatu", "code": "678", "flag": "assets/flags/vut.png"},
  {"name": "Venezuela", "code": "58", "flag": "assets/flags/ven.png"},
  {"name": "Vietnam", "code": "84", "flag": "assets/flags/vnm.png"},
  {
    "name": "Virgin Islands (British)",
    "code": "1284",
    "flag": "assets/flags/vgb.png"
  },
  {
    "name": "Virgin Islands (U.S.)",
    "code": "1340",
    "flag": "assets/flags/vir.png"
  },
  {"name": "Wallis and Futuna", "code": "681", "flag": "assets/flags/wlf.png"},
  {"name": "Western Sahara", "code": "212", "flag": "assets/flags/esh.png"},
  {"name": "Yemen", "code": "967", "flag": "assets/flags/yem.png"},
  {"name": "Zambia", "code": "260", "flag": "assets/flags/zmb.png"},
  {"name": "Zimbabwe", "code": "263", "flag": "assets/flags/zwe.png"}
];
