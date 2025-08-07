<?php

use Illuminate\Database\Seeder;

class StatesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('states')->delete();
        
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'Andaman and Nicobar Islands',
                'country_id' => 101,
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'Andhra Pradesh',
                'country_id' => 101,
            ),
            2 => 
            array (
                'id' => 3,
                'name' => 'Arunachal Pradesh',
                'country_id' => 101,
            ),
            3 => 
            array (
                'id' => 4,
                'name' => 'Assam',
                'country_id' => 101,
            ),
            4 => 
            array (
                'id' => 5,
                'name' => 'Bihar',
                'country_id' => 101,
            ),
            5 => 
            array (
                'id' => 6,
                'name' => 'Chandigarh',
                'country_id' => 101,
            ),
            6 => 
            array (
                'id' => 7,
                'name' => 'Chhattisgarh',
                'country_id' => 101,
            ),
            7 => 
            array (
                'id' => 8,
                'name' => 'Dadra and Nagar Haveli',
                'country_id' => 101,
            ),
            8 => 
            array (
                'id' => 9,
                'name' => 'Daman and Diu',
                'country_id' => 101,
            ),
            9 => 
            array (
                'id' => 10,
                'name' => 'Delhi',
                'country_id' => 101,
            ),
            10 => 
            array (
                'id' => 11,
                'name' => 'Goa',
                'country_id' => 101,
            ),
            11 => 
            array (
                'id' => 12,
                'name' => 'Gujarat',
                'country_id' => 101,
            ),
            12 => 
            array (
                'id' => 13,
                'name' => 'Haryana',
                'country_id' => 101,
            ),
            13 => 
            array (
                'id' => 14,
                'name' => 'Himachal Pradesh',
                'country_id' => 101,
            ),
            14 => 
            array (
                'id' => 15,
                'name' => 'Jammu and Kashmir',
                'country_id' => 101,
            ),
            15 => 
            array (
                'id' => 16,
                'name' => 'Jharkhand',
                'country_id' => 101,
            ),
            16 => 
            array (
                'id' => 17,
                'name' => 'Karnataka',
                'country_id' => 101,
            ),
            17 => 
            array (
                'id' => 18,
                'name' => 'Kenmore',
                'country_id' => 101,
            ),
            18 => 
            array (
                'id' => 19,
                'name' => 'Kerala',
                'country_id' => 101,
            ),
            19 => 
            array (
                'id' => 20,
                'name' => 'Lakshadweep',
                'country_id' => 101,
            ),
            20 => 
            array (
                'id' => 21,
                'name' => 'Madhya Pradesh',
                'country_id' => 101,
            ),
            21 => 
            array (
                'id' => 22,
                'name' => 'Maharashtra',
                'country_id' => 101,
            ),
            22 => 
            array (
                'id' => 23,
                'name' => 'Manipur',
                'country_id' => 101,
            ),
            23 => 
            array (
                'id' => 24,
                'name' => 'Meghalaya',
                'country_id' => 101,
            ),
            24 => 
            array (
                'id' => 25,
                'name' => 'Mizoram',
                'country_id' => 101,
            ),
            25 => 
            array (
                'id' => 26,
                'name' => 'Nagaland',
                'country_id' => 101,
            ),
            26 => 
            array (
                'id' => 27,
                'name' => 'Narora',
                'country_id' => 101,
            ),
            27 => 
            array (
                'id' => 28,
                'name' => 'Natwar',
                'country_id' => 101,
            ),
            28 => 
            array (
                'id' => 29,
                'name' => 'Odisha',
                'country_id' => 101,
            ),
            29 => 
            array (
                'id' => 30,
                'name' => 'Paschim Medinipur',
                'country_id' => 101,
            ),
            30 => 
            array (
                'id' => 31,
                'name' => 'Pondicherry',
                'country_id' => 101,
            ),
            31 => 
            array (
                'id' => 32,
                'name' => 'Punjab',
                'country_id' => 101,
            ),
            32 => 
            array (
                'id' => 33,
                'name' => 'Rajasthan',
                'country_id' => 101,
            ),
            33 => 
            array (
                'id' => 34,
                'name' => 'Sikkim',
                'country_id' => 101,
            ),
            34 => 
            array (
                'id' => 35,
                'name' => 'Tamil Nadu',
                'country_id' => 101,
            ),
            35 => 
            array (
                'id' => 36,
                'name' => 'Telangana',
                'country_id' => 101,
            ),
            36 => 
            array (
                'id' => 37,
                'name' => 'Tripura',
                'country_id' => 101,
            ),
            37 => 
            array (
                'id' => 38,
                'name' => 'Uttar Pradesh',
                'country_id' => 101,
            ),
            38 => 
            array (
                'id' => 39,
                'name' => 'Uttarakhand',
                'country_id' => 101,
            ),
            39 => 
            array (
                'id' => 40,
                'name' => 'Vaishali',
                'country_id' => 101,
            ),
            40 => 
            array (
                'id' => 41,
                'name' => 'West Bengal',
                'country_id' => 101,
            ),
            41 => 
            array (
                'id' => 42,
                'name' => 'Badakhshan',
                'country_id' => 1,
            ),
            42 => 
            array (
                'id' => 43,
                'name' => 'Badgis',
                'country_id' => 1,
            ),
            43 => 
            array (
                'id' => 44,
                'name' => 'Baglan',
                'country_id' => 1,
            ),
            44 => 
            array (
                'id' => 45,
                'name' => 'Balkh',
                'country_id' => 1,
            ),
            45 => 
            array (
                'id' => 46,
                'name' => 'Bamiyan',
                'country_id' => 1,
            ),
            46 => 
            array (
                'id' => 47,
                'name' => 'Farah',
                'country_id' => 1,
            ),
            47 => 
            array (
                'id' => 48,
                'name' => 'Faryab',
                'country_id' => 1,
            ),
            48 => 
            array (
                'id' => 49,
                'name' => 'Gawr',
                'country_id' => 1,
            ),
            49 => 
            array (
                'id' => 50,
                'name' => 'Gazni',
                'country_id' => 1,
            ),
            50 => 
            array (
                'id' => 51,
                'name' => 'Herat',
                'country_id' => 1,
            ),
            51 => 
            array (
                'id' => 52,
                'name' => 'Hilmand',
                'country_id' => 1,
            ),
            52 => 
            array (
                'id' => 53,
                'name' => 'Jawzjan',
                'country_id' => 1,
            ),
            53 => 
            array (
                'id' => 54,
                'name' => 'Kabul',
                'country_id' => 1,
            ),
            54 => 
            array (
                'id' => 55,
                'name' => 'Kapisa',
                'country_id' => 1,
            ),
            55 => 
            array (
                'id' => 56,
                'name' => 'Khawst',
                'country_id' => 1,
            ),
            56 => 
            array (
                'id' => 57,
                'name' => 'Kunar',
                'country_id' => 1,
            ),
            57 => 
            array (
                'id' => 58,
                'name' => 'Lagman',
                'country_id' => 1,
            ),
            58 => 
            array (
                'id' => 59,
                'name' => 'Lawghar',
                'country_id' => 1,
            ),
            59 => 
            array (
                'id' => 60,
                'name' => 'Nangarhar',
                'country_id' => 1,
            ),
            60 => 
            array (
                'id' => 61,
                'name' => 'Nimruz',
                'country_id' => 1,
            ),
            61 => 
            array (
                'id' => 62,
                'name' => 'Nuristan',
                'country_id' => 1,
            ),
            62 => 
            array (
                'id' => 63,
                'name' => 'Paktika',
                'country_id' => 1,
            ),
            63 => 
            array (
                'id' => 64,
                'name' => 'Paktiya',
                'country_id' => 1,
            ),
            64 => 
            array (
                'id' => 65,
                'name' => 'Parwan',
                'country_id' => 1,
            ),
            65 => 
            array (
                'id' => 66,
                'name' => 'Qandahar',
                'country_id' => 1,
            ),
            66 => 
            array (
                'id' => 67,
                'name' => 'Qunduz',
                'country_id' => 1,
            ),
            67 => 
            array (
                'id' => 68,
                'name' => 'Samangan',
                'country_id' => 1,
            ),
            68 => 
            array (
                'id' => 69,
                'name' => 'Sar-e Pul',
                'country_id' => 1,
            ),
            69 => 
            array (
                'id' => 70,
                'name' => 'Takhar',
                'country_id' => 1,
            ),
            70 => 
            array (
                'id' => 71,
                'name' => 'Uruzgan',
                'country_id' => 1,
            ),
            71 => 
            array (
                'id' => 72,
                'name' => 'Wardag',
                'country_id' => 1,
            ),
            72 => 
            array (
                'id' => 73,
                'name' => 'Zabul',
                'country_id' => 1,
            ),
            73 => 
            array (
                'id' => 74,
                'name' => 'Berat',
                'country_id' => 2,
            ),
            74 => 
            array (
                'id' => 75,
                'name' => 'Bulqize',
                'country_id' => 2,
            ),
            75 => 
            array (
                'id' => 76,
                'name' => 'Delvine',
                'country_id' => 2,
            ),
            76 => 
            array (
                'id' => 77,
                'name' => 'Devoll',
                'country_id' => 2,
            ),
            77 => 
            array (
                'id' => 78,
                'name' => 'Dibre',
                'country_id' => 2,
            ),
            78 => 
            array (
                'id' => 79,
                'name' => 'Durres',
                'country_id' => 2,
            ),
            79 => 
            array (
                'id' => 80,
                'name' => 'Elbasan',
                'country_id' => 2,
            ),
            80 => 
            array (
                'id' => 81,
                'name' => 'Fier',
                'country_id' => 2,
            ),
            81 => 
            array (
                'id' => 82,
                'name' => 'Gjirokaster',
                'country_id' => 2,
            ),
            82 => 
            array (
                'id' => 83,
                'name' => 'Gramsh',
                'country_id' => 2,
            ),
            83 => 
            array (
                'id' => 84,
                'name' => 'Has',
                'country_id' => 2,
            ),
            84 => 
            array (
                'id' => 85,
                'name' => 'Kavaje',
                'country_id' => 2,
            ),
            85 => 
            array (
                'id' => 86,
                'name' => 'Kolonje',
                'country_id' => 2,
            ),
            86 => 
            array (
                'id' => 87,
                'name' => 'Korce',
                'country_id' => 2,
            ),
            87 => 
            array (
                'id' => 88,
                'name' => 'Kruje',
                'country_id' => 2,
            ),
            88 => 
            array (
                'id' => 89,
                'name' => 'Kucove',
                'country_id' => 2,
            ),
            89 => 
            array (
                'id' => 90,
                'name' => 'Kukes',
                'country_id' => 2,
            ),
            90 => 
            array (
                'id' => 91,
                'name' => 'Kurbin',
                'country_id' => 2,
            ),
            91 => 
            array (
                'id' => 92,
                'name' => 'Lezhe',
                'country_id' => 2,
            ),
            92 => 
            array (
                'id' => 93,
                'name' => 'Librazhd',
                'country_id' => 2,
            ),
            93 => 
            array (
                'id' => 94,
                'name' => 'Lushnje',
                'country_id' => 2,
            ),
            94 => 
            array (
                'id' => 95,
                'name' => 'Mallakaster',
                'country_id' => 2,
            ),
            95 => 
            array (
                'id' => 96,
                'name' => 'Malsi e Madhe',
                'country_id' => 2,
            ),
            96 => 
            array (
                'id' => 97,
                'name' => 'Mat',
                'country_id' => 2,
            ),
            97 => 
            array (
                'id' => 98,
                'name' => 'Mirdite',
                'country_id' => 2,
            ),
            98 => 
            array (
                'id' => 99,
                'name' => 'Peqin',
                'country_id' => 2,
            ),
            99 => 
            array (
                'id' => 100,
                'name' => 'Permet',
                'country_id' => 2,
            ),
            100 => 
            array (
                'id' => 101,
                'name' => 'Pogradec',
                'country_id' => 2,
            ),
            101 => 
            array (
                'id' => 102,
                'name' => 'Puke',
                'country_id' => 2,
            ),
            102 => 
            array (
                'id' => 103,
                'name' => 'Sarande',
                'country_id' => 2,
            ),
            103 => 
            array (
                'id' => 104,
                'name' => 'Shkoder',
                'country_id' => 2,
            ),
            104 => 
            array (
                'id' => 105,
                'name' => 'Skrapar',
                'country_id' => 2,
            ),
            105 => 
            array (
                'id' => 106,
                'name' => 'Tepelene',
                'country_id' => 2,
            ),
            106 => 
            array (
                'id' => 107,
                'name' => 'Tirane',
                'country_id' => 2,
            ),
            107 => 
            array (
                'id' => 108,
                'name' => 'Tropoje',
                'country_id' => 2,
            ),
            108 => 
            array (
                'id' => 109,
                'name' => 'Vlore',
                'country_id' => 2,
            ),
            109 => 
            array (
                'id' => 110,
                'name' => '\'Ayn Daflah',
                'country_id' => 3,
            ),
            110 => 
            array (
                'id' => 111,
                'name' => '\'Ayn Tamushanat',
                'country_id' => 3,
            ),
            111 => 
            array (
                'id' => 112,
                'name' => 'Adrar',
                'country_id' => 3,
            ),
            112 => 
            array (
                'id' => 113,
                'name' => 'Algiers',
                'country_id' => 3,
            ),
            113 => 
            array (
                'id' => 114,
                'name' => 'Annabah',
                'country_id' => 3,
            ),
            114 => 
            array (
                'id' => 115,
                'name' => 'Bashshar',
                'country_id' => 3,
            ),
            115 => 
            array (
                'id' => 116,
                'name' => 'Batnah',
                'country_id' => 3,
            ),
            116 => 
            array (
                'id' => 117,
                'name' => 'Bijayah',
                'country_id' => 3,
            ),
            117 => 
            array (
                'id' => 118,
                'name' => 'Biskrah',
                'country_id' => 3,
            ),
            118 => 
            array (
                'id' => 119,
                'name' => 'Blidah',
                'country_id' => 3,
            ),
            119 => 
            array (
                'id' => 120,
                'name' => 'Buirah',
                'country_id' => 3,
            ),
            120 => 
            array (
                'id' => 121,
                'name' => 'Bumardas',
                'country_id' => 3,
            ),
            121 => 
            array (
                'id' => 122,
                'name' => 'Burj Bu Arririj',
                'country_id' => 3,
            ),
            122 => 
            array (
                'id' => 123,
                'name' => 'Ghalizan',
                'country_id' => 3,
            ),
            123 => 
            array (
                'id' => 124,
                'name' => 'Ghardayah',
                'country_id' => 3,
            ),
            124 => 
            array (
                'id' => 125,
                'name' => 'Ilizi',
                'country_id' => 3,
            ),
            125 => 
            array (
                'id' => 126,
                'name' => 'Jijili',
                'country_id' => 3,
            ),
            126 => 
            array (
                'id' => 127,
                'name' => 'Jilfah',
                'country_id' => 3,
            ),
            127 => 
            array (
                'id' => 128,
                'name' => 'Khanshalah',
                'country_id' => 3,
            ),
            128 => 
            array (
                'id' => 129,
                'name' => 'Masilah',
                'country_id' => 3,
            ),
            129 => 
            array (
                'id' => 130,
                'name' => 'Midyah',
                'country_id' => 3,
            ),
            130 => 
            array (
                'id' => 131,
                'name' => 'Milah',
                'country_id' => 3,
            ),
            131 => 
            array (
                'id' => 132,
                'name' => 'Muaskar',
                'country_id' => 3,
            ),
            132 => 
            array (
                'id' => 133,
                'name' => 'Mustaghanam',
                'country_id' => 3,
            ),
            133 => 
            array (
                'id' => 134,
                'name' => 'Naama',
                'country_id' => 3,
            ),
            134 => 
            array (
                'id' => 135,
                'name' => 'Oran',
                'country_id' => 3,
            ),
            135 => 
            array (
                'id' => 136,
                'name' => 'Ouargla',
                'country_id' => 3,
            ),
            136 => 
            array (
                'id' => 137,
                'name' => 'Qalmah',
                'country_id' => 3,
            ),
            137 => 
            array (
                'id' => 138,
                'name' => 'Qustantinah',
                'country_id' => 3,
            ),
            138 => 
            array (
                'id' => 139,
                'name' => 'Sakikdah',
                'country_id' => 3,
            ),
            139 => 
            array (
                'id' => 140,
                'name' => 'Satif',
                'country_id' => 3,
            ),
            140 => 
            array (
                'id' => 141,
                'name' => 'Sayda\'',
                'country_id' => 3,
            ),
            141 => 
            array (
                'id' => 142,
                'name' => 'Sidi ban-al-\'Abbas',
                'country_id' => 3,
            ),
            142 => 
            array (
                'id' => 143,
                'name' => 'Suq Ahras',
                'country_id' => 3,
            ),
            143 => 
            array (
                'id' => 144,
                'name' => 'Tamanghasat',
                'country_id' => 3,
            ),
            144 => 
            array (
                'id' => 145,
                'name' => 'Tibazah',
                'country_id' => 3,
            ),
            145 => 
            array (
                'id' => 146,
                'name' => 'Tibissah',
                'country_id' => 3,
            ),
            146 => 
            array (
                'id' => 147,
                'name' => 'Tilimsan',
                'country_id' => 3,
            ),
            147 => 
            array (
                'id' => 148,
                'name' => 'Tinduf',
                'country_id' => 3,
            ),
            148 => 
            array (
                'id' => 149,
                'name' => 'Tisamsilt',
                'country_id' => 3,
            ),
            149 => 
            array (
                'id' => 150,
                'name' => 'Tiyarat',
                'country_id' => 3,
            ),
            150 => 
            array (
                'id' => 151,
                'name' => 'Tizi Wazu',
                'country_id' => 3,
            ),
            151 => 
            array (
                'id' => 152,
                'name' => 'Umm-al-Bawaghi',
                'country_id' => 3,
            ),
            152 => 
            array (
                'id' => 153,
                'name' => 'Wahran',
                'country_id' => 3,
            ),
            153 => 
            array (
                'id' => 154,
                'name' => 'Warqla',
                'country_id' => 3,
            ),
            154 => 
            array (
                'id' => 155,
                'name' => 'Wilaya d Alger',
                'country_id' => 3,
            ),
            155 => 
            array (
                'id' => 156,
                'name' => 'Wilaya de Bejaia',
                'country_id' => 3,
            ),
            156 => 
            array (
                'id' => 157,
                'name' => 'Wilaya de Constantine',
                'country_id' => 3,
            ),
            157 => 
            array (
                'id' => 158,
                'name' => 'al-Aghwat',
                'country_id' => 3,
            ),
            158 => 
            array (
                'id' => 159,
                'name' => 'al-Bayadh',
                'country_id' => 3,
            ),
            159 => 
            array (
                'id' => 160,
                'name' => 'al-Jaza\'ir',
                'country_id' => 3,
            ),
            160 => 
            array (
                'id' => 161,
                'name' => 'al-Wad',
                'country_id' => 3,
            ),
            161 => 
            array (
                'id' => 162,
                'name' => 'ash-Shalif',
                'country_id' => 3,
            ),
            162 => 
            array (
                'id' => 163,
                'name' => 'at-Tarif',
                'country_id' => 3,
            ),
            163 => 
            array (
                'id' => 164,
                'name' => 'Eastern',
                'country_id' => 4,
            ),
            164 => 
            array (
                'id' => 165,
                'name' => 'Manu\'a',
                'country_id' => 4,
            ),
            165 => 
            array (
                'id' => 166,
                'name' => 'Swains Island',
                'country_id' => 4,
            ),
            166 => 
            array (
                'id' => 167,
                'name' => 'Western',
                'country_id' => 4,
            ),
            167 => 
            array (
                'id' => 168,
                'name' => 'Andorra la Vella',
                'country_id' => 5,
            ),
            168 => 
            array (
                'id' => 169,
                'name' => 'Canillo',
                'country_id' => 5,
            ),
            169 => 
            array (
                'id' => 170,
                'name' => 'Encamp',
                'country_id' => 5,
            ),
            170 => 
            array (
                'id' => 171,
                'name' => 'La Massana',
                'country_id' => 5,
            ),
            171 => 
            array (
                'id' => 172,
                'name' => 'Les Escaldes',
                'country_id' => 5,
            ),
            172 => 
            array (
                'id' => 173,
                'name' => 'Ordino',
                'country_id' => 5,
            ),
            173 => 
            array (
                'id' => 174,
                'name' => 'Sant Julia de Loria',
                'country_id' => 5,
            ),
            174 => 
            array (
                'id' => 175,
                'name' => 'Bengo',
                'country_id' => 6,
            ),
            175 => 
            array (
                'id' => 176,
                'name' => 'Benguela',
                'country_id' => 6,
            ),
            176 => 
            array (
                'id' => 177,
                'name' => 'Bie',
                'country_id' => 6,
            ),
            177 => 
            array (
                'id' => 178,
                'name' => 'Cabinda',
                'country_id' => 6,
            ),
            178 => 
            array (
                'id' => 179,
                'name' => 'Cunene',
                'country_id' => 6,
            ),
            179 => 
            array (
                'id' => 180,
                'name' => 'Huambo',
                'country_id' => 6,
            ),
            180 => 
            array (
                'id' => 181,
                'name' => 'Huila',
                'country_id' => 6,
            ),
            181 => 
            array (
                'id' => 182,
                'name' => 'Kuando-Kubango',
                'country_id' => 6,
            ),
            182 => 
            array (
                'id' => 183,
                'name' => 'Kwanza Norte',
                'country_id' => 6,
            ),
            183 => 
            array (
                'id' => 184,
                'name' => 'Kwanza Sul',
                'country_id' => 6,
            ),
            184 => 
            array (
                'id' => 185,
                'name' => 'Luanda',
                'country_id' => 6,
            ),
            185 => 
            array (
                'id' => 186,
                'name' => 'Lunda Norte',
                'country_id' => 6,
            ),
            186 => 
            array (
                'id' => 187,
                'name' => 'Lunda Sul',
                'country_id' => 6,
            ),
            187 => 
            array (
                'id' => 188,
                'name' => 'Malanje',
                'country_id' => 6,
            ),
            188 => 
            array (
                'id' => 189,
                'name' => 'Moxico',
                'country_id' => 6,
            ),
            189 => 
            array (
                'id' => 190,
                'name' => 'Namibe',
                'country_id' => 6,
            ),
            190 => 
            array (
                'id' => 191,
                'name' => 'Uige',
                'country_id' => 6,
            ),
            191 => 
            array (
                'id' => 192,
                'name' => 'Zaire',
                'country_id' => 6,
            ),
            192 => 
            array (
                'id' => 193,
                'name' => 'Other Provinces',
                'country_id' => 7,
            ),
            193 => 
            array (
                'id' => 194,
                'name' => 'Sector claimed by Argentina/Ch',
                'country_id' => 8,
            ),
            194 => 
            array (
                'id' => 195,
                'name' => 'Sector claimed by Argentina/UK',
                'country_id' => 8,
            ),
            195 => 
            array (
                'id' => 196,
                'name' => 'Sector claimed by Australia',
                'country_id' => 8,
            ),
            196 => 
            array (
                'id' => 197,
                'name' => 'Sector claimed by France',
                'country_id' => 8,
            ),
            197 => 
            array (
                'id' => 198,
                'name' => 'Sector claimed by New Zealand',
                'country_id' => 8,
            ),
            198 => 
            array (
                'id' => 199,
                'name' => 'Sector claimed by Norway',
                'country_id' => 8,
            ),
            199 => 
            array (
                'id' => 200,
                'name' => 'Unclaimed Sector',
                'country_id' => 8,
            ),
            200 => 
            array (
                'id' => 201,
                'name' => 'Barbuda',
                'country_id' => 9,
            ),
            201 => 
            array (
                'id' => 202,
                'name' => 'Saint George',
                'country_id' => 9,
            ),
            202 => 
            array (
                'id' => 203,
                'name' => 'Saint John',
                'country_id' => 9,
            ),
            203 => 
            array (
                'id' => 204,
                'name' => 'Saint Mary',
                'country_id' => 9,
            ),
            204 => 
            array (
                'id' => 205,
                'name' => 'Saint Paul',
                'country_id' => 9,
            ),
            205 => 
            array (
                'id' => 206,
                'name' => 'Saint Peter',
                'country_id' => 9,
            ),
            206 => 
            array (
                'id' => 207,
                'name' => 'Saint Philip',
                'country_id' => 9,
            ),
            207 => 
            array (
                'id' => 208,
                'name' => 'Buenos Aires',
                'country_id' => 10,
            ),
            208 => 
            array (
                'id' => 209,
                'name' => 'Catamarca',
                'country_id' => 10,
            ),
            209 => 
            array (
                'id' => 210,
                'name' => 'Chaco',
                'country_id' => 10,
            ),
            210 => 
            array (
                'id' => 211,
                'name' => 'Chubut',
                'country_id' => 10,
            ),
            211 => 
            array (
                'id' => 212,
                'name' => 'Cordoba',
                'country_id' => 10,
            ),
            212 => 
            array (
                'id' => 213,
                'name' => 'Corrientes',
                'country_id' => 10,
            ),
            213 => 
            array (
                'id' => 214,
                'name' => 'Distrito Federal',
                'country_id' => 10,
            ),
            214 => 
            array (
                'id' => 215,
                'name' => 'Entre Rios',
                'country_id' => 10,
            ),
            215 => 
            array (
                'id' => 216,
                'name' => 'Formosa',
                'country_id' => 10,
            ),
            216 => 
            array (
                'id' => 217,
                'name' => 'Jujuy',
                'country_id' => 10,
            ),
            217 => 
            array (
                'id' => 218,
                'name' => 'La Pampa',
                'country_id' => 10,
            ),
            218 => 
            array (
                'id' => 219,
                'name' => 'La Rioja',
                'country_id' => 10,
            ),
            219 => 
            array (
                'id' => 220,
                'name' => 'Mendoza',
                'country_id' => 10,
            ),
            220 => 
            array (
                'id' => 221,
                'name' => 'Misiones',
                'country_id' => 10,
            ),
            221 => 
            array (
                'id' => 222,
                'name' => 'Neuquen',
                'country_id' => 10,
            ),
            222 => 
            array (
                'id' => 223,
                'name' => 'Rio Negro',
                'country_id' => 10,
            ),
            223 => 
            array (
                'id' => 224,
                'name' => 'Salta',
                'country_id' => 10,
            ),
            224 => 
            array (
                'id' => 225,
                'name' => 'San Juan',
                'country_id' => 10,
            ),
            225 => 
            array (
                'id' => 226,
                'name' => 'San Luis',
                'country_id' => 10,
            ),
            226 => 
            array (
                'id' => 227,
                'name' => 'Santa Cruz',
                'country_id' => 10,
            ),
            227 => 
            array (
                'id' => 228,
                'name' => 'Santa Fe',
                'country_id' => 10,
            ),
            228 => 
            array (
                'id' => 229,
                'name' => 'Santiago del Estero',
                'country_id' => 10,
            ),
            229 => 
            array (
                'id' => 230,
                'name' => 'Tierra del Fuego',
                'country_id' => 10,
            ),
            230 => 
            array (
                'id' => 231,
                'name' => 'Tucuman',
                'country_id' => 10,
            ),
            231 => 
            array (
                'id' => 232,
                'name' => 'Aragatsotn',
                'country_id' => 11,
            ),
            232 => 
            array (
                'id' => 233,
                'name' => 'Ararat',
                'country_id' => 11,
            ),
            233 => 
            array (
                'id' => 234,
                'name' => 'Armavir',
                'country_id' => 11,
            ),
            234 => 
            array (
                'id' => 235,
                'name' => 'Gegharkunik',
                'country_id' => 11,
            ),
            235 => 
            array (
                'id' => 236,
                'name' => 'Kotaik',
                'country_id' => 11,
            ),
            236 => 
            array (
                'id' => 237,
                'name' => 'Lori',
                'country_id' => 11,
            ),
            237 => 
            array (
                'id' => 238,
                'name' => 'Shirak',
                'country_id' => 11,
            ),
            238 => 
            array (
                'id' => 239,
                'name' => 'Stepanakert',
                'country_id' => 11,
            ),
            239 => 
            array (
                'id' => 240,
                'name' => 'Syunik',
                'country_id' => 11,
            ),
            240 => 
            array (
                'id' => 241,
                'name' => 'Tavush',
                'country_id' => 11,
            ),
            241 => 
            array (
                'id' => 242,
                'name' => 'Vayots Dzor',
                'country_id' => 11,
            ),
            242 => 
            array (
                'id' => 243,
                'name' => 'Yerevan',
                'country_id' => 11,
            ),
            243 => 
            array (
                'id' => 244,
                'name' => 'Aruba',
                'country_id' => 12,
            ),
            244 => 
            array (
                'id' => 245,
                'name' => 'Auckland',
                'country_id' => 13,
            ),
            245 => 
            array (
                'id' => 246,
                'name' => 'Australian Capital Territory',
                'country_id' => 13,
            ),
            246 => 
            array (
                'id' => 247,
                'name' => 'Balgowlah',
                'country_id' => 13,
            ),
            247 => 
            array (
                'id' => 248,
                'name' => 'Balmain',
                'country_id' => 13,
            ),
            248 => 
            array (
                'id' => 249,
                'name' => 'Bankstown',
                'country_id' => 13,
            ),
            249 => 
            array (
                'id' => 250,
                'name' => 'Baulkham Hills',
                'country_id' => 13,
            ),
            250 => 
            array (
                'id' => 251,
                'name' => 'Bonnet Bay',
                'country_id' => 13,
            ),
            251 => 
            array (
                'id' => 252,
                'name' => 'Camberwell',
                'country_id' => 13,
            ),
            252 => 
            array (
                'id' => 253,
                'name' => 'Carole Park',
                'country_id' => 13,
            ),
            253 => 
            array (
                'id' => 254,
                'name' => 'Castle Hill',
                'country_id' => 13,
            ),
            254 => 
            array (
                'id' => 255,
                'name' => 'Caulfield',
                'country_id' => 13,
            ),
            255 => 
            array (
                'id' => 256,
                'name' => 'Chatswood',
                'country_id' => 13,
            ),
            256 => 
            array (
                'id' => 257,
                'name' => 'Cheltenham',
                'country_id' => 13,
            ),
            257 => 
            array (
                'id' => 258,
                'name' => 'Cherrybrook',
                'country_id' => 13,
            ),
            258 => 
            array (
                'id' => 259,
                'name' => 'Clayton',
                'country_id' => 13,
            ),
            259 => 
            array (
                'id' => 260,
                'name' => 'Collingwood',
                'country_id' => 13,
            ),
            260 => 
            array (
                'id' => 261,
                'name' => 'Frenchs Forest',
                'country_id' => 13,
            ),
            261 => 
            array (
                'id' => 262,
                'name' => 'Hawthorn',
                'country_id' => 13,
            ),
            262 => 
            array (
                'id' => 263,
                'name' => 'Jannnali',
                'country_id' => 13,
            ),
            263 => 
            array (
                'id' => 264,
                'name' => 'Knoxfield',
                'country_id' => 13,
            ),
            264 => 
            array (
                'id' => 265,
                'name' => 'Melbourne',
                'country_id' => 13,
            ),
            265 => 
            array (
                'id' => 266,
                'name' => 'New South Wales',
                'country_id' => 13,
            ),
            266 => 
            array (
                'id' => 267,
                'name' => 'Northern Territory',
                'country_id' => 13,
            ),
            267 => 
            array (
                'id' => 268,
                'name' => 'Perth',
                'country_id' => 13,
            ),
            268 => 
            array (
                'id' => 269,
                'name' => 'Queensland',
                'country_id' => 13,
            ),
            269 => 
            array (
                'id' => 270,
                'name' => 'South Australia',
                'country_id' => 13,
            ),
            270 => 
            array (
                'id' => 271,
                'name' => 'Tasmania',
                'country_id' => 13,
            ),
            271 => 
            array (
                'id' => 272,
                'name' => 'Templestowe',
                'country_id' => 13,
            ),
            272 => 
            array (
                'id' => 273,
                'name' => 'Victoria',
                'country_id' => 13,
            ),
            273 => 
            array (
                'id' => 274,
                'name' => 'Werribee south',
                'country_id' => 13,
            ),
            274 => 
            array (
                'id' => 275,
                'name' => 'Western Australia',
                'country_id' => 13,
            ),
            275 => 
            array (
                'id' => 276,
                'name' => 'Wheeler',
                'country_id' => 13,
            ),
            276 => 
            array (
                'id' => 277,
                'name' => 'Bundesland Salzburg',
                'country_id' => 14,
            ),
            277 => 
            array (
                'id' => 278,
                'name' => 'Bundesland Steiermark',
                'country_id' => 14,
            ),
            278 => 
            array (
                'id' => 279,
                'name' => 'Bundesland Tirol',
                'country_id' => 14,
            ),
            279 => 
            array (
                'id' => 280,
                'name' => 'Burgenland',
                'country_id' => 14,
            ),
            280 => 
            array (
                'id' => 281,
                'name' => 'Carinthia',
                'country_id' => 14,
            ),
            281 => 
            array (
                'id' => 282,
                'name' => 'Karnten',
                'country_id' => 14,
            ),
            282 => 
            array (
                'id' => 283,
                'name' => 'Liezen',
                'country_id' => 14,
            ),
            283 => 
            array (
                'id' => 284,
                'name' => 'Lower Austria',
                'country_id' => 14,
            ),
            284 => 
            array (
                'id' => 285,
                'name' => 'Niederosterreich',
                'country_id' => 14,
            ),
            285 => 
            array (
                'id' => 286,
                'name' => 'Oberosterreich',
                'country_id' => 14,
            ),
            286 => 
            array (
                'id' => 287,
                'name' => 'Salzburg',
                'country_id' => 14,
            ),
            287 => 
            array (
                'id' => 288,
                'name' => 'Schleswig-Holstein',
                'country_id' => 14,
            ),
            288 => 
            array (
                'id' => 289,
                'name' => 'Steiermark',
                'country_id' => 14,
            ),
            289 => 
            array (
                'id' => 290,
                'name' => 'Styria',
                'country_id' => 14,
            ),
            290 => 
            array (
                'id' => 291,
                'name' => 'Tirol',
                'country_id' => 14,
            ),
            291 => 
            array (
                'id' => 292,
                'name' => 'Upper Austria',
                'country_id' => 14,
            ),
            292 => 
            array (
                'id' => 293,
                'name' => 'Vorarlberg',
                'country_id' => 14,
            ),
            293 => 
            array (
                'id' => 294,
                'name' => 'Wien',
                'country_id' => 14,
            ),
            294 => 
            array (
                'id' => 295,
                'name' => 'Abseron',
                'country_id' => 15,
            ),
            295 => 
            array (
                'id' => 296,
                'name' => 'Baki Sahari',
                'country_id' => 15,
            ),
            296 => 
            array (
                'id' => 297,
                'name' => 'Ganca',
                'country_id' => 15,
            ),
            297 => 
            array (
                'id' => 298,
                'name' => 'Ganja',
                'country_id' => 15,
            ),
            298 => 
            array (
                'id' => 299,
                'name' => 'Kalbacar',
                'country_id' => 15,
            ),
            299 => 
            array (
                'id' => 300,
                'name' => 'Lankaran',
                'country_id' => 15,
            ),
            300 => 
            array (
                'id' => 301,
                'name' => 'Mil-Qarabax',
                'country_id' => 15,
            ),
            301 => 
            array (
                'id' => 302,
                'name' => 'Mugan-Salyan',
                'country_id' => 15,
            ),
            302 => 
            array (
                'id' => 303,
                'name' => 'Nagorni-Qarabax',
                'country_id' => 15,
            ),
            303 => 
            array (
                'id' => 304,
                'name' => 'Naxcivan',
                'country_id' => 15,
            ),
            304 => 
            array (
                'id' => 305,
                'name' => 'Priaraks',
                'country_id' => 15,
            ),
            305 => 
            array (
                'id' => 306,
                'name' => 'Qazax',
                'country_id' => 15,
            ),
            306 => 
            array (
                'id' => 307,
                'name' => 'Saki',
                'country_id' => 15,
            ),
            307 => 
            array (
                'id' => 308,
                'name' => 'Sirvan',
                'country_id' => 15,
            ),
            308 => 
            array (
                'id' => 309,
                'name' => 'Xacmaz',
                'country_id' => 15,
            ),
            309 => 
            array (
                'id' => 310,
                'name' => 'Abaco',
                'country_id' => 16,
            ),
            310 => 
            array (
                'id' => 311,
                'name' => 'Acklins Island',
                'country_id' => 16,
            ),
            311 => 
            array (
                'id' => 312,
                'name' => 'Andros',
                'country_id' => 16,
            ),
            312 => 
            array (
                'id' => 313,
                'name' => 'Berry Islands',
                'country_id' => 16,
            ),
            313 => 
            array (
                'id' => 314,
                'name' => 'Biminis',
                'country_id' => 16,
            ),
            314 => 
            array (
                'id' => 315,
                'name' => 'Cat Island',
                'country_id' => 16,
            ),
            315 => 
            array (
                'id' => 316,
                'name' => 'Crooked Island',
                'country_id' => 16,
            ),
            316 => 
            array (
                'id' => 317,
                'name' => 'Eleuthera',
                'country_id' => 16,
            ),
            317 => 
            array (
                'id' => 318,
                'name' => 'Exuma and Cays',
                'country_id' => 16,
            ),
            318 => 
            array (
                'id' => 319,
                'name' => 'Grand Bahama',
                'country_id' => 16,
            ),
            319 => 
            array (
                'id' => 320,
                'name' => 'Inagua Islands',
                'country_id' => 16,
            ),
            320 => 
            array (
                'id' => 321,
                'name' => 'Long Island',
                'country_id' => 16,
            ),
            321 => 
            array (
                'id' => 322,
                'name' => 'Mayaguana',
                'country_id' => 16,
            ),
            322 => 
            array (
                'id' => 323,
                'name' => 'New Providence',
                'country_id' => 16,
            ),
            323 => 
            array (
                'id' => 324,
                'name' => 'Ragged Island',
                'country_id' => 16,
            ),
            324 => 
            array (
                'id' => 325,
                'name' => 'Rum Cay',
                'country_id' => 16,
            ),
            325 => 
            array (
                'id' => 326,
                'name' => 'San Salvador',
                'country_id' => 16,
            ),
            326 => 
            array (
                'id' => 327,
                'name' => '\'Isa',
                'country_id' => 17,
            ),
            327 => 
            array (
                'id' => 328,
                'name' => 'Badiyah',
                'country_id' => 17,
            ),
            328 => 
            array (
                'id' => 329,
                'name' => 'Hidd',
                'country_id' => 17,
            ),
            329 => 
            array (
                'id' => 330,
                'name' => 'Jidd Hafs',
                'country_id' => 17,
            ),
            330 => 
            array (
                'id' => 331,
                'name' => 'Mahama',
                'country_id' => 17,
            ),
            331 => 
            array (
                'id' => 332,
                'name' => 'Manama',
                'country_id' => 17,
            ),
            332 => 
            array (
                'id' => 333,
                'name' => 'Sitrah',
                'country_id' => 17,
            ),
            333 => 
            array (
                'id' => 334,
                'name' => 'al-Manamah',
                'country_id' => 17,
            ),
            334 => 
            array (
                'id' => 335,
                'name' => 'al-Muharraq',
                'country_id' => 17,
            ),
            335 => 
            array (
                'id' => 336,
                'name' => 'ar-Rifa\'a',
                'country_id' => 17,
            ),
            336 => 
            array (
                'id' => 337,
                'name' => 'Bagar Hat',
                'country_id' => 18,
            ),
            337 => 
            array (
                'id' => 338,
                'name' => 'Bandarban',
                'country_id' => 18,
            ),
            338 => 
            array (
                'id' => 339,
                'name' => 'Barguna',
                'country_id' => 18,
            ),
            339 => 
            array (
                'id' => 340,
                'name' => 'Barisal',
                'country_id' => 18,
            ),
            340 => 
            array (
                'id' => 341,
                'name' => 'Bhola',
                'country_id' => 18,
            ),
            341 => 
            array (
                'id' => 342,
                'name' => 'Bogora',
                'country_id' => 18,
            ),
            342 => 
            array (
                'id' => 343,
                'name' => 'Brahman Bariya',
                'country_id' => 18,
            ),
            343 => 
            array (
                'id' => 344,
                'name' => 'Chandpur',
                'country_id' => 18,
            ),
            344 => 
            array (
                'id' => 345,
                'name' => 'Chattagam',
                'country_id' => 18,
            ),
            345 => 
            array (
                'id' => 346,
                'name' => 'Chittagong Division',
                'country_id' => 18,
            ),
            346 => 
            array (
                'id' => 347,
                'name' => 'Chuadanga',
                'country_id' => 18,
            ),
            347 => 
            array (
                'id' => 348,
                'name' => 'Dhaka',
                'country_id' => 18,
            ),
            348 => 
            array (
                'id' => 349,
                'name' => 'Dinajpur',
                'country_id' => 18,
            ),
            349 => 
            array (
                'id' => 350,
                'name' => 'Faridpur',
                'country_id' => 18,
            ),
            350 => 
            array (
                'id' => 351,
                'name' => 'Feni',
                'country_id' => 18,
            ),
            351 => 
            array (
                'id' => 352,
                'name' => 'Gaybanda',
                'country_id' => 18,
            ),
            352 => 
            array (
                'id' => 353,
                'name' => 'Gazipur',
                'country_id' => 18,
            ),
            353 => 
            array (
                'id' => 354,
                'name' => 'Gopalganj',
                'country_id' => 18,
            ),
            354 => 
            array (
                'id' => 355,
                'name' => 'Habiganj',
                'country_id' => 18,
            ),
            355 => 
            array (
                'id' => 356,
                'name' => 'Jaipur Hat',
                'country_id' => 18,
            ),
            356 => 
            array (
                'id' => 357,
                'name' => 'Jamalpur',
                'country_id' => 18,
            ),
            357 => 
            array (
                'id' => 358,
                'name' => 'Jessor',
                'country_id' => 18,
            ),
            358 => 
            array (
                'id' => 359,
                'name' => 'Jhalakati',
                'country_id' => 18,
            ),
            359 => 
            array (
                'id' => 360,
                'name' => 'Jhanaydah',
                'country_id' => 18,
            ),
            360 => 
            array (
                'id' => 361,
                'name' => 'Khagrachhari',
                'country_id' => 18,
            ),
            361 => 
            array (
                'id' => 362,
                'name' => 'Khulna',
                'country_id' => 18,
            ),
            362 => 
            array (
                'id' => 363,
                'name' => 'Kishorganj',
                'country_id' => 18,
            ),
            363 => 
            array (
                'id' => 364,
                'name' => 'Koks Bazar',
                'country_id' => 18,
            ),
            364 => 
            array (
                'id' => 365,
                'name' => 'Komilla',
                'country_id' => 18,
            ),
            365 => 
            array (
                'id' => 366,
                'name' => 'Kurigram',
                'country_id' => 18,
            ),
            366 => 
            array (
                'id' => 367,
                'name' => 'Kushtiya',
                'country_id' => 18,
            ),
            367 => 
            array (
                'id' => 368,
                'name' => 'Lakshmipur',
                'country_id' => 18,
            ),
            368 => 
            array (
                'id' => 369,
                'name' => 'Lalmanir Hat',
                'country_id' => 18,
            ),
            369 => 
            array (
                'id' => 370,
                'name' => 'Madaripur',
                'country_id' => 18,
            ),
            370 => 
            array (
                'id' => 371,
                'name' => 'Magura',
                'country_id' => 18,
            ),
            371 => 
            array (
                'id' => 372,
                'name' => 'Maimansingh',
                'country_id' => 18,
            ),
            372 => 
            array (
                'id' => 373,
                'name' => 'Manikganj',
                'country_id' => 18,
            ),
            373 => 
            array (
                'id' => 374,
                'name' => 'Maulvi Bazar',
                'country_id' => 18,
            ),
            374 => 
            array (
                'id' => 375,
                'name' => 'Meherpur',
                'country_id' => 18,
            ),
            375 => 
            array (
                'id' => 376,
                'name' => 'Munshiganj',
                'country_id' => 18,
            ),
            376 => 
            array (
                'id' => 377,
                'name' => 'Naral',
                'country_id' => 18,
            ),
            377 => 
            array (
                'id' => 378,
                'name' => 'Narayanganj',
                'country_id' => 18,
            ),
            378 => 
            array (
                'id' => 379,
                'name' => 'Narsingdi',
                'country_id' => 18,
            ),
            379 => 
            array (
                'id' => 380,
                'name' => 'Nator',
                'country_id' => 18,
            ),
            380 => 
            array (
                'id' => 381,
                'name' => 'Naugaon',
                'country_id' => 18,
            ),
            381 => 
            array (
                'id' => 382,
                'name' => 'Nawabganj',
                'country_id' => 18,
            ),
            382 => 
            array (
                'id' => 383,
                'name' => 'Netrakona',
                'country_id' => 18,
            ),
            383 => 
            array (
                'id' => 384,
                'name' => 'Nilphamari',
                'country_id' => 18,
            ),
            384 => 
            array (
                'id' => 385,
                'name' => 'Noakhali',
                'country_id' => 18,
            ),
            385 => 
            array (
                'id' => 386,
                'name' => 'Pabna',
                'country_id' => 18,
            ),
            386 => 
            array (
                'id' => 387,
                'name' => 'Panchagarh',
                'country_id' => 18,
            ),
            387 => 
            array (
                'id' => 388,
                'name' => 'Patuakhali',
                'country_id' => 18,
            ),
            388 => 
            array (
                'id' => 389,
                'name' => 'Pirojpur',
                'country_id' => 18,
            ),
            389 => 
            array (
                'id' => 390,
                'name' => 'Rajbari',
                'country_id' => 18,
            ),
            390 => 
            array (
                'id' => 391,
                'name' => 'Rajshahi',
                'country_id' => 18,
            ),
            391 => 
            array (
                'id' => 392,
                'name' => 'Rangamati',
                'country_id' => 18,
            ),
            392 => 
            array (
                'id' => 393,
                'name' => 'Rangpur',
                'country_id' => 18,
            ),
            393 => 
            array (
                'id' => 394,
                'name' => 'Satkhira',
                'country_id' => 18,
            ),
            394 => 
            array (
                'id' => 395,
                'name' => 'Shariatpur',
                'country_id' => 18,
            ),
            395 => 
            array (
                'id' => 396,
                'name' => 'Sherpur',
                'country_id' => 18,
            ),
            396 => 
            array (
                'id' => 397,
                'name' => 'Silhat',
                'country_id' => 18,
            ),
            397 => 
            array (
                'id' => 398,
                'name' => 'Sirajganj',
                'country_id' => 18,
            ),
            398 => 
            array (
                'id' => 399,
                'name' => 'Sunamganj',
                'country_id' => 18,
            ),
            399 => 
            array (
                'id' => 400,
                'name' => 'Tangayal',
                'country_id' => 18,
            ),
            400 => 
            array (
                'id' => 401,
                'name' => 'Thakurgaon',
                'country_id' => 18,
            ),
            401 => 
            array (
                'id' => 402,
                'name' => 'Christ Church',
                'country_id' => 19,
            ),
            402 => 
            array (
                'id' => 403,
                'name' => 'Saint Andrew',
                'country_id' => 19,
            ),
            403 => 
            array (
                'id' => 404,
                'name' => 'Saint George',
                'country_id' => 19,
            ),
            404 => 
            array (
                'id' => 405,
                'name' => 'Saint James',
                'country_id' => 19,
            ),
            405 => 
            array (
                'id' => 406,
                'name' => 'Saint John',
                'country_id' => 19,
            ),
            406 => 
            array (
                'id' => 407,
                'name' => 'Saint Joseph',
                'country_id' => 19,
            ),
            407 => 
            array (
                'id' => 408,
                'name' => 'Saint Lucy',
                'country_id' => 19,
            ),
            408 => 
            array (
                'id' => 409,
                'name' => 'Saint Michael',
                'country_id' => 19,
            ),
            409 => 
            array (
                'id' => 410,
                'name' => 'Saint Peter',
                'country_id' => 19,
            ),
            410 => 
            array (
                'id' => 411,
                'name' => 'Saint Philip',
                'country_id' => 19,
            ),
            411 => 
            array (
                'id' => 412,
                'name' => 'Saint Thomas',
                'country_id' => 19,
            ),
            412 => 
            array (
                'id' => 413,
                'name' => 'Brest',
                'country_id' => 20,
            ),
            413 => 
            array (
                'id' => 414,
                'name' => 'Homjel\'',
                'country_id' => 20,
            ),
            414 => 
            array (
                'id' => 415,
                'name' => 'Hrodna',
                'country_id' => 20,
            ),
            415 => 
            array (
                'id' => 416,
                'name' => 'Mahiljow',
                'country_id' => 20,
            ),
            416 => 
            array (
                'id' => 417,
                'name' => 'Mahilyowskaya Voblasts',
                'country_id' => 20,
            ),
            417 => 
            array (
                'id' => 418,
                'name' => 'Minsk',
                'country_id' => 20,
            ),
            418 => 
            array (
                'id' => 419,
                'name' => 'Minskaja Voblasts\'',
                'country_id' => 20,
            ),
            419 => 
            array (
                'id' => 420,
                'name' => 'Petrik',
                'country_id' => 20,
            ),
            420 => 
            array (
                'id' => 421,
                'name' => 'Vicebsk',
                'country_id' => 20,
            ),
            421 => 
            array (
                'id' => 422,
                'name' => 'Antwerpen',
                'country_id' => 21,
            ),
            422 => 
            array (
                'id' => 423,
                'name' => 'Berchem',
                'country_id' => 21,
            ),
            423 => 
            array (
                'id' => 424,
                'name' => 'Brabant',
                'country_id' => 21,
            ),
            424 => 
            array (
                'id' => 425,
                'name' => 'Brabant Wallon',
                'country_id' => 21,
            ),
            425 => 
            array (
                'id' => 426,
                'name' => 'Brussel',
                'country_id' => 21,
            ),
            426 => 
            array (
                'id' => 427,
                'name' => 'East Flanders',
                'country_id' => 21,
            ),
            427 => 
            array (
                'id' => 428,
                'name' => 'Hainaut',
                'country_id' => 21,
            ),
            428 => 
            array (
                'id' => 429,
                'name' => 'Liege',
                'country_id' => 21,
            ),
            429 => 
            array (
                'id' => 430,
                'name' => 'Limburg',
                'country_id' => 21,
            ),
            430 => 
            array (
                'id' => 431,
                'name' => 'Luxembourg',
                'country_id' => 21,
            ),
            431 => 
            array (
                'id' => 432,
                'name' => 'Namur',
                'country_id' => 21,
            ),
            432 => 
            array (
                'id' => 433,
                'name' => 'Ontario',
                'country_id' => 21,
            ),
            433 => 
            array (
                'id' => 434,
                'name' => 'Oost-Vlaanderen',
                'country_id' => 21,
            ),
            434 => 
            array (
                'id' => 435,
                'name' => 'Provincie Brabant',
                'country_id' => 21,
            ),
            435 => 
            array (
                'id' => 436,
                'name' => 'Vlaams-Brabant',
                'country_id' => 21,
            ),
            436 => 
            array (
                'id' => 437,
                'name' => 'Wallonne',
                'country_id' => 21,
            ),
            437 => 
            array (
                'id' => 438,
                'name' => 'West-Vlaanderen',
                'country_id' => 21,
            ),
            438 => 
            array (
                'id' => 439,
                'name' => 'Belize',
                'country_id' => 22,
            ),
            439 => 
            array (
                'id' => 440,
                'name' => 'Cayo',
                'country_id' => 22,
            ),
            440 => 
            array (
                'id' => 441,
                'name' => 'Corozal',
                'country_id' => 22,
            ),
            441 => 
            array (
                'id' => 442,
                'name' => 'Orange Walk',
                'country_id' => 22,
            ),
            442 => 
            array (
                'id' => 443,
                'name' => 'Stann Creek',
                'country_id' => 22,
            ),
            443 => 
            array (
                'id' => 444,
                'name' => 'Toledo',
                'country_id' => 22,
            ),
            444 => 
            array (
                'id' => 445,
                'name' => 'Alibori',
                'country_id' => 23,
            ),
            445 => 
            array (
                'id' => 446,
                'name' => 'Atacora',
                'country_id' => 23,
            ),
            446 => 
            array (
                'id' => 447,
                'name' => 'Atlantique',
                'country_id' => 23,
            ),
            447 => 
            array (
                'id' => 448,
                'name' => 'Borgou',
                'country_id' => 23,
            ),
            448 => 
            array (
                'id' => 449,
                'name' => 'Collines',
                'country_id' => 23,
            ),
            449 => 
            array (
                'id' => 450,
                'name' => 'Couffo',
                'country_id' => 23,
            ),
            450 => 
            array (
                'id' => 451,
                'name' => 'Donga',
                'country_id' => 23,
            ),
            451 => 
            array (
                'id' => 452,
                'name' => 'Littoral',
                'country_id' => 23,
            ),
            452 => 
            array (
                'id' => 453,
                'name' => 'Mono',
                'country_id' => 23,
            ),
            453 => 
            array (
                'id' => 454,
                'name' => 'Oueme',
                'country_id' => 23,
            ),
            454 => 
            array (
                'id' => 455,
                'name' => 'Plateau',
                'country_id' => 23,
            ),
            455 => 
            array (
                'id' => 456,
                'name' => 'Zou',
                'country_id' => 23,
            ),
            456 => 
            array (
                'id' => 457,
                'name' => 'Hamilton',
                'country_id' => 24,
            ),
            457 => 
            array (
                'id' => 458,
                'name' => 'Saint George',
                'country_id' => 24,
            ),
            458 => 
            array (
                'id' => 459,
                'name' => 'Bumthang',
                'country_id' => 25,
            ),
            459 => 
            array (
                'id' => 460,
                'name' => 'Chhukha',
                'country_id' => 25,
            ),
            460 => 
            array (
                'id' => 461,
                'name' => 'Chirang',
                'country_id' => 25,
            ),
            461 => 
            array (
                'id' => 462,
                'name' => 'Daga',
                'country_id' => 25,
            ),
            462 => 
            array (
                'id' => 463,
                'name' => 'Geylegphug',
                'country_id' => 25,
            ),
            463 => 
            array (
                'id' => 464,
                'name' => 'Ha',
                'country_id' => 25,
            ),
            464 => 
            array (
                'id' => 465,
                'name' => 'Lhuntshi',
                'country_id' => 25,
            ),
            465 => 
            array (
                'id' => 466,
                'name' => 'Mongar',
                'country_id' => 25,
            ),
            466 => 
            array (
                'id' => 467,
                'name' => 'Pemagatsel',
                'country_id' => 25,
            ),
            467 => 
            array (
                'id' => 468,
                'name' => 'Punakha',
                'country_id' => 25,
            ),
            468 => 
            array (
                'id' => 469,
                'name' => 'Rinpung',
                'country_id' => 25,
            ),
            469 => 
            array (
                'id' => 470,
                'name' => 'Samchi',
                'country_id' => 25,
            ),
            470 => 
            array (
                'id' => 471,
                'name' => 'Samdrup Jongkhar',
                'country_id' => 25,
            ),
            471 => 
            array (
                'id' => 472,
                'name' => 'Shemgang',
                'country_id' => 25,
            ),
            472 => 
            array (
                'id' => 473,
                'name' => 'Tashigang',
                'country_id' => 25,
            ),
            473 => 
            array (
                'id' => 474,
                'name' => 'Timphu',
                'country_id' => 25,
            ),
            474 => 
            array (
                'id' => 475,
                'name' => 'Tongsa',
                'country_id' => 25,
            ),
            475 => 
            array (
                'id' => 476,
                'name' => 'Wangdiphodrang',
                'country_id' => 25,
            ),
            476 => 
            array (
                'id' => 477,
                'name' => 'Beni',
                'country_id' => 26,
            ),
            477 => 
            array (
                'id' => 478,
                'name' => 'Chuquisaca',
                'country_id' => 26,
            ),
            478 => 
            array (
                'id' => 479,
                'name' => 'Cochabamba',
                'country_id' => 26,
            ),
            479 => 
            array (
                'id' => 480,
                'name' => 'La Paz',
                'country_id' => 26,
            ),
            480 => 
            array (
                'id' => 481,
                'name' => 'Oruro',
                'country_id' => 26,
            ),
            481 => 
            array (
                'id' => 482,
                'name' => 'Pando',
                'country_id' => 26,
            ),
            482 => 
            array (
                'id' => 483,
                'name' => 'Potosi',
                'country_id' => 26,
            ),
            483 => 
            array (
                'id' => 484,
                'name' => 'Santa Cruz',
                'country_id' => 26,
            ),
            484 => 
            array (
                'id' => 485,
                'name' => 'Tarija',
                'country_id' => 26,
            ),
            485 => 
            array (
                'id' => 486,
                'name' => 'Federacija Bosna i Hercegovina',
                'country_id' => 27,
            ),
            486 => 
            array (
                'id' => 487,
                'name' => 'Republika Srpska',
                'country_id' => 27,
            ),
            487 => 
            array (
                'id' => 488,
                'name' => 'Central Bobonong',
                'country_id' => 28,
            ),
            488 => 
            array (
                'id' => 489,
                'name' => 'Central Boteti',
                'country_id' => 28,
            ),
            489 => 
            array (
                'id' => 490,
                'name' => 'Central Mahalapye',
                'country_id' => 28,
            ),
            490 => 
            array (
                'id' => 491,
                'name' => 'Central Serowe-Palapye',
                'country_id' => 28,
            ),
            491 => 
            array (
                'id' => 492,
                'name' => 'Central Tutume',
                'country_id' => 28,
            ),
            492 => 
            array (
                'id' => 493,
                'name' => 'Chobe',
                'country_id' => 28,
            ),
            493 => 
            array (
                'id' => 494,
                'name' => 'Francistown',
                'country_id' => 28,
            ),
            494 => 
            array (
                'id' => 495,
                'name' => 'Gaborone',
                'country_id' => 28,
            ),
            495 => 
            array (
                'id' => 496,
                'name' => 'Ghanzi',
                'country_id' => 28,
            ),
            496 => 
            array (
                'id' => 497,
                'name' => 'Jwaneng',
                'country_id' => 28,
            ),
            497 => 
            array (
                'id' => 498,
                'name' => 'Kgalagadi North',
                'country_id' => 28,
            ),
            498 => 
            array (
                'id' => 499,
                'name' => 'Kgalagadi South',
                'country_id' => 28,
            ),
            499 => 
            array (
                'id' => 500,
                'name' => 'Kgatleng',
                'country_id' => 28,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 501,
                'name' => 'Kweneng',
                'country_id' => 28,
            ),
            1 => 
            array (
                'id' => 502,
                'name' => 'Lobatse',
                'country_id' => 28,
            ),
            2 => 
            array (
                'id' => 503,
                'name' => 'Ngamiland',
                'country_id' => 28,
            ),
            3 => 
            array (
                'id' => 504,
                'name' => 'Ngwaketse',
                'country_id' => 28,
            ),
            4 => 
            array (
                'id' => 505,
                'name' => 'North East',
                'country_id' => 28,
            ),
            5 => 
            array (
                'id' => 506,
                'name' => 'Okavango',
                'country_id' => 28,
            ),
            6 => 
            array (
                'id' => 507,
                'name' => 'Orapa',
                'country_id' => 28,
            ),
            7 => 
            array (
                'id' => 508,
                'name' => 'Selibe Phikwe',
                'country_id' => 28,
            ),
            8 => 
            array (
                'id' => 509,
                'name' => 'South East',
                'country_id' => 28,
            ),
            9 => 
            array (
                'id' => 510,
                'name' => 'Sowa',
                'country_id' => 28,
            ),
            10 => 
            array (
                'id' => 511,
                'name' => 'Bouvet Island',
                'country_id' => 29,
            ),
            11 => 
            array (
                'id' => 512,
                'name' => 'Acre',
                'country_id' => 30,
            ),
            12 => 
            array (
                'id' => 513,
                'name' => 'Alagoas',
                'country_id' => 30,
            ),
            13 => 
            array (
                'id' => 514,
                'name' => 'Amapa',
                'country_id' => 30,
            ),
            14 => 
            array (
                'id' => 515,
                'name' => 'Amazonas',
                'country_id' => 30,
            ),
            15 => 
            array (
                'id' => 516,
                'name' => 'Bahia',
                'country_id' => 30,
            ),
            16 => 
            array (
                'id' => 517,
                'name' => 'Ceara',
                'country_id' => 30,
            ),
            17 => 
            array (
                'id' => 518,
                'name' => 'Distrito Federal',
                'country_id' => 30,
            ),
            18 => 
            array (
                'id' => 519,
                'name' => 'Espirito Santo',
                'country_id' => 30,
            ),
            19 => 
            array (
                'id' => 520,
                'name' => 'Estado de Sao Paulo',
                'country_id' => 30,
            ),
            20 => 
            array (
                'id' => 521,
                'name' => 'Goias',
                'country_id' => 30,
            ),
            21 => 
            array (
                'id' => 522,
                'name' => 'Maranhao',
                'country_id' => 30,
            ),
            22 => 
            array (
                'id' => 523,
                'name' => 'Mato Grosso',
                'country_id' => 30,
            ),
            23 => 
            array (
                'id' => 524,
                'name' => 'Mato Grosso do Sul',
                'country_id' => 30,
            ),
            24 => 
            array (
                'id' => 525,
                'name' => 'Minas Gerais',
                'country_id' => 30,
            ),
            25 => 
            array (
                'id' => 526,
                'name' => 'Para',
                'country_id' => 30,
            ),
            26 => 
            array (
                'id' => 527,
                'name' => 'Paraiba',
                'country_id' => 30,
            ),
            27 => 
            array (
                'id' => 528,
                'name' => 'Parana',
                'country_id' => 30,
            ),
            28 => 
            array (
                'id' => 529,
                'name' => 'Pernambuco',
                'country_id' => 30,
            ),
            29 => 
            array (
                'id' => 530,
                'name' => 'Piaui',
                'country_id' => 30,
            ),
            30 => 
            array (
                'id' => 531,
                'name' => 'Rio Grande do Norte',
                'country_id' => 30,
            ),
            31 => 
            array (
                'id' => 532,
                'name' => 'Rio Grande do Sul',
                'country_id' => 30,
            ),
            32 => 
            array (
                'id' => 533,
                'name' => 'Rio de Janeiro',
                'country_id' => 30,
            ),
            33 => 
            array (
                'id' => 534,
                'name' => 'Rondonia',
                'country_id' => 30,
            ),
            34 => 
            array (
                'id' => 535,
                'name' => 'Roraima',
                'country_id' => 30,
            ),
            35 => 
            array (
                'id' => 536,
                'name' => 'Santa Catarina',
                'country_id' => 30,
            ),
            36 => 
            array (
                'id' => 537,
                'name' => 'Sao Paulo',
                'country_id' => 30,
            ),
            37 => 
            array (
                'id' => 538,
                'name' => 'Sergipe',
                'country_id' => 30,
            ),
            38 => 
            array (
                'id' => 539,
                'name' => 'Tocantins',
                'country_id' => 30,
            ),
            39 => 
            array (
                'id' => 540,
                'name' => 'British Indian Ocean Territory',
                'country_id' => 31,
            ),
            40 => 
            array (
                'id' => 541,
                'name' => 'Belait',
                'country_id' => 32,
            ),
            41 => 
            array (
                'id' => 542,
                'name' => 'Brunei-Muara',
                'country_id' => 32,
            ),
            42 => 
            array (
                'id' => 543,
                'name' => 'Temburong',
                'country_id' => 32,
            ),
            43 => 
            array (
                'id' => 544,
                'name' => 'Tutong',
                'country_id' => 32,
            ),
            44 => 
            array (
                'id' => 545,
                'name' => 'Blagoevgrad',
                'country_id' => 33,
            ),
            45 => 
            array (
                'id' => 546,
                'name' => 'Burgas',
                'country_id' => 33,
            ),
            46 => 
            array (
                'id' => 547,
                'name' => 'Dobrich',
                'country_id' => 33,
            ),
            47 => 
            array (
                'id' => 548,
                'name' => 'Gabrovo',
                'country_id' => 33,
            ),
            48 => 
            array (
                'id' => 549,
                'name' => 'Haskovo',
                'country_id' => 33,
            ),
            49 => 
            array (
                'id' => 550,
                'name' => 'Jambol',
                'country_id' => 33,
            ),
            50 => 
            array (
                'id' => 551,
                'name' => 'Kardzhali',
                'country_id' => 33,
            ),
            51 => 
            array (
                'id' => 552,
                'name' => 'Kjustendil',
                'country_id' => 33,
            ),
            52 => 
            array (
                'id' => 553,
                'name' => 'Lovech',
                'country_id' => 33,
            ),
            53 => 
            array (
                'id' => 554,
                'name' => 'Montana',
                'country_id' => 33,
            ),
            54 => 
            array (
                'id' => 555,
                'name' => 'Oblast Sofiya-Grad',
                'country_id' => 33,
            ),
            55 => 
            array (
                'id' => 556,
                'name' => 'Pazardzhik',
                'country_id' => 33,
            ),
            56 => 
            array (
                'id' => 557,
                'name' => 'Pernik',
                'country_id' => 33,
            ),
            57 => 
            array (
                'id' => 558,
                'name' => 'Pleven',
                'country_id' => 33,
            ),
            58 => 
            array (
                'id' => 559,
                'name' => 'Plovdiv',
                'country_id' => 33,
            ),
            59 => 
            array (
                'id' => 560,
                'name' => 'Razgrad',
                'country_id' => 33,
            ),
            60 => 
            array (
                'id' => 561,
                'name' => 'Ruse',
                'country_id' => 33,
            ),
            61 => 
            array (
                'id' => 562,
                'name' => 'Shumen',
                'country_id' => 33,
            ),
            62 => 
            array (
                'id' => 563,
                'name' => 'Silistra',
                'country_id' => 33,
            ),
            63 => 
            array (
                'id' => 564,
                'name' => 'Sliven',
                'country_id' => 33,
            ),
            64 => 
            array (
                'id' => 565,
                'name' => 'Smoljan',
                'country_id' => 33,
            ),
            65 => 
            array (
                'id' => 566,
                'name' => 'Sofija grad',
                'country_id' => 33,
            ),
            66 => 
            array (
                'id' => 567,
                'name' => 'Sofijska oblast',
                'country_id' => 33,
            ),
            67 => 
            array (
                'id' => 568,
                'name' => 'Stara Zagora',
                'country_id' => 33,
            ),
            68 => 
            array (
                'id' => 569,
                'name' => 'Targovishte',
                'country_id' => 33,
            ),
            69 => 
            array (
                'id' => 570,
                'name' => 'Varna',
                'country_id' => 33,
            ),
            70 => 
            array (
                'id' => 571,
                'name' => 'Veliko Tarnovo',
                'country_id' => 33,
            ),
            71 => 
            array (
                'id' => 572,
                'name' => 'Vidin',
                'country_id' => 33,
            ),
            72 => 
            array (
                'id' => 573,
                'name' => 'Vraca',
                'country_id' => 33,
            ),
            73 => 
            array (
                'id' => 574,
                'name' => 'Yablaniza',
                'country_id' => 33,
            ),
            74 => 
            array (
                'id' => 575,
                'name' => 'Bale',
                'country_id' => 34,
            ),
            75 => 
            array (
                'id' => 576,
                'name' => 'Bam',
                'country_id' => 34,
            ),
            76 => 
            array (
                'id' => 577,
                'name' => 'Bazega',
                'country_id' => 34,
            ),
            77 => 
            array (
                'id' => 578,
                'name' => 'Bougouriba',
                'country_id' => 34,
            ),
            78 => 
            array (
                'id' => 579,
                'name' => 'Boulgou',
                'country_id' => 34,
            ),
            79 => 
            array (
                'id' => 580,
                'name' => 'Boulkiemde',
                'country_id' => 34,
            ),
            80 => 
            array (
                'id' => 581,
                'name' => 'Comoe',
                'country_id' => 34,
            ),
            81 => 
            array (
                'id' => 582,
                'name' => 'Ganzourgou',
                'country_id' => 34,
            ),
            82 => 
            array (
                'id' => 583,
                'name' => 'Gnagna',
                'country_id' => 34,
            ),
            83 => 
            array (
                'id' => 584,
                'name' => 'Gourma',
                'country_id' => 34,
            ),
            84 => 
            array (
                'id' => 585,
                'name' => 'Houet',
                'country_id' => 34,
            ),
            85 => 
            array (
                'id' => 586,
                'name' => 'Ioba',
                'country_id' => 34,
            ),
            86 => 
            array (
                'id' => 587,
                'name' => 'Kadiogo',
                'country_id' => 34,
            ),
            87 => 
            array (
                'id' => 588,
                'name' => 'Kenedougou',
                'country_id' => 34,
            ),
            88 => 
            array (
                'id' => 589,
                'name' => 'Komandjari',
                'country_id' => 34,
            ),
            89 => 
            array (
                'id' => 590,
                'name' => 'Kompienga',
                'country_id' => 34,
            ),
            90 => 
            array (
                'id' => 591,
                'name' => 'Kossi',
                'country_id' => 34,
            ),
            91 => 
            array (
                'id' => 592,
                'name' => 'Kouritenga',
                'country_id' => 34,
            ),
            92 => 
            array (
                'id' => 593,
                'name' => 'Kourweogo',
                'country_id' => 34,
            ),
            93 => 
            array (
                'id' => 594,
                'name' => 'Leraba',
                'country_id' => 34,
            ),
            94 => 
            array (
                'id' => 595,
                'name' => 'Mouhoun',
                'country_id' => 34,
            ),
            95 => 
            array (
                'id' => 596,
                'name' => 'Nahouri',
                'country_id' => 34,
            ),
            96 => 
            array (
                'id' => 597,
                'name' => 'Namentenga',
                'country_id' => 34,
            ),
            97 => 
            array (
                'id' => 598,
                'name' => 'Noumbiel',
                'country_id' => 34,
            ),
            98 => 
            array (
                'id' => 599,
                'name' => 'Oubritenga',
                'country_id' => 34,
            ),
            99 => 
            array (
                'id' => 600,
                'name' => 'Oudalan',
                'country_id' => 34,
            ),
            100 => 
            array (
                'id' => 601,
                'name' => 'Passore',
                'country_id' => 34,
            ),
            101 => 
            array (
                'id' => 602,
                'name' => 'Poni',
                'country_id' => 34,
            ),
            102 => 
            array (
                'id' => 603,
                'name' => 'Sanguie',
                'country_id' => 34,
            ),
            103 => 
            array (
                'id' => 604,
                'name' => 'Sanmatenga',
                'country_id' => 34,
            ),
            104 => 
            array (
                'id' => 605,
                'name' => 'Seno',
                'country_id' => 34,
            ),
            105 => 
            array (
                'id' => 606,
                'name' => 'Sissili',
                'country_id' => 34,
            ),
            106 => 
            array (
                'id' => 607,
                'name' => 'Soum',
                'country_id' => 34,
            ),
            107 => 
            array (
                'id' => 608,
                'name' => 'Sourou',
                'country_id' => 34,
            ),
            108 => 
            array (
                'id' => 609,
                'name' => 'Tapoa',
                'country_id' => 34,
            ),
            109 => 
            array (
                'id' => 610,
                'name' => 'Tuy',
                'country_id' => 34,
            ),
            110 => 
            array (
                'id' => 611,
                'name' => 'Yatenga',
                'country_id' => 34,
            ),
            111 => 
            array (
                'id' => 612,
                'name' => 'Zondoma',
                'country_id' => 34,
            ),
            112 => 
            array (
                'id' => 613,
                'name' => 'Zoundweogo',
                'country_id' => 34,
            ),
            113 => 
            array (
                'id' => 614,
                'name' => 'Bubanza',
                'country_id' => 35,
            ),
            114 => 
            array (
                'id' => 615,
                'name' => 'Bujumbura',
                'country_id' => 35,
            ),
            115 => 
            array (
                'id' => 616,
                'name' => 'Bururi',
                'country_id' => 35,
            ),
            116 => 
            array (
                'id' => 617,
                'name' => 'Cankuzo',
                'country_id' => 35,
            ),
            117 => 
            array (
                'id' => 618,
                'name' => 'Cibitoke',
                'country_id' => 35,
            ),
            118 => 
            array (
                'id' => 619,
                'name' => 'Gitega',
                'country_id' => 35,
            ),
            119 => 
            array (
                'id' => 620,
                'name' => 'Karuzi',
                'country_id' => 35,
            ),
            120 => 
            array (
                'id' => 621,
                'name' => 'Kayanza',
                'country_id' => 35,
            ),
            121 => 
            array (
                'id' => 622,
                'name' => 'Kirundo',
                'country_id' => 35,
            ),
            122 => 
            array (
                'id' => 623,
                'name' => 'Makamba',
                'country_id' => 35,
            ),
            123 => 
            array (
                'id' => 624,
                'name' => 'Muramvya',
                'country_id' => 35,
            ),
            124 => 
            array (
                'id' => 625,
                'name' => 'Muyinga',
                'country_id' => 35,
            ),
            125 => 
            array (
                'id' => 626,
                'name' => 'Ngozi',
                'country_id' => 35,
            ),
            126 => 
            array (
                'id' => 627,
                'name' => 'Rutana',
                'country_id' => 35,
            ),
            127 => 
            array (
                'id' => 628,
                'name' => 'Ruyigi',
                'country_id' => 35,
            ),
            128 => 
            array (
                'id' => 629,
                'name' => 'Banteay Mean Chey',
                'country_id' => 36,
            ),
            129 => 
            array (
                'id' => 630,
                'name' => 'Bat Dambang',
                'country_id' => 36,
            ),
            130 => 
            array (
                'id' => 631,
                'name' => 'Kampong Cham',
                'country_id' => 36,
            ),
            131 => 
            array (
                'id' => 632,
                'name' => 'Kampong Chhnang',
                'country_id' => 36,
            ),
            132 => 
            array (
                'id' => 633,
                'name' => 'Kampong Spoeu',
                'country_id' => 36,
            ),
            133 => 
            array (
                'id' => 634,
                'name' => 'Kampong Thum',
                'country_id' => 36,
            ),
            134 => 
            array (
                'id' => 635,
                'name' => 'Kampot',
                'country_id' => 36,
            ),
            135 => 
            array (
                'id' => 636,
                'name' => 'Kandal',
                'country_id' => 36,
            ),
            136 => 
            array (
                'id' => 637,
                'name' => 'Kaoh Kong',
                'country_id' => 36,
            ),
            137 => 
            array (
                'id' => 638,
                'name' => 'Kracheh',
                'country_id' => 36,
            ),
            138 => 
            array (
                'id' => 639,
                'name' => 'Krong Kaeb',
                'country_id' => 36,
            ),
            139 => 
            array (
                'id' => 640,
                'name' => 'Krong Pailin',
                'country_id' => 36,
            ),
            140 => 
            array (
                'id' => 641,
                'name' => 'Krong Preah Sihanouk',
                'country_id' => 36,
            ),
            141 => 
            array (
                'id' => 642,
                'name' => 'Mondol Kiri',
                'country_id' => 36,
            ),
            142 => 
            array (
                'id' => 643,
                'name' => 'Otdar Mean Chey',
                'country_id' => 36,
            ),
            143 => 
            array (
                'id' => 644,
                'name' => 'Phnum Penh',
                'country_id' => 36,
            ),
            144 => 
            array (
                'id' => 645,
                'name' => 'Pousat',
                'country_id' => 36,
            ),
            145 => 
            array (
                'id' => 646,
                'name' => 'Preah Vihear',
                'country_id' => 36,
            ),
            146 => 
            array (
                'id' => 647,
                'name' => 'Prey Veaeng',
                'country_id' => 36,
            ),
            147 => 
            array (
                'id' => 648,
                'name' => 'Rotanak Kiri',
                'country_id' => 36,
            ),
            148 => 
            array (
                'id' => 649,
                'name' => 'Siem Reab',
                'country_id' => 36,
            ),
            149 => 
            array (
                'id' => 650,
                'name' => 'Stueng Traeng',
                'country_id' => 36,
            ),
            150 => 
            array (
                'id' => 651,
                'name' => 'Svay Rieng',
                'country_id' => 36,
            ),
            151 => 
            array (
                'id' => 652,
                'name' => 'Takaev',
                'country_id' => 36,
            ),
            152 => 
            array (
                'id' => 653,
                'name' => 'Adamaoua',
                'country_id' => 37,
            ),
            153 => 
            array (
                'id' => 654,
                'name' => 'Centre',
                'country_id' => 37,
            ),
            154 => 
            array (
                'id' => 655,
                'name' => 'Est',
                'country_id' => 37,
            ),
            155 => 
            array (
                'id' => 656,
                'name' => 'Littoral',
                'country_id' => 37,
            ),
            156 => 
            array (
                'id' => 657,
                'name' => 'Nord',
                'country_id' => 37,
            ),
            157 => 
            array (
                'id' => 658,
                'name' => 'Nord Extreme',
                'country_id' => 37,
            ),
            158 => 
            array (
                'id' => 659,
                'name' => 'Nordouest',
                'country_id' => 37,
            ),
            159 => 
            array (
                'id' => 660,
                'name' => 'Ouest',
                'country_id' => 37,
            ),
            160 => 
            array (
                'id' => 661,
                'name' => 'Sud',
                'country_id' => 37,
            ),
            161 => 
            array (
                'id' => 662,
                'name' => 'Sudouest',
                'country_id' => 37,
            ),
            162 => 
            array (
                'id' => 663,
                'name' => 'Alberta',
                'country_id' => 38,
            ),
            163 => 
            array (
                'id' => 664,
                'name' => 'British Columbia',
                'country_id' => 38,
            ),
            164 => 
            array (
                'id' => 665,
                'name' => 'Manitoba',
                'country_id' => 38,
            ),
            165 => 
            array (
                'id' => 666,
                'name' => 'New Brunswick',
                'country_id' => 38,
            ),
            166 => 
            array (
                'id' => 667,
                'name' => 'Newfoundland and Labrador',
                'country_id' => 38,
            ),
            167 => 
            array (
                'id' => 668,
                'name' => 'Northwest Territories',
                'country_id' => 38,
            ),
            168 => 
            array (
                'id' => 669,
                'name' => 'Nova Scotia',
                'country_id' => 38,
            ),
            169 => 
            array (
                'id' => 670,
                'name' => 'Nunavut',
                'country_id' => 38,
            ),
            170 => 
            array (
                'id' => 671,
                'name' => 'Ontario',
                'country_id' => 38,
            ),
            171 => 
            array (
                'id' => 672,
                'name' => 'Prince Edward Island',
                'country_id' => 38,
            ),
            172 => 
            array (
                'id' => 673,
                'name' => 'Quebec',
                'country_id' => 38,
            ),
            173 => 
            array (
                'id' => 674,
                'name' => 'Saskatchewan',
                'country_id' => 38,
            ),
            174 => 
            array (
                'id' => 675,
                'name' => 'Yukon',
                'country_id' => 38,
            ),
            175 => 
            array (
                'id' => 676,
                'name' => 'Boavista',
                'country_id' => 39,
            ),
            176 => 
            array (
                'id' => 677,
                'name' => 'Brava',
                'country_id' => 39,
            ),
            177 => 
            array (
                'id' => 678,
                'name' => 'Fogo',
                'country_id' => 39,
            ),
            178 => 
            array (
                'id' => 679,
                'name' => 'Maio',
                'country_id' => 39,
            ),
            179 => 
            array (
                'id' => 680,
                'name' => 'Sal',
                'country_id' => 39,
            ),
            180 => 
            array (
                'id' => 681,
                'name' => 'Santo Antao',
                'country_id' => 39,
            ),
            181 => 
            array (
                'id' => 682,
                'name' => 'Sao Nicolau',
                'country_id' => 39,
            ),
            182 => 
            array (
                'id' => 683,
                'name' => 'Sao Tiago',
                'country_id' => 39,
            ),
            183 => 
            array (
                'id' => 684,
                'name' => 'Sao Vicente',
                'country_id' => 39,
            ),
            184 => 
            array (
                'id' => 685,
                'name' => 'Grand Cayman',
                'country_id' => 40,
            ),
            185 => 
            array (
                'id' => 686,
                'name' => 'Bamingui-Bangoran',
                'country_id' => 41,
            ),
            186 => 
            array (
                'id' => 687,
                'name' => 'Bangui',
                'country_id' => 41,
            ),
            187 => 
            array (
                'id' => 688,
                'name' => 'Basse-Kotto',
                'country_id' => 41,
            ),
            188 => 
            array (
                'id' => 689,
                'name' => 'Haut-Mbomou',
                'country_id' => 41,
            ),
            189 => 
            array (
                'id' => 690,
                'name' => 'Haute-Kotto',
                'country_id' => 41,
            ),
            190 => 
            array (
                'id' => 691,
                'name' => 'Kemo',
                'country_id' => 41,
            ),
            191 => 
            array (
                'id' => 692,
                'name' => 'Lobaye',
                'country_id' => 41,
            ),
            192 => 
            array (
                'id' => 693,
                'name' => 'Mambere-Kadei',
                'country_id' => 41,
            ),
            193 => 
            array (
                'id' => 694,
                'name' => 'Mbomou',
                'country_id' => 41,
            ),
            194 => 
            array (
                'id' => 695,
                'name' => 'Nana-Gribizi',
                'country_id' => 41,
            ),
            195 => 
            array (
                'id' => 696,
                'name' => 'Nana-Mambere',
                'country_id' => 41,
            ),
            196 => 
            array (
                'id' => 697,
                'name' => 'Ombella Mpoko',
                'country_id' => 41,
            ),
            197 => 
            array (
                'id' => 698,
                'name' => 'Ouaka',
                'country_id' => 41,
            ),
            198 => 
            array (
                'id' => 699,
                'name' => 'Ouham',
                'country_id' => 41,
            ),
            199 => 
            array (
                'id' => 700,
                'name' => 'Ouham-Pende',
                'country_id' => 41,
            ),
            200 => 
            array (
                'id' => 701,
                'name' => 'Sangha-Mbaere',
                'country_id' => 41,
            ),
            201 => 
            array (
                'id' => 702,
                'name' => 'Vakaga',
                'country_id' => 41,
            ),
            202 => 
            array (
                'id' => 703,
                'name' => 'Batha',
                'country_id' => 42,
            ),
            203 => 
            array (
                'id' => 704,
                'name' => 'Biltine',
                'country_id' => 42,
            ),
            204 => 
            array (
                'id' => 705,
                'name' => 'Bourkou-Ennedi-Tibesti',
                'country_id' => 42,
            ),
            205 => 
            array (
                'id' => 706,
                'name' => 'Chari-Baguirmi',
                'country_id' => 42,
            ),
            206 => 
            array (
                'id' => 707,
                'name' => 'Guera',
                'country_id' => 42,
            ),
            207 => 
            array (
                'id' => 708,
                'name' => 'Kanem',
                'country_id' => 42,
            ),
            208 => 
            array (
                'id' => 709,
                'name' => 'Lac',
                'country_id' => 42,
            ),
            209 => 
            array (
                'id' => 710,
                'name' => 'Logone Occidental',
                'country_id' => 42,
            ),
            210 => 
            array (
                'id' => 711,
                'name' => 'Logone Oriental',
                'country_id' => 42,
            ),
            211 => 
            array (
                'id' => 712,
                'name' => 'Mayo-Kebbi',
                'country_id' => 42,
            ),
            212 => 
            array (
                'id' => 713,
                'name' => 'Moyen-Chari',
                'country_id' => 42,
            ),
            213 => 
            array (
                'id' => 714,
                'name' => 'Ouaddai',
                'country_id' => 42,
            ),
            214 => 
            array (
                'id' => 715,
                'name' => 'Salamat',
                'country_id' => 42,
            ),
            215 => 
            array (
                'id' => 716,
                'name' => 'Tandjile',
                'country_id' => 42,
            ),
            216 => 
            array (
                'id' => 717,
                'name' => 'Aisen',
                'country_id' => 43,
            ),
            217 => 
            array (
                'id' => 718,
                'name' => 'Antofagasta',
                'country_id' => 43,
            ),
            218 => 
            array (
                'id' => 719,
                'name' => 'Araucania',
                'country_id' => 43,
            ),
            219 => 
            array (
                'id' => 720,
                'name' => 'Atacama',
                'country_id' => 43,
            ),
            220 => 
            array (
                'id' => 721,
                'name' => 'Bio Bio',
                'country_id' => 43,
            ),
            221 => 
            array (
                'id' => 722,
                'name' => 'Coquimbo',
                'country_id' => 43,
            ),
            222 => 
            array (
                'id' => 723,
                'name' => 'Libertador General Bernardo O\'',
                'country_id' => 43,
            ),
            223 => 
            array (
                'id' => 724,
                'name' => 'Los Lagos',
                'country_id' => 43,
            ),
            224 => 
            array (
                'id' => 725,
                'name' => 'Magellanes',
                'country_id' => 43,
            ),
            225 => 
            array (
                'id' => 726,
                'name' => 'Maule',
                'country_id' => 43,
            ),
            226 => 
            array (
                'id' => 727,
                'name' => 'Metropolitana',
                'country_id' => 43,
            ),
            227 => 
            array (
                'id' => 728,
                'name' => 'Metropolitana de Santiago',
                'country_id' => 43,
            ),
            228 => 
            array (
                'id' => 729,
                'name' => 'Tarapaca',
                'country_id' => 43,
            ),
            229 => 
            array (
                'id' => 730,
                'name' => 'Valparaiso',
                'country_id' => 43,
            ),
            230 => 
            array (
                'id' => 731,
                'name' => 'Anhui',
                'country_id' => 44,
            ),
            231 => 
            array (
                'id' => 732,
                'name' => 'Anhui Province',
                'country_id' => 44,
            ),
            232 => 
            array (
                'id' => 733,
                'name' => 'Anhui Sheng',
                'country_id' => 44,
            ),
            233 => 
            array (
                'id' => 734,
                'name' => 'Aomen',
                'country_id' => 44,
            ),
            234 => 
            array (
                'id' => 735,
                'name' => 'Beijing',
                'country_id' => 44,
            ),
            235 => 
            array (
                'id' => 736,
                'name' => 'Beijing Shi',
                'country_id' => 44,
            ),
            236 => 
            array (
                'id' => 737,
                'name' => 'Chongqing',
                'country_id' => 44,
            ),
            237 => 
            array (
                'id' => 738,
                'name' => 'Fujian',
                'country_id' => 44,
            ),
            238 => 
            array (
                'id' => 739,
                'name' => 'Fujian Sheng',
                'country_id' => 44,
            ),
            239 => 
            array (
                'id' => 740,
                'name' => 'Gansu',
                'country_id' => 44,
            ),
            240 => 
            array (
                'id' => 741,
                'name' => 'Guangdong',
                'country_id' => 44,
            ),
            241 => 
            array (
                'id' => 742,
                'name' => 'Guangdong Sheng',
                'country_id' => 44,
            ),
            242 => 
            array (
                'id' => 743,
                'name' => 'Guangxi',
                'country_id' => 44,
            ),
            243 => 
            array (
                'id' => 744,
                'name' => 'Guizhou',
                'country_id' => 44,
            ),
            244 => 
            array (
                'id' => 745,
                'name' => 'Hainan',
                'country_id' => 44,
            ),
            245 => 
            array (
                'id' => 746,
                'name' => 'Hebei',
                'country_id' => 44,
            ),
            246 => 
            array (
                'id' => 747,
                'name' => 'Heilongjiang',
                'country_id' => 44,
            ),
            247 => 
            array (
                'id' => 748,
                'name' => 'Henan',
                'country_id' => 44,
            ),
            248 => 
            array (
                'id' => 749,
                'name' => 'Hubei',
                'country_id' => 44,
            ),
            249 => 
            array (
                'id' => 750,
                'name' => 'Hunan',
                'country_id' => 44,
            ),
            250 => 
            array (
                'id' => 751,
                'name' => 'Jiangsu',
                'country_id' => 44,
            ),
            251 => 
            array (
                'id' => 752,
                'name' => 'Jiangsu Sheng',
                'country_id' => 44,
            ),
            252 => 
            array (
                'id' => 753,
                'name' => 'Jiangxi',
                'country_id' => 44,
            ),
            253 => 
            array (
                'id' => 754,
                'name' => 'Jilin',
                'country_id' => 44,
            ),
            254 => 
            array (
                'id' => 755,
                'name' => 'Liaoning',
                'country_id' => 44,
            ),
            255 => 
            array (
                'id' => 756,
                'name' => 'Liaoning Sheng',
                'country_id' => 44,
            ),
            256 => 
            array (
                'id' => 757,
                'name' => 'Nei Monggol',
                'country_id' => 44,
            ),
            257 => 
            array (
                'id' => 758,
                'name' => 'Ningxia Hui',
                'country_id' => 44,
            ),
            258 => 
            array (
                'id' => 759,
                'name' => 'Qinghai',
                'country_id' => 44,
            ),
            259 => 
            array (
                'id' => 760,
                'name' => 'Shaanxi',
                'country_id' => 44,
            ),
            260 => 
            array (
                'id' => 761,
                'name' => 'Shandong',
                'country_id' => 44,
            ),
            261 => 
            array (
                'id' => 762,
                'name' => 'Shandong Sheng',
                'country_id' => 44,
            ),
            262 => 
            array (
                'id' => 763,
                'name' => 'Shanghai',
                'country_id' => 44,
            ),
            263 => 
            array (
                'id' => 764,
                'name' => 'Shanxi',
                'country_id' => 44,
            ),
            264 => 
            array (
                'id' => 765,
                'name' => 'Sichuan',
                'country_id' => 44,
            ),
            265 => 
            array (
                'id' => 766,
                'name' => 'Tianjin',
                'country_id' => 44,
            ),
            266 => 
            array (
                'id' => 767,
                'name' => 'Xianggang',
                'country_id' => 44,
            ),
            267 => 
            array (
                'id' => 768,
                'name' => 'Xinjiang',
                'country_id' => 44,
            ),
            268 => 
            array (
                'id' => 769,
                'name' => 'Xizang',
                'country_id' => 44,
            ),
            269 => 
            array (
                'id' => 770,
                'name' => 'Yunnan',
                'country_id' => 44,
            ),
            270 => 
            array (
                'id' => 771,
                'name' => 'Zhejiang',
                'country_id' => 44,
            ),
            271 => 
            array (
                'id' => 772,
                'name' => 'Zhejiang Sheng',
                'country_id' => 44,
            ),
            272 => 
            array (
                'id' => 773,
                'name' => 'Christmas Island',
                'country_id' => 45,
            ),
            273 => 
            array (
                'id' => 774,
            'name' => 'Cocos (Keeling) Islands',
                'country_id' => 46,
            ),
            274 => 
            array (
                'id' => 775,
                'name' => 'Amazonas',
                'country_id' => 47,
            ),
            275 => 
            array (
                'id' => 776,
                'name' => 'Antioquia',
                'country_id' => 47,
            ),
            276 => 
            array (
                'id' => 777,
                'name' => 'Arauca',
                'country_id' => 47,
            ),
            277 => 
            array (
                'id' => 778,
                'name' => 'Atlantico',
                'country_id' => 47,
            ),
            278 => 
            array (
                'id' => 779,
                'name' => 'Bogota',
                'country_id' => 47,
            ),
            279 => 
            array (
                'id' => 780,
                'name' => 'Bolivar',
                'country_id' => 47,
            ),
            280 => 
            array (
                'id' => 781,
                'name' => 'Boyaca',
                'country_id' => 47,
            ),
            281 => 
            array (
                'id' => 782,
                'name' => 'Caldas',
                'country_id' => 47,
            ),
            282 => 
            array (
                'id' => 783,
                'name' => 'Caqueta',
                'country_id' => 47,
            ),
            283 => 
            array (
                'id' => 784,
                'name' => 'Casanare',
                'country_id' => 47,
            ),
            284 => 
            array (
                'id' => 785,
                'name' => 'Cauca',
                'country_id' => 47,
            ),
            285 => 
            array (
                'id' => 786,
                'name' => 'Cesar',
                'country_id' => 47,
            ),
            286 => 
            array (
                'id' => 787,
                'name' => 'Choco',
                'country_id' => 47,
            ),
            287 => 
            array (
                'id' => 788,
                'name' => 'Cordoba',
                'country_id' => 47,
            ),
            288 => 
            array (
                'id' => 789,
                'name' => 'Cundinamarca',
                'country_id' => 47,
            ),
            289 => 
            array (
                'id' => 790,
                'name' => 'Guainia',
                'country_id' => 47,
            ),
            290 => 
            array (
                'id' => 791,
                'name' => 'Guaviare',
                'country_id' => 47,
            ),
            291 => 
            array (
                'id' => 792,
                'name' => 'Huila',
                'country_id' => 47,
            ),
            292 => 
            array (
                'id' => 793,
                'name' => 'La Guajira',
                'country_id' => 47,
            ),
            293 => 
            array (
                'id' => 794,
                'name' => 'Magdalena',
                'country_id' => 47,
            ),
            294 => 
            array (
                'id' => 795,
                'name' => 'Meta',
                'country_id' => 47,
            ),
            295 => 
            array (
                'id' => 796,
                'name' => 'Narino',
                'country_id' => 47,
            ),
            296 => 
            array (
                'id' => 797,
                'name' => 'Norte de Santander',
                'country_id' => 47,
            ),
            297 => 
            array (
                'id' => 798,
                'name' => 'Putumayo',
                'country_id' => 47,
            ),
            298 => 
            array (
                'id' => 799,
                'name' => 'Quindio',
                'country_id' => 47,
            ),
            299 => 
            array (
                'id' => 800,
                'name' => 'Risaralda',
                'country_id' => 47,
            ),
            300 => 
            array (
                'id' => 801,
                'name' => 'San Andres y Providencia',
                'country_id' => 47,
            ),
            301 => 
            array (
                'id' => 802,
                'name' => 'Santander',
                'country_id' => 47,
            ),
            302 => 
            array (
                'id' => 803,
                'name' => 'Sucre',
                'country_id' => 47,
            ),
            303 => 
            array (
                'id' => 804,
                'name' => 'Tolima',
                'country_id' => 47,
            ),
            304 => 
            array (
                'id' => 805,
                'name' => 'Valle del Cauca',
                'country_id' => 47,
            ),
            305 => 
            array (
                'id' => 806,
                'name' => 'Vaupes',
                'country_id' => 47,
            ),
            306 => 
            array (
                'id' => 807,
                'name' => 'Vichada',
                'country_id' => 47,
            ),
            307 => 
            array (
                'id' => 808,
                'name' => 'Mwali',
                'country_id' => 48,
            ),
            308 => 
            array (
                'id' => 809,
                'name' => 'Njazidja',
                'country_id' => 48,
            ),
            309 => 
            array (
                'id' => 810,
                'name' => 'Nzwani',
                'country_id' => 48,
            ),
            310 => 
            array (
                'id' => 811,
                'name' => 'Bouenza',
                'country_id' => 49,
            ),
            311 => 
            array (
                'id' => 812,
                'name' => 'Brazzaville',
                'country_id' => 49,
            ),
            312 => 
            array (
                'id' => 813,
                'name' => 'Cuvette',
                'country_id' => 49,
            ),
            313 => 
            array (
                'id' => 814,
                'name' => 'Kouilou',
                'country_id' => 49,
            ),
            314 => 
            array (
                'id' => 815,
                'name' => 'Lekoumou',
                'country_id' => 49,
            ),
            315 => 
            array (
                'id' => 816,
                'name' => 'Likouala',
                'country_id' => 49,
            ),
            316 => 
            array (
                'id' => 817,
                'name' => 'Niari',
                'country_id' => 49,
            ),
            317 => 
            array (
                'id' => 818,
                'name' => 'Plateaux',
                'country_id' => 49,
            ),
            318 => 
            array (
                'id' => 819,
                'name' => 'Pool',
                'country_id' => 49,
            ),
            319 => 
            array (
                'id' => 820,
                'name' => 'Sangha',
                'country_id' => 49,
            ),
            320 => 
            array (
                'id' => 821,
                'name' => 'Bandundu',
                'country_id' => 50,
            ),
            321 => 
            array (
                'id' => 822,
                'name' => 'Bas-Congo',
                'country_id' => 50,
            ),
            322 => 
            array (
                'id' => 823,
                'name' => 'Equateur',
                'country_id' => 50,
            ),
            323 => 
            array (
                'id' => 824,
                'name' => 'Haut-Congo',
                'country_id' => 50,
            ),
            324 => 
            array (
                'id' => 825,
                'name' => 'Kasai-Occidental',
                'country_id' => 50,
            ),
            325 => 
            array (
                'id' => 826,
                'name' => 'Kasai-Oriental',
                'country_id' => 50,
            ),
            326 => 
            array (
                'id' => 827,
                'name' => 'Katanga',
                'country_id' => 50,
            ),
            327 => 
            array (
                'id' => 828,
                'name' => 'Kinshasa',
                'country_id' => 50,
            ),
            328 => 
            array (
                'id' => 829,
                'name' => 'Maniema',
                'country_id' => 50,
            ),
            329 => 
            array (
                'id' => 830,
                'name' => 'Nord-Kivu',
                'country_id' => 50,
            ),
            330 => 
            array (
                'id' => 831,
                'name' => 'Sud-Kivu',
                'country_id' => 50,
            ),
            331 => 
            array (
                'id' => 832,
                'name' => 'Aitutaki',
                'country_id' => 51,
            ),
            332 => 
            array (
                'id' => 833,
                'name' => 'Atiu',
                'country_id' => 51,
            ),
            333 => 
            array (
                'id' => 834,
                'name' => 'Mangaia',
                'country_id' => 51,
            ),
            334 => 
            array (
                'id' => 835,
                'name' => 'Manihiki',
                'country_id' => 51,
            ),
            335 => 
            array (
                'id' => 836,
                'name' => 'Mauke',
                'country_id' => 51,
            ),
            336 => 
            array (
                'id' => 837,
                'name' => 'Mitiaro',
                'country_id' => 51,
            ),
            337 => 
            array (
                'id' => 838,
                'name' => 'Nassau',
                'country_id' => 51,
            ),
            338 => 
            array (
                'id' => 839,
                'name' => 'Pukapuka',
                'country_id' => 51,
            ),
            339 => 
            array (
                'id' => 840,
                'name' => 'Rakahanga',
                'country_id' => 51,
            ),
            340 => 
            array (
                'id' => 841,
                'name' => 'Rarotonga',
                'country_id' => 51,
            ),
            341 => 
            array (
                'id' => 842,
                'name' => 'Tongareva',
                'country_id' => 51,
            ),
            342 => 
            array (
                'id' => 843,
                'name' => 'Alajuela',
                'country_id' => 52,
            ),
            343 => 
            array (
                'id' => 844,
                'name' => 'Cartago',
                'country_id' => 52,
            ),
            344 => 
            array (
                'id' => 845,
                'name' => 'Guanacaste',
                'country_id' => 52,
            ),
            345 => 
            array (
                'id' => 846,
                'name' => 'Heredia',
                'country_id' => 52,
            ),
            346 => 
            array (
                'id' => 847,
                'name' => 'Limon',
                'country_id' => 52,
            ),
            347 => 
            array (
                'id' => 848,
                'name' => 'Puntarenas',
                'country_id' => 52,
            ),
            348 => 
            array (
                'id' => 849,
                'name' => 'San Jose',
                'country_id' => 52,
            ),
            349 => 
            array (
                'id' => 850,
                'name' => 'Abidjan',
                'country_id' => 53,
            ),
            350 => 
            array (
                'id' => 851,
                'name' => 'Agneby',
                'country_id' => 53,
            ),
            351 => 
            array (
                'id' => 852,
                'name' => 'Bafing',
                'country_id' => 53,
            ),
            352 => 
            array (
                'id' => 853,
                'name' => 'Denguele',
                'country_id' => 53,
            ),
            353 => 
            array (
                'id' => 854,
                'name' => 'Dix-huit Montagnes',
                'country_id' => 53,
            ),
            354 => 
            array (
                'id' => 855,
                'name' => 'Fromager',
                'country_id' => 53,
            ),
            355 => 
            array (
                'id' => 856,
                'name' => 'Haut-Sassandra',
                'country_id' => 53,
            ),
            356 => 
            array (
                'id' => 857,
                'name' => 'Lacs',
                'country_id' => 53,
            ),
            357 => 
            array (
                'id' => 858,
                'name' => 'Lagunes',
                'country_id' => 53,
            ),
            358 => 
            array (
                'id' => 859,
                'name' => 'Marahoue',
                'country_id' => 53,
            ),
            359 => 
            array (
                'id' => 860,
                'name' => 'Moyen-Cavally',
                'country_id' => 53,
            ),
            360 => 
            array (
                'id' => 861,
                'name' => 'Moyen-Comoe',
                'country_id' => 53,
            ),
            361 => 
            array (
                'id' => 862,
                'name' => 'N\'zi-Comoe',
                'country_id' => 53,
            ),
            362 => 
            array (
                'id' => 863,
                'name' => 'Sassandra',
                'country_id' => 53,
            ),
            363 => 
            array (
                'id' => 864,
                'name' => 'Savanes',
                'country_id' => 53,
            ),
            364 => 
            array (
                'id' => 865,
                'name' => 'Sud-Bandama',
                'country_id' => 53,
            ),
            365 => 
            array (
                'id' => 866,
                'name' => 'Sud-Comoe',
                'country_id' => 53,
            ),
            366 => 
            array (
                'id' => 867,
                'name' => 'Vallee du Bandama',
                'country_id' => 53,
            ),
            367 => 
            array (
                'id' => 868,
                'name' => 'Worodougou',
                'country_id' => 53,
            ),
            368 => 
            array (
                'id' => 869,
                'name' => 'Zanzan',
                'country_id' => 53,
            ),
            369 => 
            array (
                'id' => 870,
                'name' => 'Bjelovar-Bilogora',
                'country_id' => 54,
            ),
            370 => 
            array (
                'id' => 871,
                'name' => 'Dubrovnik-Neretva',
                'country_id' => 54,
            ),
            371 => 
            array (
                'id' => 872,
                'name' => 'Grad Zagreb',
                'country_id' => 54,
            ),
            372 => 
            array (
                'id' => 873,
                'name' => 'Istra',
                'country_id' => 54,
            ),
            373 => 
            array (
                'id' => 874,
                'name' => 'Karlovac',
                'country_id' => 54,
            ),
            374 => 
            array (
                'id' => 875,
                'name' => 'Koprivnica-Krizhevci',
                'country_id' => 54,
            ),
            375 => 
            array (
                'id' => 876,
                'name' => 'Krapina-Zagorje',
                'country_id' => 54,
            ),
            376 => 
            array (
                'id' => 877,
                'name' => 'Lika-Senj',
                'country_id' => 54,
            ),
            377 => 
            array (
                'id' => 878,
                'name' => 'Medhimurje',
                'country_id' => 54,
            ),
            378 => 
            array (
                'id' => 879,
                'name' => 'Medimurska Zupanija',
                'country_id' => 54,
            ),
            379 => 
            array (
                'id' => 880,
                'name' => 'Osijek-Baranja',
                'country_id' => 54,
            ),
            380 => 
            array (
                'id' => 881,
                'name' => 'Osjecko-Baranjska Zupanija',
                'country_id' => 54,
            ),
            381 => 
            array (
                'id' => 882,
                'name' => 'Pozhega-Slavonija',
                'country_id' => 54,
            ),
            382 => 
            array (
                'id' => 883,
                'name' => 'Primorje-Gorski Kotar',
                'country_id' => 54,
            ),
            383 => 
            array (
                'id' => 884,
                'name' => 'Shibenik-Knin',
                'country_id' => 54,
            ),
            384 => 
            array (
                'id' => 885,
                'name' => 'Sisak-Moslavina',
                'country_id' => 54,
            ),
            385 => 
            array (
                'id' => 886,
                'name' => 'Slavonski Brod-Posavina',
                'country_id' => 54,
            ),
            386 => 
            array (
                'id' => 887,
                'name' => 'Split-Dalmacija',
                'country_id' => 54,
            ),
            387 => 
            array (
                'id' => 888,
                'name' => 'Varazhdin',
                'country_id' => 54,
            ),
            388 => 
            array (
                'id' => 889,
                'name' => 'Virovitica-Podravina',
                'country_id' => 54,
            ),
            389 => 
            array (
                'id' => 890,
                'name' => 'Vukovar-Srijem',
                'country_id' => 54,
            ),
            390 => 
            array (
                'id' => 891,
                'name' => 'Zadar',
                'country_id' => 54,
            ),
            391 => 
            array (
                'id' => 892,
                'name' => 'Zagreb',
                'country_id' => 54,
            ),
            392 => 
            array (
                'id' => 893,
                'name' => 'Camaguey',
                'country_id' => 55,
            ),
            393 => 
            array (
                'id' => 894,
                'name' => 'Ciego de Avila',
                'country_id' => 55,
            ),
            394 => 
            array (
                'id' => 895,
                'name' => 'Cienfuegos',
                'country_id' => 55,
            ),
            395 => 
            array (
                'id' => 896,
                'name' => 'Ciudad de la Habana',
                'country_id' => 55,
            ),
            396 => 
            array (
                'id' => 897,
                'name' => 'Granma',
                'country_id' => 55,
            ),
            397 => 
            array (
                'id' => 898,
                'name' => 'Guantanamo',
                'country_id' => 55,
            ),
            398 => 
            array (
                'id' => 899,
                'name' => 'Habana',
                'country_id' => 55,
            ),
            399 => 
            array (
                'id' => 900,
                'name' => 'Holguin',
                'country_id' => 55,
            ),
            400 => 
            array (
                'id' => 901,
                'name' => 'Isla de la Juventud',
                'country_id' => 55,
            ),
            401 => 
            array (
                'id' => 902,
                'name' => 'La Habana',
                'country_id' => 55,
            ),
            402 => 
            array (
                'id' => 903,
                'name' => 'Las Tunas',
                'country_id' => 55,
            ),
            403 => 
            array (
                'id' => 904,
                'name' => 'Matanzas',
                'country_id' => 55,
            ),
            404 => 
            array (
                'id' => 905,
                'name' => 'Pinar del Rio',
                'country_id' => 55,
            ),
            405 => 
            array (
                'id' => 906,
                'name' => 'Sancti Spiritus',
                'country_id' => 55,
            ),
            406 => 
            array (
                'id' => 907,
                'name' => 'Santiago de Cuba',
                'country_id' => 55,
            ),
            407 => 
            array (
                'id' => 908,
                'name' => 'Villa Clara',
                'country_id' => 55,
            ),
            408 => 
            array (
                'id' => 909,
                'name' => 'Government controlled area',
                'country_id' => 56,
            ),
            409 => 
            array (
                'id' => 910,
                'name' => 'Limassol',
                'country_id' => 56,
            ),
            410 => 
            array (
                'id' => 911,
                'name' => 'Nicosia District',
                'country_id' => 56,
            ),
            411 => 
            array (
                'id' => 912,
                'name' => 'Paphos',
                'country_id' => 56,
            ),
            412 => 
            array (
                'id' => 913,
                'name' => 'Turkish controlled area',
                'country_id' => 56,
            ),
            413 => 
            array (
                'id' => 914,
                'name' => 'Central Bohemian',
                'country_id' => 57,
            ),
            414 => 
            array (
                'id' => 915,
                'name' => 'Frycovice',
                'country_id' => 57,
            ),
            415 => 
            array (
                'id' => 916,
                'name' => 'Jihocesky Kraj',
                'country_id' => 57,
            ),
            416 => 
            array (
                'id' => 917,
                'name' => 'Jihochesky',
                'country_id' => 57,
            ),
            417 => 
            array (
                'id' => 918,
                'name' => 'Jihomoravsky',
                'country_id' => 57,
            ),
            418 => 
            array (
                'id' => 919,
                'name' => 'Karlovarsky',
                'country_id' => 57,
            ),
            419 => 
            array (
                'id' => 920,
                'name' => 'Klecany',
                'country_id' => 57,
            ),
            420 => 
            array (
                'id' => 921,
                'name' => 'Kralovehradecky',
                'country_id' => 57,
            ),
            421 => 
            array (
                'id' => 922,
                'name' => 'Liberecky',
                'country_id' => 57,
            ),
            422 => 
            array (
                'id' => 923,
                'name' => 'Lipov',
                'country_id' => 57,
            ),
            423 => 
            array (
                'id' => 924,
                'name' => 'Moravskoslezsky',
                'country_id' => 57,
            ),
            424 => 
            array (
                'id' => 925,
                'name' => 'Olomoucky',
                'country_id' => 57,
            ),
            425 => 
            array (
                'id' => 926,
                'name' => 'Olomoucky Kraj',
                'country_id' => 57,
            ),
            426 => 
            array (
                'id' => 927,
                'name' => 'Pardubicky',
                'country_id' => 57,
            ),
            427 => 
            array (
                'id' => 928,
                'name' => 'Plzensky',
                'country_id' => 57,
            ),
            428 => 
            array (
                'id' => 929,
                'name' => 'Praha',
                'country_id' => 57,
            ),
            429 => 
            array (
                'id' => 930,
                'name' => 'Rajhrad',
                'country_id' => 57,
            ),
            430 => 
            array (
                'id' => 931,
                'name' => 'Smirice',
                'country_id' => 57,
            ),
            431 => 
            array (
                'id' => 932,
                'name' => 'South Moravian',
                'country_id' => 57,
            ),
            432 => 
            array (
                'id' => 933,
                'name' => 'Straz nad Nisou',
                'country_id' => 57,
            ),
            433 => 
            array (
                'id' => 934,
                'name' => 'Stredochesky',
                'country_id' => 57,
            ),
            434 => 
            array (
                'id' => 935,
                'name' => 'Unicov',
                'country_id' => 57,
            ),
            435 => 
            array (
                'id' => 936,
                'name' => 'Ustecky',
                'country_id' => 57,
            ),
            436 => 
            array (
                'id' => 937,
                'name' => 'Valletta',
                'country_id' => 57,
            ),
            437 => 
            array (
                'id' => 938,
                'name' => 'Velesin',
                'country_id' => 57,
            ),
            438 => 
            array (
                'id' => 939,
                'name' => 'Vysochina',
                'country_id' => 57,
            ),
            439 => 
            array (
                'id' => 940,
                'name' => 'Zlinsky',
                'country_id' => 57,
            ),
            440 => 
            array (
                'id' => 941,
                'name' => 'Arhus',
                'country_id' => 58,
            ),
            441 => 
            array (
                'id' => 942,
                'name' => 'Bornholm',
                'country_id' => 58,
            ),
            442 => 
            array (
                'id' => 943,
                'name' => 'Frederiksborg',
                'country_id' => 58,
            ),
            443 => 
            array (
                'id' => 944,
                'name' => 'Fyn',
                'country_id' => 58,
            ),
            444 => 
            array (
                'id' => 945,
                'name' => 'Hovedstaden',
                'country_id' => 58,
            ),
            445 => 
            array (
                'id' => 946,
                'name' => 'Kobenhavn',
                'country_id' => 58,
            ),
            446 => 
            array (
                'id' => 947,
                'name' => 'Kobenhavns Amt',
                'country_id' => 58,
            ),
            447 => 
            array (
                'id' => 948,
                'name' => 'Kobenhavns Kommune',
                'country_id' => 58,
            ),
            448 => 
            array (
                'id' => 949,
                'name' => 'Nordjylland',
                'country_id' => 58,
            ),
            449 => 
            array (
                'id' => 950,
                'name' => 'Ribe',
                'country_id' => 58,
            ),
            450 => 
            array (
                'id' => 951,
                'name' => 'Ringkobing',
                'country_id' => 58,
            ),
            451 => 
            array (
                'id' => 952,
                'name' => 'Roervig',
                'country_id' => 58,
            ),
            452 => 
            array (
                'id' => 953,
                'name' => 'Roskilde',
                'country_id' => 58,
            ),
            453 => 
            array (
                'id' => 954,
                'name' => 'Roslev',
                'country_id' => 58,
            ),
            454 => 
            array (
                'id' => 955,
                'name' => 'Sjaelland',
                'country_id' => 58,
            ),
            455 => 
            array (
                'id' => 956,
                'name' => 'Soeborg',
                'country_id' => 58,
            ),
            456 => 
            array (
                'id' => 957,
                'name' => 'Sonderjylland',
                'country_id' => 58,
            ),
            457 => 
            array (
                'id' => 958,
                'name' => 'Storstrom',
                'country_id' => 58,
            ),
            458 => 
            array (
                'id' => 959,
                'name' => 'Syddanmark',
                'country_id' => 58,
            ),
            459 => 
            array (
                'id' => 960,
                'name' => 'Toelloese',
                'country_id' => 58,
            ),
            460 => 
            array (
                'id' => 961,
                'name' => 'Vejle',
                'country_id' => 58,
            ),
            461 => 
            array (
                'id' => 962,
                'name' => 'Vestsjalland',
                'country_id' => 58,
            ),
            462 => 
            array (
                'id' => 963,
                'name' => 'Viborg',
                'country_id' => 58,
            ),
            463 => 
            array (
                'id' => 964,
                'name' => '\'Ali Sabih',
                'country_id' => 59,
            ),
            464 => 
            array (
                'id' => 965,
                'name' => 'Dikhil',
                'country_id' => 59,
            ),
            465 => 
            array (
                'id' => 966,
                'name' => 'Jibuti',
                'country_id' => 59,
            ),
            466 => 
            array (
                'id' => 967,
                'name' => 'Tajurah',
                'country_id' => 59,
            ),
            467 => 
            array (
                'id' => 968,
                'name' => 'Ubuk',
                'country_id' => 59,
            ),
            468 => 
            array (
                'id' => 969,
                'name' => 'Saint Andrew',
                'country_id' => 60,
            ),
            469 => 
            array (
                'id' => 970,
                'name' => 'Saint David',
                'country_id' => 60,
            ),
            470 => 
            array (
                'id' => 971,
                'name' => 'Saint George',
                'country_id' => 60,
            ),
            471 => 
            array (
                'id' => 972,
                'name' => 'Saint John',
                'country_id' => 60,
            ),
            472 => 
            array (
                'id' => 973,
                'name' => 'Saint Joseph',
                'country_id' => 60,
            ),
            473 => 
            array (
                'id' => 974,
                'name' => 'Saint Luke',
                'country_id' => 60,
            ),
            474 => 
            array (
                'id' => 975,
                'name' => 'Saint Mark',
                'country_id' => 60,
            ),
            475 => 
            array (
                'id' => 976,
                'name' => 'Saint Patrick',
                'country_id' => 60,
            ),
            476 => 
            array (
                'id' => 977,
                'name' => 'Saint Paul',
                'country_id' => 60,
            ),
            477 => 
            array (
                'id' => 978,
                'name' => 'Saint Peter',
                'country_id' => 60,
            ),
            478 => 
            array (
                'id' => 979,
                'name' => 'Azua',
                'country_id' => 61,
            ),
            479 => 
            array (
                'id' => 980,
                'name' => 'Bahoruco',
                'country_id' => 61,
            ),
            480 => 
            array (
                'id' => 981,
                'name' => 'Barahona',
                'country_id' => 61,
            ),
            481 => 
            array (
                'id' => 982,
                'name' => 'Dajabon',
                'country_id' => 61,
            ),
            482 => 
            array (
                'id' => 983,
                'name' => 'Distrito Nacional',
                'country_id' => 61,
            ),
            483 => 
            array (
                'id' => 984,
                'name' => 'Duarte',
                'country_id' => 61,
            ),
            484 => 
            array (
                'id' => 985,
                'name' => 'El Seybo',
                'country_id' => 61,
            ),
            485 => 
            array (
                'id' => 986,
                'name' => 'Elias Pina',
                'country_id' => 61,
            ),
            486 => 
            array (
                'id' => 987,
                'name' => 'Espaillat',
                'country_id' => 61,
            ),
            487 => 
            array (
                'id' => 988,
                'name' => 'Hato Mayor',
                'country_id' => 61,
            ),
            488 => 
            array (
                'id' => 989,
                'name' => 'Independencia',
                'country_id' => 61,
            ),
            489 => 
            array (
                'id' => 990,
                'name' => 'La Altagracia',
                'country_id' => 61,
            ),
            490 => 
            array (
                'id' => 991,
                'name' => 'La Romana',
                'country_id' => 61,
            ),
            491 => 
            array (
                'id' => 992,
                'name' => 'La Vega',
                'country_id' => 61,
            ),
            492 => 
            array (
                'id' => 993,
                'name' => 'Maria Trinidad Sanchez',
                'country_id' => 61,
            ),
            493 => 
            array (
                'id' => 994,
                'name' => 'Monsenor Nouel',
                'country_id' => 61,
            ),
            494 => 
            array (
                'id' => 995,
                'name' => 'Monte Cristi',
                'country_id' => 61,
            ),
            495 => 
            array (
                'id' => 996,
                'name' => 'Monte Plata',
                'country_id' => 61,
            ),
            496 => 
            array (
                'id' => 997,
                'name' => 'Pedernales',
                'country_id' => 61,
            ),
            497 => 
            array (
                'id' => 998,
                'name' => 'Peravia',
                'country_id' => 61,
            ),
            498 => 
            array (
                'id' => 999,
                'name' => 'Puerto Plata',
                'country_id' => 61,
            ),
            499 => 
            array (
                'id' => 1000,
                'name' => 'Salcedo',
                'country_id' => 61,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 1001,
                'name' => 'Samana',
                'country_id' => 61,
            ),
            1 => 
            array (
                'id' => 1002,
                'name' => 'San Cristobal',
                'country_id' => 61,
            ),
            2 => 
            array (
                'id' => 1003,
                'name' => 'San Juan',
                'country_id' => 61,
            ),
            3 => 
            array (
                'id' => 1004,
                'name' => 'San Pedro de Macoris',
                'country_id' => 61,
            ),
            4 => 
            array (
                'id' => 1005,
                'name' => 'Sanchez Ramirez',
                'country_id' => 61,
            ),
            5 => 
            array (
                'id' => 1006,
                'name' => 'Santiago',
                'country_id' => 61,
            ),
            6 => 
            array (
                'id' => 1007,
                'name' => 'Santiago Rodriguez',
                'country_id' => 61,
            ),
            7 => 
            array (
                'id' => 1008,
                'name' => 'Valverde',
                'country_id' => 61,
            ),
            8 => 
            array (
                'id' => 1009,
                'name' => 'Aileu',
                'country_id' => 62,
            ),
            9 => 
            array (
                'id' => 1010,
                'name' => 'Ainaro',
                'country_id' => 62,
            ),
            10 => 
            array (
                'id' => 1011,
                'name' => 'Ambeno',
                'country_id' => 62,
            ),
            11 => 
            array (
                'id' => 1012,
                'name' => 'Baucau',
                'country_id' => 62,
            ),
            12 => 
            array (
                'id' => 1013,
                'name' => 'Bobonaro',
                'country_id' => 62,
            ),
            13 => 
            array (
                'id' => 1014,
                'name' => 'Cova Lima',
                'country_id' => 62,
            ),
            14 => 
            array (
                'id' => 1015,
                'name' => 'Dili',
                'country_id' => 62,
            ),
            15 => 
            array (
                'id' => 1016,
                'name' => 'Ermera',
                'country_id' => 62,
            ),
            16 => 
            array (
                'id' => 1017,
                'name' => 'Lautem',
                'country_id' => 62,
            ),
            17 => 
            array (
                'id' => 1018,
                'name' => 'Liquica',
                'country_id' => 62,
            ),
            18 => 
            array (
                'id' => 1019,
                'name' => 'Manatuto',
                'country_id' => 62,
            ),
            19 => 
            array (
                'id' => 1020,
                'name' => 'Manufahi',
                'country_id' => 62,
            ),
            20 => 
            array (
                'id' => 1021,
                'name' => 'Viqueque',
                'country_id' => 62,
            ),
            21 => 
            array (
                'id' => 1022,
                'name' => 'Azuay',
                'country_id' => 63,
            ),
            22 => 
            array (
                'id' => 1023,
                'name' => 'Bolivar',
                'country_id' => 63,
            ),
            23 => 
            array (
                'id' => 1024,
                'name' => 'Canar',
                'country_id' => 63,
            ),
            24 => 
            array (
                'id' => 1025,
                'name' => 'Carchi',
                'country_id' => 63,
            ),
            25 => 
            array (
                'id' => 1026,
                'name' => 'Chimborazo',
                'country_id' => 63,
            ),
            26 => 
            array (
                'id' => 1027,
                'name' => 'Cotopaxi',
                'country_id' => 63,
            ),
            27 => 
            array (
                'id' => 1028,
                'name' => 'El Oro',
                'country_id' => 63,
            ),
            28 => 
            array (
                'id' => 1029,
                'name' => 'Esmeraldas',
                'country_id' => 63,
            ),
            29 => 
            array (
                'id' => 1030,
                'name' => 'Galapagos',
                'country_id' => 63,
            ),
            30 => 
            array (
                'id' => 1031,
                'name' => 'Guayas',
                'country_id' => 63,
            ),
            31 => 
            array (
                'id' => 1032,
                'name' => 'Imbabura',
                'country_id' => 63,
            ),
            32 => 
            array (
                'id' => 1033,
                'name' => 'Loja',
                'country_id' => 63,
            ),
            33 => 
            array (
                'id' => 1034,
                'name' => 'Los Rios',
                'country_id' => 63,
            ),
            34 => 
            array (
                'id' => 1035,
                'name' => 'Manabi',
                'country_id' => 63,
            ),
            35 => 
            array (
                'id' => 1036,
                'name' => 'Morona Santiago',
                'country_id' => 63,
            ),
            36 => 
            array (
                'id' => 1037,
                'name' => 'Napo',
                'country_id' => 63,
            ),
            37 => 
            array (
                'id' => 1038,
                'name' => 'Orellana',
                'country_id' => 63,
            ),
            38 => 
            array (
                'id' => 1039,
                'name' => 'Pastaza',
                'country_id' => 63,
            ),
            39 => 
            array (
                'id' => 1040,
                'name' => 'Pichincha',
                'country_id' => 63,
            ),
            40 => 
            array (
                'id' => 1041,
                'name' => 'Sucumbios',
                'country_id' => 63,
            ),
            41 => 
            array (
                'id' => 1042,
                'name' => 'Tungurahua',
                'country_id' => 63,
            ),
            42 => 
            array (
                'id' => 1043,
                'name' => 'Zamora Chinchipe',
                'country_id' => 63,
            ),
            43 => 
            array (
                'id' => 1044,
                'name' => 'Aswan',
                'country_id' => 64,
            ),
            44 => 
            array (
                'id' => 1045,
                'name' => 'Asyut',
                'country_id' => 64,
            ),
            45 => 
            array (
                'id' => 1046,
                'name' => 'Bani Suwayf',
                'country_id' => 64,
            ),
            46 => 
            array (
                'id' => 1047,
                'name' => 'Bur Sa\'id',
                'country_id' => 64,
            ),
            47 => 
            array (
                'id' => 1048,
                'name' => 'Cairo',
                'country_id' => 64,
            ),
            48 => 
            array (
                'id' => 1049,
                'name' => 'Dumyat',
                'country_id' => 64,
            ),
            49 => 
            array (
                'id' => 1050,
                'name' => 'Kafr-ash-Shaykh',
                'country_id' => 64,
            ),
            50 => 
            array (
                'id' => 1051,
                'name' => 'Matruh',
                'country_id' => 64,
            ),
            51 => 
            array (
                'id' => 1052,
                'name' => 'Muhafazat ad Daqahliyah',
                'country_id' => 64,
            ),
            52 => 
            array (
                'id' => 1053,
                'name' => 'Muhafazat al Fayyum',
                'country_id' => 64,
            ),
            53 => 
            array (
                'id' => 1054,
                'name' => 'Muhafazat al Gharbiyah',
                'country_id' => 64,
            ),
            54 => 
            array (
                'id' => 1055,
                'name' => 'Muhafazat al Iskandariyah',
                'country_id' => 64,
            ),
            55 => 
            array (
                'id' => 1056,
                'name' => 'Muhafazat al Qahirah',
                'country_id' => 64,
            ),
            56 => 
            array (
                'id' => 1057,
                'name' => 'Qina',
                'country_id' => 64,
            ),
            57 => 
            array (
                'id' => 1058,
                'name' => 'Sawhaj',
                'country_id' => 64,
            ),
            58 => 
            array (
                'id' => 1059,
                'name' => 'Sina al-Janubiyah',
                'country_id' => 64,
            ),
            59 => 
            array (
                'id' => 1060,
                'name' => 'Sina ash-Shamaliyah',
                'country_id' => 64,
            ),
            60 => 
            array (
                'id' => 1061,
                'name' => 'ad-Daqahliyah',
                'country_id' => 64,
            ),
            61 => 
            array (
                'id' => 1062,
                'name' => 'al-Bahr-al-Ahmar',
                'country_id' => 64,
            ),
            62 => 
            array (
                'id' => 1063,
                'name' => 'al-Buhayrah',
                'country_id' => 64,
            ),
            63 => 
            array (
                'id' => 1064,
                'name' => 'al-Fayyum',
                'country_id' => 64,
            ),
            64 => 
            array (
                'id' => 1065,
                'name' => 'al-Gharbiyah',
                'country_id' => 64,
            ),
            65 => 
            array (
                'id' => 1066,
                'name' => 'al-Iskandariyah',
                'country_id' => 64,
            ),
            66 => 
            array (
                'id' => 1067,
                'name' => 'al-Ismailiyah',
                'country_id' => 64,
            ),
            67 => 
            array (
                'id' => 1068,
                'name' => 'al-Jizah',
                'country_id' => 64,
            ),
            68 => 
            array (
                'id' => 1069,
                'name' => 'al-Minufiyah',
                'country_id' => 64,
            ),
            69 => 
            array (
                'id' => 1070,
                'name' => 'al-Minya',
                'country_id' => 64,
            ),
            70 => 
            array (
                'id' => 1071,
                'name' => 'al-Qahira',
                'country_id' => 64,
            ),
            71 => 
            array (
                'id' => 1072,
                'name' => 'al-Qalyubiyah',
                'country_id' => 64,
            ),
            72 => 
            array (
                'id' => 1073,
                'name' => 'al-Uqsur',
                'country_id' => 64,
            ),
            73 => 
            array (
                'id' => 1074,
                'name' => 'al-Wadi al-Jadid',
                'country_id' => 64,
            ),
            74 => 
            array (
                'id' => 1075,
                'name' => 'as-Suways',
                'country_id' => 64,
            ),
            75 => 
            array (
                'id' => 1076,
                'name' => 'ash-Sharqiyah',
                'country_id' => 64,
            ),
            76 => 
            array (
                'id' => 1077,
                'name' => 'Ahuachapan',
                'country_id' => 65,
            ),
            77 => 
            array (
                'id' => 1078,
                'name' => 'Cabanas',
                'country_id' => 65,
            ),
            78 => 
            array (
                'id' => 1079,
                'name' => 'Chalatenango',
                'country_id' => 65,
            ),
            79 => 
            array (
                'id' => 1080,
                'name' => 'Cuscatlan',
                'country_id' => 65,
            ),
            80 => 
            array (
                'id' => 1081,
                'name' => 'La Libertad',
                'country_id' => 65,
            ),
            81 => 
            array (
                'id' => 1082,
                'name' => 'La Paz',
                'country_id' => 65,
            ),
            82 => 
            array (
                'id' => 1083,
                'name' => 'La Union',
                'country_id' => 65,
            ),
            83 => 
            array (
                'id' => 1084,
                'name' => 'Morazan',
                'country_id' => 65,
            ),
            84 => 
            array (
                'id' => 1085,
                'name' => 'San Miguel',
                'country_id' => 65,
            ),
            85 => 
            array (
                'id' => 1086,
                'name' => 'San Salvador',
                'country_id' => 65,
            ),
            86 => 
            array (
                'id' => 1087,
                'name' => 'San Vicente',
                'country_id' => 65,
            ),
            87 => 
            array (
                'id' => 1088,
                'name' => 'Santa Ana',
                'country_id' => 65,
            ),
            88 => 
            array (
                'id' => 1089,
                'name' => 'Sonsonate',
                'country_id' => 65,
            ),
            89 => 
            array (
                'id' => 1090,
                'name' => 'Usulutan',
                'country_id' => 65,
            ),
            90 => 
            array (
                'id' => 1091,
                'name' => 'Annobon',
                'country_id' => 66,
            ),
            91 => 
            array (
                'id' => 1092,
                'name' => 'Bioko Norte',
                'country_id' => 66,
            ),
            92 => 
            array (
                'id' => 1093,
                'name' => 'Bioko Sur',
                'country_id' => 66,
            ),
            93 => 
            array (
                'id' => 1094,
                'name' => 'Centro Sur',
                'country_id' => 66,
            ),
            94 => 
            array (
                'id' => 1095,
                'name' => 'Kie-Ntem',
                'country_id' => 66,
            ),
            95 => 
            array (
                'id' => 1096,
                'name' => 'Litoral',
                'country_id' => 66,
            ),
            96 => 
            array (
                'id' => 1097,
                'name' => 'Wele-Nzas',
                'country_id' => 66,
            ),
            97 => 
            array (
                'id' => 1098,
                'name' => 'Anseba',
                'country_id' => 67,
            ),
            98 => 
            array (
                'id' => 1099,
                'name' => 'Debub',
                'country_id' => 67,
            ),
            99 => 
            array (
                'id' => 1100,
                'name' => 'Debub-Keih-Bahri',
                'country_id' => 67,
            ),
            100 => 
            array (
                'id' => 1101,
                'name' => 'Gash-Barka',
                'country_id' => 67,
            ),
            101 => 
            array (
                'id' => 1102,
                'name' => 'Maekel',
                'country_id' => 67,
            ),
            102 => 
            array (
                'id' => 1103,
                'name' => 'Semien-Keih-Bahri',
                'country_id' => 67,
            ),
            103 => 
            array (
                'id' => 1104,
                'name' => 'Harju',
                'country_id' => 68,
            ),
            104 => 
            array (
                'id' => 1105,
                'name' => 'Hiiu',
                'country_id' => 68,
            ),
            105 => 
            array (
                'id' => 1106,
                'name' => 'Ida-Viru',
                'country_id' => 68,
            ),
            106 => 
            array (
                'id' => 1107,
                'name' => 'Jarva',
                'country_id' => 68,
            ),
            107 => 
            array (
                'id' => 1108,
                'name' => 'Jogeva',
                'country_id' => 68,
            ),
            108 => 
            array (
                'id' => 1109,
                'name' => 'Laane',
                'country_id' => 68,
            ),
            109 => 
            array (
                'id' => 1110,
                'name' => 'Laane-Viru',
                'country_id' => 68,
            ),
            110 => 
            array (
                'id' => 1111,
                'name' => 'Parnu',
                'country_id' => 68,
            ),
            111 => 
            array (
                'id' => 1112,
                'name' => 'Polva',
                'country_id' => 68,
            ),
            112 => 
            array (
                'id' => 1113,
                'name' => 'Rapla',
                'country_id' => 68,
            ),
            113 => 
            array (
                'id' => 1114,
                'name' => 'Saare',
                'country_id' => 68,
            ),
            114 => 
            array (
                'id' => 1115,
                'name' => 'Tartu',
                'country_id' => 68,
            ),
            115 => 
            array (
                'id' => 1116,
                'name' => 'Valga',
                'country_id' => 68,
            ),
            116 => 
            array (
                'id' => 1117,
                'name' => 'Viljandi',
                'country_id' => 68,
            ),
            117 => 
            array (
                'id' => 1118,
                'name' => 'Voru',
                'country_id' => 68,
            ),
            118 => 
            array (
                'id' => 1119,
                'name' => 'Addis Abeba',
                'country_id' => 69,
            ),
            119 => 
            array (
                'id' => 1120,
                'name' => 'Afar',
                'country_id' => 69,
            ),
            120 => 
            array (
                'id' => 1121,
                'name' => 'Amhara',
                'country_id' => 69,
            ),
            121 => 
            array (
                'id' => 1122,
                'name' => 'Benishangul',
                'country_id' => 69,
            ),
            122 => 
            array (
                'id' => 1123,
                'name' => 'Diredawa',
                'country_id' => 69,
            ),
            123 => 
            array (
                'id' => 1124,
                'name' => 'Gambella',
                'country_id' => 69,
            ),
            124 => 
            array (
                'id' => 1125,
                'name' => 'Harar',
                'country_id' => 69,
            ),
            125 => 
            array (
                'id' => 1126,
                'name' => 'Jigjiga',
                'country_id' => 69,
            ),
            126 => 
            array (
                'id' => 1127,
                'name' => 'Mekele',
                'country_id' => 69,
            ),
            127 => 
            array (
                'id' => 1128,
                'name' => 'Oromia',
                'country_id' => 69,
            ),
            128 => 
            array (
                'id' => 1129,
                'name' => 'Somali',
                'country_id' => 69,
            ),
            129 => 
            array (
                'id' => 1130,
                'name' => 'Southern',
                'country_id' => 69,
            ),
            130 => 
            array (
                'id' => 1131,
                'name' => 'Tigray',
                'country_id' => 69,
            ),
            131 => 
            array (
                'id' => 1132,
                'name' => 'Christmas Island',
                'country_id' => 70,
            ),
            132 => 
            array (
                'id' => 1133,
                'name' => 'Cocos Islands',
                'country_id' => 70,
            ),
            133 => 
            array (
                'id' => 1134,
                'name' => 'Coral Sea Islands',
                'country_id' => 70,
            ),
            134 => 
            array (
                'id' => 1135,
                'name' => 'Falkland Islands',
                'country_id' => 71,
            ),
            135 => 
            array (
                'id' => 1136,
                'name' => 'South Georgia',
                'country_id' => 71,
            ),
            136 => 
            array (
                'id' => 1137,
                'name' => 'Klaksvik',
                'country_id' => 72,
            ),
            137 => 
            array (
                'id' => 1138,
                'name' => 'Nor ara Eysturoy',
                'country_id' => 72,
            ),
            138 => 
            array (
                'id' => 1139,
                'name' => 'Nor oy',
                'country_id' => 72,
            ),
            139 => 
            array (
                'id' => 1140,
                'name' => 'Sandoy',
                'country_id' => 72,
            ),
            140 => 
            array (
                'id' => 1141,
                'name' => 'Streymoy',
                'country_id' => 72,
            ),
            141 => 
            array (
                'id' => 1142,
                'name' => 'Su uroy',
                'country_id' => 72,
            ),
            142 => 
            array (
                'id' => 1143,
                'name' => 'Sy ra Eysturoy',
                'country_id' => 72,
            ),
            143 => 
            array (
                'id' => 1144,
                'name' => 'Torshavn',
                'country_id' => 72,
            ),
            144 => 
            array (
                'id' => 1145,
                'name' => 'Vaga',
                'country_id' => 72,
            ),
            145 => 
            array (
                'id' => 1146,
                'name' => 'Central',
                'country_id' => 73,
            ),
            146 => 
            array (
                'id' => 1147,
                'name' => 'Eastern',
                'country_id' => 73,
            ),
            147 => 
            array (
                'id' => 1148,
                'name' => 'Northern',
                'country_id' => 73,
            ),
            148 => 
            array (
                'id' => 1149,
                'name' => 'South Pacific',
                'country_id' => 73,
            ),
            149 => 
            array (
                'id' => 1150,
                'name' => 'Western',
                'country_id' => 73,
            ),
            150 => 
            array (
                'id' => 1151,
                'name' => 'Ahvenanmaa',
                'country_id' => 74,
            ),
            151 => 
            array (
                'id' => 1152,
                'name' => 'Etela-Karjala',
                'country_id' => 74,
            ),
            152 => 
            array (
                'id' => 1153,
                'name' => 'Etela-Pohjanmaa',
                'country_id' => 74,
            ),
            153 => 
            array (
                'id' => 1154,
                'name' => 'Etela-Savo',
                'country_id' => 74,
            ),
            154 => 
            array (
                'id' => 1155,
                'name' => 'Etela-Suomen Laani',
                'country_id' => 74,
            ),
            155 => 
            array (
                'id' => 1156,
                'name' => 'Ita-Suomen Laani',
                'country_id' => 74,
            ),
            156 => 
            array (
                'id' => 1157,
                'name' => 'Ita-Uusimaa',
                'country_id' => 74,
            ),
            157 => 
            array (
                'id' => 1158,
                'name' => 'Kainuu',
                'country_id' => 74,
            ),
            158 => 
            array (
                'id' => 1159,
                'name' => 'Kanta-Hame',
                'country_id' => 74,
            ),
            159 => 
            array (
                'id' => 1160,
                'name' => 'Keski-Pohjanmaa',
                'country_id' => 74,
            ),
            160 => 
            array (
                'id' => 1161,
                'name' => 'Keski-Suomi',
                'country_id' => 74,
            ),
            161 => 
            array (
                'id' => 1162,
                'name' => 'Kymenlaakso',
                'country_id' => 74,
            ),
            162 => 
            array (
                'id' => 1163,
                'name' => 'Lansi-Suomen Laani',
                'country_id' => 74,
            ),
            163 => 
            array (
                'id' => 1164,
                'name' => 'Lappi',
                'country_id' => 74,
            ),
            164 => 
            array (
                'id' => 1165,
                'name' => 'Northern Savonia',
                'country_id' => 74,
            ),
            165 => 
            array (
                'id' => 1166,
                'name' => 'Ostrobothnia',
                'country_id' => 74,
            ),
            166 => 
            array (
                'id' => 1167,
                'name' => 'Oulun Laani',
                'country_id' => 74,
            ),
            167 => 
            array (
                'id' => 1168,
                'name' => 'Paijat-Hame',
                'country_id' => 74,
            ),
            168 => 
            array (
                'id' => 1169,
                'name' => 'Pirkanmaa',
                'country_id' => 74,
            ),
            169 => 
            array (
                'id' => 1170,
                'name' => 'Pohjanmaa',
                'country_id' => 74,
            ),
            170 => 
            array (
                'id' => 1171,
                'name' => 'Pohjois-Karjala',
                'country_id' => 74,
            ),
            171 => 
            array (
                'id' => 1172,
                'name' => 'Pohjois-Pohjanmaa',
                'country_id' => 74,
            ),
            172 => 
            array (
                'id' => 1173,
                'name' => 'Pohjois-Savo',
                'country_id' => 74,
            ),
            173 => 
            array (
                'id' => 1174,
                'name' => 'Saarijarvi',
                'country_id' => 74,
            ),
            174 => 
            array (
                'id' => 1175,
                'name' => 'Satakunta',
                'country_id' => 74,
            ),
            175 => 
            array (
                'id' => 1176,
                'name' => 'Southern Savonia',
                'country_id' => 74,
            ),
            176 => 
            array (
                'id' => 1177,
                'name' => 'Tavastia Proper',
                'country_id' => 74,
            ),
            177 => 
            array (
                'id' => 1178,
                'name' => 'Uleaborgs Lan',
                'country_id' => 74,
            ),
            178 => 
            array (
                'id' => 1179,
                'name' => 'Uusimaa',
                'country_id' => 74,
            ),
            179 => 
            array (
                'id' => 1180,
                'name' => 'Varsinais-Suomi',
                'country_id' => 74,
            ),
            180 => 
            array (
                'id' => 1181,
                'name' => 'Ain',
                'country_id' => 75,
            ),
            181 => 
            array (
                'id' => 1182,
                'name' => 'Aisne',
                'country_id' => 75,
            ),
            182 => 
            array (
                'id' => 1183,
                'name' => 'Albi Le Sequestre',
                'country_id' => 75,
            ),
            183 => 
            array (
                'id' => 1184,
                'name' => 'Allier',
                'country_id' => 75,
            ),
            184 => 
            array (
                'id' => 1185,
                'name' => 'Alpes-Cote dAzur',
                'country_id' => 75,
            ),
            185 => 
            array (
                'id' => 1186,
                'name' => 'Alpes-Maritimes',
                'country_id' => 75,
            ),
            186 => 
            array (
                'id' => 1187,
                'name' => 'Alpes-de-Haute-Provence',
                'country_id' => 75,
            ),
            187 => 
            array (
                'id' => 1188,
                'name' => 'Alsace',
                'country_id' => 75,
            ),
            188 => 
            array (
                'id' => 1189,
                'name' => 'Aquitaine',
                'country_id' => 75,
            ),
            189 => 
            array (
                'id' => 1190,
                'name' => 'Ardeche',
                'country_id' => 75,
            ),
            190 => 
            array (
                'id' => 1191,
                'name' => 'Ardennes',
                'country_id' => 75,
            ),
            191 => 
            array (
                'id' => 1192,
                'name' => 'Ariege',
                'country_id' => 75,
            ),
            192 => 
            array (
                'id' => 1193,
                'name' => 'Aube',
                'country_id' => 75,
            ),
            193 => 
            array (
                'id' => 1194,
                'name' => 'Aude',
                'country_id' => 75,
            ),
            194 => 
            array (
                'id' => 1195,
                'name' => 'Auvergne',
                'country_id' => 75,
            ),
            195 => 
            array (
                'id' => 1196,
                'name' => 'Aveyron',
                'country_id' => 75,
            ),
            196 => 
            array (
                'id' => 1197,
                'name' => 'Bas-Rhin',
                'country_id' => 75,
            ),
            197 => 
            array (
                'id' => 1198,
                'name' => 'Basse-Normandie',
                'country_id' => 75,
            ),
            198 => 
            array (
                'id' => 1199,
                'name' => 'Bouches-du-Rhone',
                'country_id' => 75,
            ),
            199 => 
            array (
                'id' => 1200,
                'name' => 'Bourgogne',
                'country_id' => 75,
            ),
            200 => 
            array (
                'id' => 1201,
                'name' => 'Bretagne',
                'country_id' => 75,
            ),
            201 => 
            array (
                'id' => 1202,
                'name' => 'Brittany',
                'country_id' => 75,
            ),
            202 => 
            array (
                'id' => 1203,
                'name' => 'Burgundy',
                'country_id' => 75,
            ),
            203 => 
            array (
                'id' => 1204,
                'name' => 'Calvados',
                'country_id' => 75,
            ),
            204 => 
            array (
                'id' => 1205,
                'name' => 'Cantal',
                'country_id' => 75,
            ),
            205 => 
            array (
                'id' => 1206,
                'name' => 'Cedex',
                'country_id' => 75,
            ),
            206 => 
            array (
                'id' => 1207,
                'name' => 'Centre',
                'country_id' => 75,
            ),
            207 => 
            array (
                'id' => 1208,
                'name' => 'Charente',
                'country_id' => 75,
            ),
            208 => 
            array (
                'id' => 1209,
                'name' => 'Charente-Maritime',
                'country_id' => 75,
            ),
            209 => 
            array (
                'id' => 1210,
                'name' => 'Cher',
                'country_id' => 75,
            ),
            210 => 
            array (
                'id' => 1211,
                'name' => 'Correze',
                'country_id' => 75,
            ),
            211 => 
            array (
                'id' => 1212,
                'name' => 'Corse-du-Sud',
                'country_id' => 75,
            ),
            212 => 
            array (
                'id' => 1213,
                'name' => 'Cote-d\'Or',
                'country_id' => 75,
            ),
            213 => 
            array (
                'id' => 1214,
                'name' => 'Cotes-d\'Armor',
                'country_id' => 75,
            ),
            214 => 
            array (
                'id' => 1215,
                'name' => 'Creuse',
                'country_id' => 75,
            ),
            215 => 
            array (
                'id' => 1216,
                'name' => 'Crolles',
                'country_id' => 75,
            ),
            216 => 
            array (
                'id' => 1217,
                'name' => 'Deux-Sevres',
                'country_id' => 75,
            ),
            217 => 
            array (
                'id' => 1218,
                'name' => 'Dordogne',
                'country_id' => 75,
            ),
            218 => 
            array (
                'id' => 1219,
                'name' => 'Doubs',
                'country_id' => 75,
            ),
            219 => 
            array (
                'id' => 1220,
                'name' => 'Drome',
                'country_id' => 75,
            ),
            220 => 
            array (
                'id' => 1221,
                'name' => 'Essonne',
                'country_id' => 75,
            ),
            221 => 
            array (
                'id' => 1222,
                'name' => 'Eure',
                'country_id' => 75,
            ),
            222 => 
            array (
                'id' => 1223,
                'name' => 'Eure-et-Loir',
                'country_id' => 75,
            ),
            223 => 
            array (
                'id' => 1224,
                'name' => 'Feucherolles',
                'country_id' => 75,
            ),
            224 => 
            array (
                'id' => 1225,
                'name' => 'Finistere',
                'country_id' => 75,
            ),
            225 => 
            array (
                'id' => 1226,
                'name' => 'Franche-Comte',
                'country_id' => 75,
            ),
            226 => 
            array (
                'id' => 1227,
                'name' => 'Gard',
                'country_id' => 75,
            ),
            227 => 
            array (
                'id' => 1228,
                'name' => 'Gers',
                'country_id' => 75,
            ),
            228 => 
            array (
                'id' => 1229,
                'name' => 'Gironde',
                'country_id' => 75,
            ),
            229 => 
            array (
                'id' => 1230,
                'name' => 'Haut-Rhin',
                'country_id' => 75,
            ),
            230 => 
            array (
                'id' => 1231,
                'name' => 'Haute-Corse',
                'country_id' => 75,
            ),
            231 => 
            array (
                'id' => 1232,
                'name' => 'Haute-Garonne',
                'country_id' => 75,
            ),
            232 => 
            array (
                'id' => 1233,
                'name' => 'Haute-Loire',
                'country_id' => 75,
            ),
            233 => 
            array (
                'id' => 1234,
                'name' => 'Haute-Marne',
                'country_id' => 75,
            ),
            234 => 
            array (
                'id' => 1235,
                'name' => 'Haute-Saone',
                'country_id' => 75,
            ),
            235 => 
            array (
                'id' => 1236,
                'name' => 'Haute-Savoie',
                'country_id' => 75,
            ),
            236 => 
            array (
                'id' => 1237,
                'name' => 'Haute-Vienne',
                'country_id' => 75,
            ),
            237 => 
            array (
                'id' => 1238,
                'name' => 'Hautes-Alpes',
                'country_id' => 75,
            ),
            238 => 
            array (
                'id' => 1239,
                'name' => 'Hautes-Pyrenees',
                'country_id' => 75,
            ),
            239 => 
            array (
                'id' => 1240,
                'name' => 'Hauts-de-Seine',
                'country_id' => 75,
            ),
            240 => 
            array (
                'id' => 1241,
                'name' => 'Herault',
                'country_id' => 75,
            ),
            241 => 
            array (
                'id' => 1242,
                'name' => 'Ile-de-France',
                'country_id' => 75,
            ),
            242 => 
            array (
                'id' => 1243,
                'name' => 'Ille-et-Vilaine',
                'country_id' => 75,
            ),
            243 => 
            array (
                'id' => 1244,
                'name' => 'Indre',
                'country_id' => 75,
            ),
            244 => 
            array (
                'id' => 1245,
                'name' => 'Indre-et-Loire',
                'country_id' => 75,
            ),
            245 => 
            array (
                'id' => 1246,
                'name' => 'Isere',
                'country_id' => 75,
            ),
            246 => 
            array (
                'id' => 1247,
                'name' => 'Jura',
                'country_id' => 75,
            ),
            247 => 
            array (
                'id' => 1248,
                'name' => 'Klagenfurt',
                'country_id' => 75,
            ),
            248 => 
            array (
                'id' => 1249,
                'name' => 'Landes',
                'country_id' => 75,
            ),
            249 => 
            array (
                'id' => 1250,
                'name' => 'Languedoc-Roussillon',
                'country_id' => 75,
            ),
            250 => 
            array (
                'id' => 1251,
                'name' => 'Larcay',
                'country_id' => 75,
            ),
            251 => 
            array (
                'id' => 1252,
                'name' => 'Le Castellet',
                'country_id' => 75,
            ),
            252 => 
            array (
                'id' => 1253,
                'name' => 'Le Creusot',
                'country_id' => 75,
            ),
            253 => 
            array (
                'id' => 1254,
                'name' => 'Limousin',
                'country_id' => 75,
            ),
            254 => 
            array (
                'id' => 1255,
                'name' => 'Loir-et-Cher',
                'country_id' => 75,
            ),
            255 => 
            array (
                'id' => 1256,
                'name' => 'Loire',
                'country_id' => 75,
            ),
            256 => 
            array (
                'id' => 1257,
                'name' => 'Loire-Atlantique',
                'country_id' => 75,
            ),
            257 => 
            array (
                'id' => 1258,
                'name' => 'Loiret',
                'country_id' => 75,
            ),
            258 => 
            array (
                'id' => 1259,
                'name' => 'Lorraine',
                'country_id' => 75,
            ),
            259 => 
            array (
                'id' => 1260,
                'name' => 'Lot',
                'country_id' => 75,
            ),
            260 => 
            array (
                'id' => 1261,
                'name' => 'Lot-et-Garonne',
                'country_id' => 75,
            ),
            261 => 
            array (
                'id' => 1262,
                'name' => 'Lower Normandy',
                'country_id' => 75,
            ),
            262 => 
            array (
                'id' => 1263,
                'name' => 'Lozere',
                'country_id' => 75,
            ),
            263 => 
            array (
                'id' => 1264,
                'name' => 'Maine-et-Loire',
                'country_id' => 75,
            ),
            264 => 
            array (
                'id' => 1265,
                'name' => 'Manche',
                'country_id' => 75,
            ),
            265 => 
            array (
                'id' => 1266,
                'name' => 'Marne',
                'country_id' => 75,
            ),
            266 => 
            array (
                'id' => 1267,
                'name' => 'Mayenne',
                'country_id' => 75,
            ),
            267 => 
            array (
                'id' => 1268,
                'name' => 'Meurthe-et-Moselle',
                'country_id' => 75,
            ),
            268 => 
            array (
                'id' => 1269,
                'name' => 'Meuse',
                'country_id' => 75,
            ),
            269 => 
            array (
                'id' => 1270,
                'name' => 'Midi-Pyrenees',
                'country_id' => 75,
            ),
            270 => 
            array (
                'id' => 1271,
                'name' => 'Morbihan',
                'country_id' => 75,
            ),
            271 => 
            array (
                'id' => 1272,
                'name' => 'Moselle',
                'country_id' => 75,
            ),
            272 => 
            array (
                'id' => 1273,
                'name' => 'Nievre',
                'country_id' => 75,
            ),
            273 => 
            array (
                'id' => 1274,
                'name' => 'Nord',
                'country_id' => 75,
            ),
            274 => 
            array (
                'id' => 1275,
                'name' => 'Nord-Pas-de-Calais',
                'country_id' => 75,
            ),
            275 => 
            array (
                'id' => 1276,
                'name' => 'Oise',
                'country_id' => 75,
            ),
            276 => 
            array (
                'id' => 1277,
                'name' => 'Orne',
                'country_id' => 75,
            ),
            277 => 
            array (
                'id' => 1278,
                'name' => 'Paris',
                'country_id' => 75,
            ),
            278 => 
            array (
                'id' => 1279,
                'name' => 'Pas-de-Calais',
                'country_id' => 75,
            ),
            279 => 
            array (
                'id' => 1280,
                'name' => 'Pays de la Loire',
                'country_id' => 75,
            ),
            280 => 
            array (
                'id' => 1281,
                'name' => 'Pays-de-la-Loire',
                'country_id' => 75,
            ),
            281 => 
            array (
                'id' => 1282,
                'name' => 'Picardy',
                'country_id' => 75,
            ),
            282 => 
            array (
                'id' => 1283,
                'name' => 'Puy-de-Dome',
                'country_id' => 75,
            ),
            283 => 
            array (
                'id' => 1284,
                'name' => 'Pyrenees-Atlantiques',
                'country_id' => 75,
            ),
            284 => 
            array (
                'id' => 1285,
                'name' => 'Pyrenees-Orientales',
                'country_id' => 75,
            ),
            285 => 
            array (
                'id' => 1286,
                'name' => 'Quelmes',
                'country_id' => 75,
            ),
            286 => 
            array (
                'id' => 1287,
                'name' => 'Rhone',
                'country_id' => 75,
            ),
            287 => 
            array (
                'id' => 1288,
                'name' => 'Rhone-Alpes',
                'country_id' => 75,
            ),
            288 => 
            array (
                'id' => 1289,
                'name' => 'Saint Ouen',
                'country_id' => 75,
            ),
            289 => 
            array (
                'id' => 1290,
                'name' => 'Saint Viatre',
                'country_id' => 75,
            ),
            290 => 
            array (
                'id' => 1291,
                'name' => 'Saone-et-Loire',
                'country_id' => 75,
            ),
            291 => 
            array (
                'id' => 1292,
                'name' => 'Sarthe',
                'country_id' => 75,
            ),
            292 => 
            array (
                'id' => 1293,
                'name' => 'Savoie',
                'country_id' => 75,
            ),
            293 => 
            array (
                'id' => 1294,
                'name' => 'Seine-Maritime',
                'country_id' => 75,
            ),
            294 => 
            array (
                'id' => 1295,
                'name' => 'Seine-Saint-Denis',
                'country_id' => 75,
            ),
            295 => 
            array (
                'id' => 1296,
                'name' => 'Seine-et-Marne',
                'country_id' => 75,
            ),
            296 => 
            array (
                'id' => 1297,
                'name' => 'Somme',
                'country_id' => 75,
            ),
            297 => 
            array (
                'id' => 1298,
                'name' => 'Sophia Antipolis',
                'country_id' => 75,
            ),
            298 => 
            array (
                'id' => 1299,
                'name' => 'Souvans',
                'country_id' => 75,
            ),
            299 => 
            array (
                'id' => 1300,
                'name' => 'Tarn',
                'country_id' => 75,
            ),
            300 => 
            array (
                'id' => 1301,
                'name' => 'Tarn-et-Garonne',
                'country_id' => 75,
            ),
            301 => 
            array (
                'id' => 1302,
                'name' => 'Territoire de Belfort',
                'country_id' => 75,
            ),
            302 => 
            array (
                'id' => 1303,
                'name' => 'Treignac',
                'country_id' => 75,
            ),
            303 => 
            array (
                'id' => 1304,
                'name' => 'Upper Normandy',
                'country_id' => 75,
            ),
            304 => 
            array (
                'id' => 1305,
                'name' => 'Val-d\'Oise',
                'country_id' => 75,
            ),
            305 => 
            array (
                'id' => 1306,
                'name' => 'Val-de-Marne',
                'country_id' => 75,
            ),
            306 => 
            array (
                'id' => 1307,
                'name' => 'Var',
                'country_id' => 75,
            ),
            307 => 
            array (
                'id' => 1308,
                'name' => 'Vaucluse',
                'country_id' => 75,
            ),
            308 => 
            array (
                'id' => 1309,
                'name' => 'Vellise',
                'country_id' => 75,
            ),
            309 => 
            array (
                'id' => 1310,
                'name' => 'Vendee',
                'country_id' => 75,
            ),
            310 => 
            array (
                'id' => 1311,
                'name' => 'Vienne',
                'country_id' => 75,
            ),
            311 => 
            array (
                'id' => 1312,
                'name' => 'Vosges',
                'country_id' => 75,
            ),
            312 => 
            array (
                'id' => 1313,
                'name' => 'Yonne',
                'country_id' => 75,
            ),
            313 => 
            array (
                'id' => 1314,
                'name' => 'Yvelines',
                'country_id' => 75,
            ),
            314 => 
            array (
                'id' => 1315,
                'name' => 'Cayenne',
                'country_id' => 76,
            ),
            315 => 
            array (
                'id' => 1316,
                'name' => 'Saint-Laurent-du-Maroni',
                'country_id' => 76,
            ),
            316 => 
            array (
                'id' => 1317,
                'name' => 'Iles du Vent',
                'country_id' => 77,
            ),
            317 => 
            array (
                'id' => 1318,
                'name' => 'Iles sous le Vent',
                'country_id' => 77,
            ),
            318 => 
            array (
                'id' => 1319,
                'name' => 'Marquesas',
                'country_id' => 77,
            ),
            319 => 
            array (
                'id' => 1320,
                'name' => 'Tuamotu',
                'country_id' => 77,
            ),
            320 => 
            array (
                'id' => 1321,
                'name' => 'Tubuai',
                'country_id' => 77,
            ),
            321 => 
            array (
                'id' => 1322,
                'name' => 'Amsterdam',
                'country_id' => 78,
            ),
            322 => 
            array (
                'id' => 1323,
                'name' => 'Crozet Islands',
                'country_id' => 78,
            ),
            323 => 
            array (
                'id' => 1324,
                'name' => 'Kerguelen',
                'country_id' => 78,
            ),
            324 => 
            array (
                'id' => 1325,
                'name' => 'Estuaire',
                'country_id' => 79,
            ),
            325 => 
            array (
                'id' => 1326,
                'name' => 'Haut-Ogooue',
                'country_id' => 79,
            ),
            326 => 
            array (
                'id' => 1327,
                'name' => 'Moyen-Ogooue',
                'country_id' => 79,
            ),
            327 => 
            array (
                'id' => 1328,
                'name' => 'Ngounie',
                'country_id' => 79,
            ),
            328 => 
            array (
                'id' => 1329,
                'name' => 'Nyanga',
                'country_id' => 79,
            ),
            329 => 
            array (
                'id' => 1330,
                'name' => 'Ogooue-Ivindo',
                'country_id' => 79,
            ),
            330 => 
            array (
                'id' => 1331,
                'name' => 'Ogooue-Lolo',
                'country_id' => 79,
            ),
            331 => 
            array (
                'id' => 1332,
                'name' => 'Ogooue-Maritime',
                'country_id' => 79,
            ),
            332 => 
            array (
                'id' => 1333,
                'name' => 'Woleu-Ntem',
                'country_id' => 79,
            ),
            333 => 
            array (
                'id' => 1334,
                'name' => 'Banjul',
                'country_id' => 80,
            ),
            334 => 
            array (
                'id' => 1335,
                'name' => 'Basse',
                'country_id' => 80,
            ),
            335 => 
            array (
                'id' => 1336,
                'name' => 'Brikama',
                'country_id' => 80,
            ),
            336 => 
            array (
                'id' => 1337,
                'name' => 'Janjanbureh',
                'country_id' => 80,
            ),
            337 => 
            array (
                'id' => 1338,
                'name' => 'Kanifing',
                'country_id' => 80,
            ),
            338 => 
            array (
                'id' => 1339,
                'name' => 'Kerewan',
                'country_id' => 80,
            ),
            339 => 
            array (
                'id' => 1340,
                'name' => 'Kuntaur',
                'country_id' => 80,
            ),
            340 => 
            array (
                'id' => 1341,
                'name' => 'Mansakonko',
                'country_id' => 80,
            ),
            341 => 
            array (
                'id' => 1342,
                'name' => 'Abhasia',
                'country_id' => 81,
            ),
            342 => 
            array (
                'id' => 1343,
                'name' => 'Ajaria',
                'country_id' => 81,
            ),
            343 => 
            array (
                'id' => 1344,
                'name' => 'Guria',
                'country_id' => 81,
            ),
            344 => 
            array (
                'id' => 1345,
                'name' => 'Imereti',
                'country_id' => 81,
            ),
            345 => 
            array (
                'id' => 1346,
                'name' => 'Kaheti',
                'country_id' => 81,
            ),
            346 => 
            array (
                'id' => 1347,
                'name' => 'Kvemo Kartli',
                'country_id' => 81,
            ),
            347 => 
            array (
                'id' => 1348,
                'name' => 'Mcheta-Mtianeti',
                'country_id' => 81,
            ),
            348 => 
            array (
                'id' => 1349,
                'name' => 'Racha',
                'country_id' => 81,
            ),
            349 => 
            array (
                'id' => 1350,
                'name' => 'Samagrelo-Zemo Svaneti',
                'country_id' => 81,
            ),
            350 => 
            array (
                'id' => 1351,
                'name' => 'Samche-Zhavaheti',
                'country_id' => 81,
            ),
            351 => 
            array (
                'id' => 1352,
                'name' => 'Shida Kartli',
                'country_id' => 81,
            ),
            352 => 
            array (
                'id' => 1353,
                'name' => 'Tbilisi',
                'country_id' => 81,
            ),
            353 => 
            array (
                'id' => 1354,
                'name' => 'Auvergne',
                'country_id' => 82,
            ),
            354 => 
            array (
                'id' => 1355,
                'name' => 'Baden-Wurttemberg',
                'country_id' => 82,
            ),
            355 => 
            array (
                'id' => 1356,
                'name' => 'Bavaria',
                'country_id' => 82,
            ),
            356 => 
            array (
                'id' => 1357,
                'name' => 'Bayern',
                'country_id' => 82,
            ),
            357 => 
            array (
                'id' => 1358,
                'name' => 'Beilstein Wurtt',
                'country_id' => 82,
            ),
            358 => 
            array (
                'id' => 1359,
                'name' => 'Berlin',
                'country_id' => 82,
            ),
            359 => 
            array (
                'id' => 1360,
                'name' => 'Brandenburg',
                'country_id' => 82,
            ),
            360 => 
            array (
                'id' => 1361,
                'name' => 'Bremen',
                'country_id' => 82,
            ),
            361 => 
            array (
                'id' => 1362,
                'name' => 'Dreisbach',
                'country_id' => 82,
            ),
            362 => 
            array (
                'id' => 1363,
                'name' => 'Freistaat Bayern',
                'country_id' => 82,
            ),
            363 => 
            array (
                'id' => 1364,
                'name' => 'Hamburg',
                'country_id' => 82,
            ),
            364 => 
            array (
                'id' => 1365,
                'name' => 'Hannover',
                'country_id' => 82,
            ),
            365 => 
            array (
                'id' => 1366,
                'name' => 'Heroldstatt',
                'country_id' => 82,
            ),
            366 => 
            array (
                'id' => 1367,
                'name' => 'Hessen',
                'country_id' => 82,
            ),
            367 => 
            array (
                'id' => 1368,
                'name' => 'Kortenberg',
                'country_id' => 82,
            ),
            368 => 
            array (
                'id' => 1369,
                'name' => 'Laasdorf',
                'country_id' => 82,
            ),
            369 => 
            array (
                'id' => 1370,
                'name' => 'Land Baden-Wurttemberg',
                'country_id' => 82,
            ),
            370 => 
            array (
                'id' => 1371,
                'name' => 'Land Bayern',
                'country_id' => 82,
            ),
            371 => 
            array (
                'id' => 1372,
                'name' => 'Land Brandenburg',
                'country_id' => 82,
            ),
            372 => 
            array (
                'id' => 1373,
                'name' => 'Land Hessen',
                'country_id' => 82,
            ),
            373 => 
            array (
                'id' => 1374,
                'name' => 'Land Mecklenburg-Vorpommern',
                'country_id' => 82,
            ),
            374 => 
            array (
                'id' => 1375,
                'name' => 'Land Nordrhein-Westfalen',
                'country_id' => 82,
            ),
            375 => 
            array (
                'id' => 1376,
                'name' => 'Land Rheinland-Pfalz',
                'country_id' => 82,
            ),
            376 => 
            array (
                'id' => 1377,
                'name' => 'Land Sachsen',
                'country_id' => 82,
            ),
            377 => 
            array (
                'id' => 1378,
                'name' => 'Land Sachsen-Anhalt',
                'country_id' => 82,
            ),
            378 => 
            array (
                'id' => 1379,
                'name' => 'Land Thuringen',
                'country_id' => 82,
            ),
            379 => 
            array (
                'id' => 1380,
                'name' => 'Lower Saxony',
                'country_id' => 82,
            ),
            380 => 
            array (
                'id' => 1381,
                'name' => 'Mecklenburg-Vorpommern',
                'country_id' => 82,
            ),
            381 => 
            array (
                'id' => 1382,
                'name' => 'Mulfingen',
                'country_id' => 82,
            ),
            382 => 
            array (
                'id' => 1383,
                'name' => 'Munich',
                'country_id' => 82,
            ),
            383 => 
            array (
                'id' => 1384,
                'name' => 'Neubeuern',
                'country_id' => 82,
            ),
            384 => 
            array (
                'id' => 1385,
                'name' => 'Niedersachsen',
                'country_id' => 82,
            ),
            385 => 
            array (
                'id' => 1386,
                'name' => 'Noord-Holland',
                'country_id' => 82,
            ),
            386 => 
            array (
                'id' => 1387,
                'name' => 'Nordrhein-Westfalen',
                'country_id' => 82,
            ),
            387 => 
            array (
                'id' => 1388,
                'name' => 'North Rhine-Westphalia',
                'country_id' => 82,
            ),
            388 => 
            array (
                'id' => 1389,
                'name' => 'Osterode',
                'country_id' => 82,
            ),
            389 => 
            array (
                'id' => 1390,
                'name' => 'Rheinland-Pfalz',
                'country_id' => 82,
            ),
            390 => 
            array (
                'id' => 1391,
                'name' => 'Rhineland-Palatinate',
                'country_id' => 82,
            ),
            391 => 
            array (
                'id' => 1392,
                'name' => 'Saarland',
                'country_id' => 82,
            ),
            392 => 
            array (
                'id' => 1393,
                'name' => 'Sachsen',
                'country_id' => 82,
            ),
            393 => 
            array (
                'id' => 1394,
                'name' => 'Sachsen-Anhalt',
                'country_id' => 82,
            ),
            394 => 
            array (
                'id' => 1395,
                'name' => 'Saxony',
                'country_id' => 82,
            ),
            395 => 
            array (
                'id' => 1396,
                'name' => 'Schleswig-Holstein',
                'country_id' => 82,
            ),
            396 => 
            array (
                'id' => 1397,
                'name' => 'Thuringia',
                'country_id' => 82,
            ),
            397 => 
            array (
                'id' => 1398,
                'name' => 'Webling',
                'country_id' => 82,
            ),
            398 => 
            array (
                'id' => 1399,
                'name' => 'Weinstrabe',
                'country_id' => 82,
            ),
            399 => 
            array (
                'id' => 1400,
                'name' => 'schlobborn',
                'country_id' => 82,
            ),
            400 => 
            array (
                'id' => 1401,
                'name' => 'Ashanti',
                'country_id' => 83,
            ),
            401 => 
            array (
                'id' => 1402,
                'name' => 'Brong-Ahafo',
                'country_id' => 83,
            ),
            402 => 
            array (
                'id' => 1403,
                'name' => 'Central',
                'country_id' => 83,
            ),
            403 => 
            array (
                'id' => 1404,
                'name' => 'Eastern',
                'country_id' => 83,
            ),
            404 => 
            array (
                'id' => 1405,
                'name' => 'Greater Accra',
                'country_id' => 83,
            ),
            405 => 
            array (
                'id' => 1406,
                'name' => 'Northern',
                'country_id' => 83,
            ),
            406 => 
            array (
                'id' => 1407,
                'name' => 'Upper East',
                'country_id' => 83,
            ),
            407 => 
            array (
                'id' => 1408,
                'name' => 'Upper West',
                'country_id' => 83,
            ),
            408 => 
            array (
                'id' => 1409,
                'name' => 'Volta',
                'country_id' => 83,
            ),
            409 => 
            array (
                'id' => 1410,
                'name' => 'Western',
                'country_id' => 83,
            ),
            410 => 
            array (
                'id' => 1411,
                'name' => 'Gibraltar',
                'country_id' => 84,
            ),
            411 => 
            array (
                'id' => 1412,
                'name' => 'Acharnes',
                'country_id' => 85,
            ),
            412 => 
            array (
                'id' => 1413,
                'name' => 'Ahaia',
                'country_id' => 85,
            ),
            413 => 
            array (
                'id' => 1414,
                'name' => 'Aitolia kai Akarnania',
                'country_id' => 85,
            ),
            414 => 
            array (
                'id' => 1415,
                'name' => 'Argolis',
                'country_id' => 85,
            ),
            415 => 
            array (
                'id' => 1416,
                'name' => 'Arkadia',
                'country_id' => 85,
            ),
            416 => 
            array (
                'id' => 1417,
                'name' => 'Arta',
                'country_id' => 85,
            ),
            417 => 
            array (
                'id' => 1418,
                'name' => 'Attica',
                'country_id' => 85,
            ),
            418 => 
            array (
                'id' => 1419,
                'name' => 'Attiki',
                'country_id' => 85,
            ),
            419 => 
            array (
                'id' => 1420,
                'name' => 'Ayion Oros',
                'country_id' => 85,
            ),
            420 => 
            array (
                'id' => 1421,
                'name' => 'Crete',
                'country_id' => 85,
            ),
            421 => 
            array (
                'id' => 1422,
                'name' => 'Dodekanisos',
                'country_id' => 85,
            ),
            422 => 
            array (
                'id' => 1423,
                'name' => 'Drama',
                'country_id' => 85,
            ),
            423 => 
            array (
                'id' => 1424,
                'name' => 'Evia',
                'country_id' => 85,
            ),
            424 => 
            array (
                'id' => 1425,
                'name' => 'Evritania',
                'country_id' => 85,
            ),
            425 => 
            array (
                'id' => 1426,
                'name' => 'Evros',
                'country_id' => 85,
            ),
            426 => 
            array (
                'id' => 1427,
                'name' => 'Evvoia',
                'country_id' => 85,
            ),
            427 => 
            array (
                'id' => 1428,
                'name' => 'Florina',
                'country_id' => 85,
            ),
            428 => 
            array (
                'id' => 1429,
                'name' => 'Fokis',
                'country_id' => 85,
            ),
            429 => 
            array (
                'id' => 1430,
                'name' => 'Fthiotis',
                'country_id' => 85,
            ),
            430 => 
            array (
                'id' => 1431,
                'name' => 'Grevena',
                'country_id' => 85,
            ),
            431 => 
            array (
                'id' => 1432,
                'name' => 'Halandri',
                'country_id' => 85,
            ),
            432 => 
            array (
                'id' => 1433,
                'name' => 'Halkidiki',
                'country_id' => 85,
            ),
            433 => 
            array (
                'id' => 1434,
                'name' => 'Hania',
                'country_id' => 85,
            ),
            434 => 
            array (
                'id' => 1435,
                'name' => 'Heraklion',
                'country_id' => 85,
            ),
            435 => 
            array (
                'id' => 1436,
                'name' => 'Hios',
                'country_id' => 85,
            ),
            436 => 
            array (
                'id' => 1437,
                'name' => 'Ilia',
                'country_id' => 85,
            ),
            437 => 
            array (
                'id' => 1438,
                'name' => 'Imathia',
                'country_id' => 85,
            ),
            438 => 
            array (
                'id' => 1439,
                'name' => 'Ioannina',
                'country_id' => 85,
            ),
            439 => 
            array (
                'id' => 1440,
                'name' => 'Iraklion',
                'country_id' => 85,
            ),
            440 => 
            array (
                'id' => 1441,
                'name' => 'Karditsa',
                'country_id' => 85,
            ),
            441 => 
            array (
                'id' => 1442,
                'name' => 'Kastoria',
                'country_id' => 85,
            ),
            442 => 
            array (
                'id' => 1443,
                'name' => 'Kavala',
                'country_id' => 85,
            ),
            443 => 
            array (
                'id' => 1444,
                'name' => 'Kefallinia',
                'country_id' => 85,
            ),
            444 => 
            array (
                'id' => 1445,
                'name' => 'Kerkira',
                'country_id' => 85,
            ),
            445 => 
            array (
                'id' => 1446,
                'name' => 'Kiklades',
                'country_id' => 85,
            ),
            446 => 
            array (
                'id' => 1447,
                'name' => 'Kilkis',
                'country_id' => 85,
            ),
            447 => 
            array (
                'id' => 1448,
                'name' => 'Korinthia',
                'country_id' => 85,
            ),
            448 => 
            array (
                'id' => 1449,
                'name' => 'Kozani',
                'country_id' => 85,
            ),
            449 => 
            array (
                'id' => 1450,
                'name' => 'Lakonia',
                'country_id' => 85,
            ),
            450 => 
            array (
                'id' => 1451,
                'name' => 'Larisa',
                'country_id' => 85,
            ),
            451 => 
            array (
                'id' => 1452,
                'name' => 'Lasithi',
                'country_id' => 85,
            ),
            452 => 
            array (
                'id' => 1453,
                'name' => 'Lesvos',
                'country_id' => 85,
            ),
            453 => 
            array (
                'id' => 1454,
                'name' => 'Levkas',
                'country_id' => 85,
            ),
            454 => 
            array (
                'id' => 1455,
                'name' => 'Magnisia',
                'country_id' => 85,
            ),
            455 => 
            array (
                'id' => 1456,
                'name' => 'Messinia',
                'country_id' => 85,
            ),
            456 => 
            array (
                'id' => 1457,
                'name' => 'Nomos Attikis',
                'country_id' => 85,
            ),
            457 => 
            array (
                'id' => 1458,
                'name' => 'Nomos Zakynthou',
                'country_id' => 85,
            ),
            458 => 
            array (
                'id' => 1459,
                'name' => 'Pella',
                'country_id' => 85,
            ),
            459 => 
            array (
                'id' => 1460,
                'name' => 'Pieria',
                'country_id' => 85,
            ),
            460 => 
            array (
                'id' => 1461,
                'name' => 'Piraios',
                'country_id' => 85,
            ),
            461 => 
            array (
                'id' => 1462,
                'name' => 'Preveza',
                'country_id' => 85,
            ),
            462 => 
            array (
                'id' => 1463,
                'name' => 'Rethimni',
                'country_id' => 85,
            ),
            463 => 
            array (
                'id' => 1464,
                'name' => 'Rodopi',
                'country_id' => 85,
            ),
            464 => 
            array (
                'id' => 1465,
                'name' => 'Samos',
                'country_id' => 85,
            ),
            465 => 
            array (
                'id' => 1466,
                'name' => 'Serrai',
                'country_id' => 85,
            ),
            466 => 
            array (
                'id' => 1467,
                'name' => 'Thesprotia',
                'country_id' => 85,
            ),
            467 => 
            array (
                'id' => 1468,
                'name' => 'Thessaloniki',
                'country_id' => 85,
            ),
            468 => 
            array (
                'id' => 1469,
                'name' => 'Trikala',
                'country_id' => 85,
            ),
            469 => 
            array (
                'id' => 1470,
                'name' => 'Voiotia',
                'country_id' => 85,
            ),
            470 => 
            array (
                'id' => 1471,
                'name' => 'West Greece',
                'country_id' => 85,
            ),
            471 => 
            array (
                'id' => 1472,
                'name' => 'Xanthi',
                'country_id' => 85,
            ),
            472 => 
            array (
                'id' => 1473,
                'name' => 'Zakinthos',
                'country_id' => 85,
            ),
            473 => 
            array (
                'id' => 1474,
                'name' => 'Aasiaat',
                'country_id' => 86,
            ),
            474 => 
            array (
                'id' => 1475,
                'name' => 'Ammassalik',
                'country_id' => 86,
            ),
            475 => 
            array (
                'id' => 1476,
                'name' => 'Illoqqortoormiut',
                'country_id' => 86,
            ),
            476 => 
            array (
                'id' => 1477,
                'name' => 'Ilulissat',
                'country_id' => 86,
            ),
            477 => 
            array (
                'id' => 1478,
                'name' => 'Ivittuut',
                'country_id' => 86,
            ),
            478 => 
            array (
                'id' => 1479,
                'name' => 'Kangaatsiaq',
                'country_id' => 86,
            ),
            479 => 
            array (
                'id' => 1480,
                'name' => 'Maniitsoq',
                'country_id' => 86,
            ),
            480 => 
            array (
                'id' => 1481,
                'name' => 'Nanortalik',
                'country_id' => 86,
            ),
            481 => 
            array (
                'id' => 1482,
                'name' => 'Narsaq',
                'country_id' => 86,
            ),
            482 => 
            array (
                'id' => 1483,
                'name' => 'Nuuk',
                'country_id' => 86,
            ),
            483 => 
            array (
                'id' => 1484,
                'name' => 'Paamiut',
                'country_id' => 86,
            ),
            484 => 
            array (
                'id' => 1485,
                'name' => 'Qaanaaq',
                'country_id' => 86,
            ),
            485 => 
            array (
                'id' => 1486,
                'name' => 'Qaqortoq',
                'country_id' => 86,
            ),
            486 => 
            array (
                'id' => 1487,
                'name' => 'Qasigiannguit',
                'country_id' => 86,
            ),
            487 => 
            array (
                'id' => 1488,
                'name' => 'Qeqertarsuaq',
                'country_id' => 86,
            ),
            488 => 
            array (
                'id' => 1489,
                'name' => 'Sisimiut',
                'country_id' => 86,
            ),
            489 => 
            array (
                'id' => 1490,
                'name' => 'Udenfor kommunal inddeling',
                'country_id' => 86,
            ),
            490 => 
            array (
                'id' => 1491,
                'name' => 'Upernavik',
                'country_id' => 86,
            ),
            491 => 
            array (
                'id' => 1492,
                'name' => 'Uummannaq',
                'country_id' => 86,
            ),
            492 => 
            array (
                'id' => 1493,
                'name' => 'Carriacou-Petite Martinique',
                'country_id' => 87,
            ),
            493 => 
            array (
                'id' => 1494,
                'name' => 'Saint Andrew',
                'country_id' => 87,
            ),
            494 => 
            array (
                'id' => 1495,
                'name' => 'Saint Davids',
                'country_id' => 87,
            ),
            495 => 
            array (
                'id' => 1496,
                'name' => 'Saint George\'s',
                'country_id' => 87,
            ),
            496 => 
            array (
                'id' => 1497,
                'name' => 'Saint John',
                'country_id' => 87,
            ),
            497 => 
            array (
                'id' => 1498,
                'name' => 'Saint Mark',
                'country_id' => 87,
            ),
            498 => 
            array (
                'id' => 1499,
                'name' => 'Saint Patrick',
                'country_id' => 87,
            ),
            499 => 
            array (
                'id' => 1500,
                'name' => 'Basse-Terre',
                'country_id' => 88,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 1501,
                'name' => 'Grande-Terre',
                'country_id' => 88,
            ),
            1 => 
            array (
                'id' => 1502,
                'name' => 'Iles des Saintes',
                'country_id' => 88,
            ),
            2 => 
            array (
                'id' => 1503,
                'name' => 'La Desirade',
                'country_id' => 88,
            ),
            3 => 
            array (
                'id' => 1504,
                'name' => 'Marie-Galante',
                'country_id' => 88,
            ),
            4 => 
            array (
                'id' => 1505,
                'name' => 'Saint Barthelemy',
                'country_id' => 88,
            ),
            5 => 
            array (
                'id' => 1506,
                'name' => 'Saint Martin',
                'country_id' => 88,
            ),
            6 => 
            array (
                'id' => 1507,
                'name' => 'Agana Heights',
                'country_id' => 89,
            ),
            7 => 
            array (
                'id' => 1508,
                'name' => 'Agat',
                'country_id' => 89,
            ),
            8 => 
            array (
                'id' => 1509,
                'name' => 'Barrigada',
                'country_id' => 89,
            ),
            9 => 
            array (
                'id' => 1510,
                'name' => 'Chalan-Pago-Ordot',
                'country_id' => 89,
            ),
            10 => 
            array (
                'id' => 1511,
                'name' => 'Dededo',
                'country_id' => 89,
            ),
            11 => 
            array (
                'id' => 1512,
                'name' => 'Hagatna',
                'country_id' => 89,
            ),
            12 => 
            array (
                'id' => 1513,
                'name' => 'Inarajan',
                'country_id' => 89,
            ),
            13 => 
            array (
                'id' => 1514,
                'name' => 'Mangilao',
                'country_id' => 89,
            ),
            14 => 
            array (
                'id' => 1515,
                'name' => 'Merizo',
                'country_id' => 89,
            ),
            15 => 
            array (
                'id' => 1516,
                'name' => 'Mongmong-Toto-Maite',
                'country_id' => 89,
            ),
            16 => 
            array (
                'id' => 1517,
                'name' => 'Santa Rita',
                'country_id' => 89,
            ),
            17 => 
            array (
                'id' => 1518,
                'name' => 'Sinajana',
                'country_id' => 89,
            ),
            18 => 
            array (
                'id' => 1519,
                'name' => 'Talofofo',
                'country_id' => 89,
            ),
            19 => 
            array (
                'id' => 1520,
                'name' => 'Tamuning',
                'country_id' => 89,
            ),
            20 => 
            array (
                'id' => 1521,
                'name' => 'Yigo',
                'country_id' => 89,
            ),
            21 => 
            array (
                'id' => 1522,
                'name' => 'Yona',
                'country_id' => 89,
            ),
            22 => 
            array (
                'id' => 1523,
                'name' => 'Alta Verapaz',
                'country_id' => 90,
            ),
            23 => 
            array (
                'id' => 1524,
                'name' => 'Baja Verapaz',
                'country_id' => 90,
            ),
            24 => 
            array (
                'id' => 1525,
                'name' => 'Chimaltenango',
                'country_id' => 90,
            ),
            25 => 
            array (
                'id' => 1526,
                'name' => 'Chiquimula',
                'country_id' => 90,
            ),
            26 => 
            array (
                'id' => 1527,
                'name' => 'El Progreso',
                'country_id' => 90,
            ),
            27 => 
            array (
                'id' => 1528,
                'name' => 'Escuintla',
                'country_id' => 90,
            ),
            28 => 
            array (
                'id' => 1529,
                'name' => 'Guatemala',
                'country_id' => 90,
            ),
            29 => 
            array (
                'id' => 1530,
                'name' => 'Huehuetenango',
                'country_id' => 90,
            ),
            30 => 
            array (
                'id' => 1531,
                'name' => 'Izabal',
                'country_id' => 90,
            ),
            31 => 
            array (
                'id' => 1532,
                'name' => 'Jalapa',
                'country_id' => 90,
            ),
            32 => 
            array (
                'id' => 1533,
                'name' => 'Jutiapa',
                'country_id' => 90,
            ),
            33 => 
            array (
                'id' => 1534,
                'name' => 'Peten',
                'country_id' => 90,
            ),
            34 => 
            array (
                'id' => 1535,
                'name' => 'Quezaltenango',
                'country_id' => 90,
            ),
            35 => 
            array (
                'id' => 1536,
                'name' => 'Quiche',
                'country_id' => 90,
            ),
            36 => 
            array (
                'id' => 1537,
                'name' => 'Retalhuleu',
                'country_id' => 90,
            ),
            37 => 
            array (
                'id' => 1538,
                'name' => 'Sacatepequez',
                'country_id' => 90,
            ),
            38 => 
            array (
                'id' => 1539,
                'name' => 'San Marcos',
                'country_id' => 90,
            ),
            39 => 
            array (
                'id' => 1540,
                'name' => 'Santa Rosa',
                'country_id' => 90,
            ),
            40 => 
            array (
                'id' => 1541,
                'name' => 'Solola',
                'country_id' => 90,
            ),
            41 => 
            array (
                'id' => 1542,
                'name' => 'Suchitepequez',
                'country_id' => 90,
            ),
            42 => 
            array (
                'id' => 1543,
                'name' => 'Totonicapan',
                'country_id' => 90,
            ),
            43 => 
            array (
                'id' => 1544,
                'name' => 'Zacapa',
                'country_id' => 90,
            ),
            44 => 
            array (
                'id' => 1545,
                'name' => 'Alderney',
                'country_id' => 91,
            ),
            45 => 
            array (
                'id' => 1546,
                'name' => 'Castel',
                'country_id' => 91,
            ),
            46 => 
            array (
                'id' => 1547,
                'name' => 'Forest',
                'country_id' => 91,
            ),
            47 => 
            array (
                'id' => 1548,
                'name' => 'Saint Andrew',
                'country_id' => 91,
            ),
            48 => 
            array (
                'id' => 1549,
                'name' => 'Saint Martin',
                'country_id' => 91,
            ),
            49 => 
            array (
                'id' => 1550,
                'name' => 'Saint Peter Port',
                'country_id' => 91,
            ),
            50 => 
            array (
                'id' => 1551,
                'name' => 'Saint Pierre du Bois',
                'country_id' => 91,
            ),
            51 => 
            array (
                'id' => 1552,
                'name' => 'Saint Sampson',
                'country_id' => 91,
            ),
            52 => 
            array (
                'id' => 1553,
                'name' => 'Saint Saviour',
                'country_id' => 91,
            ),
            53 => 
            array (
                'id' => 1554,
                'name' => 'Sark',
                'country_id' => 91,
            ),
            54 => 
            array (
                'id' => 1555,
                'name' => 'Torteval',
                'country_id' => 91,
            ),
            55 => 
            array (
                'id' => 1556,
                'name' => 'Vale',
                'country_id' => 91,
            ),
            56 => 
            array (
                'id' => 1557,
                'name' => 'Beyla',
                'country_id' => 92,
            ),
            57 => 
            array (
                'id' => 1558,
                'name' => 'Boffa',
                'country_id' => 92,
            ),
            58 => 
            array (
                'id' => 1559,
                'name' => 'Boke',
                'country_id' => 92,
            ),
            59 => 
            array (
                'id' => 1560,
                'name' => 'Conakry',
                'country_id' => 92,
            ),
            60 => 
            array (
                'id' => 1561,
                'name' => 'Coyah',
                'country_id' => 92,
            ),
            61 => 
            array (
                'id' => 1562,
                'name' => 'Dabola',
                'country_id' => 92,
            ),
            62 => 
            array (
                'id' => 1563,
                'name' => 'Dalaba',
                'country_id' => 92,
            ),
            63 => 
            array (
                'id' => 1564,
                'name' => 'Dinguiraye',
                'country_id' => 92,
            ),
            64 => 
            array (
                'id' => 1565,
                'name' => 'Faranah',
                'country_id' => 92,
            ),
            65 => 
            array (
                'id' => 1566,
                'name' => 'Forecariah',
                'country_id' => 92,
            ),
            66 => 
            array (
                'id' => 1567,
                'name' => 'Fria',
                'country_id' => 92,
            ),
            67 => 
            array (
                'id' => 1568,
                'name' => 'Gaoual',
                'country_id' => 92,
            ),
            68 => 
            array (
                'id' => 1569,
                'name' => 'Gueckedou',
                'country_id' => 92,
            ),
            69 => 
            array (
                'id' => 1570,
                'name' => 'Kankan',
                'country_id' => 92,
            ),
            70 => 
            array (
                'id' => 1571,
                'name' => 'Kerouane',
                'country_id' => 92,
            ),
            71 => 
            array (
                'id' => 1572,
                'name' => 'Kindia',
                'country_id' => 92,
            ),
            72 => 
            array (
                'id' => 1573,
                'name' => 'Kissidougou',
                'country_id' => 92,
            ),
            73 => 
            array (
                'id' => 1574,
                'name' => 'Koubia',
                'country_id' => 92,
            ),
            74 => 
            array (
                'id' => 1575,
                'name' => 'Koundara',
                'country_id' => 92,
            ),
            75 => 
            array (
                'id' => 1576,
                'name' => 'Kouroussa',
                'country_id' => 92,
            ),
            76 => 
            array (
                'id' => 1577,
                'name' => 'Labe',
                'country_id' => 92,
            ),
            77 => 
            array (
                'id' => 1578,
                'name' => 'Lola',
                'country_id' => 92,
            ),
            78 => 
            array (
                'id' => 1579,
                'name' => 'Macenta',
                'country_id' => 92,
            ),
            79 => 
            array (
                'id' => 1580,
                'name' => 'Mali',
                'country_id' => 92,
            ),
            80 => 
            array (
                'id' => 1581,
                'name' => 'Mamou',
                'country_id' => 92,
            ),
            81 => 
            array (
                'id' => 1582,
                'name' => 'Mandiana',
                'country_id' => 92,
            ),
            82 => 
            array (
                'id' => 1583,
                'name' => 'Nzerekore',
                'country_id' => 92,
            ),
            83 => 
            array (
                'id' => 1584,
                'name' => 'Pita',
                'country_id' => 92,
            ),
            84 => 
            array (
                'id' => 1585,
                'name' => 'Siguiri',
                'country_id' => 92,
            ),
            85 => 
            array (
                'id' => 1586,
                'name' => 'Telimele',
                'country_id' => 92,
            ),
            86 => 
            array (
                'id' => 1587,
                'name' => 'Tougue',
                'country_id' => 92,
            ),
            87 => 
            array (
                'id' => 1588,
                'name' => 'Yomou',
                'country_id' => 92,
            ),
            88 => 
            array (
                'id' => 1589,
                'name' => 'Bafata',
                'country_id' => 93,
            ),
            89 => 
            array (
                'id' => 1590,
                'name' => 'Bissau',
                'country_id' => 93,
            ),
            90 => 
            array (
                'id' => 1591,
                'name' => 'Bolama',
                'country_id' => 93,
            ),
            91 => 
            array (
                'id' => 1592,
                'name' => 'Cacheu',
                'country_id' => 93,
            ),
            92 => 
            array (
                'id' => 1593,
                'name' => 'Gabu',
                'country_id' => 93,
            ),
            93 => 
            array (
                'id' => 1594,
                'name' => 'Oio',
                'country_id' => 93,
            ),
            94 => 
            array (
                'id' => 1595,
                'name' => 'Quinara',
                'country_id' => 93,
            ),
            95 => 
            array (
                'id' => 1596,
                'name' => 'Tombali',
                'country_id' => 93,
            ),
            96 => 
            array (
                'id' => 1597,
                'name' => 'Barima-Waini',
                'country_id' => 94,
            ),
            97 => 
            array (
                'id' => 1598,
                'name' => 'Cuyuni-Mazaruni',
                'country_id' => 94,
            ),
            98 => 
            array (
                'id' => 1599,
                'name' => 'Demerara-Mahaica',
                'country_id' => 94,
            ),
            99 => 
            array (
                'id' => 1600,
                'name' => 'East Berbice-Corentyne',
                'country_id' => 94,
            ),
            100 => 
            array (
                'id' => 1601,
                'name' => 'Essequibo Islands-West Demerar',
                'country_id' => 94,
            ),
            101 => 
            array (
                'id' => 1602,
                'name' => 'Mahaica-Berbice',
                'country_id' => 94,
            ),
            102 => 
            array (
                'id' => 1603,
                'name' => 'Pomeroon-Supenaam',
                'country_id' => 94,
            ),
            103 => 
            array (
                'id' => 1604,
                'name' => 'Potaro-Siparuni',
                'country_id' => 94,
            ),
            104 => 
            array (
                'id' => 1605,
                'name' => 'Upper Demerara-Berbice',
                'country_id' => 94,
            ),
            105 => 
            array (
                'id' => 1606,
                'name' => 'Upper Takutu-Upper Essequibo',
                'country_id' => 94,
            ),
            106 => 
            array (
                'id' => 1607,
                'name' => 'Artibonite',
                'country_id' => 95,
            ),
            107 => 
            array (
                'id' => 1608,
                'name' => 'Centre',
                'country_id' => 95,
            ),
            108 => 
            array (
                'id' => 1609,
                'name' => 'Grand\'Anse',
                'country_id' => 95,
            ),
            109 => 
            array (
                'id' => 1610,
                'name' => 'Nord',
                'country_id' => 95,
            ),
            110 => 
            array (
                'id' => 1611,
                'name' => 'Nord-Est',
                'country_id' => 95,
            ),
            111 => 
            array (
                'id' => 1612,
                'name' => 'Nord-Ouest',
                'country_id' => 95,
            ),
            112 => 
            array (
                'id' => 1613,
                'name' => 'Ouest',
                'country_id' => 95,
            ),
            113 => 
            array (
                'id' => 1614,
                'name' => 'Sud',
                'country_id' => 95,
            ),
            114 => 
            array (
                'id' => 1615,
                'name' => 'Sud-Est',
                'country_id' => 95,
            ),
            115 => 
            array (
                'id' => 1616,
                'name' => 'Heard and McDonald Islands',
                'country_id' => 96,
            ),
            116 => 
            array (
                'id' => 1617,
                'name' => 'Atlantida',
                'country_id' => 97,
            ),
            117 => 
            array (
                'id' => 1618,
                'name' => 'Choluteca',
                'country_id' => 97,
            ),
            118 => 
            array (
                'id' => 1619,
                'name' => 'Colon',
                'country_id' => 97,
            ),
            119 => 
            array (
                'id' => 1620,
                'name' => 'Comayagua',
                'country_id' => 97,
            ),
            120 => 
            array (
                'id' => 1621,
                'name' => 'Copan',
                'country_id' => 97,
            ),
            121 => 
            array (
                'id' => 1622,
                'name' => 'Cortes',
                'country_id' => 97,
            ),
            122 => 
            array (
                'id' => 1623,
                'name' => 'Distrito Central',
                'country_id' => 97,
            ),
            123 => 
            array (
                'id' => 1624,
                'name' => 'El Paraiso',
                'country_id' => 97,
            ),
            124 => 
            array (
                'id' => 1625,
                'name' => 'Francisco Morazan',
                'country_id' => 97,
            ),
            125 => 
            array (
                'id' => 1626,
                'name' => 'Gracias a Dios',
                'country_id' => 97,
            ),
            126 => 
            array (
                'id' => 1627,
                'name' => 'Intibuca',
                'country_id' => 97,
            ),
            127 => 
            array (
                'id' => 1628,
                'name' => 'Islas de la Bahia',
                'country_id' => 97,
            ),
            128 => 
            array (
                'id' => 1629,
                'name' => 'La Paz',
                'country_id' => 97,
            ),
            129 => 
            array (
                'id' => 1630,
                'name' => 'Lempira',
                'country_id' => 97,
            ),
            130 => 
            array (
                'id' => 1631,
                'name' => 'Ocotepeque',
                'country_id' => 97,
            ),
            131 => 
            array (
                'id' => 1632,
                'name' => 'Olancho',
                'country_id' => 97,
            ),
            132 => 
            array (
                'id' => 1633,
                'name' => 'Santa Barbara',
                'country_id' => 97,
            ),
            133 => 
            array (
                'id' => 1634,
                'name' => 'Valle',
                'country_id' => 97,
            ),
            134 => 
            array (
                'id' => 1635,
                'name' => 'Yoro',
                'country_id' => 97,
            ),
            135 => 
            array (
                'id' => 1636,
                'name' => 'Hong Kong',
                'country_id' => 98,
            ),
            136 => 
            array (
                'id' => 1637,
                'name' => 'Bacs-Kiskun',
                'country_id' => 99,
            ),
            137 => 
            array (
                'id' => 1638,
                'name' => 'Baranya',
                'country_id' => 99,
            ),
            138 => 
            array (
                'id' => 1639,
                'name' => 'Bekes',
                'country_id' => 99,
            ),
            139 => 
            array (
                'id' => 1640,
                'name' => 'Borsod-Abauj-Zemplen',
                'country_id' => 99,
            ),
            140 => 
            array (
                'id' => 1641,
                'name' => 'Budapest',
                'country_id' => 99,
            ),
            141 => 
            array (
                'id' => 1642,
                'name' => 'Csongrad',
                'country_id' => 99,
            ),
            142 => 
            array (
                'id' => 1643,
                'name' => 'Fejer',
                'country_id' => 99,
            ),
            143 => 
            array (
                'id' => 1644,
                'name' => 'Gyor-Moson-Sopron',
                'country_id' => 99,
            ),
            144 => 
            array (
                'id' => 1645,
                'name' => 'Hajdu-Bihar',
                'country_id' => 99,
            ),
            145 => 
            array (
                'id' => 1646,
                'name' => 'Heves',
                'country_id' => 99,
            ),
            146 => 
            array (
                'id' => 1647,
                'name' => 'Jasz-Nagykun-Szolnok',
                'country_id' => 99,
            ),
            147 => 
            array (
                'id' => 1648,
                'name' => 'Komarom-Esztergom',
                'country_id' => 99,
            ),
            148 => 
            array (
                'id' => 1649,
                'name' => 'Nograd',
                'country_id' => 99,
            ),
            149 => 
            array (
                'id' => 1650,
                'name' => 'Pest',
                'country_id' => 99,
            ),
            150 => 
            array (
                'id' => 1651,
                'name' => 'Somogy',
                'country_id' => 99,
            ),
            151 => 
            array (
                'id' => 1652,
                'name' => 'Szabolcs-Szatmar-Bereg',
                'country_id' => 99,
            ),
            152 => 
            array (
                'id' => 1653,
                'name' => 'Tolna',
                'country_id' => 99,
            ),
            153 => 
            array (
                'id' => 1654,
                'name' => 'Vas',
                'country_id' => 99,
            ),
            154 => 
            array (
                'id' => 1655,
                'name' => 'Veszprem',
                'country_id' => 99,
            ),
            155 => 
            array (
                'id' => 1656,
                'name' => 'Zala',
                'country_id' => 99,
            ),
            156 => 
            array (
                'id' => 1657,
                'name' => 'Austurland',
                'country_id' => 100,
            ),
            157 => 
            array (
                'id' => 1658,
                'name' => 'Gullbringusysla',
                'country_id' => 100,
            ),
            158 => 
            array (
                'id' => 1659,
                'name' => 'Hofu borgarsva i',
                'country_id' => 100,
            ),
            159 => 
            array (
                'id' => 1660,
                'name' => 'Nor urland eystra',
                'country_id' => 100,
            ),
            160 => 
            array (
                'id' => 1661,
                'name' => 'Nor urland vestra',
                'country_id' => 100,
            ),
            161 => 
            array (
                'id' => 1662,
                'name' => 'Su urland',
                'country_id' => 100,
            ),
            162 => 
            array (
                'id' => 1663,
                'name' => 'Su urnes',
                'country_id' => 100,
            ),
            163 => 
            array (
                'id' => 1664,
                'name' => 'Vestfir ir',
                'country_id' => 100,
            ),
            164 => 
            array (
                'id' => 1665,
                'name' => 'Vesturland',
                'country_id' => 100,
            ),
            165 => 
            array (
                'id' => 1666,
                'name' => 'Aceh',
                'country_id' => 102,
            ),
            166 => 
            array (
                'id' => 1667,
                'name' => 'Bali',
                'country_id' => 102,
            ),
            167 => 
            array (
                'id' => 1668,
                'name' => 'Bangka-Belitung',
                'country_id' => 102,
            ),
            168 => 
            array (
                'id' => 1669,
                'name' => 'Banten',
                'country_id' => 102,
            ),
            169 => 
            array (
                'id' => 1670,
                'name' => 'Bengkulu',
                'country_id' => 102,
            ),
            170 => 
            array (
                'id' => 1671,
                'name' => 'Gandaria',
                'country_id' => 102,
            ),
            171 => 
            array (
                'id' => 1672,
                'name' => 'Gorontalo',
                'country_id' => 102,
            ),
            172 => 
            array (
                'id' => 1673,
                'name' => 'Jakarta',
                'country_id' => 102,
            ),
            173 => 
            array (
                'id' => 1674,
                'name' => 'Jambi',
                'country_id' => 102,
            ),
            174 => 
            array (
                'id' => 1675,
                'name' => 'Jawa Barat',
                'country_id' => 102,
            ),
            175 => 
            array (
                'id' => 1676,
                'name' => 'Jawa Tengah',
                'country_id' => 102,
            ),
            176 => 
            array (
                'id' => 1677,
                'name' => 'Jawa Timur',
                'country_id' => 102,
            ),
            177 => 
            array (
                'id' => 1678,
                'name' => 'Kalimantan Barat',
                'country_id' => 102,
            ),
            178 => 
            array (
                'id' => 1679,
                'name' => 'Kalimantan Selatan',
                'country_id' => 102,
            ),
            179 => 
            array (
                'id' => 1680,
                'name' => 'Kalimantan Tengah',
                'country_id' => 102,
            ),
            180 => 
            array (
                'id' => 1681,
                'name' => 'Kalimantan Timur',
                'country_id' => 102,
            ),
            181 => 
            array (
                'id' => 1682,
                'name' => 'Kendal',
                'country_id' => 102,
            ),
            182 => 
            array (
                'id' => 1683,
                'name' => 'Lampung',
                'country_id' => 102,
            ),
            183 => 
            array (
                'id' => 1684,
                'name' => 'Maluku',
                'country_id' => 102,
            ),
            184 => 
            array (
                'id' => 1685,
                'name' => 'Maluku Utara',
                'country_id' => 102,
            ),
            185 => 
            array (
                'id' => 1686,
                'name' => 'Nusa Tenggara Barat',
                'country_id' => 102,
            ),
            186 => 
            array (
                'id' => 1687,
                'name' => 'Nusa Tenggara Timur',
                'country_id' => 102,
            ),
            187 => 
            array (
                'id' => 1688,
                'name' => 'Papua',
                'country_id' => 102,
            ),
            188 => 
            array (
                'id' => 1689,
                'name' => 'Riau',
                'country_id' => 102,
            ),
            189 => 
            array (
                'id' => 1690,
                'name' => 'Riau Kepulauan',
                'country_id' => 102,
            ),
            190 => 
            array (
                'id' => 1691,
                'name' => 'Solo',
                'country_id' => 102,
            ),
            191 => 
            array (
                'id' => 1692,
                'name' => 'Sulawesi Selatan',
                'country_id' => 102,
            ),
            192 => 
            array (
                'id' => 1693,
                'name' => 'Sulawesi Tengah',
                'country_id' => 102,
            ),
            193 => 
            array (
                'id' => 1694,
                'name' => 'Sulawesi Tenggara',
                'country_id' => 102,
            ),
            194 => 
            array (
                'id' => 1695,
                'name' => 'Sulawesi Utara',
                'country_id' => 102,
            ),
            195 => 
            array (
                'id' => 1696,
                'name' => 'Sumatera Barat',
                'country_id' => 102,
            ),
            196 => 
            array (
                'id' => 1697,
                'name' => 'Sumatera Selatan',
                'country_id' => 102,
            ),
            197 => 
            array (
                'id' => 1698,
                'name' => 'Sumatera Utara',
                'country_id' => 102,
            ),
            198 => 
            array (
                'id' => 1699,
                'name' => 'Yogyakarta',
                'country_id' => 102,
            ),
            199 => 
            array (
                'id' => 1700,
                'name' => 'Ardabil',
                'country_id' => 103,
            ),
            200 => 
            array (
                'id' => 1701,
                'name' => 'Azarbayjan-e Bakhtari',
                'country_id' => 103,
            ),
            201 => 
            array (
                'id' => 1702,
                'name' => 'Azarbayjan-e Khavari',
                'country_id' => 103,
            ),
            202 => 
            array (
                'id' => 1703,
                'name' => 'Bushehr',
                'country_id' => 103,
            ),
            203 => 
            array (
                'id' => 1704,
                'name' => 'Chahar Mahal-e Bakhtiari',
                'country_id' => 103,
            ),
            204 => 
            array (
                'id' => 1705,
                'name' => 'Esfahan',
                'country_id' => 103,
            ),
            205 => 
            array (
                'id' => 1706,
                'name' => 'Fars',
                'country_id' => 103,
            ),
            206 => 
            array (
                'id' => 1707,
                'name' => 'Gilan',
                'country_id' => 103,
            ),
            207 => 
            array (
                'id' => 1708,
                'name' => 'Golestan',
                'country_id' => 103,
            ),
            208 => 
            array (
                'id' => 1709,
                'name' => 'Hamadan',
                'country_id' => 103,
            ),
            209 => 
            array (
                'id' => 1710,
                'name' => 'Hormozgan',
                'country_id' => 103,
            ),
            210 => 
            array (
                'id' => 1711,
                'name' => 'Ilam',
                'country_id' => 103,
            ),
            211 => 
            array (
                'id' => 1712,
                'name' => 'Kerman',
                'country_id' => 103,
            ),
            212 => 
            array (
                'id' => 1713,
                'name' => 'Kermanshah',
                'country_id' => 103,
            ),
            213 => 
            array (
                'id' => 1714,
                'name' => 'Khorasan',
                'country_id' => 103,
            ),
            214 => 
            array (
                'id' => 1715,
                'name' => 'Khuzestan',
                'country_id' => 103,
            ),
            215 => 
            array (
                'id' => 1716,
                'name' => 'Kohgiluyeh-e Boyerahmad',
                'country_id' => 103,
            ),
            216 => 
            array (
                'id' => 1717,
                'name' => 'Kordestan',
                'country_id' => 103,
            ),
            217 => 
            array (
                'id' => 1718,
                'name' => 'Lorestan',
                'country_id' => 103,
            ),
            218 => 
            array (
                'id' => 1719,
                'name' => 'Markazi',
                'country_id' => 103,
            ),
            219 => 
            array (
                'id' => 1720,
                'name' => 'Mazandaran',
                'country_id' => 103,
            ),
            220 => 
            array (
                'id' => 1721,
                'name' => 'Ostan-e Esfahan',
                'country_id' => 103,
            ),
            221 => 
            array (
                'id' => 1722,
                'name' => 'Qazvin',
                'country_id' => 103,
            ),
            222 => 
            array (
                'id' => 1723,
                'name' => 'Qom',
                'country_id' => 103,
            ),
            223 => 
            array (
                'id' => 1724,
                'name' => 'Semnan',
                'country_id' => 103,
            ),
            224 => 
            array (
                'id' => 1725,
                'name' => 'Sistan-e Baluchestan',
                'country_id' => 103,
            ),
            225 => 
            array (
                'id' => 1726,
                'name' => 'Tehran',
                'country_id' => 103,
            ),
            226 => 
            array (
                'id' => 1727,
                'name' => 'Yazd',
                'country_id' => 103,
            ),
            227 => 
            array (
                'id' => 1728,
                'name' => 'Zanjan',
                'country_id' => 103,
            ),
            228 => 
            array (
                'id' => 1729,
                'name' => 'Babil',
                'country_id' => 104,
            ),
            229 => 
            array (
                'id' => 1730,
                'name' => 'Baghdad',
                'country_id' => 104,
            ),
            230 => 
            array (
                'id' => 1731,
                'name' => 'Dahuk',
                'country_id' => 104,
            ),
            231 => 
            array (
                'id' => 1732,
                'name' => 'Dhi Qar',
                'country_id' => 104,
            ),
            232 => 
            array (
                'id' => 1733,
                'name' => 'Diyala',
                'country_id' => 104,
            ),
            233 => 
            array (
                'id' => 1734,
                'name' => 'Erbil',
                'country_id' => 104,
            ),
            234 => 
            array (
                'id' => 1735,
                'name' => 'Irbil',
                'country_id' => 104,
            ),
            235 => 
            array (
                'id' => 1736,
                'name' => 'Karbala',
                'country_id' => 104,
            ),
            236 => 
            array (
                'id' => 1737,
                'name' => 'Kurdistan',
                'country_id' => 104,
            ),
            237 => 
            array (
                'id' => 1738,
                'name' => 'Maysan',
                'country_id' => 104,
            ),
            238 => 
            array (
                'id' => 1739,
                'name' => 'Ninawa',
                'country_id' => 104,
            ),
            239 => 
            array (
                'id' => 1740,
                'name' => 'Salah-ad-Din',
                'country_id' => 104,
            ),
            240 => 
            array (
                'id' => 1741,
                'name' => 'Wasit',
                'country_id' => 104,
            ),
            241 => 
            array (
                'id' => 1742,
                'name' => 'al-Anbar',
                'country_id' => 104,
            ),
            242 => 
            array (
                'id' => 1743,
                'name' => 'al-Basrah',
                'country_id' => 104,
            ),
            243 => 
            array (
                'id' => 1744,
                'name' => 'al-Muthanna',
                'country_id' => 104,
            ),
            244 => 
            array (
                'id' => 1745,
                'name' => 'al-Qadisiyah',
                'country_id' => 104,
            ),
            245 => 
            array (
                'id' => 1746,
                'name' => 'an-Najaf',
                'country_id' => 104,
            ),
            246 => 
            array (
                'id' => 1747,
                'name' => 'as-Sulaymaniyah',
                'country_id' => 104,
            ),
            247 => 
            array (
                'id' => 1748,
                'name' => 'at-Ta\'mim',
                'country_id' => 104,
            ),
            248 => 
            array (
                'id' => 1749,
                'name' => 'Armagh',
                'country_id' => 105,
            ),
            249 => 
            array (
                'id' => 1750,
                'name' => 'Carlow',
                'country_id' => 105,
            ),
            250 => 
            array (
                'id' => 1751,
                'name' => 'Cavan',
                'country_id' => 105,
            ),
            251 => 
            array (
                'id' => 1752,
                'name' => 'Clare',
                'country_id' => 105,
            ),
            252 => 
            array (
                'id' => 1753,
                'name' => 'Cork',
                'country_id' => 105,
            ),
            253 => 
            array (
                'id' => 1754,
                'name' => 'Donegal',
                'country_id' => 105,
            ),
            254 => 
            array (
                'id' => 1755,
                'name' => 'Dublin',
                'country_id' => 105,
            ),
            255 => 
            array (
                'id' => 1756,
                'name' => 'Galway',
                'country_id' => 105,
            ),
            256 => 
            array (
                'id' => 1757,
                'name' => 'Kerry',
                'country_id' => 105,
            ),
            257 => 
            array (
                'id' => 1758,
                'name' => 'Kildare',
                'country_id' => 105,
            ),
            258 => 
            array (
                'id' => 1759,
                'name' => 'Kilkenny',
                'country_id' => 105,
            ),
            259 => 
            array (
                'id' => 1760,
                'name' => 'Laois',
                'country_id' => 105,
            ),
            260 => 
            array (
                'id' => 1761,
                'name' => 'Leinster',
                'country_id' => 105,
            ),
            261 => 
            array (
                'id' => 1762,
                'name' => 'Leitrim',
                'country_id' => 105,
            ),
            262 => 
            array (
                'id' => 1763,
                'name' => 'Limerick',
                'country_id' => 105,
            ),
            263 => 
            array (
                'id' => 1764,
                'name' => 'Loch Garman',
                'country_id' => 105,
            ),
            264 => 
            array (
                'id' => 1765,
                'name' => 'Longford',
                'country_id' => 105,
            ),
            265 => 
            array (
                'id' => 1766,
                'name' => 'Louth',
                'country_id' => 105,
            ),
            266 => 
            array (
                'id' => 1767,
                'name' => 'Mayo',
                'country_id' => 105,
            ),
            267 => 
            array (
                'id' => 1768,
                'name' => 'Meath',
                'country_id' => 105,
            ),
            268 => 
            array (
                'id' => 1769,
                'name' => 'Monaghan',
                'country_id' => 105,
            ),
            269 => 
            array (
                'id' => 1770,
                'name' => 'Offaly',
                'country_id' => 105,
            ),
            270 => 
            array (
                'id' => 1771,
                'name' => 'Roscommon',
                'country_id' => 105,
            ),
            271 => 
            array (
                'id' => 1772,
                'name' => 'Sligo',
                'country_id' => 105,
            ),
            272 => 
            array (
                'id' => 1773,
                'name' => 'Tipperary North Riding',
                'country_id' => 105,
            ),
            273 => 
            array (
                'id' => 1774,
                'name' => 'Tipperary South Riding',
                'country_id' => 105,
            ),
            274 => 
            array (
                'id' => 1775,
                'name' => 'Ulster',
                'country_id' => 105,
            ),
            275 => 
            array (
                'id' => 1776,
                'name' => 'Waterford',
                'country_id' => 105,
            ),
            276 => 
            array (
                'id' => 1777,
                'name' => 'Westmeath',
                'country_id' => 105,
            ),
            277 => 
            array (
                'id' => 1778,
                'name' => 'Wexford',
                'country_id' => 105,
            ),
            278 => 
            array (
                'id' => 1779,
                'name' => 'Wicklow',
                'country_id' => 105,
            ),
            279 => 
            array (
                'id' => 1780,
                'name' => 'Beit Hanania',
                'country_id' => 106,
            ),
            280 => 
            array (
                'id' => 1781,
                'name' => 'Ben Gurion Airport',
                'country_id' => 106,
            ),
            281 => 
            array (
                'id' => 1782,
                'name' => 'Bethlehem',
                'country_id' => 106,
            ),
            282 => 
            array (
                'id' => 1783,
                'name' => 'Caesarea',
                'country_id' => 106,
            ),
            283 => 
            array (
                'id' => 1784,
                'name' => 'Centre',
                'country_id' => 106,
            ),
            284 => 
            array (
                'id' => 1785,
                'name' => 'Gaza',
                'country_id' => 106,
            ),
            285 => 
            array (
                'id' => 1786,
                'name' => 'Hadaron',
                'country_id' => 106,
            ),
            286 => 
            array (
                'id' => 1787,
                'name' => 'Haifa District',
                'country_id' => 106,
            ),
            287 => 
            array (
                'id' => 1788,
                'name' => 'Hamerkaz',
                'country_id' => 106,
            ),
            288 => 
            array (
                'id' => 1789,
                'name' => 'Hazafon',
                'country_id' => 106,
            ),
            289 => 
            array (
                'id' => 1790,
                'name' => 'Hebron',
                'country_id' => 106,
            ),
            290 => 
            array (
                'id' => 1791,
                'name' => 'Jaffa',
                'country_id' => 106,
            ),
            291 => 
            array (
                'id' => 1792,
                'name' => 'Jerusalem',
                'country_id' => 106,
            ),
            292 => 
            array (
                'id' => 1793,
                'name' => 'Khefa',
                'country_id' => 106,
            ),
            293 => 
            array (
                'id' => 1794,
                'name' => 'Kiryat Yam',
                'country_id' => 106,
            ),
            294 => 
            array (
                'id' => 1795,
                'name' => 'Lower Galilee',
                'country_id' => 106,
            ),
            295 => 
            array (
                'id' => 1796,
                'name' => 'Qalqilya',
                'country_id' => 106,
            ),
            296 => 
            array (
                'id' => 1797,
                'name' => 'Talme Elazar',
                'country_id' => 106,
            ),
            297 => 
            array (
                'id' => 1798,
                'name' => 'Tel Aviv',
                'country_id' => 106,
            ),
            298 => 
            array (
                'id' => 1799,
                'name' => 'Tsafon',
                'country_id' => 106,
            ),
            299 => 
            array (
                'id' => 1800,
                'name' => 'Umm El Fahem',
                'country_id' => 106,
            ),
            300 => 
            array (
                'id' => 1801,
                'name' => 'Yerushalayim',
                'country_id' => 106,
            ),
            301 => 
            array (
                'id' => 1802,
                'name' => 'Abruzzi',
                'country_id' => 107,
            ),
            302 => 
            array (
                'id' => 1803,
                'name' => 'Abruzzo',
                'country_id' => 107,
            ),
            303 => 
            array (
                'id' => 1804,
                'name' => 'Agrigento',
                'country_id' => 107,
            ),
            304 => 
            array (
                'id' => 1805,
                'name' => 'Alessandria',
                'country_id' => 107,
            ),
            305 => 
            array (
                'id' => 1806,
                'name' => 'Ancona',
                'country_id' => 107,
            ),
            306 => 
            array (
                'id' => 1807,
                'name' => 'Arezzo',
                'country_id' => 107,
            ),
            307 => 
            array (
                'id' => 1808,
                'name' => 'Ascoli Piceno',
                'country_id' => 107,
            ),
            308 => 
            array (
                'id' => 1809,
                'name' => 'Asti',
                'country_id' => 107,
            ),
            309 => 
            array (
                'id' => 1810,
                'name' => 'Avellino',
                'country_id' => 107,
            ),
            310 => 
            array (
                'id' => 1811,
                'name' => 'Bari',
                'country_id' => 107,
            ),
            311 => 
            array (
                'id' => 1812,
                'name' => 'Basilicata',
                'country_id' => 107,
            ),
            312 => 
            array (
                'id' => 1813,
                'name' => 'Belluno',
                'country_id' => 107,
            ),
            313 => 
            array (
                'id' => 1814,
                'name' => 'Benevento',
                'country_id' => 107,
            ),
            314 => 
            array (
                'id' => 1815,
                'name' => 'Bergamo',
                'country_id' => 107,
            ),
            315 => 
            array (
                'id' => 1816,
                'name' => 'Biella',
                'country_id' => 107,
            ),
            316 => 
            array (
                'id' => 1817,
                'name' => 'Bologna',
                'country_id' => 107,
            ),
            317 => 
            array (
                'id' => 1818,
                'name' => 'Bolzano',
                'country_id' => 107,
            ),
            318 => 
            array (
                'id' => 1819,
                'name' => 'Brescia',
                'country_id' => 107,
            ),
            319 => 
            array (
                'id' => 1820,
                'name' => 'Brindisi',
                'country_id' => 107,
            ),
            320 => 
            array (
                'id' => 1821,
                'name' => 'Calabria',
                'country_id' => 107,
            ),
            321 => 
            array (
                'id' => 1822,
                'name' => 'Campania',
                'country_id' => 107,
            ),
            322 => 
            array (
                'id' => 1823,
                'name' => 'Cartoceto',
                'country_id' => 107,
            ),
            323 => 
            array (
                'id' => 1824,
                'name' => 'Caserta',
                'country_id' => 107,
            ),
            324 => 
            array (
                'id' => 1825,
                'name' => 'Catania',
                'country_id' => 107,
            ),
            325 => 
            array (
                'id' => 1826,
                'name' => 'Chieti',
                'country_id' => 107,
            ),
            326 => 
            array (
                'id' => 1827,
                'name' => 'Como',
                'country_id' => 107,
            ),
            327 => 
            array (
                'id' => 1828,
                'name' => 'Cosenza',
                'country_id' => 107,
            ),
            328 => 
            array (
                'id' => 1829,
                'name' => 'Cremona',
                'country_id' => 107,
            ),
            329 => 
            array (
                'id' => 1830,
                'name' => 'Cuneo',
                'country_id' => 107,
            ),
            330 => 
            array (
                'id' => 1831,
                'name' => 'Emilia-Romagna',
                'country_id' => 107,
            ),
            331 => 
            array (
                'id' => 1832,
                'name' => 'Ferrara',
                'country_id' => 107,
            ),
            332 => 
            array (
                'id' => 1833,
                'name' => 'Firenze',
                'country_id' => 107,
            ),
            333 => 
            array (
                'id' => 1834,
                'name' => 'Florence',
                'country_id' => 107,
            ),
            334 => 
            array (
                'id' => 1835,
                'name' => 'Forli-Cesena ',
                'country_id' => 107,
            ),
            335 => 
            array (
                'id' => 1836,
                'name' => 'Friuli-Venezia Giulia',
                'country_id' => 107,
            ),
            336 => 
            array (
                'id' => 1837,
                'name' => 'Frosinone',
                'country_id' => 107,
            ),
            337 => 
            array (
                'id' => 1838,
                'name' => 'Genoa',
                'country_id' => 107,
            ),
            338 => 
            array (
                'id' => 1839,
                'name' => 'Gorizia',
                'country_id' => 107,
            ),
            339 => 
            array (
                'id' => 1840,
                'name' => 'L\'Aquila',
                'country_id' => 107,
            ),
            340 => 
            array (
                'id' => 1841,
                'name' => 'Lazio',
                'country_id' => 107,
            ),
            341 => 
            array (
                'id' => 1842,
                'name' => 'Lecce',
                'country_id' => 107,
            ),
            342 => 
            array (
                'id' => 1843,
                'name' => 'Lecco',
                'country_id' => 107,
            ),
            343 => 
            array (
                'id' => 1844,
                'name' => 'Lecco Province',
                'country_id' => 107,
            ),
            344 => 
            array (
                'id' => 1845,
                'name' => 'Liguria',
                'country_id' => 107,
            ),
            345 => 
            array (
                'id' => 1846,
                'name' => 'Lodi',
                'country_id' => 107,
            ),
            346 => 
            array (
                'id' => 1847,
                'name' => 'Lombardia',
                'country_id' => 107,
            ),
            347 => 
            array (
                'id' => 1848,
                'name' => 'Lombardy',
                'country_id' => 107,
            ),
            348 => 
            array (
                'id' => 1849,
                'name' => 'Macerata',
                'country_id' => 107,
            ),
            349 => 
            array (
                'id' => 1850,
                'name' => 'Mantova',
                'country_id' => 107,
            ),
            350 => 
            array (
                'id' => 1851,
                'name' => 'Marche',
                'country_id' => 107,
            ),
            351 => 
            array (
                'id' => 1852,
                'name' => 'Messina',
                'country_id' => 107,
            ),
            352 => 
            array (
                'id' => 1853,
                'name' => 'Milan',
                'country_id' => 107,
            ),
            353 => 
            array (
                'id' => 1854,
                'name' => 'Modena',
                'country_id' => 107,
            ),
            354 => 
            array (
                'id' => 1855,
                'name' => 'Molise',
                'country_id' => 107,
            ),
            355 => 
            array (
                'id' => 1856,
                'name' => 'Molteno',
                'country_id' => 107,
            ),
            356 => 
            array (
                'id' => 1857,
                'name' => 'Montenegro',
                'country_id' => 107,
            ),
            357 => 
            array (
                'id' => 1858,
                'name' => 'Monza and Brianza',
                'country_id' => 107,
            ),
            358 => 
            array (
                'id' => 1859,
                'name' => 'Naples',
                'country_id' => 107,
            ),
            359 => 
            array (
                'id' => 1860,
                'name' => 'Novara',
                'country_id' => 107,
            ),
            360 => 
            array (
                'id' => 1861,
                'name' => 'Padova',
                'country_id' => 107,
            ),
            361 => 
            array (
                'id' => 1862,
                'name' => 'Parma',
                'country_id' => 107,
            ),
            362 => 
            array (
                'id' => 1863,
                'name' => 'Pavia',
                'country_id' => 107,
            ),
            363 => 
            array (
                'id' => 1864,
                'name' => 'Perugia',
                'country_id' => 107,
            ),
            364 => 
            array (
                'id' => 1865,
                'name' => 'Pesaro-Urbino',
                'country_id' => 107,
            ),
            365 => 
            array (
                'id' => 1866,
                'name' => 'Piacenza',
                'country_id' => 107,
            ),
            366 => 
            array (
                'id' => 1867,
                'name' => 'Piedmont',
                'country_id' => 107,
            ),
            367 => 
            array (
                'id' => 1868,
                'name' => 'Piemonte',
                'country_id' => 107,
            ),
            368 => 
            array (
                'id' => 1869,
                'name' => 'Pisa',
                'country_id' => 107,
            ),
            369 => 
            array (
                'id' => 1870,
                'name' => 'Pordenone',
                'country_id' => 107,
            ),
            370 => 
            array (
                'id' => 1871,
                'name' => 'Potenza',
                'country_id' => 107,
            ),
            371 => 
            array (
                'id' => 1872,
                'name' => 'Puglia',
                'country_id' => 107,
            ),
            372 => 
            array (
                'id' => 1873,
                'name' => 'Reggio Emilia',
                'country_id' => 107,
            ),
            373 => 
            array (
                'id' => 1874,
                'name' => 'Rimini',
                'country_id' => 107,
            ),
            374 => 
            array (
                'id' => 1875,
                'name' => 'Roma',
                'country_id' => 107,
            ),
            375 => 
            array (
                'id' => 1876,
                'name' => 'Salerno',
                'country_id' => 107,
            ),
            376 => 
            array (
                'id' => 1877,
                'name' => 'Sardegna',
                'country_id' => 107,
            ),
            377 => 
            array (
                'id' => 1878,
                'name' => 'Sassari',
                'country_id' => 107,
            ),
            378 => 
            array (
                'id' => 1879,
                'name' => 'Savona',
                'country_id' => 107,
            ),
            379 => 
            array (
                'id' => 1880,
                'name' => 'Sicilia',
                'country_id' => 107,
            ),
            380 => 
            array (
                'id' => 1881,
                'name' => 'Siena',
                'country_id' => 107,
            ),
            381 => 
            array (
                'id' => 1882,
                'name' => 'Sondrio',
                'country_id' => 107,
            ),
            382 => 
            array (
                'id' => 1883,
                'name' => 'South Tyrol',
                'country_id' => 107,
            ),
            383 => 
            array (
                'id' => 1884,
                'name' => 'Taranto',
                'country_id' => 107,
            ),
            384 => 
            array (
                'id' => 1885,
                'name' => 'Teramo',
                'country_id' => 107,
            ),
            385 => 
            array (
                'id' => 1886,
                'name' => 'Torino',
                'country_id' => 107,
            ),
            386 => 
            array (
                'id' => 1887,
                'name' => 'Toscana',
                'country_id' => 107,
            ),
            387 => 
            array (
                'id' => 1888,
                'name' => 'Trapani',
                'country_id' => 107,
            ),
            388 => 
            array (
                'id' => 1889,
                'name' => 'Trentino-Alto Adige',
                'country_id' => 107,
            ),
            389 => 
            array (
                'id' => 1890,
                'name' => 'Trento',
                'country_id' => 107,
            ),
            390 => 
            array (
                'id' => 1891,
                'name' => 'Treviso',
                'country_id' => 107,
            ),
            391 => 
            array (
                'id' => 1892,
                'name' => 'Udine',
                'country_id' => 107,
            ),
            392 => 
            array (
                'id' => 1893,
                'name' => 'Umbria',
                'country_id' => 107,
            ),
            393 => 
            array (
                'id' => 1894,
                'name' => 'Valle d\'Aosta',
                'country_id' => 107,
            ),
            394 => 
            array (
                'id' => 1895,
                'name' => 'Varese',
                'country_id' => 107,
            ),
            395 => 
            array (
                'id' => 1896,
                'name' => 'Veneto',
                'country_id' => 107,
            ),
            396 => 
            array (
                'id' => 1897,
                'name' => 'Venezia',
                'country_id' => 107,
            ),
            397 => 
            array (
                'id' => 1898,
                'name' => 'Verbano-Cusio-Ossola',
                'country_id' => 107,
            ),
            398 => 
            array (
                'id' => 1899,
                'name' => 'Vercelli',
                'country_id' => 107,
            ),
            399 => 
            array (
                'id' => 1900,
                'name' => 'Verona',
                'country_id' => 107,
            ),
            400 => 
            array (
                'id' => 1901,
                'name' => 'Vicenza',
                'country_id' => 107,
            ),
            401 => 
            array (
                'id' => 1902,
                'name' => 'Viterbo',
                'country_id' => 107,
            ),
            402 => 
            array (
                'id' => 1903,
                'name' => 'Buxoro Viloyati',
                'country_id' => 108,
            ),
            403 => 
            array (
                'id' => 1904,
                'name' => 'Clarendon',
                'country_id' => 108,
            ),
            404 => 
            array (
                'id' => 1905,
                'name' => 'Hanover',
                'country_id' => 108,
            ),
            405 => 
            array (
                'id' => 1906,
                'name' => 'Kingston',
                'country_id' => 108,
            ),
            406 => 
            array (
                'id' => 1907,
                'name' => 'Manchester',
                'country_id' => 108,
            ),
            407 => 
            array (
                'id' => 1908,
                'name' => 'Portland',
                'country_id' => 108,
            ),
            408 => 
            array (
                'id' => 1909,
                'name' => 'Saint Andrews',
                'country_id' => 108,
            ),
            409 => 
            array (
                'id' => 1910,
                'name' => 'Saint Ann',
                'country_id' => 108,
            ),
            410 => 
            array (
                'id' => 1911,
                'name' => 'Saint Catherine',
                'country_id' => 108,
            ),
            411 => 
            array (
                'id' => 1912,
                'name' => 'Saint Elizabeth',
                'country_id' => 108,
            ),
            412 => 
            array (
                'id' => 1913,
                'name' => 'Saint James',
                'country_id' => 108,
            ),
            413 => 
            array (
                'id' => 1914,
                'name' => 'Saint Mary',
                'country_id' => 108,
            ),
            414 => 
            array (
                'id' => 1915,
                'name' => 'Saint Thomas',
                'country_id' => 108,
            ),
            415 => 
            array (
                'id' => 1916,
                'name' => 'Trelawney',
                'country_id' => 108,
            ),
            416 => 
            array (
                'id' => 1917,
                'name' => 'Westmoreland',
                'country_id' => 108,
            ),
            417 => 
            array (
                'id' => 1918,
                'name' => 'Aichi',
                'country_id' => 109,
            ),
            418 => 
            array (
                'id' => 1919,
                'name' => 'Akita',
                'country_id' => 109,
            ),
            419 => 
            array (
                'id' => 1920,
                'name' => 'Aomori',
                'country_id' => 109,
            ),
            420 => 
            array (
                'id' => 1921,
                'name' => 'Chiba',
                'country_id' => 109,
            ),
            421 => 
            array (
                'id' => 1922,
                'name' => 'Ehime',
                'country_id' => 109,
            ),
            422 => 
            array (
                'id' => 1923,
                'name' => 'Fukui',
                'country_id' => 109,
            ),
            423 => 
            array (
                'id' => 1924,
                'name' => 'Fukuoka',
                'country_id' => 109,
            ),
            424 => 
            array (
                'id' => 1925,
                'name' => 'Fukushima',
                'country_id' => 109,
            ),
            425 => 
            array (
                'id' => 1926,
                'name' => 'Gifu',
                'country_id' => 109,
            ),
            426 => 
            array (
                'id' => 1927,
                'name' => 'Gumma',
                'country_id' => 109,
            ),
            427 => 
            array (
                'id' => 1928,
                'name' => 'Hiroshima',
                'country_id' => 109,
            ),
            428 => 
            array (
                'id' => 1929,
                'name' => 'Hokkaido',
                'country_id' => 109,
            ),
            429 => 
            array (
                'id' => 1930,
                'name' => 'Hyogo',
                'country_id' => 109,
            ),
            430 => 
            array (
                'id' => 1931,
                'name' => 'Ibaraki',
                'country_id' => 109,
            ),
            431 => 
            array (
                'id' => 1932,
                'name' => 'Ishikawa',
                'country_id' => 109,
            ),
            432 => 
            array (
                'id' => 1933,
                'name' => 'Iwate',
                'country_id' => 109,
            ),
            433 => 
            array (
                'id' => 1934,
                'name' => 'Kagawa',
                'country_id' => 109,
            ),
            434 => 
            array (
                'id' => 1935,
                'name' => 'Kagoshima',
                'country_id' => 109,
            ),
            435 => 
            array (
                'id' => 1936,
                'name' => 'Kanagawa',
                'country_id' => 109,
            ),
            436 => 
            array (
                'id' => 1937,
                'name' => 'Kanto',
                'country_id' => 109,
            ),
            437 => 
            array (
                'id' => 1938,
                'name' => 'Kochi',
                'country_id' => 109,
            ),
            438 => 
            array (
                'id' => 1939,
                'name' => 'Kumamoto',
                'country_id' => 109,
            ),
            439 => 
            array (
                'id' => 1940,
                'name' => 'Kyoto',
                'country_id' => 109,
            ),
            440 => 
            array (
                'id' => 1941,
                'name' => 'Mie',
                'country_id' => 109,
            ),
            441 => 
            array (
                'id' => 1942,
                'name' => 'Miyagi',
                'country_id' => 109,
            ),
            442 => 
            array (
                'id' => 1943,
                'name' => 'Miyazaki',
                'country_id' => 109,
            ),
            443 => 
            array (
                'id' => 1944,
                'name' => 'Nagano',
                'country_id' => 109,
            ),
            444 => 
            array (
                'id' => 1945,
                'name' => 'Nagasaki',
                'country_id' => 109,
            ),
            445 => 
            array (
                'id' => 1946,
                'name' => 'Nara',
                'country_id' => 109,
            ),
            446 => 
            array (
                'id' => 1947,
                'name' => 'Niigata',
                'country_id' => 109,
            ),
            447 => 
            array (
                'id' => 1948,
                'name' => 'Oita',
                'country_id' => 109,
            ),
            448 => 
            array (
                'id' => 1949,
                'name' => 'Okayama',
                'country_id' => 109,
            ),
            449 => 
            array (
                'id' => 1950,
                'name' => 'Okinawa',
                'country_id' => 109,
            ),
            450 => 
            array (
                'id' => 1951,
                'name' => 'Osaka',
                'country_id' => 109,
            ),
            451 => 
            array (
                'id' => 1952,
                'name' => 'Saga',
                'country_id' => 109,
            ),
            452 => 
            array (
                'id' => 1953,
                'name' => 'Saitama',
                'country_id' => 109,
            ),
            453 => 
            array (
                'id' => 1954,
                'name' => 'Shiga',
                'country_id' => 109,
            ),
            454 => 
            array (
                'id' => 1955,
                'name' => 'Shimane',
                'country_id' => 109,
            ),
            455 => 
            array (
                'id' => 1956,
                'name' => 'Shizuoka',
                'country_id' => 109,
            ),
            456 => 
            array (
                'id' => 1957,
                'name' => 'Tochigi',
                'country_id' => 109,
            ),
            457 => 
            array (
                'id' => 1958,
                'name' => 'Tokushima',
                'country_id' => 109,
            ),
            458 => 
            array (
                'id' => 1959,
                'name' => 'Tokyo',
                'country_id' => 109,
            ),
            459 => 
            array (
                'id' => 1960,
                'name' => 'Tottori',
                'country_id' => 109,
            ),
            460 => 
            array (
                'id' => 1961,
                'name' => 'Toyama',
                'country_id' => 109,
            ),
            461 => 
            array (
                'id' => 1962,
                'name' => 'Wakayama',
                'country_id' => 109,
            ),
            462 => 
            array (
                'id' => 1963,
                'name' => 'Yamagata',
                'country_id' => 109,
            ),
            463 => 
            array (
                'id' => 1964,
                'name' => 'Yamaguchi',
                'country_id' => 109,
            ),
            464 => 
            array (
                'id' => 1965,
                'name' => 'Yamanashi',
                'country_id' => 109,
            ),
            465 => 
            array (
                'id' => 1966,
                'name' => 'Grouville',
                'country_id' => 110,
            ),
            466 => 
            array (
                'id' => 1967,
                'name' => 'Saint Brelade',
                'country_id' => 110,
            ),
            467 => 
            array (
                'id' => 1968,
                'name' => 'Saint Clement',
                'country_id' => 110,
            ),
            468 => 
            array (
                'id' => 1969,
                'name' => 'Saint Helier',
                'country_id' => 110,
            ),
            469 => 
            array (
                'id' => 1970,
                'name' => 'Saint John',
                'country_id' => 110,
            ),
            470 => 
            array (
                'id' => 1971,
                'name' => 'Saint Lawrence',
                'country_id' => 110,
            ),
            471 => 
            array (
                'id' => 1972,
                'name' => 'Saint Martin',
                'country_id' => 110,
            ),
            472 => 
            array (
                'id' => 1973,
                'name' => 'Saint Mary',
                'country_id' => 110,
            ),
            473 => 
            array (
                'id' => 1974,
                'name' => 'Saint Peter',
                'country_id' => 110,
            ),
            474 => 
            array (
                'id' => 1975,
                'name' => 'Saint Saviour',
                'country_id' => 110,
            ),
            475 => 
            array (
                'id' => 1976,
                'name' => 'Trinity',
                'country_id' => 110,
            ),
            476 => 
            array (
                'id' => 1977,
                'name' => '\'Ajlun',
                'country_id' => 111,
            ),
            477 => 
            array (
                'id' => 1978,
                'name' => 'Amman',
                'country_id' => 111,
            ),
            478 => 
            array (
                'id' => 1979,
                'name' => 'Irbid',
                'country_id' => 111,
            ),
            479 => 
            array (
                'id' => 1980,
                'name' => 'Jarash',
                'country_id' => 111,
            ),
            480 => 
            array (
                'id' => 1981,
                'name' => 'Ma\'an',
                'country_id' => 111,
            ),
            481 => 
            array (
                'id' => 1982,
                'name' => 'Madaba',
                'country_id' => 111,
            ),
            482 => 
            array (
                'id' => 1983,
                'name' => 'al-\'Aqabah',
                'country_id' => 111,
            ),
            483 => 
            array (
                'id' => 1984,
                'name' => 'al-Balqa\'',
                'country_id' => 111,
            ),
            484 => 
            array (
                'id' => 1985,
                'name' => 'al-Karak',
                'country_id' => 111,
            ),
            485 => 
            array (
                'id' => 1986,
                'name' => 'al-Mafraq',
                'country_id' => 111,
            ),
            486 => 
            array (
                'id' => 1987,
                'name' => 'at-Tafilah',
                'country_id' => 111,
            ),
            487 => 
            array (
                'id' => 1988,
                'name' => 'az-Zarqa\'',
                'country_id' => 111,
            ),
            488 => 
            array (
                'id' => 1989,
                'name' => 'Akmecet',
                'country_id' => 112,
            ),
            489 => 
            array (
                'id' => 1990,
                'name' => 'Akmola',
                'country_id' => 112,
            ),
            490 => 
            array (
                'id' => 1991,
                'name' => 'Aktobe',
                'country_id' => 112,
            ),
            491 => 
            array (
                'id' => 1992,
                'name' => 'Almati',
                'country_id' => 112,
            ),
            492 => 
            array (
                'id' => 1993,
                'name' => 'Atirau',
                'country_id' => 112,
            ),
            493 => 
            array (
                'id' => 1994,
                'name' => 'Batis Kazakstan',
                'country_id' => 112,
            ),
            494 => 
            array (
                'id' => 1995,
                'name' => 'Burlinsky Region',
                'country_id' => 112,
            ),
            495 => 
            array (
                'id' => 1996,
                'name' => 'Karagandi',
                'country_id' => 112,
            ),
            496 => 
            array (
                'id' => 1997,
                'name' => 'Kostanay',
                'country_id' => 112,
            ),
            497 => 
            array (
                'id' => 1998,
                'name' => 'Mankistau',
                'country_id' => 112,
            ),
            498 => 
            array (
                'id' => 1999,
                'name' => 'Ontustik Kazakstan',
                'country_id' => 112,
            ),
            499 => 
            array (
                'id' => 2000,
                'name' => 'Pavlodar',
                'country_id' => 112,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 2001,
                'name' => 'Sigis Kazakstan',
                'country_id' => 112,
            ),
            1 => 
            array (
                'id' => 2002,
                'name' => 'Soltustik Kazakstan',
                'country_id' => 112,
            ),
            2 => 
            array (
                'id' => 2003,
                'name' => 'Taraz',
                'country_id' => 112,
            ),
            3 => 
            array (
                'id' => 2004,
                'name' => 'Central',
                'country_id' => 113,
            ),
            4 => 
            array (
                'id' => 2005,
                'name' => 'Coast',
                'country_id' => 113,
            ),
            5 => 
            array (
                'id' => 2006,
                'name' => 'Eastern',
                'country_id' => 113,
            ),
            6 => 
            array (
                'id' => 2007,
                'name' => 'Nairobi',
                'country_id' => 113,
            ),
            7 => 
            array (
                'id' => 2008,
                'name' => 'North Eastern',
                'country_id' => 113,
            ),
            8 => 
            array (
                'id' => 2009,
                'name' => 'Nyanza',
                'country_id' => 113,
            ),
            9 => 
            array (
                'id' => 2010,
                'name' => 'Rift Valley',
                'country_id' => 113,
            ),
            10 => 
            array (
                'id' => 2011,
                'name' => 'Western',
                'country_id' => 113,
            ),
            11 => 
            array (
                'id' => 2012,
                'name' => 'Abaiang',
                'country_id' => 114,
            ),
            12 => 
            array (
                'id' => 2013,
                'name' => 'Abemana',
                'country_id' => 114,
            ),
            13 => 
            array (
                'id' => 2014,
                'name' => 'Aranuka',
                'country_id' => 114,
            ),
            14 => 
            array (
                'id' => 2015,
                'name' => 'Arorae',
                'country_id' => 114,
            ),
            15 => 
            array (
                'id' => 2016,
                'name' => 'Banaba',
                'country_id' => 114,
            ),
            16 => 
            array (
                'id' => 2017,
                'name' => 'Beru',
                'country_id' => 114,
            ),
            17 => 
            array (
                'id' => 2018,
                'name' => 'Butaritari',
                'country_id' => 114,
            ),
            18 => 
            array (
                'id' => 2019,
                'name' => 'Kiritimati',
                'country_id' => 114,
            ),
            19 => 
            array (
                'id' => 2020,
                'name' => 'Kuria',
                'country_id' => 114,
            ),
            20 => 
            array (
                'id' => 2021,
                'name' => 'Maiana',
                'country_id' => 114,
            ),
            21 => 
            array (
                'id' => 2022,
                'name' => 'Makin',
                'country_id' => 114,
            ),
            22 => 
            array (
                'id' => 2023,
                'name' => 'Marakei',
                'country_id' => 114,
            ),
            23 => 
            array (
                'id' => 2024,
                'name' => 'Nikunau',
                'country_id' => 114,
            ),
            24 => 
            array (
                'id' => 2025,
                'name' => 'Nonouti',
                'country_id' => 114,
            ),
            25 => 
            array (
                'id' => 2026,
                'name' => 'Onotoa',
                'country_id' => 114,
            ),
            26 => 
            array (
                'id' => 2027,
                'name' => 'Phoenix Islands',
                'country_id' => 114,
            ),
            27 => 
            array (
                'id' => 2028,
                'name' => 'Tabiteuea North',
                'country_id' => 114,
            ),
            28 => 
            array (
                'id' => 2029,
                'name' => 'Tabiteuea South',
                'country_id' => 114,
            ),
            29 => 
            array (
                'id' => 2030,
                'name' => 'Tabuaeran',
                'country_id' => 114,
            ),
            30 => 
            array (
                'id' => 2031,
                'name' => 'Tamana',
                'country_id' => 114,
            ),
            31 => 
            array (
                'id' => 2032,
                'name' => 'Tarawa North',
                'country_id' => 114,
            ),
            32 => 
            array (
                'id' => 2033,
                'name' => 'Tarawa South',
                'country_id' => 114,
            ),
            33 => 
            array (
                'id' => 2034,
                'name' => 'Teraina',
                'country_id' => 114,
            ),
            34 => 
            array (
                'id' => 2035,
                'name' => 'Chagangdo',
                'country_id' => 115,
            ),
            35 => 
            array (
                'id' => 2036,
                'name' => 'Hamgyeongbukto',
                'country_id' => 115,
            ),
            36 => 
            array (
                'id' => 2037,
                'name' => 'Hamgyeongnamdo',
                'country_id' => 115,
            ),
            37 => 
            array (
                'id' => 2038,
                'name' => 'Hwanghaebukto',
                'country_id' => 115,
            ),
            38 => 
            array (
                'id' => 2039,
                'name' => 'Hwanghaenamdo',
                'country_id' => 115,
            ),
            39 => 
            array (
                'id' => 2040,
                'name' => 'Kaeseong',
                'country_id' => 115,
            ),
            40 => 
            array (
                'id' => 2041,
                'name' => 'Kangweon',
                'country_id' => 115,
            ),
            41 => 
            array (
                'id' => 2042,
                'name' => 'Nampo',
                'country_id' => 115,
            ),
            42 => 
            array (
                'id' => 2043,
                'name' => 'Pyeonganbukto',
                'country_id' => 115,
            ),
            43 => 
            array (
                'id' => 2044,
                'name' => 'Pyeongannamdo',
                'country_id' => 115,
            ),
            44 => 
            array (
                'id' => 2045,
                'name' => 'Pyeongyang',
                'country_id' => 115,
            ),
            45 => 
            array (
                'id' => 2046,
                'name' => 'Yanggang',
                'country_id' => 115,
            ),
            46 => 
            array (
                'id' => 2047,
                'name' => 'Busan',
                'country_id' => 116,
            ),
            47 => 
            array (
                'id' => 2048,
                'name' => 'Cheju',
                'country_id' => 116,
            ),
            48 => 
            array (
                'id' => 2049,
                'name' => 'Chollabuk',
                'country_id' => 116,
            ),
            49 => 
            array (
                'id' => 2050,
                'name' => 'Chollanam',
                'country_id' => 116,
            ),
            50 => 
            array (
                'id' => 2051,
                'name' => 'Chungbuk',
                'country_id' => 116,
            ),
            51 => 
            array (
                'id' => 2052,
                'name' => 'Chungcheongbuk',
                'country_id' => 116,
            ),
            52 => 
            array (
                'id' => 2053,
                'name' => 'Chungcheongnam',
                'country_id' => 116,
            ),
            53 => 
            array (
                'id' => 2054,
                'name' => 'Chungnam',
                'country_id' => 116,
            ),
            54 => 
            array (
                'id' => 2055,
                'name' => 'Daegu',
                'country_id' => 116,
            ),
            55 => 
            array (
                'id' => 2056,
                'name' => 'Gangwon-do',
                'country_id' => 116,
            ),
            56 => 
            array (
                'id' => 2057,
                'name' => 'Goyang-si',
                'country_id' => 116,
            ),
            57 => 
            array (
                'id' => 2058,
                'name' => 'Gyeonggi-do',
                'country_id' => 116,
            ),
            58 => 
            array (
                'id' => 2059,
                'name' => 'Gyeongsang ',
                'country_id' => 116,
            ),
            59 => 
            array (
                'id' => 2060,
                'name' => 'Gyeongsangnam-do',
                'country_id' => 116,
            ),
            60 => 
            array (
                'id' => 2061,
                'name' => 'Incheon',
                'country_id' => 116,
            ),
            61 => 
            array (
                'id' => 2062,
                'name' => 'Jeju-Si',
                'country_id' => 116,
            ),
            62 => 
            array (
                'id' => 2063,
                'name' => 'Jeonbuk',
                'country_id' => 116,
            ),
            63 => 
            array (
                'id' => 2064,
                'name' => 'Kangweon',
                'country_id' => 116,
            ),
            64 => 
            array (
                'id' => 2065,
                'name' => 'Kwangju',
                'country_id' => 116,
            ),
            65 => 
            array (
                'id' => 2066,
                'name' => 'Kyeonggi',
                'country_id' => 116,
            ),
            66 => 
            array (
                'id' => 2067,
                'name' => 'Kyeongsangbuk',
                'country_id' => 116,
            ),
            67 => 
            array (
                'id' => 2068,
                'name' => 'Kyeongsangnam',
                'country_id' => 116,
            ),
            68 => 
            array (
                'id' => 2069,
                'name' => 'Kyonggi-do',
                'country_id' => 116,
            ),
            69 => 
            array (
                'id' => 2070,
                'name' => 'Kyungbuk-Do',
                'country_id' => 116,
            ),
            70 => 
            array (
                'id' => 2071,
                'name' => 'Kyunggi-Do',
                'country_id' => 116,
            ),
            71 => 
            array (
                'id' => 2072,
                'name' => 'Kyunggi-do',
                'country_id' => 116,
            ),
            72 => 
            array (
                'id' => 2073,
                'name' => 'Pusan',
                'country_id' => 116,
            ),
            73 => 
            array (
                'id' => 2074,
                'name' => 'Seoul',
                'country_id' => 116,
            ),
            74 => 
            array (
                'id' => 2075,
                'name' => 'Sudogwon',
                'country_id' => 116,
            ),
            75 => 
            array (
                'id' => 2076,
                'name' => 'Taegu',
                'country_id' => 116,
            ),
            76 => 
            array (
                'id' => 2077,
                'name' => 'Taejeon',
                'country_id' => 116,
            ),
            77 => 
            array (
                'id' => 2078,
                'name' => 'Taejon-gwangyoksi',
                'country_id' => 116,
            ),
            78 => 
            array (
                'id' => 2079,
                'name' => 'Ulsan',
                'country_id' => 116,
            ),
            79 => 
            array (
                'id' => 2080,
                'name' => 'Wonju',
                'country_id' => 116,
            ),
            80 => 
            array (
                'id' => 2081,
                'name' => 'gwangyoksi',
                'country_id' => 116,
            ),
            81 => 
            array (
                'id' => 2082,
                'name' => 'Al Asimah',
                'country_id' => 117,
            ),
            82 => 
            array (
                'id' => 2083,
                'name' => 'Hawalli',
                'country_id' => 117,
            ),
            83 => 
            array (
                'id' => 2084,
                'name' => 'Mishref',
                'country_id' => 117,
            ),
            84 => 
            array (
                'id' => 2085,
                'name' => 'Qadesiya',
                'country_id' => 117,
            ),
            85 => 
            array (
                'id' => 2086,
                'name' => 'Safat',
                'country_id' => 117,
            ),
            86 => 
            array (
                'id' => 2087,
                'name' => 'Salmiya',
                'country_id' => 117,
            ),
            87 => 
            array (
                'id' => 2088,
                'name' => 'al-Ahmadi',
                'country_id' => 117,
            ),
            88 => 
            array (
                'id' => 2089,
                'name' => 'al-Farwaniyah',
                'country_id' => 117,
            ),
            89 => 
            array (
                'id' => 2090,
                'name' => 'al-Jahra',
                'country_id' => 117,
            ),
            90 => 
            array (
                'id' => 2091,
                'name' => 'al-Kuwayt',
                'country_id' => 117,
            ),
            91 => 
            array (
                'id' => 2092,
                'name' => 'Batken',
                'country_id' => 118,
            ),
            92 => 
            array (
                'id' => 2093,
                'name' => 'Bishkek',
                'country_id' => 118,
            ),
            93 => 
            array (
                'id' => 2094,
                'name' => 'Chui',
                'country_id' => 118,
            ),
            94 => 
            array (
                'id' => 2095,
                'name' => 'Issyk-Kul',
                'country_id' => 118,
            ),
            95 => 
            array (
                'id' => 2096,
                'name' => 'Jalal-Abad',
                'country_id' => 118,
            ),
            96 => 
            array (
                'id' => 2097,
                'name' => 'Naryn',
                'country_id' => 118,
            ),
            97 => 
            array (
                'id' => 2098,
                'name' => 'Osh',
                'country_id' => 118,
            ),
            98 => 
            array (
                'id' => 2099,
                'name' => 'Talas',
                'country_id' => 118,
            ),
            99 => 
            array (
                'id' => 2100,
                'name' => 'Attopu',
                'country_id' => 119,
            ),
            100 => 
            array (
                'id' => 2101,
                'name' => 'Bokeo',
                'country_id' => 119,
            ),
            101 => 
            array (
                'id' => 2102,
                'name' => 'Bolikhamsay',
                'country_id' => 119,
            ),
            102 => 
            array (
                'id' => 2103,
                'name' => 'Champasak',
                'country_id' => 119,
            ),
            103 => 
            array (
                'id' => 2104,
                'name' => 'Houaphanh',
                'country_id' => 119,
            ),
            104 => 
            array (
                'id' => 2105,
                'name' => 'Khammouane',
                'country_id' => 119,
            ),
            105 => 
            array (
                'id' => 2106,
                'name' => 'Luang Nam Tha',
                'country_id' => 119,
            ),
            106 => 
            array (
                'id' => 2107,
                'name' => 'Luang Prabang',
                'country_id' => 119,
            ),
            107 => 
            array (
                'id' => 2108,
                'name' => 'Oudomxay',
                'country_id' => 119,
            ),
            108 => 
            array (
                'id' => 2109,
                'name' => 'Phongsaly',
                'country_id' => 119,
            ),
            109 => 
            array (
                'id' => 2110,
                'name' => 'Saravan',
                'country_id' => 119,
            ),
            110 => 
            array (
                'id' => 2111,
                'name' => 'Savannakhet',
                'country_id' => 119,
            ),
            111 => 
            array (
                'id' => 2112,
                'name' => 'Sekong',
                'country_id' => 119,
            ),
            112 => 
            array (
                'id' => 2113,
                'name' => 'Viangchan Prefecture',
                'country_id' => 119,
            ),
            113 => 
            array (
                'id' => 2114,
                'name' => 'Viangchan Province',
                'country_id' => 119,
            ),
            114 => 
            array (
                'id' => 2115,
                'name' => 'Xaignabury',
                'country_id' => 119,
            ),
            115 => 
            array (
                'id' => 2116,
                'name' => 'Xiang Khuang',
                'country_id' => 119,
            ),
            116 => 
            array (
                'id' => 2117,
                'name' => 'Aizkraukles',
                'country_id' => 120,
            ),
            117 => 
            array (
                'id' => 2118,
                'name' => 'Aluksnes',
                'country_id' => 120,
            ),
            118 => 
            array (
                'id' => 2119,
                'name' => 'Balvu',
                'country_id' => 120,
            ),
            119 => 
            array (
                'id' => 2120,
                'name' => 'Bauskas',
                'country_id' => 120,
            ),
            120 => 
            array (
                'id' => 2121,
                'name' => 'Cesu',
                'country_id' => 120,
            ),
            121 => 
            array (
                'id' => 2122,
                'name' => 'Daugavpils',
                'country_id' => 120,
            ),
            122 => 
            array (
                'id' => 2123,
                'name' => 'Daugavpils City',
                'country_id' => 120,
            ),
            123 => 
            array (
                'id' => 2124,
                'name' => 'Dobeles',
                'country_id' => 120,
            ),
            124 => 
            array (
                'id' => 2125,
                'name' => 'Gulbenes',
                'country_id' => 120,
            ),
            125 => 
            array (
                'id' => 2126,
                'name' => 'Jekabspils',
                'country_id' => 120,
            ),
            126 => 
            array (
                'id' => 2127,
                'name' => 'Jelgava',
                'country_id' => 120,
            ),
            127 => 
            array (
                'id' => 2128,
                'name' => 'Jelgavas',
                'country_id' => 120,
            ),
            128 => 
            array (
                'id' => 2129,
                'name' => 'Jurmala City',
                'country_id' => 120,
            ),
            129 => 
            array (
                'id' => 2130,
                'name' => 'Kraslavas',
                'country_id' => 120,
            ),
            130 => 
            array (
                'id' => 2131,
                'name' => 'Kuldigas',
                'country_id' => 120,
            ),
            131 => 
            array (
                'id' => 2132,
                'name' => 'Liepaja',
                'country_id' => 120,
            ),
            132 => 
            array (
                'id' => 2133,
                'name' => 'Liepajas',
                'country_id' => 120,
            ),
            133 => 
            array (
                'id' => 2134,
                'name' => 'Limbazhu',
                'country_id' => 120,
            ),
            134 => 
            array (
                'id' => 2135,
                'name' => 'Ludzas',
                'country_id' => 120,
            ),
            135 => 
            array (
                'id' => 2136,
                'name' => 'Madonas',
                'country_id' => 120,
            ),
            136 => 
            array (
                'id' => 2137,
                'name' => 'Ogres',
                'country_id' => 120,
            ),
            137 => 
            array (
                'id' => 2138,
                'name' => 'Preilu',
                'country_id' => 120,
            ),
            138 => 
            array (
                'id' => 2139,
                'name' => 'Rezekne',
                'country_id' => 120,
            ),
            139 => 
            array (
                'id' => 2140,
                'name' => 'Rezeknes',
                'country_id' => 120,
            ),
            140 => 
            array (
                'id' => 2141,
                'name' => 'Riga',
                'country_id' => 120,
            ),
            141 => 
            array (
                'id' => 2142,
                'name' => 'Rigas',
                'country_id' => 120,
            ),
            142 => 
            array (
                'id' => 2143,
                'name' => 'Saldus',
                'country_id' => 120,
            ),
            143 => 
            array (
                'id' => 2144,
                'name' => 'Talsu',
                'country_id' => 120,
            ),
            144 => 
            array (
                'id' => 2145,
                'name' => 'Tukuma',
                'country_id' => 120,
            ),
            145 => 
            array (
                'id' => 2146,
                'name' => 'Valkas',
                'country_id' => 120,
            ),
            146 => 
            array (
                'id' => 2147,
                'name' => 'Valmieras',
                'country_id' => 120,
            ),
            147 => 
            array (
                'id' => 2148,
                'name' => 'Ventspils',
                'country_id' => 120,
            ),
            148 => 
            array (
                'id' => 2149,
                'name' => 'Ventspils City',
                'country_id' => 120,
            ),
            149 => 
            array (
                'id' => 2150,
                'name' => 'Beirut',
                'country_id' => 121,
            ),
            150 => 
            array (
                'id' => 2151,
                'name' => 'Jabal Lubnan',
                'country_id' => 121,
            ),
            151 => 
            array (
                'id' => 2152,
                'name' => 'Mohafazat Liban-Nord',
                'country_id' => 121,
            ),
            152 => 
            array (
                'id' => 2153,
                'name' => 'Mohafazat Mont-Liban',
                'country_id' => 121,
            ),
            153 => 
            array (
                'id' => 2154,
                'name' => 'Sidon',
                'country_id' => 121,
            ),
            154 => 
            array (
                'id' => 2155,
                'name' => 'al-Biqa',
                'country_id' => 121,
            ),
            155 => 
            array (
                'id' => 2156,
                'name' => 'al-Janub',
                'country_id' => 121,
            ),
            156 => 
            array (
                'id' => 2157,
                'name' => 'an-Nabatiyah',
                'country_id' => 121,
            ),
            157 => 
            array (
                'id' => 2158,
                'name' => 'ash-Shamal',
                'country_id' => 121,
            ),
            158 => 
            array (
                'id' => 2159,
                'name' => 'Berea',
                'country_id' => 122,
            ),
            159 => 
            array (
                'id' => 2160,
                'name' => 'Butha-Buthe',
                'country_id' => 122,
            ),
            160 => 
            array (
                'id' => 2161,
                'name' => 'Leribe',
                'country_id' => 122,
            ),
            161 => 
            array (
                'id' => 2162,
                'name' => 'Mafeteng',
                'country_id' => 122,
            ),
            162 => 
            array (
                'id' => 2163,
                'name' => 'Maseru',
                'country_id' => 122,
            ),
            163 => 
            array (
                'id' => 2164,
                'name' => 'Mohale\'s Hoek',
                'country_id' => 122,
            ),
            164 => 
            array (
                'id' => 2165,
                'name' => 'Mokhotlong',
                'country_id' => 122,
            ),
            165 => 
            array (
                'id' => 2166,
                'name' => 'Qacha\'s Nek',
                'country_id' => 122,
            ),
            166 => 
            array (
                'id' => 2167,
                'name' => 'Quthing',
                'country_id' => 122,
            ),
            167 => 
            array (
                'id' => 2168,
                'name' => 'Thaba-Tseka',
                'country_id' => 122,
            ),
            168 => 
            array (
                'id' => 2169,
                'name' => 'Bomi',
                'country_id' => 123,
            ),
            169 => 
            array (
                'id' => 2170,
                'name' => 'Bong',
                'country_id' => 123,
            ),
            170 => 
            array (
                'id' => 2171,
                'name' => 'Grand Bassa',
                'country_id' => 123,
            ),
            171 => 
            array (
                'id' => 2172,
                'name' => 'Grand Cape Mount',
                'country_id' => 123,
            ),
            172 => 
            array (
                'id' => 2173,
                'name' => 'Grand Gedeh',
                'country_id' => 123,
            ),
            173 => 
            array (
                'id' => 2174,
                'name' => 'Loffa',
                'country_id' => 123,
            ),
            174 => 
            array (
                'id' => 2175,
                'name' => 'Margibi',
                'country_id' => 123,
            ),
            175 => 
            array (
                'id' => 2176,
                'name' => 'Maryland and Grand Kru',
                'country_id' => 123,
            ),
            176 => 
            array (
                'id' => 2177,
                'name' => 'Montserrado',
                'country_id' => 123,
            ),
            177 => 
            array (
                'id' => 2178,
                'name' => 'Nimba',
                'country_id' => 123,
            ),
            178 => 
            array (
                'id' => 2179,
                'name' => 'Rivercess',
                'country_id' => 123,
            ),
            179 => 
            array (
                'id' => 2180,
                'name' => 'Sinoe',
                'country_id' => 123,
            ),
            180 => 
            array (
                'id' => 2181,
                'name' => 'Ajdabiya',
                'country_id' => 124,
            ),
            181 => 
            array (
                'id' => 2182,
                'name' => 'Fezzan',
                'country_id' => 124,
            ),
            182 => 
            array (
                'id' => 2183,
                'name' => 'Banghazi',
                'country_id' => 124,
            ),
            183 => 
            array (
                'id' => 2184,
                'name' => 'Darnah',
                'country_id' => 124,
            ),
            184 => 
            array (
                'id' => 2185,
                'name' => 'Ghadamis',
                'country_id' => 124,
            ),
            185 => 
            array (
                'id' => 2186,
                'name' => 'Gharyan',
                'country_id' => 124,
            ),
            186 => 
            array (
                'id' => 2187,
                'name' => 'Misratah',
                'country_id' => 124,
            ),
            187 => 
            array (
                'id' => 2188,
                'name' => 'Murzuq',
                'country_id' => 124,
            ),
            188 => 
            array (
                'id' => 2189,
                'name' => 'Sabha',
                'country_id' => 124,
            ),
            189 => 
            array (
                'id' => 2190,
                'name' => 'Sawfajjin',
                'country_id' => 124,
            ),
            190 => 
            array (
                'id' => 2191,
                'name' => 'Surt',
                'country_id' => 124,
            ),
            191 => 
            array (
                'id' => 2192,
                'name' => 'Tarabulus',
                'country_id' => 124,
            ),
            192 => 
            array (
                'id' => 2193,
                'name' => 'Tarhunah',
                'country_id' => 124,
            ),
            193 => 
            array (
                'id' => 2194,
                'name' => 'Tripolitania',
                'country_id' => 124,
            ),
            194 => 
            array (
                'id' => 2195,
                'name' => 'Tubruq',
                'country_id' => 124,
            ),
            195 => 
            array (
                'id' => 2196,
                'name' => 'Yafran',
                'country_id' => 124,
            ),
            196 => 
            array (
                'id' => 2197,
                'name' => 'Zlitan',
                'country_id' => 124,
            ),
            197 => 
            array (
                'id' => 2198,
                'name' => 'al-\'Aziziyah',
                'country_id' => 124,
            ),
            198 => 
            array (
                'id' => 2199,
                'name' => 'al-Fatih',
                'country_id' => 124,
            ),
            199 => 
            array (
                'id' => 2200,
                'name' => 'al-Jabal al Akhdar',
                'country_id' => 124,
            ),
            200 => 
            array (
                'id' => 2201,
                'name' => 'al-Jufrah',
                'country_id' => 124,
            ),
            201 => 
            array (
                'id' => 2202,
                'name' => 'al-Khums',
                'country_id' => 124,
            ),
            202 => 
            array (
                'id' => 2203,
                'name' => 'al-Kufrah',
                'country_id' => 124,
            ),
            203 => 
            array (
                'id' => 2204,
                'name' => 'an-Nuqat al-Khams',
                'country_id' => 124,
            ),
            204 => 
            array (
                'id' => 2205,
                'name' => 'ash-Shati\'',
                'country_id' => 124,
            ),
            205 => 
            array (
                'id' => 2206,
                'name' => 'az-Zawiyah',
                'country_id' => 124,
            ),
            206 => 
            array (
                'id' => 2207,
                'name' => 'Balzers',
                'country_id' => 125,
            ),
            207 => 
            array (
                'id' => 2208,
                'name' => 'Eschen',
                'country_id' => 125,
            ),
            208 => 
            array (
                'id' => 2209,
                'name' => 'Gamprin',
                'country_id' => 125,
            ),
            209 => 
            array (
                'id' => 2210,
                'name' => 'Mauren',
                'country_id' => 125,
            ),
            210 => 
            array (
                'id' => 2211,
                'name' => 'Planken',
                'country_id' => 125,
            ),
            211 => 
            array (
                'id' => 2212,
                'name' => 'Ruggell',
                'country_id' => 125,
            ),
            212 => 
            array (
                'id' => 2213,
                'name' => 'Schaan',
                'country_id' => 125,
            ),
            213 => 
            array (
                'id' => 2214,
                'name' => 'Schellenberg',
                'country_id' => 125,
            ),
            214 => 
            array (
                'id' => 2215,
                'name' => 'Triesen',
                'country_id' => 125,
            ),
            215 => 
            array (
                'id' => 2216,
                'name' => 'Triesenberg',
                'country_id' => 125,
            ),
            216 => 
            array (
                'id' => 2217,
                'name' => 'Vaduz',
                'country_id' => 125,
            ),
            217 => 
            array (
                'id' => 2218,
                'name' => 'Alytaus',
                'country_id' => 126,
            ),
            218 => 
            array (
                'id' => 2219,
                'name' => 'Anyksciai',
                'country_id' => 126,
            ),
            219 => 
            array (
                'id' => 2220,
                'name' => 'Kauno',
                'country_id' => 126,
            ),
            220 => 
            array (
                'id' => 2221,
                'name' => 'Klaipedos',
                'country_id' => 126,
            ),
            221 => 
            array (
                'id' => 2222,
                'name' => 'Marijampoles',
                'country_id' => 126,
            ),
            222 => 
            array (
                'id' => 2223,
                'name' => 'Panevezhio',
                'country_id' => 126,
            ),
            223 => 
            array (
                'id' => 2224,
                'name' => 'Panevezys',
                'country_id' => 126,
            ),
            224 => 
            array (
                'id' => 2225,
                'name' => 'Shiauliu',
                'country_id' => 126,
            ),
            225 => 
            array (
                'id' => 2226,
                'name' => 'Taurages',
                'country_id' => 126,
            ),
            226 => 
            array (
                'id' => 2227,
                'name' => 'Telshiu',
                'country_id' => 126,
            ),
            227 => 
            array (
                'id' => 2228,
                'name' => 'Telsiai',
                'country_id' => 126,
            ),
            228 => 
            array (
                'id' => 2229,
                'name' => 'Utenos',
                'country_id' => 126,
            ),
            229 => 
            array (
                'id' => 2230,
                'name' => 'Vilniaus',
                'country_id' => 126,
            ),
            230 => 
            array (
                'id' => 2231,
                'name' => 'Capellen',
                'country_id' => 127,
            ),
            231 => 
            array (
                'id' => 2232,
                'name' => 'Clervaux',
                'country_id' => 127,
            ),
            232 => 
            array (
                'id' => 2233,
                'name' => 'Diekirch',
                'country_id' => 127,
            ),
            233 => 
            array (
                'id' => 2234,
                'name' => 'Echternach',
                'country_id' => 127,
            ),
            234 => 
            array (
                'id' => 2235,
                'name' => 'Esch-sur-Alzette',
                'country_id' => 127,
            ),
            235 => 
            array (
                'id' => 2236,
                'name' => 'Grevenmacher',
                'country_id' => 127,
            ),
            236 => 
            array (
                'id' => 2237,
                'name' => 'Luxembourg',
                'country_id' => 127,
            ),
            237 => 
            array (
                'id' => 2238,
                'name' => 'Mersch',
                'country_id' => 127,
            ),
            238 => 
            array (
                'id' => 2239,
                'name' => 'Redange',
                'country_id' => 127,
            ),
            239 => 
            array (
                'id' => 2240,
                'name' => 'Remich',
                'country_id' => 127,
            ),
            240 => 
            array (
                'id' => 2241,
                'name' => 'Vianden',
                'country_id' => 127,
            ),
            241 => 
            array (
                'id' => 2242,
                'name' => 'Wiltz',
                'country_id' => 127,
            ),
            242 => 
            array (
                'id' => 2243,
                'name' => 'Macau',
                'country_id' => 128,
            ),
            243 => 
            array (
                'id' => 2244,
                'name' => 'Berovo',
                'country_id' => 129,
            ),
            244 => 
            array (
                'id' => 2245,
                'name' => 'Bitola',
                'country_id' => 129,
            ),
            245 => 
            array (
                'id' => 2246,
                'name' => 'Brod',
                'country_id' => 129,
            ),
            246 => 
            array (
                'id' => 2247,
                'name' => 'Debar',
                'country_id' => 129,
            ),
            247 => 
            array (
                'id' => 2248,
                'name' => 'Delchevo',
                'country_id' => 129,
            ),
            248 => 
            array (
                'id' => 2249,
                'name' => 'Demir Hisar',
                'country_id' => 129,
            ),
            249 => 
            array (
                'id' => 2250,
                'name' => 'Gevgelija',
                'country_id' => 129,
            ),
            250 => 
            array (
                'id' => 2251,
                'name' => 'Gostivar',
                'country_id' => 129,
            ),
            251 => 
            array (
                'id' => 2252,
                'name' => 'Kavadarci',
                'country_id' => 129,
            ),
            252 => 
            array (
                'id' => 2253,
                'name' => 'Kichevo',
                'country_id' => 129,
            ),
            253 => 
            array (
                'id' => 2254,
                'name' => 'Kochani',
                'country_id' => 129,
            ),
            254 => 
            array (
                'id' => 2255,
                'name' => 'Kratovo',
                'country_id' => 129,
            ),
            255 => 
            array (
                'id' => 2256,
                'name' => 'Kriva Palanka',
                'country_id' => 129,
            ),
            256 => 
            array (
                'id' => 2257,
                'name' => 'Krushevo',
                'country_id' => 129,
            ),
            257 => 
            array (
                'id' => 2258,
                'name' => 'Kumanovo',
                'country_id' => 129,
            ),
            258 => 
            array (
                'id' => 2259,
                'name' => 'Negotino',
                'country_id' => 129,
            ),
            259 => 
            array (
                'id' => 2260,
                'name' => 'Ohrid',
                'country_id' => 129,
            ),
            260 => 
            array (
                'id' => 2261,
                'name' => 'Prilep',
                'country_id' => 129,
            ),
            261 => 
            array (
                'id' => 2262,
                'name' => 'Probishtip',
                'country_id' => 129,
            ),
            262 => 
            array (
                'id' => 2263,
                'name' => 'Radovish',
                'country_id' => 129,
            ),
            263 => 
            array (
                'id' => 2264,
                'name' => 'Resen',
                'country_id' => 129,
            ),
            264 => 
            array (
                'id' => 2265,
                'name' => 'Shtip',
                'country_id' => 129,
            ),
            265 => 
            array (
                'id' => 2266,
                'name' => 'Skopje',
                'country_id' => 129,
            ),
            266 => 
            array (
                'id' => 2267,
                'name' => 'Struga',
                'country_id' => 129,
            ),
            267 => 
            array (
                'id' => 2268,
                'name' => 'Strumica',
                'country_id' => 129,
            ),
            268 => 
            array (
                'id' => 2269,
                'name' => 'Sveti Nikole',
                'country_id' => 129,
            ),
            269 => 
            array (
                'id' => 2270,
                'name' => 'Tetovo',
                'country_id' => 129,
            ),
            270 => 
            array (
                'id' => 2271,
                'name' => 'Valandovo',
                'country_id' => 129,
            ),
            271 => 
            array (
                'id' => 2272,
                'name' => 'Veles',
                'country_id' => 129,
            ),
            272 => 
            array (
                'id' => 2273,
                'name' => 'Vinica',
                'country_id' => 129,
            ),
            273 => 
            array (
                'id' => 2274,
                'name' => 'Antananarivo',
                'country_id' => 130,
            ),
            274 => 
            array (
                'id' => 2275,
                'name' => 'Antsiranana',
                'country_id' => 130,
            ),
            275 => 
            array (
                'id' => 2276,
                'name' => 'Fianarantsoa',
                'country_id' => 130,
            ),
            276 => 
            array (
                'id' => 2277,
                'name' => 'Mahajanga',
                'country_id' => 130,
            ),
            277 => 
            array (
                'id' => 2278,
                'name' => 'Toamasina',
                'country_id' => 130,
            ),
            278 => 
            array (
                'id' => 2279,
                'name' => 'Toliary',
                'country_id' => 130,
            ),
            279 => 
            array (
                'id' => 2280,
                'name' => 'Balaka',
                'country_id' => 131,
            ),
            280 => 
            array (
                'id' => 2281,
                'name' => 'Blantyre City',
                'country_id' => 131,
            ),
            281 => 
            array (
                'id' => 2282,
                'name' => 'Chikwawa',
                'country_id' => 131,
            ),
            282 => 
            array (
                'id' => 2283,
                'name' => 'Chiradzulu',
                'country_id' => 131,
            ),
            283 => 
            array (
                'id' => 2284,
                'name' => 'Chitipa',
                'country_id' => 131,
            ),
            284 => 
            array (
                'id' => 2285,
                'name' => 'Dedza',
                'country_id' => 131,
            ),
            285 => 
            array (
                'id' => 2286,
                'name' => 'Dowa',
                'country_id' => 131,
            ),
            286 => 
            array (
                'id' => 2287,
                'name' => 'Karonga',
                'country_id' => 131,
            ),
            287 => 
            array (
                'id' => 2288,
                'name' => 'Kasungu',
                'country_id' => 131,
            ),
            288 => 
            array (
                'id' => 2289,
                'name' => 'Lilongwe City',
                'country_id' => 131,
            ),
            289 => 
            array (
                'id' => 2290,
                'name' => 'Machinga',
                'country_id' => 131,
            ),
            290 => 
            array (
                'id' => 2291,
                'name' => 'Mangochi',
                'country_id' => 131,
            ),
            291 => 
            array (
                'id' => 2292,
                'name' => 'Mchinji',
                'country_id' => 131,
            ),
            292 => 
            array (
                'id' => 2293,
                'name' => 'Mulanje',
                'country_id' => 131,
            ),
            293 => 
            array (
                'id' => 2294,
                'name' => 'Mwanza',
                'country_id' => 131,
            ),
            294 => 
            array (
                'id' => 2295,
                'name' => 'Mzimba',
                'country_id' => 131,
            ),
            295 => 
            array (
                'id' => 2296,
                'name' => 'Mzuzu City',
                'country_id' => 131,
            ),
            296 => 
            array (
                'id' => 2297,
                'name' => 'Nkhata Bay',
                'country_id' => 131,
            ),
            297 => 
            array (
                'id' => 2298,
                'name' => 'Nkhotakota',
                'country_id' => 131,
            ),
            298 => 
            array (
                'id' => 2299,
                'name' => 'Nsanje',
                'country_id' => 131,
            ),
            299 => 
            array (
                'id' => 2300,
                'name' => 'Ntcheu',
                'country_id' => 131,
            ),
            300 => 
            array (
                'id' => 2301,
                'name' => 'Ntchisi',
                'country_id' => 131,
            ),
            301 => 
            array (
                'id' => 2302,
                'name' => 'Phalombe',
                'country_id' => 131,
            ),
            302 => 
            array (
                'id' => 2303,
                'name' => 'Rumphi',
                'country_id' => 131,
            ),
            303 => 
            array (
                'id' => 2304,
                'name' => 'Salima',
                'country_id' => 131,
            ),
            304 => 
            array (
                'id' => 2305,
                'name' => 'Thyolo',
                'country_id' => 131,
            ),
            305 => 
            array (
                'id' => 2306,
                'name' => 'Zomba Municipality',
                'country_id' => 131,
            ),
            306 => 
            array (
                'id' => 2307,
                'name' => 'Johor',
                'country_id' => 132,
            ),
            307 => 
            array (
                'id' => 2308,
                'name' => 'Kedah',
                'country_id' => 132,
            ),
            308 => 
            array (
                'id' => 2309,
                'name' => 'Kelantan',
                'country_id' => 132,
            ),
            309 => 
            array (
                'id' => 2310,
                'name' => 'Kuala Lumpur',
                'country_id' => 132,
            ),
            310 => 
            array (
                'id' => 2311,
                'name' => 'Labuan',
                'country_id' => 132,
            ),
            311 => 
            array (
                'id' => 2312,
                'name' => 'Melaka',
                'country_id' => 132,
            ),
            312 => 
            array (
                'id' => 2313,
                'name' => 'Negeri Johor',
                'country_id' => 132,
            ),
            313 => 
            array (
                'id' => 2314,
                'name' => 'Negeri Sembilan',
                'country_id' => 132,
            ),
            314 => 
            array (
                'id' => 2315,
                'name' => 'Pahang',
                'country_id' => 132,
            ),
            315 => 
            array (
                'id' => 2316,
                'name' => 'Penang',
                'country_id' => 132,
            ),
            316 => 
            array (
                'id' => 2317,
                'name' => 'Perak',
                'country_id' => 132,
            ),
            317 => 
            array (
                'id' => 2318,
                'name' => 'Perlis',
                'country_id' => 132,
            ),
            318 => 
            array (
                'id' => 2319,
                'name' => 'Pulau Pinang',
                'country_id' => 132,
            ),
            319 => 
            array (
                'id' => 2320,
                'name' => 'Sabah',
                'country_id' => 132,
            ),
            320 => 
            array (
                'id' => 2321,
                'name' => 'Sarawak',
                'country_id' => 132,
            ),
            321 => 
            array (
                'id' => 2322,
                'name' => 'Selangor',
                'country_id' => 132,
            ),
            322 => 
            array (
                'id' => 2323,
                'name' => 'Sembilan',
                'country_id' => 132,
            ),
            323 => 
            array (
                'id' => 2324,
                'name' => 'Terengganu',
                'country_id' => 132,
            ),
            324 => 
            array (
                'id' => 2325,
                'name' => 'Alif Alif',
                'country_id' => 133,
            ),
            325 => 
            array (
                'id' => 2326,
                'name' => 'Alif Dhaal',
                'country_id' => 133,
            ),
            326 => 
            array (
                'id' => 2327,
                'name' => 'Baa',
                'country_id' => 133,
            ),
            327 => 
            array (
                'id' => 2328,
                'name' => 'Dhaal',
                'country_id' => 133,
            ),
            328 => 
            array (
                'id' => 2329,
                'name' => 'Faaf',
                'country_id' => 133,
            ),
            329 => 
            array (
                'id' => 2330,
                'name' => 'Gaaf Alif',
                'country_id' => 133,
            ),
            330 => 
            array (
                'id' => 2331,
                'name' => 'Gaaf Dhaal',
                'country_id' => 133,
            ),
            331 => 
            array (
                'id' => 2332,
                'name' => 'Ghaviyani',
                'country_id' => 133,
            ),
            332 => 
            array (
                'id' => 2333,
                'name' => 'Haa Alif',
                'country_id' => 133,
            ),
            333 => 
            array (
                'id' => 2334,
                'name' => 'Haa Dhaal',
                'country_id' => 133,
            ),
            334 => 
            array (
                'id' => 2335,
                'name' => 'Kaaf',
                'country_id' => 133,
            ),
            335 => 
            array (
                'id' => 2336,
                'name' => 'Laam',
                'country_id' => 133,
            ),
            336 => 
            array (
                'id' => 2337,
                'name' => 'Lhaviyani',
                'country_id' => 133,
            ),
            337 => 
            array (
                'id' => 2338,
                'name' => 'Male',
                'country_id' => 133,
            ),
            338 => 
            array (
                'id' => 2339,
                'name' => 'Miim',
                'country_id' => 133,
            ),
            339 => 
            array (
                'id' => 2340,
                'name' => 'Nuun',
                'country_id' => 133,
            ),
            340 => 
            array (
                'id' => 2341,
                'name' => 'Raa',
                'country_id' => 133,
            ),
            341 => 
            array (
                'id' => 2342,
                'name' => 'Shaviyani',
                'country_id' => 133,
            ),
            342 => 
            array (
                'id' => 2343,
                'name' => 'Siin',
                'country_id' => 133,
            ),
            343 => 
            array (
                'id' => 2344,
                'name' => 'Thaa',
                'country_id' => 133,
            ),
            344 => 
            array (
                'id' => 2345,
                'name' => 'Vaav',
                'country_id' => 133,
            ),
            345 => 
            array (
                'id' => 2346,
                'name' => 'Bamako',
                'country_id' => 134,
            ),
            346 => 
            array (
                'id' => 2347,
                'name' => 'Gao',
                'country_id' => 134,
            ),
            347 => 
            array (
                'id' => 2348,
                'name' => 'Kayes',
                'country_id' => 134,
            ),
            348 => 
            array (
                'id' => 2349,
                'name' => 'Kidal',
                'country_id' => 134,
            ),
            349 => 
            array (
                'id' => 2350,
                'name' => 'Koulikoro',
                'country_id' => 134,
            ),
            350 => 
            array (
                'id' => 2351,
                'name' => 'Mopti',
                'country_id' => 134,
            ),
            351 => 
            array (
                'id' => 2352,
                'name' => 'Segou',
                'country_id' => 134,
            ),
            352 => 
            array (
                'id' => 2353,
                'name' => 'Sikasso',
                'country_id' => 134,
            ),
            353 => 
            array (
                'id' => 2354,
                'name' => 'Tombouctou',
                'country_id' => 134,
            ),
            354 => 
            array (
                'id' => 2355,
                'name' => 'Gozo and Comino',
                'country_id' => 135,
            ),
            355 => 
            array (
                'id' => 2356,
                'name' => 'Inner Harbour',
                'country_id' => 135,
            ),
            356 => 
            array (
                'id' => 2357,
                'name' => 'Northern',
                'country_id' => 135,
            ),
            357 => 
            array (
                'id' => 2358,
                'name' => 'Outer Harbour',
                'country_id' => 135,
            ),
            358 => 
            array (
                'id' => 2359,
                'name' => 'South Eastern',
                'country_id' => 135,
            ),
            359 => 
            array (
                'id' => 2360,
                'name' => 'Valletta',
                'country_id' => 135,
            ),
            360 => 
            array (
                'id' => 2361,
                'name' => 'Western',
                'country_id' => 135,
            ),
            361 => 
            array (
                'id' => 2362,
                'name' => 'Castletown',
                'country_id' => 136,
            ),
            362 => 
            array (
                'id' => 2363,
                'name' => 'Douglas',
                'country_id' => 136,
            ),
            363 => 
            array (
                'id' => 2364,
                'name' => 'Laxey',
                'country_id' => 136,
            ),
            364 => 
            array (
                'id' => 2365,
                'name' => 'Onchan',
                'country_id' => 136,
            ),
            365 => 
            array (
                'id' => 2366,
                'name' => 'Peel',
                'country_id' => 136,
            ),
            366 => 
            array (
                'id' => 2367,
                'name' => 'Port Erin',
                'country_id' => 136,
            ),
            367 => 
            array (
                'id' => 2368,
                'name' => 'Port Saint Mary',
                'country_id' => 136,
            ),
            368 => 
            array (
                'id' => 2369,
                'name' => 'Ramsey',
                'country_id' => 136,
            ),
            369 => 
            array (
                'id' => 2370,
                'name' => 'Ailinlaplap',
                'country_id' => 137,
            ),
            370 => 
            array (
                'id' => 2371,
                'name' => 'Ailuk',
                'country_id' => 137,
            ),
            371 => 
            array (
                'id' => 2372,
                'name' => 'Arno',
                'country_id' => 137,
            ),
            372 => 
            array (
                'id' => 2373,
                'name' => 'Aur',
                'country_id' => 137,
            ),
            373 => 
            array (
                'id' => 2374,
                'name' => 'Bikini',
                'country_id' => 137,
            ),
            374 => 
            array (
                'id' => 2375,
                'name' => 'Ebon',
                'country_id' => 137,
            ),
            375 => 
            array (
                'id' => 2376,
                'name' => 'Enewetak',
                'country_id' => 137,
            ),
            376 => 
            array (
                'id' => 2377,
                'name' => 'Jabat',
                'country_id' => 137,
            ),
            377 => 
            array (
                'id' => 2378,
                'name' => 'Jaluit',
                'country_id' => 137,
            ),
            378 => 
            array (
                'id' => 2379,
                'name' => 'Kili',
                'country_id' => 137,
            ),
            379 => 
            array (
                'id' => 2380,
                'name' => 'Kwajalein',
                'country_id' => 137,
            ),
            380 => 
            array (
                'id' => 2381,
                'name' => 'Lae',
                'country_id' => 137,
            ),
            381 => 
            array (
                'id' => 2382,
                'name' => 'Lib',
                'country_id' => 137,
            ),
            382 => 
            array (
                'id' => 2383,
                'name' => 'Likiep',
                'country_id' => 137,
            ),
            383 => 
            array (
                'id' => 2384,
                'name' => 'Majuro',
                'country_id' => 137,
            ),
            384 => 
            array (
                'id' => 2385,
                'name' => 'Maloelap',
                'country_id' => 137,
            ),
            385 => 
            array (
                'id' => 2386,
                'name' => 'Mejit',
                'country_id' => 137,
            ),
            386 => 
            array (
                'id' => 2387,
                'name' => 'Mili',
                'country_id' => 137,
            ),
            387 => 
            array (
                'id' => 2388,
                'name' => 'Namorik',
                'country_id' => 137,
            ),
            388 => 
            array (
                'id' => 2389,
                'name' => 'Namu',
                'country_id' => 137,
            ),
            389 => 
            array (
                'id' => 2390,
                'name' => 'Rongelap',
                'country_id' => 137,
            ),
            390 => 
            array (
                'id' => 2391,
                'name' => 'Ujae',
                'country_id' => 137,
            ),
            391 => 
            array (
                'id' => 2392,
                'name' => 'Utrik',
                'country_id' => 137,
            ),
            392 => 
            array (
                'id' => 2393,
                'name' => 'Wotho',
                'country_id' => 137,
            ),
            393 => 
            array (
                'id' => 2394,
                'name' => 'Wotje',
                'country_id' => 137,
            ),
            394 => 
            array (
                'id' => 2395,
                'name' => 'Fort-de-France',
                'country_id' => 138,
            ),
            395 => 
            array (
                'id' => 2396,
                'name' => 'La Trinite',
                'country_id' => 138,
            ),
            396 => 
            array (
                'id' => 2397,
                'name' => 'Le Marin',
                'country_id' => 138,
            ),
            397 => 
            array (
                'id' => 2398,
                'name' => 'Saint-Pierre',
                'country_id' => 138,
            ),
            398 => 
            array (
                'id' => 2399,
                'name' => 'Adrar',
                'country_id' => 139,
            ),
            399 => 
            array (
                'id' => 2400,
                'name' => 'Assaba',
                'country_id' => 139,
            ),
            400 => 
            array (
                'id' => 2401,
                'name' => 'Brakna',
                'country_id' => 139,
            ),
            401 => 
            array (
                'id' => 2402,
                'name' => 'Dhakhlat Nawadibu',
                'country_id' => 139,
            ),
            402 => 
            array (
                'id' => 2403,
                'name' => 'Hudh-al-Gharbi',
                'country_id' => 139,
            ),
            403 => 
            array (
                'id' => 2404,
                'name' => 'Hudh-ash-Sharqi',
                'country_id' => 139,
            ),
            404 => 
            array (
                'id' => 2405,
                'name' => 'Inshiri',
                'country_id' => 139,
            ),
            405 => 
            array (
                'id' => 2406,
                'name' => 'Nawakshut',
                'country_id' => 139,
            ),
            406 => 
            array (
                'id' => 2407,
                'name' => 'Qidimagha',
                'country_id' => 139,
            ),
            407 => 
            array (
                'id' => 2408,
                'name' => 'Qurqul',
                'country_id' => 139,
            ),
            408 => 
            array (
                'id' => 2409,
                'name' => 'Taqant',
                'country_id' => 139,
            ),
            409 => 
            array (
                'id' => 2410,
                'name' => 'Tiris Zammur',
                'country_id' => 139,
            ),
            410 => 
            array (
                'id' => 2411,
                'name' => 'Trarza',
                'country_id' => 139,
            ),
            411 => 
            array (
                'id' => 2412,
                'name' => 'Black River',
                'country_id' => 140,
            ),
            412 => 
            array (
                'id' => 2413,
                'name' => 'Eau Coulee',
                'country_id' => 140,
            ),
            413 => 
            array (
                'id' => 2414,
                'name' => 'Flacq',
                'country_id' => 140,
            ),
            414 => 
            array (
                'id' => 2415,
                'name' => 'Floreal',
                'country_id' => 140,
            ),
            415 => 
            array (
                'id' => 2416,
                'name' => 'Grand Port',
                'country_id' => 140,
            ),
            416 => 
            array (
                'id' => 2417,
                'name' => 'Moka',
                'country_id' => 140,
            ),
            417 => 
            array (
                'id' => 2418,
                'name' => 'Pamplempousses',
                'country_id' => 140,
            ),
            418 => 
            array (
                'id' => 2419,
                'name' => 'Plaines Wilhelm',
                'country_id' => 140,
            ),
            419 => 
            array (
                'id' => 2420,
                'name' => 'Port Louis',
                'country_id' => 140,
            ),
            420 => 
            array (
                'id' => 2421,
                'name' => 'Riviere du Rempart',
                'country_id' => 140,
            ),
            421 => 
            array (
                'id' => 2422,
                'name' => 'Rodrigues',
                'country_id' => 140,
            ),
            422 => 
            array (
                'id' => 2423,
                'name' => 'Rose Hill',
                'country_id' => 140,
            ),
            423 => 
            array (
                'id' => 2424,
                'name' => 'Savanne',
                'country_id' => 140,
            ),
            424 => 
            array (
                'id' => 2425,
                'name' => 'Mayotte',
                'country_id' => 141,
            ),
            425 => 
            array (
                'id' => 2426,
                'name' => 'Pamanzi',
                'country_id' => 141,
            ),
            426 => 
            array (
                'id' => 2427,
                'name' => 'Aguascalientes',
                'country_id' => 142,
            ),
            427 => 
            array (
                'id' => 2428,
                'name' => 'Baja California',
                'country_id' => 142,
            ),
            428 => 
            array (
                'id' => 2429,
                'name' => 'Baja California Sur',
                'country_id' => 142,
            ),
            429 => 
            array (
                'id' => 2430,
                'name' => 'Campeche',
                'country_id' => 142,
            ),
            430 => 
            array (
                'id' => 2431,
                'name' => 'Chiapas',
                'country_id' => 142,
            ),
            431 => 
            array (
                'id' => 2432,
                'name' => 'Chihuahua',
                'country_id' => 142,
            ),
            432 => 
            array (
                'id' => 2433,
                'name' => 'Coahuila',
                'country_id' => 142,
            ),
            433 => 
            array (
                'id' => 2434,
                'name' => 'Colima',
                'country_id' => 142,
            ),
            434 => 
            array (
                'id' => 2435,
                'name' => 'Distrito Federal',
                'country_id' => 142,
            ),
            435 => 
            array (
                'id' => 2436,
                'name' => 'Durango',
                'country_id' => 142,
            ),
            436 => 
            array (
                'id' => 2437,
                'name' => 'Estado de Mexico',
                'country_id' => 142,
            ),
            437 => 
            array (
                'id' => 2438,
                'name' => 'Guanajuato',
                'country_id' => 142,
            ),
            438 => 
            array (
                'id' => 2439,
                'name' => 'Guerrero',
                'country_id' => 142,
            ),
            439 => 
            array (
                'id' => 2440,
                'name' => 'Hidalgo',
                'country_id' => 142,
            ),
            440 => 
            array (
                'id' => 2441,
                'name' => 'Jalisco',
                'country_id' => 142,
            ),
            441 => 
            array (
                'id' => 2442,
                'name' => 'Mexico',
                'country_id' => 142,
            ),
            442 => 
            array (
                'id' => 2443,
                'name' => 'Michoacan',
                'country_id' => 142,
            ),
            443 => 
            array (
                'id' => 2444,
                'name' => 'Morelos',
                'country_id' => 142,
            ),
            444 => 
            array (
                'id' => 2445,
                'name' => 'Nayarit',
                'country_id' => 142,
            ),
            445 => 
            array (
                'id' => 2446,
                'name' => 'Nuevo Leon',
                'country_id' => 142,
            ),
            446 => 
            array (
                'id' => 2447,
                'name' => 'Oaxaca',
                'country_id' => 142,
            ),
            447 => 
            array (
                'id' => 2448,
                'name' => 'Puebla',
                'country_id' => 142,
            ),
            448 => 
            array (
                'id' => 2449,
                'name' => 'Queretaro',
                'country_id' => 142,
            ),
            449 => 
            array (
                'id' => 2450,
                'name' => 'Quintana Roo',
                'country_id' => 142,
            ),
            450 => 
            array (
                'id' => 2451,
                'name' => 'San Luis Potosi',
                'country_id' => 142,
            ),
            451 => 
            array (
                'id' => 2452,
                'name' => 'Sinaloa',
                'country_id' => 142,
            ),
            452 => 
            array (
                'id' => 2453,
                'name' => 'Sonora',
                'country_id' => 142,
            ),
            453 => 
            array (
                'id' => 2454,
                'name' => 'Tabasco',
                'country_id' => 142,
            ),
            454 => 
            array (
                'id' => 2455,
                'name' => 'Tamaulipas',
                'country_id' => 142,
            ),
            455 => 
            array (
                'id' => 2456,
                'name' => 'Tlaxcala',
                'country_id' => 142,
            ),
            456 => 
            array (
                'id' => 2457,
                'name' => 'Veracruz',
                'country_id' => 142,
            ),
            457 => 
            array (
                'id' => 2458,
                'name' => 'Yucatan',
                'country_id' => 142,
            ),
            458 => 
            array (
                'id' => 2459,
                'name' => 'Zacatecas',
                'country_id' => 142,
            ),
            459 => 
            array (
                'id' => 2460,
                'name' => 'Chuuk',
                'country_id' => 143,
            ),
            460 => 
            array (
                'id' => 2461,
                'name' => 'Kusaie',
                'country_id' => 143,
            ),
            461 => 
            array (
                'id' => 2462,
                'name' => 'Pohnpei',
                'country_id' => 143,
            ),
            462 => 
            array (
                'id' => 2463,
                'name' => 'Yap',
                'country_id' => 143,
            ),
            463 => 
            array (
                'id' => 2464,
                'name' => 'Balti',
                'country_id' => 144,
            ),
            464 => 
            array (
                'id' => 2465,
                'name' => 'Cahul',
                'country_id' => 144,
            ),
            465 => 
            array (
                'id' => 2466,
                'name' => 'Chisinau',
                'country_id' => 144,
            ),
            466 => 
            array (
                'id' => 2467,
                'name' => 'Chisinau Oras',
                'country_id' => 144,
            ),
            467 => 
            array (
                'id' => 2468,
                'name' => 'Edinet',
                'country_id' => 144,
            ),
            468 => 
            array (
                'id' => 2469,
                'name' => 'Gagauzia',
                'country_id' => 144,
            ),
            469 => 
            array (
                'id' => 2470,
                'name' => 'Lapusna',
                'country_id' => 144,
            ),
            470 => 
            array (
                'id' => 2471,
                'name' => 'Orhei',
                'country_id' => 144,
            ),
            471 => 
            array (
                'id' => 2472,
                'name' => 'Soroca',
                'country_id' => 144,
            ),
            472 => 
            array (
                'id' => 2473,
                'name' => 'Taraclia',
                'country_id' => 144,
            ),
            473 => 
            array (
                'id' => 2474,
                'name' => 'Tighina',
                'country_id' => 144,
            ),
            474 => 
            array (
                'id' => 2475,
                'name' => 'Transnistria',
                'country_id' => 144,
            ),
            475 => 
            array (
                'id' => 2476,
                'name' => 'Ungheni',
                'country_id' => 144,
            ),
            476 => 
            array (
                'id' => 2477,
                'name' => 'Fontvieille',
                'country_id' => 145,
            ),
            477 => 
            array (
                'id' => 2478,
                'name' => 'La Condamine',
                'country_id' => 145,
            ),
            478 => 
            array (
                'id' => 2479,
                'name' => 'Monaco-Ville',
                'country_id' => 145,
            ),
            479 => 
            array (
                'id' => 2480,
                'name' => 'Monte Carlo',
                'country_id' => 145,
            ),
            480 => 
            array (
                'id' => 2481,
                'name' => 'Arhangaj',
                'country_id' => 146,
            ),
            481 => 
            array (
                'id' => 2482,
                'name' => 'Bajan-Olgij',
                'country_id' => 146,
            ),
            482 => 
            array (
                'id' => 2483,
                'name' => 'Bajanhongor',
                'country_id' => 146,
            ),
            483 => 
            array (
                'id' => 2484,
                'name' => 'Bulgan',
                'country_id' => 146,
            ),
            484 => 
            array (
                'id' => 2485,
                'name' => 'Darhan-Uul',
                'country_id' => 146,
            ),
            485 => 
            array (
                'id' => 2486,
                'name' => 'Dornod',
                'country_id' => 146,
            ),
            486 => 
            array (
                'id' => 2487,
                'name' => 'Dornogovi',
                'country_id' => 146,
            ),
            487 => 
            array (
                'id' => 2488,
                'name' => 'Dundgovi',
                'country_id' => 146,
            ),
            488 => 
            array (
                'id' => 2489,
                'name' => 'Govi-Altaj',
                'country_id' => 146,
            ),
            489 => 
            array (
                'id' => 2490,
                'name' => 'Govisumber',
                'country_id' => 146,
            ),
            490 => 
            array (
                'id' => 2491,
                'name' => 'Hentij',
                'country_id' => 146,
            ),
            491 => 
            array (
                'id' => 2492,
                'name' => 'Hovd',
                'country_id' => 146,
            ),
            492 => 
            array (
                'id' => 2493,
                'name' => 'Hovsgol',
                'country_id' => 146,
            ),
            493 => 
            array (
                'id' => 2494,
                'name' => 'Omnogovi',
                'country_id' => 146,
            ),
            494 => 
            array (
                'id' => 2495,
                'name' => 'Orhon',
                'country_id' => 146,
            ),
            495 => 
            array (
                'id' => 2496,
                'name' => 'Ovorhangaj',
                'country_id' => 146,
            ),
            496 => 
            array (
                'id' => 2497,
                'name' => 'Selenge',
                'country_id' => 146,
            ),
            497 => 
            array (
                'id' => 2498,
                'name' => 'Suhbaatar',
                'country_id' => 146,
            ),
            498 => 
            array (
                'id' => 2499,
                'name' => 'Tov',
                'country_id' => 146,
            ),
            499 => 
            array (
                'id' => 2500,
                'name' => 'Ulaanbaatar',
                'country_id' => 146,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 2501,
                'name' => 'Uvs',
                'country_id' => 146,
            ),
            1 => 
            array (
                'id' => 2502,
                'name' => 'Zavhan',
                'country_id' => 146,
            ),
            2 => 
            array (
                'id' => 2503,
                'name' => 'Montserrat',
                'country_id' => 147,
            ),
            3 => 
            array (
                'id' => 2504,
                'name' => 'Agadir',
                'country_id' => 148,
            ),
            4 => 
            array (
                'id' => 2505,
                'name' => 'Casablanca',
                'country_id' => 148,
            ),
            5 => 
            array (
                'id' => 2506,
                'name' => 'Chaouia-Ouardigha',
                'country_id' => 148,
            ),
            6 => 
            array (
                'id' => 2507,
                'name' => 'Doukkala-Abda',
                'country_id' => 148,
            ),
            7 => 
            array (
                'id' => 2508,
                'name' => 'Fes-Boulemane',
                'country_id' => 148,
            ),
            8 => 
            array (
                'id' => 2509,
                'name' => 'Gharb-Chrarda-Beni Hssen',
                'country_id' => 148,
            ),
            9 => 
            array (
                'id' => 2510,
                'name' => 'Guelmim',
                'country_id' => 148,
            ),
            10 => 
            array (
                'id' => 2511,
                'name' => 'Kenitra',
                'country_id' => 148,
            ),
            11 => 
            array (
                'id' => 2512,
                'name' => 'Marrakech-Tensift-Al Haouz',
                'country_id' => 148,
            ),
            12 => 
            array (
                'id' => 2513,
                'name' => 'Meknes-Tafilalet',
                'country_id' => 148,
            ),
            13 => 
            array (
                'id' => 2514,
                'name' => 'Oriental',
                'country_id' => 148,
            ),
            14 => 
            array (
                'id' => 2515,
                'name' => 'Oujda',
                'country_id' => 148,
            ),
            15 => 
            array (
                'id' => 2516,
                'name' => 'Province de Tanger',
                'country_id' => 148,
            ),
            16 => 
            array (
                'id' => 2517,
                'name' => 'Rabat-Sale-Zammour-Zaer',
                'country_id' => 148,
            ),
            17 => 
            array (
                'id' => 2518,
                'name' => 'Sala Al Jadida',
                'country_id' => 148,
            ),
            18 => 
            array (
                'id' => 2519,
                'name' => 'Settat',
                'country_id' => 148,
            ),
            19 => 
            array (
                'id' => 2520,
                'name' => 'Souss Massa-Draa',
                'country_id' => 148,
            ),
            20 => 
            array (
                'id' => 2521,
                'name' => 'Tadla-Azilal',
                'country_id' => 148,
            ),
            21 => 
            array (
                'id' => 2522,
                'name' => 'Tangier-Tetouan',
                'country_id' => 148,
            ),
            22 => 
            array (
                'id' => 2523,
                'name' => 'Taza-Al Hoceima-Taounate',
                'country_id' => 148,
            ),
            23 => 
            array (
                'id' => 2524,
                'name' => 'Wilaya de Casablanca',
                'country_id' => 148,
            ),
            24 => 
            array (
                'id' => 2525,
                'name' => 'Wilaya de Rabat-Sale',
                'country_id' => 148,
            ),
            25 => 
            array (
                'id' => 2526,
                'name' => 'Cabo Delgado',
                'country_id' => 149,
            ),
            26 => 
            array (
                'id' => 2527,
                'name' => 'Gaza',
                'country_id' => 149,
            ),
            27 => 
            array (
                'id' => 2528,
                'name' => 'Inhambane',
                'country_id' => 149,
            ),
            28 => 
            array (
                'id' => 2529,
                'name' => 'Manica',
                'country_id' => 149,
            ),
            29 => 
            array (
                'id' => 2530,
                'name' => 'Maputo',
                'country_id' => 149,
            ),
            30 => 
            array (
                'id' => 2531,
                'name' => 'Maputo Provincia',
                'country_id' => 149,
            ),
            31 => 
            array (
                'id' => 2532,
                'name' => 'Nampula',
                'country_id' => 149,
            ),
            32 => 
            array (
                'id' => 2533,
                'name' => 'Niassa',
                'country_id' => 149,
            ),
            33 => 
            array (
                'id' => 2534,
                'name' => 'Sofala',
                'country_id' => 149,
            ),
            34 => 
            array (
                'id' => 2535,
                'name' => 'Tete',
                'country_id' => 149,
            ),
            35 => 
            array (
                'id' => 2536,
                'name' => 'Zambezia',
                'country_id' => 149,
            ),
            36 => 
            array (
                'id' => 2537,
                'name' => 'Ayeyarwady',
                'country_id' => 150,
            ),
            37 => 
            array (
                'id' => 2538,
                'name' => 'Bago',
                'country_id' => 150,
            ),
            38 => 
            array (
                'id' => 2539,
                'name' => 'Chin',
                'country_id' => 150,
            ),
            39 => 
            array (
                'id' => 2540,
                'name' => 'Kachin',
                'country_id' => 150,
            ),
            40 => 
            array (
                'id' => 2541,
                'name' => 'Kayah',
                'country_id' => 150,
            ),
            41 => 
            array (
                'id' => 2542,
                'name' => 'Kayin',
                'country_id' => 150,
            ),
            42 => 
            array (
                'id' => 2543,
                'name' => 'Magway',
                'country_id' => 150,
            ),
            43 => 
            array (
                'id' => 2544,
                'name' => 'Mandalay',
                'country_id' => 150,
            ),
            44 => 
            array (
                'id' => 2545,
                'name' => 'Mon',
                'country_id' => 150,
            ),
            45 => 
            array (
                'id' => 2546,
                'name' => 'Nay Pyi Taw',
                'country_id' => 150,
            ),
            46 => 
            array (
                'id' => 2547,
                'name' => 'Rakhine',
                'country_id' => 150,
            ),
            47 => 
            array (
                'id' => 2548,
                'name' => 'Sagaing',
                'country_id' => 150,
            ),
            48 => 
            array (
                'id' => 2549,
                'name' => 'Shan',
                'country_id' => 150,
            ),
            49 => 
            array (
                'id' => 2550,
                'name' => 'Tanintharyi',
                'country_id' => 150,
            ),
            50 => 
            array (
                'id' => 2551,
                'name' => 'Yangon',
                'country_id' => 150,
            ),
            51 => 
            array (
                'id' => 2552,
                'name' => 'Caprivi',
                'country_id' => 151,
            ),
            52 => 
            array (
                'id' => 2553,
                'name' => 'Erongo',
                'country_id' => 151,
            ),
            53 => 
            array (
                'id' => 2554,
                'name' => 'Hardap',
                'country_id' => 151,
            ),
            54 => 
            array (
                'id' => 2555,
                'name' => 'Karas',
                'country_id' => 151,
            ),
            55 => 
            array (
                'id' => 2556,
                'name' => 'Kavango',
                'country_id' => 151,
            ),
            56 => 
            array (
                'id' => 2557,
                'name' => 'Khomas',
                'country_id' => 151,
            ),
            57 => 
            array (
                'id' => 2558,
                'name' => 'Kunene',
                'country_id' => 151,
            ),
            58 => 
            array (
                'id' => 2559,
                'name' => 'Ohangwena',
                'country_id' => 151,
            ),
            59 => 
            array (
                'id' => 2560,
                'name' => 'Omaheke',
                'country_id' => 151,
            ),
            60 => 
            array (
                'id' => 2561,
                'name' => 'Omusati',
                'country_id' => 151,
            ),
            61 => 
            array (
                'id' => 2562,
                'name' => 'Oshana',
                'country_id' => 151,
            ),
            62 => 
            array (
                'id' => 2563,
                'name' => 'Oshikoto',
                'country_id' => 151,
            ),
            63 => 
            array (
                'id' => 2564,
                'name' => 'Otjozondjupa',
                'country_id' => 151,
            ),
            64 => 
            array (
                'id' => 2565,
                'name' => 'Yaren',
                'country_id' => 152,
            ),
            65 => 
            array (
                'id' => 2566,
                'name' => 'Bagmati',
                'country_id' => 153,
            ),
            66 => 
            array (
                'id' => 2567,
                'name' => 'Bheri',
                'country_id' => 153,
            ),
            67 => 
            array (
                'id' => 2568,
                'name' => 'Dhawalagiri',
                'country_id' => 153,
            ),
            68 => 
            array (
                'id' => 2569,
                'name' => 'Gandaki',
                'country_id' => 153,
            ),
            69 => 
            array (
                'id' => 2570,
                'name' => 'Janakpur',
                'country_id' => 153,
            ),
            70 => 
            array (
                'id' => 2571,
                'name' => 'Karnali',
                'country_id' => 153,
            ),
            71 => 
            array (
                'id' => 2572,
                'name' => 'Koshi',
                'country_id' => 153,
            ),
            72 => 
            array (
                'id' => 2573,
                'name' => 'Lumbini',
                'country_id' => 153,
            ),
            73 => 
            array (
                'id' => 2574,
                'name' => 'Mahakali',
                'country_id' => 153,
            ),
            74 => 
            array (
                'id' => 2575,
                'name' => 'Mechi',
                'country_id' => 153,
            ),
            75 => 
            array (
                'id' => 2576,
                'name' => 'Narayani',
                'country_id' => 153,
            ),
            76 => 
            array (
                'id' => 2577,
                'name' => 'Rapti',
                'country_id' => 153,
            ),
            77 => 
            array (
                'id' => 2578,
                'name' => 'Sagarmatha',
                'country_id' => 153,
            ),
            78 => 
            array (
                'id' => 2579,
                'name' => 'Seti',
                'country_id' => 153,
            ),
            79 => 
            array (
                'id' => 2580,
                'name' => 'Bonaire',
                'country_id' => 154,
            ),
            80 => 
            array (
                'id' => 2581,
                'name' => 'Curacao',
                'country_id' => 154,
            ),
            81 => 
            array (
                'id' => 2582,
                'name' => 'Saba',
                'country_id' => 154,
            ),
            82 => 
            array (
                'id' => 2583,
                'name' => 'Sint Eustatius',
                'country_id' => 154,
            ),
            83 => 
            array (
                'id' => 2584,
                'name' => 'Sint Maarten',
                'country_id' => 154,
            ),
            84 => 
            array (
                'id' => 2585,
                'name' => 'Amsterdam',
                'country_id' => 155,
            ),
            85 => 
            array (
                'id' => 2586,
                'name' => 'Benelux',
                'country_id' => 155,
            ),
            86 => 
            array (
                'id' => 2587,
                'name' => 'Drenthe',
                'country_id' => 155,
            ),
            87 => 
            array (
                'id' => 2588,
                'name' => 'Flevoland',
                'country_id' => 155,
            ),
            88 => 
            array (
                'id' => 2589,
                'name' => 'Friesland',
                'country_id' => 155,
            ),
            89 => 
            array (
                'id' => 2590,
                'name' => 'Gelderland',
                'country_id' => 155,
            ),
            90 => 
            array (
                'id' => 2591,
                'name' => 'Groningen',
                'country_id' => 155,
            ),
            91 => 
            array (
                'id' => 2592,
                'name' => 'Limburg',
                'country_id' => 155,
            ),
            92 => 
            array (
                'id' => 2593,
                'name' => 'Noord-Brabant',
                'country_id' => 155,
            ),
            93 => 
            array (
                'id' => 2594,
                'name' => 'Noord-Holland',
                'country_id' => 155,
            ),
            94 => 
            array (
                'id' => 2595,
                'name' => 'Overijssel',
                'country_id' => 155,
            ),
            95 => 
            array (
                'id' => 2596,
                'name' => 'South Holland',
                'country_id' => 155,
            ),
            96 => 
            array (
                'id' => 2597,
                'name' => 'Utrecht',
                'country_id' => 155,
            ),
            97 => 
            array (
                'id' => 2598,
                'name' => 'Zeeland',
                'country_id' => 155,
            ),
            98 => 
            array (
                'id' => 2599,
                'name' => 'Zuid-Holland',
                'country_id' => 155,
            ),
            99 => 
            array (
                'id' => 2600,
                'name' => 'Iles',
                'country_id' => 156,
            ),
            100 => 
            array (
                'id' => 2601,
                'name' => 'Nord',
                'country_id' => 156,
            ),
            101 => 
            array (
                'id' => 2602,
                'name' => 'Sud',
                'country_id' => 156,
            ),
            102 => 
            array (
                'id' => 2603,
                'name' => 'Area Outside Region',
                'country_id' => 157,
            ),
            103 => 
            array (
                'id' => 2604,
                'name' => 'Auckland',
                'country_id' => 157,
            ),
            104 => 
            array (
                'id' => 2605,
                'name' => 'Bay of Plenty',
                'country_id' => 157,
            ),
            105 => 
            array (
                'id' => 2606,
                'name' => 'Canterbury',
                'country_id' => 157,
            ),
            106 => 
            array (
                'id' => 2607,
                'name' => 'Christchurch',
                'country_id' => 157,
            ),
            107 => 
            array (
                'id' => 2608,
                'name' => 'Gisborne',
                'country_id' => 157,
            ),
            108 => 
            array (
                'id' => 2609,
                'name' => 'Hawke\'s Bay',
                'country_id' => 157,
            ),
            109 => 
            array (
                'id' => 2610,
                'name' => 'Manawatu-Wanganui',
                'country_id' => 157,
            ),
            110 => 
            array (
                'id' => 2611,
                'name' => 'Marlborough',
                'country_id' => 157,
            ),
            111 => 
            array (
                'id' => 2612,
                'name' => 'Nelson',
                'country_id' => 157,
            ),
            112 => 
            array (
                'id' => 2613,
                'name' => 'Northland',
                'country_id' => 157,
            ),
            113 => 
            array (
                'id' => 2614,
                'name' => 'Otago',
                'country_id' => 157,
            ),
            114 => 
            array (
                'id' => 2615,
                'name' => 'Rodney',
                'country_id' => 157,
            ),
            115 => 
            array (
                'id' => 2616,
                'name' => 'Southland',
                'country_id' => 157,
            ),
            116 => 
            array (
                'id' => 2617,
                'name' => 'Taranaki',
                'country_id' => 157,
            ),
            117 => 
            array (
                'id' => 2618,
                'name' => 'Tasman',
                'country_id' => 157,
            ),
            118 => 
            array (
                'id' => 2619,
                'name' => 'Waikato',
                'country_id' => 157,
            ),
            119 => 
            array (
                'id' => 2620,
                'name' => 'Wellington',
                'country_id' => 157,
            ),
            120 => 
            array (
                'id' => 2621,
                'name' => 'West Coast',
                'country_id' => 157,
            ),
            121 => 
            array (
                'id' => 2622,
                'name' => 'Atlantico Norte',
                'country_id' => 158,
            ),
            122 => 
            array (
                'id' => 2623,
                'name' => 'Atlantico Sur',
                'country_id' => 158,
            ),
            123 => 
            array (
                'id' => 2624,
                'name' => 'Boaco',
                'country_id' => 158,
            ),
            124 => 
            array (
                'id' => 2625,
                'name' => 'Carazo',
                'country_id' => 158,
            ),
            125 => 
            array (
                'id' => 2626,
                'name' => 'Chinandega',
                'country_id' => 158,
            ),
            126 => 
            array (
                'id' => 2627,
                'name' => 'Chontales',
                'country_id' => 158,
            ),
            127 => 
            array (
                'id' => 2628,
                'name' => 'Esteli',
                'country_id' => 158,
            ),
            128 => 
            array (
                'id' => 2629,
                'name' => 'Granada',
                'country_id' => 158,
            ),
            129 => 
            array (
                'id' => 2630,
                'name' => 'Jinotega',
                'country_id' => 158,
            ),
            130 => 
            array (
                'id' => 2631,
                'name' => 'Leon',
                'country_id' => 158,
            ),
            131 => 
            array (
                'id' => 2632,
                'name' => 'Madriz',
                'country_id' => 158,
            ),
            132 => 
            array (
                'id' => 2633,
                'name' => 'Managua',
                'country_id' => 158,
            ),
            133 => 
            array (
                'id' => 2634,
                'name' => 'Masaya',
                'country_id' => 158,
            ),
            134 => 
            array (
                'id' => 2635,
                'name' => 'Matagalpa',
                'country_id' => 158,
            ),
            135 => 
            array (
                'id' => 2636,
                'name' => 'Nueva Segovia',
                'country_id' => 158,
            ),
            136 => 
            array (
                'id' => 2637,
                'name' => 'Rio San Juan',
                'country_id' => 158,
            ),
            137 => 
            array (
                'id' => 2638,
                'name' => 'Rivas',
                'country_id' => 158,
            ),
            138 => 
            array (
                'id' => 2639,
                'name' => 'Agadez',
                'country_id' => 159,
            ),
            139 => 
            array (
                'id' => 2640,
                'name' => 'Diffa',
                'country_id' => 159,
            ),
            140 => 
            array (
                'id' => 2641,
                'name' => 'Dosso',
                'country_id' => 159,
            ),
            141 => 
            array (
                'id' => 2642,
                'name' => 'Maradi',
                'country_id' => 159,
            ),
            142 => 
            array (
                'id' => 2643,
                'name' => 'Niamey',
                'country_id' => 159,
            ),
            143 => 
            array (
                'id' => 2644,
                'name' => 'Tahoua',
                'country_id' => 159,
            ),
            144 => 
            array (
                'id' => 2645,
                'name' => 'Tillabery',
                'country_id' => 159,
            ),
            145 => 
            array (
                'id' => 2646,
                'name' => 'Zinder',
                'country_id' => 159,
            ),
            146 => 
            array (
                'id' => 2647,
                'name' => 'Abia',
                'country_id' => 160,
            ),
            147 => 
            array (
                'id' => 2648,
                'name' => 'Abuja Federal Capital Territor',
                'country_id' => 160,
            ),
            148 => 
            array (
                'id' => 2649,
                'name' => 'Adamawa',
                'country_id' => 160,
            ),
            149 => 
            array (
                'id' => 2650,
                'name' => 'Akwa Ibom',
                'country_id' => 160,
            ),
            150 => 
            array (
                'id' => 2651,
                'name' => 'Anambra',
                'country_id' => 160,
            ),
            151 => 
            array (
                'id' => 2652,
                'name' => 'Bauchi',
                'country_id' => 160,
            ),
            152 => 
            array (
                'id' => 2653,
                'name' => 'Bayelsa',
                'country_id' => 160,
            ),
            153 => 
            array (
                'id' => 2654,
                'name' => 'Benue',
                'country_id' => 160,
            ),
            154 => 
            array (
                'id' => 2655,
                'name' => 'Borno',
                'country_id' => 160,
            ),
            155 => 
            array (
                'id' => 2656,
                'name' => 'Cross River',
                'country_id' => 160,
            ),
            156 => 
            array (
                'id' => 2657,
                'name' => 'Delta',
                'country_id' => 160,
            ),
            157 => 
            array (
                'id' => 2658,
                'name' => 'Ebonyi',
                'country_id' => 160,
            ),
            158 => 
            array (
                'id' => 2659,
                'name' => 'Edo',
                'country_id' => 160,
            ),
            159 => 
            array (
                'id' => 2660,
                'name' => 'Ekiti',
                'country_id' => 160,
            ),
            160 => 
            array (
                'id' => 2661,
                'name' => 'Enugu',
                'country_id' => 160,
            ),
            161 => 
            array (
                'id' => 2662,
                'name' => 'Gombe',
                'country_id' => 160,
            ),
            162 => 
            array (
                'id' => 2663,
                'name' => 'Imo',
                'country_id' => 160,
            ),
            163 => 
            array (
                'id' => 2664,
                'name' => 'Jigawa',
                'country_id' => 160,
            ),
            164 => 
            array (
                'id' => 2665,
                'name' => 'Kaduna',
                'country_id' => 160,
            ),
            165 => 
            array (
                'id' => 2666,
                'name' => 'Kano',
                'country_id' => 160,
            ),
            166 => 
            array (
                'id' => 2667,
                'name' => 'Katsina',
                'country_id' => 160,
            ),
            167 => 
            array (
                'id' => 2668,
                'name' => 'Kebbi',
                'country_id' => 160,
            ),
            168 => 
            array (
                'id' => 2669,
                'name' => 'Kogi',
                'country_id' => 160,
            ),
            169 => 
            array (
                'id' => 2670,
                'name' => 'Kwara',
                'country_id' => 160,
            ),
            170 => 
            array (
                'id' => 2671,
                'name' => 'Lagos',
                'country_id' => 160,
            ),
            171 => 
            array (
                'id' => 2672,
                'name' => 'Nassarawa',
                'country_id' => 160,
            ),
            172 => 
            array (
                'id' => 2673,
                'name' => 'Niger',
                'country_id' => 160,
            ),
            173 => 
            array (
                'id' => 2674,
                'name' => 'Ogun',
                'country_id' => 160,
            ),
            174 => 
            array (
                'id' => 2675,
                'name' => 'Ondo',
                'country_id' => 160,
            ),
            175 => 
            array (
                'id' => 2676,
                'name' => 'Osun',
                'country_id' => 160,
            ),
            176 => 
            array (
                'id' => 2677,
                'name' => 'Oyo',
                'country_id' => 160,
            ),
            177 => 
            array (
                'id' => 2678,
                'name' => 'Plateau',
                'country_id' => 160,
            ),
            178 => 
            array (
                'id' => 2679,
                'name' => 'Rivers',
                'country_id' => 160,
            ),
            179 => 
            array (
                'id' => 2680,
                'name' => 'Sokoto',
                'country_id' => 160,
            ),
            180 => 
            array (
                'id' => 2681,
                'name' => 'Taraba',
                'country_id' => 160,
            ),
            181 => 
            array (
                'id' => 2682,
                'name' => 'Yobe',
                'country_id' => 160,
            ),
            182 => 
            array (
                'id' => 2683,
                'name' => 'Zamfara',
                'country_id' => 160,
            ),
            183 => 
            array (
                'id' => 2684,
                'name' => 'Niue',
                'country_id' => 161,
            ),
            184 => 
            array (
                'id' => 2685,
                'name' => 'Norfolk Island',
                'country_id' => 162,
            ),
            185 => 
            array (
                'id' => 2686,
                'name' => 'Northern Islands',
                'country_id' => 163,
            ),
            186 => 
            array (
                'id' => 2687,
                'name' => 'Rota',
                'country_id' => 163,
            ),
            187 => 
            array (
                'id' => 2688,
                'name' => 'Saipan',
                'country_id' => 163,
            ),
            188 => 
            array (
                'id' => 2689,
                'name' => 'Tinian',
                'country_id' => 163,
            ),
            189 => 
            array (
                'id' => 2690,
                'name' => 'Akershus',
                'country_id' => 164,
            ),
            190 => 
            array (
                'id' => 2691,
                'name' => 'Aust Agder',
                'country_id' => 164,
            ),
            191 => 
            array (
                'id' => 2692,
                'name' => 'Bergen',
                'country_id' => 164,
            ),
            192 => 
            array (
                'id' => 2693,
                'name' => 'Buskerud',
                'country_id' => 164,
            ),
            193 => 
            array (
                'id' => 2694,
                'name' => 'Finnmark',
                'country_id' => 164,
            ),
            194 => 
            array (
                'id' => 2695,
                'name' => 'Hedmark',
                'country_id' => 164,
            ),
            195 => 
            array (
                'id' => 2696,
                'name' => 'Hordaland',
                'country_id' => 164,
            ),
            196 => 
            array (
                'id' => 2697,
                'name' => 'Moere og Romsdal',
                'country_id' => 164,
            ),
            197 => 
            array (
                'id' => 2698,
                'name' => 'Nord Trondelag',
                'country_id' => 164,
            ),
            198 => 
            array (
                'id' => 2699,
                'name' => 'Nordland',
                'country_id' => 164,
            ),
            199 => 
            array (
                'id' => 2700,
                'name' => 'Oestfold',
                'country_id' => 164,
            ),
            200 => 
            array (
                'id' => 2701,
                'name' => 'Oppland',
                'country_id' => 164,
            ),
            201 => 
            array (
                'id' => 2702,
                'name' => 'Oslo',
                'country_id' => 164,
            ),
            202 => 
            array (
                'id' => 2703,
                'name' => 'Rogaland',
                'country_id' => 164,
            ),
            203 => 
            array (
                'id' => 2704,
                'name' => 'Soer Troendelag',
                'country_id' => 164,
            ),
            204 => 
            array (
                'id' => 2705,
                'name' => 'Sogn og Fjordane',
                'country_id' => 164,
            ),
            205 => 
            array (
                'id' => 2706,
                'name' => 'Stavern',
                'country_id' => 164,
            ),
            206 => 
            array (
                'id' => 2707,
                'name' => 'Sykkylven',
                'country_id' => 164,
            ),
            207 => 
            array (
                'id' => 2708,
                'name' => 'Telemark',
                'country_id' => 164,
            ),
            208 => 
            array (
                'id' => 2709,
                'name' => 'Troms',
                'country_id' => 164,
            ),
            209 => 
            array (
                'id' => 2710,
                'name' => 'Vest Agder',
                'country_id' => 164,
            ),
            210 => 
            array (
                'id' => 2711,
                'name' => 'Vestfold',
                'country_id' => 164,
            ),
            211 => 
            array (
                'id' => 2712,
                'name' => 'ÃƒÆ’Ã‚Ëœstfold',
                'country_id' => 164,
            ),
            212 => 
            array (
                'id' => 2713,
                'name' => 'Al Buraimi',
                'country_id' => 165,
            ),
            213 => 
            array (
                'id' => 2714,
                'name' => 'Dhufar',
                'country_id' => 165,
            ),
            214 => 
            array (
                'id' => 2715,
                'name' => 'Masqat',
                'country_id' => 165,
            ),
            215 => 
            array (
                'id' => 2716,
                'name' => 'Musandam',
                'country_id' => 165,
            ),
            216 => 
            array (
                'id' => 2717,
                'name' => 'Rusayl',
                'country_id' => 165,
            ),
            217 => 
            array (
                'id' => 2718,
                'name' => 'Wadi Kabir',
                'country_id' => 165,
            ),
            218 => 
            array (
                'id' => 2719,
                'name' => 'ad-Dakhiliyah',
                'country_id' => 165,
            ),
            219 => 
            array (
                'id' => 2720,
                'name' => 'adh-Dhahirah',
                'country_id' => 165,
            ),
            220 => 
            array (
                'id' => 2721,
                'name' => 'al-Batinah',
                'country_id' => 165,
            ),
            221 => 
            array (
                'id' => 2722,
                'name' => 'ash-Sharqiyah',
                'country_id' => 165,
            ),
            222 => 
            array (
                'id' => 2723,
                'name' => 'Baluchistan',
                'country_id' => 166,
            ),
            223 => 
            array (
                'id' => 2724,
                'name' => 'Federal Capital Area',
                'country_id' => 166,
            ),
            224 => 
            array (
                'id' => 2725,
                'name' => 'Federally administered Tribal ',
                'country_id' => 166,
            ),
            225 => 
            array (
                'id' => 2726,
                'name' => 'North-West Frontier',
                'country_id' => 166,
            ),
            226 => 
            array (
                'id' => 2727,
                'name' => 'Northern Areas',
                'country_id' => 166,
            ),
            227 => 
            array (
                'id' => 2728,
                'name' => 'Punjab',
                'country_id' => 166,
            ),
            228 => 
            array (
                'id' => 2729,
                'name' => 'Sind',
                'country_id' => 166,
            ),
            229 => 
            array (
                'id' => 2730,
                'name' => 'Aimeliik',
                'country_id' => 167,
            ),
            230 => 
            array (
                'id' => 2731,
                'name' => 'Airai',
                'country_id' => 167,
            ),
            231 => 
            array (
                'id' => 2732,
                'name' => 'Angaur',
                'country_id' => 167,
            ),
            232 => 
            array (
                'id' => 2733,
                'name' => 'Hatobohei',
                'country_id' => 167,
            ),
            233 => 
            array (
                'id' => 2734,
                'name' => 'Kayangel',
                'country_id' => 167,
            ),
            234 => 
            array (
                'id' => 2735,
                'name' => 'Koror',
                'country_id' => 167,
            ),
            235 => 
            array (
                'id' => 2736,
                'name' => 'Melekeok',
                'country_id' => 167,
            ),
            236 => 
            array (
                'id' => 2737,
                'name' => 'Ngaraard',
                'country_id' => 167,
            ),
            237 => 
            array (
                'id' => 2738,
                'name' => 'Ngardmau',
                'country_id' => 167,
            ),
            238 => 
            array (
                'id' => 2739,
                'name' => 'Ngaremlengui',
                'country_id' => 167,
            ),
            239 => 
            array (
                'id' => 2740,
                'name' => 'Ngatpang',
                'country_id' => 167,
            ),
            240 => 
            array (
                'id' => 2741,
                'name' => 'Ngchesar',
                'country_id' => 167,
            ),
            241 => 
            array (
                'id' => 2742,
                'name' => 'Ngerchelong',
                'country_id' => 167,
            ),
            242 => 
            array (
                'id' => 2743,
                'name' => 'Ngiwal',
                'country_id' => 167,
            ),
            243 => 
            array (
                'id' => 2744,
                'name' => 'Peleliu',
                'country_id' => 167,
            ),
            244 => 
            array (
                'id' => 2745,
                'name' => 'Sonsorol',
                'country_id' => 167,
            ),
            245 => 
            array (
                'id' => 2746,
                'name' => 'Ariha',
                'country_id' => 168,
            ),
            246 => 
            array (
                'id' => 2747,
                'name' => 'Bayt Lahm',
                'country_id' => 168,
            ),
            247 => 
            array (
                'id' => 2748,
                'name' => 'Bethlehem',
                'country_id' => 168,
            ),
            248 => 
            array (
                'id' => 2749,
                'name' => 'Dayr-al-Balah',
                'country_id' => 168,
            ),
            249 => 
            array (
                'id' => 2750,
                'name' => 'Ghazzah',
                'country_id' => 168,
            ),
            250 => 
            array (
                'id' => 2751,
                'name' => 'Ghazzah ash-Shamaliyah',
                'country_id' => 168,
            ),
            251 => 
            array (
                'id' => 2752,
                'name' => 'Janin',
                'country_id' => 168,
            ),
            252 => 
            array (
                'id' => 2753,
                'name' => 'Khan Yunis',
                'country_id' => 168,
            ),
            253 => 
            array (
                'id' => 2754,
                'name' => 'Nabulus',
                'country_id' => 168,
            ),
            254 => 
            array (
                'id' => 2755,
                'name' => 'Qalqilyah',
                'country_id' => 168,
            ),
            255 => 
            array (
                'id' => 2756,
                'name' => 'Rafah',
                'country_id' => 168,
            ),
            256 => 
            array (
                'id' => 2757,
                'name' => 'Ram Allah wal-Birah',
                'country_id' => 168,
            ),
            257 => 
            array (
                'id' => 2758,
                'name' => 'Salfit',
                'country_id' => 168,
            ),
            258 => 
            array (
                'id' => 2759,
                'name' => 'Tubas',
                'country_id' => 168,
            ),
            259 => 
            array (
                'id' => 2760,
                'name' => 'Tulkarm',
                'country_id' => 168,
            ),
            260 => 
            array (
                'id' => 2761,
                'name' => 'al-Khalil',
                'country_id' => 168,
            ),
            261 => 
            array (
                'id' => 2762,
                'name' => 'al-Quds',
                'country_id' => 168,
            ),
            262 => 
            array (
                'id' => 2763,
                'name' => 'Bocas del Toro',
                'country_id' => 169,
            ),
            263 => 
            array (
                'id' => 2764,
                'name' => 'Chiriqui',
                'country_id' => 169,
            ),
            264 => 
            array (
                'id' => 2765,
                'name' => 'Cocle',
                'country_id' => 169,
            ),
            265 => 
            array (
                'id' => 2766,
                'name' => 'Colon',
                'country_id' => 169,
            ),
            266 => 
            array (
                'id' => 2767,
                'name' => 'Darien',
                'country_id' => 169,
            ),
            267 => 
            array (
                'id' => 2768,
                'name' => 'Embera',
                'country_id' => 169,
            ),
            268 => 
            array (
                'id' => 2769,
                'name' => 'Herrera',
                'country_id' => 169,
            ),
            269 => 
            array (
                'id' => 2770,
                'name' => 'Kuna Yala',
                'country_id' => 169,
            ),
            270 => 
            array (
                'id' => 2771,
                'name' => 'Los Santos',
                'country_id' => 169,
            ),
            271 => 
            array (
                'id' => 2772,
                'name' => 'Ngobe Bugle',
                'country_id' => 169,
            ),
            272 => 
            array (
                'id' => 2773,
                'name' => 'Panama',
                'country_id' => 169,
            ),
            273 => 
            array (
                'id' => 2774,
                'name' => 'Veraguas',
                'country_id' => 169,
            ),
            274 => 
            array (
                'id' => 2775,
                'name' => 'East New Britain',
                'country_id' => 170,
            ),
            275 => 
            array (
                'id' => 2776,
                'name' => 'East Sepik',
                'country_id' => 170,
            ),
            276 => 
            array (
                'id' => 2777,
                'name' => 'Eastern Highlands',
                'country_id' => 170,
            ),
            277 => 
            array (
                'id' => 2778,
                'name' => 'Enga',
                'country_id' => 170,
            ),
            278 => 
            array (
                'id' => 2779,
                'name' => 'Fly River',
                'country_id' => 170,
            ),
            279 => 
            array (
                'id' => 2780,
                'name' => 'Gulf',
                'country_id' => 170,
            ),
            280 => 
            array (
                'id' => 2781,
                'name' => 'Madang',
                'country_id' => 170,
            ),
            281 => 
            array (
                'id' => 2782,
                'name' => 'Manus',
                'country_id' => 170,
            ),
            282 => 
            array (
                'id' => 2783,
                'name' => 'Milne Bay',
                'country_id' => 170,
            ),
            283 => 
            array (
                'id' => 2784,
                'name' => 'Morobe',
                'country_id' => 170,
            ),
            284 => 
            array (
                'id' => 2785,
                'name' => 'National Capital District',
                'country_id' => 170,
            ),
            285 => 
            array (
                'id' => 2786,
                'name' => 'New Ireland',
                'country_id' => 170,
            ),
            286 => 
            array (
                'id' => 2787,
                'name' => 'North Solomons',
                'country_id' => 170,
            ),
            287 => 
            array (
                'id' => 2788,
                'name' => 'Oro',
                'country_id' => 170,
            ),
            288 => 
            array (
                'id' => 2789,
                'name' => 'Sandaun',
                'country_id' => 170,
            ),
            289 => 
            array (
                'id' => 2790,
                'name' => 'Simbu',
                'country_id' => 170,
            ),
            290 => 
            array (
                'id' => 2791,
                'name' => 'Southern Highlands',
                'country_id' => 170,
            ),
            291 => 
            array (
                'id' => 2792,
                'name' => 'West New Britain',
                'country_id' => 170,
            ),
            292 => 
            array (
                'id' => 2793,
                'name' => 'Western Highlands',
                'country_id' => 170,
            ),
            293 => 
            array (
                'id' => 2794,
                'name' => 'Alto Paraguay',
                'country_id' => 171,
            ),
            294 => 
            array (
                'id' => 2795,
                'name' => 'Alto Parana',
                'country_id' => 171,
            ),
            295 => 
            array (
                'id' => 2796,
                'name' => 'Amambay',
                'country_id' => 171,
            ),
            296 => 
            array (
                'id' => 2797,
                'name' => 'Asuncion',
                'country_id' => 171,
            ),
            297 => 
            array (
                'id' => 2798,
                'name' => 'Boqueron',
                'country_id' => 171,
            ),
            298 => 
            array (
                'id' => 2799,
                'name' => 'Caaguazu',
                'country_id' => 171,
            ),
            299 => 
            array (
                'id' => 2800,
                'name' => 'Caazapa',
                'country_id' => 171,
            ),
            300 => 
            array (
                'id' => 2801,
                'name' => 'Canendiyu',
                'country_id' => 171,
            ),
            301 => 
            array (
                'id' => 2802,
                'name' => 'Central',
                'country_id' => 171,
            ),
            302 => 
            array (
                'id' => 2803,
                'name' => 'Concepcion',
                'country_id' => 171,
            ),
            303 => 
            array (
                'id' => 2804,
                'name' => 'Cordillera',
                'country_id' => 171,
            ),
            304 => 
            array (
                'id' => 2805,
                'name' => 'Guaira',
                'country_id' => 171,
            ),
            305 => 
            array (
                'id' => 2806,
                'name' => 'Itapua',
                'country_id' => 171,
            ),
            306 => 
            array (
                'id' => 2807,
                'name' => 'Misiones',
                'country_id' => 171,
            ),
            307 => 
            array (
                'id' => 2808,
                'name' => 'Neembucu',
                'country_id' => 171,
            ),
            308 => 
            array (
                'id' => 2809,
                'name' => 'Paraguari',
                'country_id' => 171,
            ),
            309 => 
            array (
                'id' => 2810,
                'name' => 'Presidente Hayes',
                'country_id' => 171,
            ),
            310 => 
            array (
                'id' => 2811,
                'name' => 'San Pedro',
                'country_id' => 171,
            ),
            311 => 
            array (
                'id' => 2812,
                'name' => 'Amazonas',
                'country_id' => 172,
            ),
            312 => 
            array (
                'id' => 2813,
                'name' => 'Ancash',
                'country_id' => 172,
            ),
            313 => 
            array (
                'id' => 2814,
                'name' => 'Apurimac',
                'country_id' => 172,
            ),
            314 => 
            array (
                'id' => 2815,
                'name' => 'Arequipa',
                'country_id' => 172,
            ),
            315 => 
            array (
                'id' => 2816,
                'name' => 'Ayacucho',
                'country_id' => 172,
            ),
            316 => 
            array (
                'id' => 2817,
                'name' => 'Cajamarca',
                'country_id' => 172,
            ),
            317 => 
            array (
                'id' => 2818,
                'name' => 'Cusco',
                'country_id' => 172,
            ),
            318 => 
            array (
                'id' => 2819,
                'name' => 'Huancavelica',
                'country_id' => 172,
            ),
            319 => 
            array (
                'id' => 2820,
                'name' => 'Huanuco',
                'country_id' => 172,
            ),
            320 => 
            array (
                'id' => 2821,
                'name' => 'Ica',
                'country_id' => 172,
            ),
            321 => 
            array (
                'id' => 2822,
                'name' => 'Junin',
                'country_id' => 172,
            ),
            322 => 
            array (
                'id' => 2823,
                'name' => 'La Libertad',
                'country_id' => 172,
            ),
            323 => 
            array (
                'id' => 2824,
                'name' => 'Lambayeque',
                'country_id' => 172,
            ),
            324 => 
            array (
                'id' => 2825,
                'name' => 'Lima y Callao',
                'country_id' => 172,
            ),
            325 => 
            array (
                'id' => 2826,
                'name' => 'Loreto',
                'country_id' => 172,
            ),
            326 => 
            array (
                'id' => 2827,
                'name' => 'Madre de Dios',
                'country_id' => 172,
            ),
            327 => 
            array (
                'id' => 2828,
                'name' => 'Moquegua',
                'country_id' => 172,
            ),
            328 => 
            array (
                'id' => 2829,
                'name' => 'Pasco',
                'country_id' => 172,
            ),
            329 => 
            array (
                'id' => 2830,
                'name' => 'Piura',
                'country_id' => 172,
            ),
            330 => 
            array (
                'id' => 2831,
                'name' => 'Puno',
                'country_id' => 172,
            ),
            331 => 
            array (
                'id' => 2832,
                'name' => 'San Martin',
                'country_id' => 172,
            ),
            332 => 
            array (
                'id' => 2833,
                'name' => 'Tacna',
                'country_id' => 172,
            ),
            333 => 
            array (
                'id' => 2834,
                'name' => 'Tumbes',
                'country_id' => 172,
            ),
            334 => 
            array (
                'id' => 2835,
                'name' => 'Ucayali',
                'country_id' => 172,
            ),
            335 => 
            array (
                'id' => 2836,
                'name' => 'Batangas',
                'country_id' => 173,
            ),
            336 => 
            array (
                'id' => 2837,
                'name' => 'Bicol',
                'country_id' => 173,
            ),
            337 => 
            array (
                'id' => 2838,
                'name' => 'Bulacan',
                'country_id' => 173,
            ),
            338 => 
            array (
                'id' => 2839,
                'name' => 'Cagayan',
                'country_id' => 173,
            ),
            339 => 
            array (
                'id' => 2840,
                'name' => 'Caraga',
                'country_id' => 173,
            ),
            340 => 
            array (
                'id' => 2841,
                'name' => 'Central Luzon',
                'country_id' => 173,
            ),
            341 => 
            array (
                'id' => 2842,
                'name' => 'Central Mindanao',
                'country_id' => 173,
            ),
            342 => 
            array (
                'id' => 2843,
                'name' => 'Central Visayas',
                'country_id' => 173,
            ),
            343 => 
            array (
                'id' => 2844,
                'name' => 'Cordillera',
                'country_id' => 173,
            ),
            344 => 
            array (
                'id' => 2845,
                'name' => 'Davao',
                'country_id' => 173,
            ),
            345 => 
            array (
                'id' => 2846,
                'name' => 'Eastern Visayas',
                'country_id' => 173,
            ),
            346 => 
            array (
                'id' => 2847,
                'name' => 'Greater Metropolitan Area',
                'country_id' => 173,
            ),
            347 => 
            array (
                'id' => 2848,
                'name' => 'Ilocos',
                'country_id' => 173,
            ),
            348 => 
            array (
                'id' => 2849,
                'name' => 'Laguna',
                'country_id' => 173,
            ),
            349 => 
            array (
                'id' => 2850,
                'name' => 'Luzon',
                'country_id' => 173,
            ),
            350 => 
            array (
                'id' => 2851,
                'name' => 'Mactan',
                'country_id' => 173,
            ),
            351 => 
            array (
                'id' => 2852,
                'name' => 'Metropolitan Manila Area',
                'country_id' => 173,
            ),
            352 => 
            array (
                'id' => 2853,
                'name' => 'Muslim Mindanao',
                'country_id' => 173,
            ),
            353 => 
            array (
                'id' => 2854,
                'name' => 'Northern Mindanao',
                'country_id' => 173,
            ),
            354 => 
            array (
                'id' => 2855,
                'name' => 'Southern Mindanao',
                'country_id' => 173,
            ),
            355 => 
            array (
                'id' => 2856,
                'name' => 'Southern Tagalog',
                'country_id' => 173,
            ),
            356 => 
            array (
                'id' => 2857,
                'name' => 'Western Mindanao',
                'country_id' => 173,
            ),
            357 => 
            array (
                'id' => 2858,
                'name' => 'Western Visayas',
                'country_id' => 173,
            ),
            358 => 
            array (
                'id' => 2859,
                'name' => 'Pitcairn Island',
                'country_id' => 174,
            ),
            359 => 
            array (
                'id' => 2860,
                'name' => 'Biale Blota',
                'country_id' => 175,
            ),
            360 => 
            array (
                'id' => 2861,
                'name' => 'Dobroszyce',
                'country_id' => 175,
            ),
            361 => 
            array (
                'id' => 2862,
                'name' => 'Dolnoslaskie',
                'country_id' => 175,
            ),
            362 => 
            array (
                'id' => 2863,
                'name' => 'Dziekanow Lesny',
                'country_id' => 175,
            ),
            363 => 
            array (
                'id' => 2864,
                'name' => 'Hopowo',
                'country_id' => 175,
            ),
            364 => 
            array (
                'id' => 2865,
                'name' => 'Kartuzy',
                'country_id' => 175,
            ),
            365 => 
            array (
                'id' => 2866,
                'name' => 'Koscian',
                'country_id' => 175,
            ),
            366 => 
            array (
                'id' => 2867,
                'name' => 'Krakow',
                'country_id' => 175,
            ),
            367 => 
            array (
                'id' => 2868,
                'name' => 'Kujawsko-Pomorskie',
                'country_id' => 175,
            ),
            368 => 
            array (
                'id' => 2869,
                'name' => 'Lodzkie',
                'country_id' => 175,
            ),
            369 => 
            array (
                'id' => 2870,
                'name' => 'Lubelskie',
                'country_id' => 175,
            ),
            370 => 
            array (
                'id' => 2871,
                'name' => 'Lubuskie',
                'country_id' => 175,
            ),
            371 => 
            array (
                'id' => 2872,
                'name' => 'Malomice',
                'country_id' => 175,
            ),
            372 => 
            array (
                'id' => 2873,
                'name' => 'Malopolskie',
                'country_id' => 175,
            ),
            373 => 
            array (
                'id' => 2874,
                'name' => 'Mazowieckie',
                'country_id' => 175,
            ),
            374 => 
            array (
                'id' => 2875,
                'name' => 'Mirkow',
                'country_id' => 175,
            ),
            375 => 
            array (
                'id' => 2876,
                'name' => 'Opolskie',
                'country_id' => 175,
            ),
            376 => 
            array (
                'id' => 2877,
                'name' => 'Ostrowiec',
                'country_id' => 175,
            ),
            377 => 
            array (
                'id' => 2878,
                'name' => 'Podkarpackie',
                'country_id' => 175,
            ),
            378 => 
            array (
                'id' => 2879,
                'name' => 'Podlaskie',
                'country_id' => 175,
            ),
            379 => 
            array (
                'id' => 2880,
                'name' => 'Polska',
                'country_id' => 175,
            ),
            380 => 
            array (
                'id' => 2881,
                'name' => 'Pomorskie',
                'country_id' => 175,
            ),
            381 => 
            array (
                'id' => 2882,
                'name' => 'Poznan',
                'country_id' => 175,
            ),
            382 => 
            array (
                'id' => 2883,
                'name' => 'Pruszkow',
                'country_id' => 175,
            ),
            383 => 
            array (
                'id' => 2884,
                'name' => 'Rymanowska',
                'country_id' => 175,
            ),
            384 => 
            array (
                'id' => 2885,
                'name' => 'Rzeszow',
                'country_id' => 175,
            ),
            385 => 
            array (
                'id' => 2886,
                'name' => 'Slaskie',
                'country_id' => 175,
            ),
            386 => 
            array (
                'id' => 2887,
                'name' => 'Stare Pole',
                'country_id' => 175,
            ),
            387 => 
            array (
                'id' => 2888,
                'name' => 'Swietokrzyskie',
                'country_id' => 175,
            ),
            388 => 
            array (
                'id' => 2889,
                'name' => 'Warminsko-Mazurskie',
                'country_id' => 175,
            ),
            389 => 
            array (
                'id' => 2890,
                'name' => 'Warsaw',
                'country_id' => 175,
            ),
            390 => 
            array (
                'id' => 2891,
                'name' => 'Wejherowo',
                'country_id' => 175,
            ),
            391 => 
            array (
                'id' => 2892,
                'name' => 'Wielkopolskie',
                'country_id' => 175,
            ),
            392 => 
            array (
                'id' => 2893,
                'name' => 'Wroclaw',
                'country_id' => 175,
            ),
            393 => 
            array (
                'id' => 2894,
                'name' => 'Zachodnio-Pomorskie',
                'country_id' => 175,
            ),
            394 => 
            array (
                'id' => 2895,
                'name' => 'Zukowo',
                'country_id' => 175,
            ),
            395 => 
            array (
                'id' => 2896,
                'name' => 'Abrantes',
                'country_id' => 176,
            ),
            396 => 
            array (
                'id' => 2897,
                'name' => 'Acores',
                'country_id' => 176,
            ),
            397 => 
            array (
                'id' => 2898,
                'name' => 'Alentejo',
                'country_id' => 176,
            ),
            398 => 
            array (
                'id' => 2899,
                'name' => 'Algarve',
                'country_id' => 176,
            ),
            399 => 
            array (
                'id' => 2900,
                'name' => 'Braga',
                'country_id' => 176,
            ),
            400 => 
            array (
                'id' => 2901,
                'name' => 'Centro',
                'country_id' => 176,
            ),
            401 => 
            array (
                'id' => 2902,
                'name' => 'Distrito de Leiria',
                'country_id' => 176,
            ),
            402 => 
            array (
                'id' => 2903,
                'name' => 'Distrito de Viana do Castelo',
                'country_id' => 176,
            ),
            403 => 
            array (
                'id' => 2904,
                'name' => 'Distrito de Vila Real',
                'country_id' => 176,
            ),
            404 => 
            array (
                'id' => 2905,
                'name' => 'Distrito do Porto',
                'country_id' => 176,
            ),
            405 => 
            array (
                'id' => 2906,
                'name' => 'Lisboa e Vale do Tejo',
                'country_id' => 176,
            ),
            406 => 
            array (
                'id' => 2907,
                'name' => 'Madeira',
                'country_id' => 176,
            ),
            407 => 
            array (
                'id' => 2908,
                'name' => 'Norte',
                'country_id' => 176,
            ),
            408 => 
            array (
                'id' => 2909,
                'name' => 'Paivas',
                'country_id' => 176,
            ),
            409 => 
            array (
                'id' => 2910,
                'name' => 'Arecibo',
                'country_id' => 177,
            ),
            410 => 
            array (
                'id' => 2911,
                'name' => 'Bayamon',
                'country_id' => 177,
            ),
            411 => 
            array (
                'id' => 2912,
                'name' => 'Carolina',
                'country_id' => 177,
            ),
            412 => 
            array (
                'id' => 2913,
                'name' => 'Florida',
                'country_id' => 177,
            ),
            413 => 
            array (
                'id' => 2914,
                'name' => 'Guayama',
                'country_id' => 177,
            ),
            414 => 
            array (
                'id' => 2915,
                'name' => 'Humacao',
                'country_id' => 177,
            ),
            415 => 
            array (
                'id' => 2916,
                'name' => 'Mayaguez-Aguadilla',
                'country_id' => 177,
            ),
            416 => 
            array (
                'id' => 2917,
                'name' => 'Ponce',
                'country_id' => 177,
            ),
            417 => 
            array (
                'id' => 2918,
                'name' => 'Salinas',
                'country_id' => 177,
            ),
            418 => 
            array (
                'id' => 2919,
                'name' => 'San Juan',
                'country_id' => 177,
            ),
            419 => 
            array (
                'id' => 2920,
                'name' => 'Doha',
                'country_id' => 178,
            ),
            420 => 
            array (
                'id' => 2921,
                'name' => 'Jarian-al-Batnah',
                'country_id' => 178,
            ),
            421 => 
            array (
                'id' => 2922,
                'name' => 'Umm Salal',
                'country_id' => 178,
            ),
            422 => 
            array (
                'id' => 2923,
                'name' => 'ad-Dawhah',
                'country_id' => 178,
            ),
            423 => 
            array (
                'id' => 2924,
                'name' => 'al-Ghuwayriyah',
                'country_id' => 178,
            ),
            424 => 
            array (
                'id' => 2925,
                'name' => 'al-Jumayliyah',
                'country_id' => 178,
            ),
            425 => 
            array (
                'id' => 2926,
                'name' => 'al-Khawr',
                'country_id' => 178,
            ),
            426 => 
            array (
                'id' => 2927,
                'name' => 'al-Wakrah',
                'country_id' => 178,
            ),
            427 => 
            array (
                'id' => 2928,
                'name' => 'ar-Rayyan',
                'country_id' => 178,
            ),
            428 => 
            array (
                'id' => 2929,
                'name' => 'ash-Shamal',
                'country_id' => 178,
            ),
            429 => 
            array (
                'id' => 2930,
                'name' => 'Saint-Benoit',
                'country_id' => 179,
            ),
            430 => 
            array (
                'id' => 2931,
                'name' => 'Saint-Denis',
                'country_id' => 179,
            ),
            431 => 
            array (
                'id' => 2932,
                'name' => 'Saint-Paul',
                'country_id' => 179,
            ),
            432 => 
            array (
                'id' => 2933,
                'name' => 'Saint-Pierre',
                'country_id' => 179,
            ),
            433 => 
            array (
                'id' => 2934,
                'name' => 'Alba',
                'country_id' => 180,
            ),
            434 => 
            array (
                'id' => 2935,
                'name' => 'Arad',
                'country_id' => 180,
            ),
            435 => 
            array (
                'id' => 2936,
                'name' => 'Arges',
                'country_id' => 180,
            ),
            436 => 
            array (
                'id' => 2937,
                'name' => 'Bacau',
                'country_id' => 180,
            ),
            437 => 
            array (
                'id' => 2938,
                'name' => 'Bihor',
                'country_id' => 180,
            ),
            438 => 
            array (
                'id' => 2939,
                'name' => 'Bistrita-Nasaud',
                'country_id' => 180,
            ),
            439 => 
            array (
                'id' => 2940,
                'name' => 'Botosani',
                'country_id' => 180,
            ),
            440 => 
            array (
                'id' => 2941,
                'name' => 'Braila',
                'country_id' => 180,
            ),
            441 => 
            array (
                'id' => 2942,
                'name' => 'Brasov',
                'country_id' => 180,
            ),
            442 => 
            array (
                'id' => 2943,
                'name' => 'Bucuresti',
                'country_id' => 180,
            ),
            443 => 
            array (
                'id' => 2944,
                'name' => 'Buzau',
                'country_id' => 180,
            ),
            444 => 
            array (
                'id' => 2945,
                'name' => 'Calarasi',
                'country_id' => 180,
            ),
            445 => 
            array (
                'id' => 2946,
                'name' => 'Caras-Severin',
                'country_id' => 180,
            ),
            446 => 
            array (
                'id' => 2947,
                'name' => 'Cluj',
                'country_id' => 180,
            ),
            447 => 
            array (
                'id' => 2948,
                'name' => 'Constanta',
                'country_id' => 180,
            ),
            448 => 
            array (
                'id' => 2949,
                'name' => 'Covasna',
                'country_id' => 180,
            ),
            449 => 
            array (
                'id' => 2950,
                'name' => 'Dambovita',
                'country_id' => 180,
            ),
            450 => 
            array (
                'id' => 2951,
                'name' => 'Dolj',
                'country_id' => 180,
            ),
            451 => 
            array (
                'id' => 2952,
                'name' => 'Galati',
                'country_id' => 180,
            ),
            452 => 
            array (
                'id' => 2953,
                'name' => 'Giurgiu',
                'country_id' => 180,
            ),
            453 => 
            array (
                'id' => 2954,
                'name' => 'Gorj',
                'country_id' => 180,
            ),
            454 => 
            array (
                'id' => 2955,
                'name' => 'Harghita',
                'country_id' => 180,
            ),
            455 => 
            array (
                'id' => 2956,
                'name' => 'Hunedoara',
                'country_id' => 180,
            ),
            456 => 
            array (
                'id' => 2957,
                'name' => 'Ialomita',
                'country_id' => 180,
            ),
            457 => 
            array (
                'id' => 2958,
                'name' => 'Iasi',
                'country_id' => 180,
            ),
            458 => 
            array (
                'id' => 2959,
                'name' => 'Ilfov',
                'country_id' => 180,
            ),
            459 => 
            array (
                'id' => 2960,
                'name' => 'Maramures',
                'country_id' => 180,
            ),
            460 => 
            array (
                'id' => 2961,
                'name' => 'Mehedinti',
                'country_id' => 180,
            ),
            461 => 
            array (
                'id' => 2962,
                'name' => 'Mures',
                'country_id' => 180,
            ),
            462 => 
            array (
                'id' => 2963,
                'name' => 'Neamt',
                'country_id' => 180,
            ),
            463 => 
            array (
                'id' => 2964,
                'name' => 'Olt',
                'country_id' => 180,
            ),
            464 => 
            array (
                'id' => 2965,
                'name' => 'Prahova',
                'country_id' => 180,
            ),
            465 => 
            array (
                'id' => 2966,
                'name' => 'Salaj',
                'country_id' => 180,
            ),
            466 => 
            array (
                'id' => 2967,
                'name' => 'Satu Mare',
                'country_id' => 180,
            ),
            467 => 
            array (
                'id' => 2968,
                'name' => 'Sibiu',
                'country_id' => 180,
            ),
            468 => 
            array (
                'id' => 2969,
                'name' => 'Sondelor',
                'country_id' => 180,
            ),
            469 => 
            array (
                'id' => 2970,
                'name' => 'Suceava',
                'country_id' => 180,
            ),
            470 => 
            array (
                'id' => 2971,
                'name' => 'Teleorman',
                'country_id' => 180,
            ),
            471 => 
            array (
                'id' => 2972,
                'name' => 'Timis',
                'country_id' => 180,
            ),
            472 => 
            array (
                'id' => 2973,
                'name' => 'Tulcea',
                'country_id' => 180,
            ),
            473 => 
            array (
                'id' => 2974,
                'name' => 'Valcea',
                'country_id' => 180,
            ),
            474 => 
            array (
                'id' => 2975,
                'name' => 'Vaslui',
                'country_id' => 180,
            ),
            475 => 
            array (
                'id' => 2976,
                'name' => 'Vrancea',
                'country_id' => 180,
            ),
            476 => 
            array (
                'id' => 2977,
                'name' => 'Adygeja',
                'country_id' => 181,
            ),
            477 => 
            array (
                'id' => 2978,
                'name' => 'Aga',
                'country_id' => 181,
            ),
            478 => 
            array (
                'id' => 2979,
                'name' => 'Alanija',
                'country_id' => 181,
            ),
            479 => 
            array (
                'id' => 2980,
                'name' => 'Altaj',
                'country_id' => 181,
            ),
            480 => 
            array (
                'id' => 2981,
                'name' => 'Amur',
                'country_id' => 181,
            ),
            481 => 
            array (
                'id' => 2982,
                'name' => 'Arhangelsk',
                'country_id' => 181,
            ),
            482 => 
            array (
                'id' => 2983,
                'name' => 'Astrahan',
                'country_id' => 181,
            ),
            483 => 
            array (
                'id' => 2984,
                'name' => 'Bashkortostan',
                'country_id' => 181,
            ),
            484 => 
            array (
                'id' => 2985,
                'name' => 'Belgorod',
                'country_id' => 181,
            ),
            485 => 
            array (
                'id' => 2986,
                'name' => 'Brjansk',
                'country_id' => 181,
            ),
            486 => 
            array (
                'id' => 2987,
                'name' => 'Burjatija',
                'country_id' => 181,
            ),
            487 => 
            array (
                'id' => 2988,
                'name' => 'Chechenija',
                'country_id' => 181,
            ),
            488 => 
            array (
                'id' => 2989,
                'name' => 'Cheljabinsk',
                'country_id' => 181,
            ),
            489 => 
            array (
                'id' => 2990,
                'name' => 'Chita',
                'country_id' => 181,
            ),
            490 => 
            array (
                'id' => 2991,
                'name' => 'Chukotka',
                'country_id' => 181,
            ),
            491 => 
            array (
                'id' => 2992,
                'name' => 'Chuvashija',
                'country_id' => 181,
            ),
            492 => 
            array (
                'id' => 2993,
                'name' => 'Dagestan',
                'country_id' => 181,
            ),
            493 => 
            array (
                'id' => 2994,
                'name' => 'Evenkija',
                'country_id' => 181,
            ),
            494 => 
            array (
                'id' => 2995,
                'name' => 'Gorno-Altaj',
                'country_id' => 181,
            ),
            495 => 
            array (
                'id' => 2996,
                'name' => 'Habarovsk',
                'country_id' => 181,
            ),
            496 => 
            array (
                'id' => 2997,
                'name' => 'Hakasija',
                'country_id' => 181,
            ),
            497 => 
            array (
                'id' => 2998,
                'name' => 'Hanty-Mansija',
                'country_id' => 181,
            ),
            498 => 
            array (
                'id' => 2999,
                'name' => 'Ingusetija',
                'country_id' => 181,
            ),
            499 => 
            array (
                'id' => 3000,
                'name' => 'Irkutsk',
                'country_id' => 181,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 3001,
                'name' => 'Ivanovo',
                'country_id' => 181,
            ),
            1 => 
            array (
                'id' => 3002,
                'name' => 'Jamalo-Nenets',
                'country_id' => 181,
            ),
            2 => 
            array (
                'id' => 3003,
                'name' => 'Jaroslavl',
                'country_id' => 181,
            ),
            3 => 
            array (
                'id' => 3004,
                'name' => 'Jevrej',
                'country_id' => 181,
            ),
            4 => 
            array (
                'id' => 3005,
                'name' => 'Kabardino-Balkarija',
                'country_id' => 181,
            ),
            5 => 
            array (
                'id' => 3006,
                'name' => 'Kaliningrad',
                'country_id' => 181,
            ),
            6 => 
            array (
                'id' => 3007,
                'name' => 'Kalmykija',
                'country_id' => 181,
            ),
            7 => 
            array (
                'id' => 3008,
                'name' => 'Kaluga',
                'country_id' => 181,
            ),
            8 => 
            array (
                'id' => 3009,
                'name' => 'Kamchatka',
                'country_id' => 181,
            ),
            9 => 
            array (
                'id' => 3010,
                'name' => 'Karachaj-Cherkessija',
                'country_id' => 181,
            ),
            10 => 
            array (
                'id' => 3011,
                'name' => 'Karelija',
                'country_id' => 181,
            ),
            11 => 
            array (
                'id' => 3012,
                'name' => 'Kemerovo',
                'country_id' => 181,
            ),
            12 => 
            array (
                'id' => 3013,
                'name' => 'Khabarovskiy Kray',
                'country_id' => 181,
            ),
            13 => 
            array (
                'id' => 3014,
                'name' => 'Kirov',
                'country_id' => 181,
            ),
            14 => 
            array (
                'id' => 3015,
                'name' => 'Komi',
                'country_id' => 181,
            ),
            15 => 
            array (
                'id' => 3016,
                'name' => 'Komi-Permjakija',
                'country_id' => 181,
            ),
            16 => 
            array (
                'id' => 3017,
                'name' => 'Korjakija',
                'country_id' => 181,
            ),
            17 => 
            array (
                'id' => 3018,
                'name' => 'Kostroma',
                'country_id' => 181,
            ),
            18 => 
            array (
                'id' => 3019,
                'name' => 'Krasnodar',
                'country_id' => 181,
            ),
            19 => 
            array (
                'id' => 3020,
                'name' => 'Krasnojarsk',
                'country_id' => 181,
            ),
            20 => 
            array (
                'id' => 3021,
                'name' => 'Krasnoyarskiy Kray',
                'country_id' => 181,
            ),
            21 => 
            array (
                'id' => 3022,
                'name' => 'Kurgan',
                'country_id' => 181,
            ),
            22 => 
            array (
                'id' => 3023,
                'name' => 'Kursk',
                'country_id' => 181,
            ),
            23 => 
            array (
                'id' => 3024,
                'name' => 'Leningrad',
                'country_id' => 181,
            ),
            24 => 
            array (
                'id' => 3025,
                'name' => 'Lipeck',
                'country_id' => 181,
            ),
            25 => 
            array (
                'id' => 3026,
                'name' => 'Magadan',
                'country_id' => 181,
            ),
            26 => 
            array (
                'id' => 3027,
                'name' => 'Marij El',
                'country_id' => 181,
            ),
            27 => 
            array (
                'id' => 3028,
                'name' => 'Mordovija',
                'country_id' => 181,
            ),
            28 => 
            array (
                'id' => 3029,
                'name' => 'Moscow',
                'country_id' => 181,
            ),
            29 => 
            array (
                'id' => 3030,
                'name' => 'Moskovskaja Oblast',
                'country_id' => 181,
            ),
            30 => 
            array (
                'id' => 3031,
                'name' => 'Moskovskaya Oblast',
                'country_id' => 181,
            ),
            31 => 
            array (
                'id' => 3032,
                'name' => 'Moskva',
                'country_id' => 181,
            ),
            32 => 
            array (
                'id' => 3033,
                'name' => 'Murmansk',
                'country_id' => 181,
            ),
            33 => 
            array (
                'id' => 3034,
                'name' => 'Nenets',
                'country_id' => 181,
            ),
            34 => 
            array (
                'id' => 3035,
                'name' => 'Nizhnij Novgorod',
                'country_id' => 181,
            ),
            35 => 
            array (
                'id' => 3036,
                'name' => 'Novgorod',
                'country_id' => 181,
            ),
            36 => 
            array (
                'id' => 3037,
                'name' => 'Novokusnezk',
                'country_id' => 181,
            ),
            37 => 
            array (
                'id' => 3038,
                'name' => 'Novosibirsk',
                'country_id' => 181,
            ),
            38 => 
            array (
                'id' => 3039,
                'name' => 'Omsk',
                'country_id' => 181,
            ),
            39 => 
            array (
                'id' => 3040,
                'name' => 'Orenburg',
                'country_id' => 181,
            ),
            40 => 
            array (
                'id' => 3041,
                'name' => 'Orjol',
                'country_id' => 181,
            ),
            41 => 
            array (
                'id' => 3042,
                'name' => 'Penza',
                'country_id' => 181,
            ),
            42 => 
            array (
                'id' => 3043,
                'name' => 'Perm',
                'country_id' => 181,
            ),
            43 => 
            array (
                'id' => 3044,
                'name' => 'Primorje',
                'country_id' => 181,
            ),
            44 => 
            array (
                'id' => 3045,
                'name' => 'Pskov',
                'country_id' => 181,
            ),
            45 => 
            array (
                'id' => 3046,
                'name' => 'Pskovskaya Oblast',
                'country_id' => 181,
            ),
            46 => 
            array (
                'id' => 3047,
                'name' => 'Rjazan',
                'country_id' => 181,
            ),
            47 => 
            array (
                'id' => 3048,
                'name' => 'Rostov',
                'country_id' => 181,
            ),
            48 => 
            array (
                'id' => 3049,
                'name' => 'Saha',
                'country_id' => 181,
            ),
            49 => 
            array (
                'id' => 3050,
                'name' => 'Sahalin',
                'country_id' => 181,
            ),
            50 => 
            array (
                'id' => 3051,
                'name' => 'Samara',
                'country_id' => 181,
            ),
            51 => 
            array (
                'id' => 3052,
                'name' => 'Samarskaya',
                'country_id' => 181,
            ),
            52 => 
            array (
                'id' => 3053,
                'name' => 'Sankt-Peterburg',
                'country_id' => 181,
            ),
            53 => 
            array (
                'id' => 3054,
                'name' => 'Saratov',
                'country_id' => 181,
            ),
            54 => 
            array (
                'id' => 3055,
                'name' => 'Smolensk',
                'country_id' => 181,
            ),
            55 => 
            array (
                'id' => 3056,
                'name' => 'Stavropol',
                'country_id' => 181,
            ),
            56 => 
            array (
                'id' => 3057,
                'name' => 'Sverdlovsk',
                'country_id' => 181,
            ),
            57 => 
            array (
                'id' => 3058,
                'name' => 'Tajmyrija',
                'country_id' => 181,
            ),
            58 => 
            array (
                'id' => 3059,
                'name' => 'Tambov',
                'country_id' => 181,
            ),
            59 => 
            array (
                'id' => 3060,
                'name' => 'Tatarstan',
                'country_id' => 181,
            ),
            60 => 
            array (
                'id' => 3061,
                'name' => 'Tjumen',
                'country_id' => 181,
            ),
            61 => 
            array (
                'id' => 3062,
                'name' => 'Tomsk',
                'country_id' => 181,
            ),
            62 => 
            array (
                'id' => 3063,
                'name' => 'Tula',
                'country_id' => 181,
            ),
            63 => 
            array (
                'id' => 3064,
                'name' => 'Tver',
                'country_id' => 181,
            ),
            64 => 
            array (
                'id' => 3065,
                'name' => 'Tyva',
                'country_id' => 181,
            ),
            65 => 
            array (
                'id' => 3066,
                'name' => 'Udmurtija',
                'country_id' => 181,
            ),
            66 => 
            array (
                'id' => 3067,
                'name' => 'Uljanovsk',
                'country_id' => 181,
            ),
            67 => 
            array (
                'id' => 3068,
                'name' => 'Ulyanovskaya Oblast',
                'country_id' => 181,
            ),
            68 => 
            array (
                'id' => 3069,
                'name' => 'Ust-Orda',
                'country_id' => 181,
            ),
            69 => 
            array (
                'id' => 3070,
                'name' => 'Vladimir',
                'country_id' => 181,
            ),
            70 => 
            array (
                'id' => 3071,
                'name' => 'Volgograd',
                'country_id' => 181,
            ),
            71 => 
            array (
                'id' => 3072,
                'name' => 'Vologda',
                'country_id' => 181,
            ),
            72 => 
            array (
                'id' => 3073,
                'name' => 'Voronezh',
                'country_id' => 181,
            ),
            73 => 
            array (
                'id' => 3074,
                'name' => 'Butare',
                'country_id' => 182,
            ),
            74 => 
            array (
                'id' => 3075,
                'name' => 'Byumba',
                'country_id' => 182,
            ),
            75 => 
            array (
                'id' => 3076,
                'name' => 'Cyangugu',
                'country_id' => 182,
            ),
            76 => 
            array (
                'id' => 3077,
                'name' => 'Gikongoro',
                'country_id' => 182,
            ),
            77 => 
            array (
                'id' => 3078,
                'name' => 'Gisenyi',
                'country_id' => 182,
            ),
            78 => 
            array (
                'id' => 3079,
                'name' => 'Gitarama',
                'country_id' => 182,
            ),
            79 => 
            array (
                'id' => 3080,
                'name' => 'Kibungo',
                'country_id' => 182,
            ),
            80 => 
            array (
                'id' => 3081,
                'name' => 'Kibuye',
                'country_id' => 182,
            ),
            81 => 
            array (
                'id' => 3082,
                'name' => 'Kigali-ngali',
                'country_id' => 182,
            ),
            82 => 
            array (
                'id' => 3083,
                'name' => 'Ruhengeri',
                'country_id' => 182,
            ),
            83 => 
            array (
                'id' => 3084,
                'name' => 'Ascension',
                'country_id' => 183,
            ),
            84 => 
            array (
                'id' => 3085,
                'name' => 'Gough Island',
                'country_id' => 183,
            ),
            85 => 
            array (
                'id' => 3086,
                'name' => 'Saint Helena',
                'country_id' => 183,
            ),
            86 => 
            array (
                'id' => 3087,
                'name' => 'Tristan da Cunha',
                'country_id' => 183,
            ),
            87 => 
            array (
                'id' => 3088,
                'name' => 'Christ Church Nichola Town',
                'country_id' => 184,
            ),
            88 => 
            array (
                'id' => 3089,
                'name' => 'Saint Anne Sandy Point',
                'country_id' => 184,
            ),
            89 => 
            array (
                'id' => 3090,
                'name' => 'Saint George Basseterre',
                'country_id' => 184,
            ),
            90 => 
            array (
                'id' => 3091,
                'name' => 'Saint George Gingerland',
                'country_id' => 184,
            ),
            91 => 
            array (
                'id' => 3092,
                'name' => 'Saint James Windward',
                'country_id' => 184,
            ),
            92 => 
            array (
                'id' => 3093,
                'name' => 'Saint John Capesterre',
                'country_id' => 184,
            ),
            93 => 
            array (
                'id' => 3094,
                'name' => 'Saint John Figtree',
                'country_id' => 184,
            ),
            94 => 
            array (
                'id' => 3095,
                'name' => 'Saint Mary Cayon',
                'country_id' => 184,
            ),
            95 => 
            array (
                'id' => 3096,
                'name' => 'Saint Paul Capesterre',
                'country_id' => 184,
            ),
            96 => 
            array (
                'id' => 3097,
                'name' => 'Saint Paul Charlestown',
                'country_id' => 184,
            ),
            97 => 
            array (
                'id' => 3098,
                'name' => 'Saint Peter Basseterre',
                'country_id' => 184,
            ),
            98 => 
            array (
                'id' => 3099,
                'name' => 'Saint Thomas Lowland',
                'country_id' => 184,
            ),
            99 => 
            array (
                'id' => 3100,
                'name' => 'Saint Thomas Middle Island',
                'country_id' => 184,
            ),
            100 => 
            array (
                'id' => 3101,
                'name' => 'Trinity Palmetto Point',
                'country_id' => 184,
            ),
            101 => 
            array (
                'id' => 3102,
                'name' => 'Anse-la-Raye',
                'country_id' => 185,
            ),
            102 => 
            array (
                'id' => 3103,
                'name' => 'Canaries',
                'country_id' => 185,
            ),
            103 => 
            array (
                'id' => 3104,
                'name' => 'Castries',
                'country_id' => 185,
            ),
            104 => 
            array (
                'id' => 3105,
                'name' => 'Choiseul',
                'country_id' => 185,
            ),
            105 => 
            array (
                'id' => 3106,
                'name' => 'Dennery',
                'country_id' => 185,
            ),
            106 => 
            array (
                'id' => 3107,
                'name' => 'Gros Inlet',
                'country_id' => 185,
            ),
            107 => 
            array (
                'id' => 3108,
                'name' => 'Laborie',
                'country_id' => 185,
            ),
            108 => 
            array (
                'id' => 3109,
                'name' => 'Micoud',
                'country_id' => 185,
            ),
            109 => 
            array (
                'id' => 3110,
                'name' => 'Soufriere',
                'country_id' => 185,
            ),
            110 => 
            array (
                'id' => 3111,
                'name' => 'Vieux Fort',
                'country_id' => 185,
            ),
            111 => 
            array (
                'id' => 3112,
                'name' => 'Miquelon-Langlade',
                'country_id' => 186,
            ),
            112 => 
            array (
                'id' => 3113,
                'name' => 'Saint-Pierre',
                'country_id' => 186,
            ),
            113 => 
            array (
                'id' => 3114,
                'name' => 'Charlotte',
                'country_id' => 187,
            ),
            114 => 
            array (
                'id' => 3115,
                'name' => 'Grenadines',
                'country_id' => 187,
            ),
            115 => 
            array (
                'id' => 3116,
                'name' => 'Saint Andrew',
                'country_id' => 187,
            ),
            116 => 
            array (
                'id' => 3117,
                'name' => 'Saint David',
                'country_id' => 187,
            ),
            117 => 
            array (
                'id' => 3118,
                'name' => 'Saint George',
                'country_id' => 187,
            ),
            118 => 
            array (
                'id' => 3119,
                'name' => 'Saint Patrick',
                'country_id' => 187,
            ),
            119 => 
            array (
                'id' => 3120,
                'name' => 'A\'ana',
                'country_id' => 188,
            ),
            120 => 
            array (
                'id' => 3121,
                'name' => 'Aiga-i-le-Tai',
                'country_id' => 188,
            ),
            121 => 
            array (
                'id' => 3122,
                'name' => 'Atua',
                'country_id' => 188,
            ),
            122 => 
            array (
                'id' => 3123,
                'name' => 'Fa\'asaleleaga',
                'country_id' => 188,
            ),
            123 => 
            array (
                'id' => 3124,
                'name' => 'Gaga\'emauga',
                'country_id' => 188,
            ),
            124 => 
            array (
                'id' => 3125,
                'name' => 'Gagaifomauga',
                'country_id' => 188,
            ),
            125 => 
            array (
                'id' => 3126,
                'name' => 'Palauli',
                'country_id' => 188,
            ),
            126 => 
            array (
                'id' => 3127,
                'name' => 'Satupa\'itea',
                'country_id' => 188,
            ),
            127 => 
            array (
                'id' => 3128,
                'name' => 'Tuamasaga',
                'country_id' => 188,
            ),
            128 => 
            array (
                'id' => 3129,
                'name' => 'Va\'a-o-Fonoti',
                'country_id' => 188,
            ),
            129 => 
            array (
                'id' => 3130,
                'name' => 'Vaisigano',
                'country_id' => 188,
            ),
            130 => 
            array (
                'id' => 3131,
                'name' => 'Acquaviva',
                'country_id' => 189,
            ),
            131 => 
            array (
                'id' => 3132,
                'name' => 'Borgo Maggiore',
                'country_id' => 189,
            ),
            132 => 
            array (
                'id' => 3133,
                'name' => 'Chiesanuova',
                'country_id' => 189,
            ),
            133 => 
            array (
                'id' => 3134,
                'name' => 'Domagnano',
                'country_id' => 189,
            ),
            134 => 
            array (
                'id' => 3135,
                'name' => 'Faetano',
                'country_id' => 189,
            ),
            135 => 
            array (
                'id' => 3136,
                'name' => 'Fiorentino',
                'country_id' => 189,
            ),
            136 => 
            array (
                'id' => 3137,
                'name' => 'Montegiardino',
                'country_id' => 189,
            ),
            137 => 
            array (
                'id' => 3138,
                'name' => 'San Marino',
                'country_id' => 189,
            ),
            138 => 
            array (
                'id' => 3139,
                'name' => 'Serravalle',
                'country_id' => 189,
            ),
            139 => 
            array (
                'id' => 3140,
                'name' => 'Agua Grande',
                'country_id' => 190,
            ),
            140 => 
            array (
                'id' => 3141,
                'name' => 'Cantagalo',
                'country_id' => 190,
            ),
            141 => 
            array (
                'id' => 3142,
                'name' => 'Lemba',
                'country_id' => 190,
            ),
            142 => 
            array (
                'id' => 3143,
                'name' => 'Lobata',
                'country_id' => 190,
            ),
            143 => 
            array (
                'id' => 3144,
                'name' => 'Me-Zochi',
                'country_id' => 190,
            ),
            144 => 
            array (
                'id' => 3145,
                'name' => 'Pague',
                'country_id' => 190,
            ),
            145 => 
            array (
                'id' => 3146,
                'name' => 'Al Khobar',
                'country_id' => 191,
            ),
            146 => 
            array (
                'id' => 3147,
                'name' => 'Aseer',
                'country_id' => 191,
            ),
            147 => 
            array (
                'id' => 3148,
                'name' => 'Ash Sharqiyah',
                'country_id' => 191,
            ),
            148 => 
            array (
                'id' => 3149,
                'name' => 'Asir',
                'country_id' => 191,
            ),
            149 => 
            array (
                'id' => 3150,
                'name' => 'Central Province',
                'country_id' => 191,
            ),
            150 => 
            array (
                'id' => 3151,
                'name' => 'Eastern Province',
                'country_id' => 191,
            ),
            151 => 
            array (
                'id' => 3152,
                'name' => 'Ha\'il',
                'country_id' => 191,
            ),
            152 => 
            array (
                'id' => 3153,
                'name' => 'Jawf',
                'country_id' => 191,
            ),
            153 => 
            array (
                'id' => 3154,
                'name' => 'Jizan',
                'country_id' => 191,
            ),
            154 => 
            array (
                'id' => 3155,
                'name' => 'Makkah',
                'country_id' => 191,
            ),
            155 => 
            array (
                'id' => 3156,
                'name' => 'Najran',
                'country_id' => 191,
            ),
            156 => 
            array (
                'id' => 3157,
                'name' => 'Qasim',
                'country_id' => 191,
            ),
            157 => 
            array (
                'id' => 3158,
                'name' => 'Tabuk',
                'country_id' => 191,
            ),
            158 => 
            array (
                'id' => 3159,
                'name' => 'Western Province',
                'country_id' => 191,
            ),
            159 => 
            array (
                'id' => 3160,
                'name' => 'al-Bahah',
                'country_id' => 191,
            ),
            160 => 
            array (
                'id' => 3161,
                'name' => 'al-Hudud-ash-Shamaliyah',
                'country_id' => 191,
            ),
            161 => 
            array (
                'id' => 3162,
                'name' => 'al-Madinah',
                'country_id' => 191,
            ),
            162 => 
            array (
                'id' => 3163,
                'name' => 'ar-Riyad',
                'country_id' => 191,
            ),
            163 => 
            array (
                'id' => 3164,
                'name' => 'Dakar',
                'country_id' => 192,
            ),
            164 => 
            array (
                'id' => 3165,
                'name' => 'Diourbel',
                'country_id' => 192,
            ),
            165 => 
            array (
                'id' => 3166,
                'name' => 'Fatick',
                'country_id' => 192,
            ),
            166 => 
            array (
                'id' => 3167,
                'name' => 'Kaolack',
                'country_id' => 192,
            ),
            167 => 
            array (
                'id' => 3168,
                'name' => 'Kolda',
                'country_id' => 192,
            ),
            168 => 
            array (
                'id' => 3169,
                'name' => 'Louga',
                'country_id' => 192,
            ),
            169 => 
            array (
                'id' => 3170,
                'name' => 'Saint-Louis',
                'country_id' => 192,
            ),
            170 => 
            array (
                'id' => 3171,
                'name' => 'Tambacounda',
                'country_id' => 192,
            ),
            171 => 
            array (
                'id' => 3172,
                'name' => 'Thies',
                'country_id' => 192,
            ),
            172 => 
            array (
                'id' => 3173,
                'name' => 'Ziguinchor',
                'country_id' => 192,
            ),
            173 => 
            array (
                'id' => 3174,
                'name' => 'Central Serbia',
                'country_id' => 193,
            ),
            174 => 
            array (
                'id' => 3175,
                'name' => 'Kosovo and Metohija',
                'country_id' => 193,
            ),
            175 => 
            array (
                'id' => 3176,
                'name' => 'Vojvodina',
                'country_id' => 193,
            ),
            176 => 
            array (
                'id' => 3177,
                'name' => 'Anse Boileau',
                'country_id' => 194,
            ),
            177 => 
            array (
                'id' => 3178,
                'name' => 'Anse Royale',
                'country_id' => 194,
            ),
            178 => 
            array (
                'id' => 3179,
                'name' => 'Cascade',
                'country_id' => 194,
            ),
            179 => 
            array (
                'id' => 3180,
                'name' => 'Takamaka',
                'country_id' => 194,
            ),
            180 => 
            array (
                'id' => 3181,
                'name' => 'Victoria',
                'country_id' => 194,
            ),
            181 => 
            array (
                'id' => 3182,
                'name' => 'Eastern',
                'country_id' => 195,
            ),
            182 => 
            array (
                'id' => 3183,
                'name' => 'Northern',
                'country_id' => 195,
            ),
            183 => 
            array (
                'id' => 3184,
                'name' => 'Southern',
                'country_id' => 195,
            ),
            184 => 
            array (
                'id' => 3185,
                'name' => 'Western',
                'country_id' => 195,
            ),
            185 => 
            array (
                'id' => 3186,
                'name' => 'Singapore',
                'country_id' => 196,
            ),
            186 => 
            array (
                'id' => 3187,
                'name' => 'Banskobystricky',
                'country_id' => 197,
            ),
            187 => 
            array (
                'id' => 3188,
                'name' => 'Bratislavsky',
                'country_id' => 197,
            ),
            188 => 
            array (
                'id' => 3189,
                'name' => 'Kosicky',
                'country_id' => 197,
            ),
            189 => 
            array (
                'id' => 3190,
                'name' => 'Nitriansky',
                'country_id' => 197,
            ),
            190 => 
            array (
                'id' => 3191,
                'name' => 'Presovsky',
                'country_id' => 197,
            ),
            191 => 
            array (
                'id' => 3192,
                'name' => 'Trenciansky',
                'country_id' => 197,
            ),
            192 => 
            array (
                'id' => 3193,
                'name' => 'Trnavsky',
                'country_id' => 197,
            ),
            193 => 
            array (
                'id' => 3194,
                'name' => 'Zilinsky',
                'country_id' => 197,
            ),
            194 => 
            array (
                'id' => 3195,
                'name' => 'Benedikt',
                'country_id' => 198,
            ),
            195 => 
            array (
                'id' => 3196,
                'name' => 'Gorenjska',
                'country_id' => 198,
            ),
            196 => 
            array (
                'id' => 3197,
                'name' => 'Gorishka',
                'country_id' => 198,
            ),
            197 => 
            array (
                'id' => 3198,
                'name' => 'Jugovzhodna Slovenija',
                'country_id' => 198,
            ),
            198 => 
            array (
                'id' => 3199,
                'name' => 'Koroshka',
                'country_id' => 198,
            ),
            199 => 
            array (
                'id' => 3200,
                'name' => 'Notranjsko-krashka',
                'country_id' => 198,
            ),
            200 => 
            array (
                'id' => 3201,
                'name' => 'Obalno-krashka',
                'country_id' => 198,
            ),
            201 => 
            array (
                'id' => 3202,
                'name' => 'Obcina Domzale',
                'country_id' => 198,
            ),
            202 => 
            array (
                'id' => 3203,
                'name' => 'Obcina Vitanje',
                'country_id' => 198,
            ),
            203 => 
            array (
                'id' => 3204,
                'name' => 'Osrednjeslovenska',
                'country_id' => 198,
            ),
            204 => 
            array (
                'id' => 3205,
                'name' => 'Podravska',
                'country_id' => 198,
            ),
            205 => 
            array (
                'id' => 3206,
                'name' => 'Pomurska',
                'country_id' => 198,
            ),
            206 => 
            array (
                'id' => 3207,
                'name' => 'Savinjska',
                'country_id' => 198,
            ),
            207 => 
            array (
                'id' => 3208,
                'name' => 'Slovenian Littoral',
                'country_id' => 198,
            ),
            208 => 
            array (
                'id' => 3209,
                'name' => 'Spodnjeposavska',
                'country_id' => 198,
            ),
            209 => 
            array (
                'id' => 3210,
                'name' => 'Zasavska',
                'country_id' => 198,
            ),
            210 => 
            array (
                'id' => 3211,
                'name' => 'Pitcairn',
                'country_id' => 199,
            ),
            211 => 
            array (
                'id' => 3212,
                'name' => 'Central',
                'country_id' => 200,
            ),
            212 => 
            array (
                'id' => 3213,
                'name' => 'Choiseul',
                'country_id' => 200,
            ),
            213 => 
            array (
                'id' => 3214,
                'name' => 'Guadalcanal',
                'country_id' => 200,
            ),
            214 => 
            array (
                'id' => 3215,
                'name' => 'Isabel',
                'country_id' => 200,
            ),
            215 => 
            array (
                'id' => 3216,
                'name' => 'Makira and Ulawa',
                'country_id' => 200,
            ),
            216 => 
            array (
                'id' => 3217,
                'name' => 'Malaita',
                'country_id' => 200,
            ),
            217 => 
            array (
                'id' => 3218,
                'name' => 'Rennell and Bellona',
                'country_id' => 200,
            ),
            218 => 
            array (
                'id' => 3219,
                'name' => 'Temotu',
                'country_id' => 200,
            ),
            219 => 
            array (
                'id' => 3220,
                'name' => 'Western',
                'country_id' => 200,
            ),
            220 => 
            array (
                'id' => 3221,
                'name' => 'Awdal',
                'country_id' => 201,
            ),
            221 => 
            array (
                'id' => 3222,
                'name' => 'Bakol',
                'country_id' => 201,
            ),
            222 => 
            array (
                'id' => 3223,
                'name' => 'Banadir',
                'country_id' => 201,
            ),
            223 => 
            array (
                'id' => 3224,
                'name' => 'Bari',
                'country_id' => 201,
            ),
            224 => 
            array (
                'id' => 3225,
                'name' => 'Bay',
                'country_id' => 201,
            ),
            225 => 
            array (
                'id' => 3226,
                'name' => 'Galgudug',
                'country_id' => 201,
            ),
            226 => 
            array (
                'id' => 3227,
                'name' => 'Gedo',
                'country_id' => 201,
            ),
            227 => 
            array (
                'id' => 3228,
                'name' => 'Hiran',
                'country_id' => 201,
            ),
            228 => 
            array (
                'id' => 3229,
                'name' => 'Jubbada Hose',
                'country_id' => 201,
            ),
            229 => 
            array (
                'id' => 3230,
                'name' => 'Jubbadha Dexe',
                'country_id' => 201,
            ),
            230 => 
            array (
                'id' => 3231,
                'name' => 'Mudug',
                'country_id' => 201,
            ),
            231 => 
            array (
                'id' => 3232,
                'name' => 'Nugal',
                'country_id' => 201,
            ),
            232 => 
            array (
                'id' => 3233,
                'name' => 'Sanag',
                'country_id' => 201,
            ),
            233 => 
            array (
                'id' => 3234,
                'name' => 'Shabellaha Dhexe',
                'country_id' => 201,
            ),
            234 => 
            array (
                'id' => 3235,
                'name' => 'Shabellaha Hose',
                'country_id' => 201,
            ),
            235 => 
            array (
                'id' => 3236,
                'name' => 'Togdher',
                'country_id' => 201,
            ),
            236 => 
            array (
                'id' => 3237,
                'name' => 'Woqoyi Galbed',
                'country_id' => 201,
            ),
            237 => 
            array (
                'id' => 3238,
                'name' => 'Eastern Cape',
                'country_id' => 202,
            ),
            238 => 
            array (
                'id' => 3239,
                'name' => 'Free State',
                'country_id' => 202,
            ),
            239 => 
            array (
                'id' => 3240,
                'name' => 'Gauteng',
                'country_id' => 202,
            ),
            240 => 
            array (
                'id' => 3241,
                'name' => 'Kempton Park',
                'country_id' => 202,
            ),
            241 => 
            array (
                'id' => 3242,
                'name' => 'Kramerville',
                'country_id' => 202,
            ),
            242 => 
            array (
                'id' => 3243,
                'name' => 'KwaZulu Natal',
                'country_id' => 202,
            ),
            243 => 
            array (
                'id' => 3244,
                'name' => 'Limpopo',
                'country_id' => 202,
            ),
            244 => 
            array (
                'id' => 3245,
                'name' => 'Mpumalanga',
                'country_id' => 202,
            ),
            245 => 
            array (
                'id' => 3246,
                'name' => 'North West',
                'country_id' => 202,
            ),
            246 => 
            array (
                'id' => 3247,
                'name' => 'Northern Cape',
                'country_id' => 202,
            ),
            247 => 
            array (
                'id' => 3248,
                'name' => 'Parow',
                'country_id' => 202,
            ),
            248 => 
            array (
                'id' => 3249,
                'name' => 'Table View',
                'country_id' => 202,
            ),
            249 => 
            array (
                'id' => 3250,
                'name' => 'Umtentweni',
                'country_id' => 202,
            ),
            250 => 
            array (
                'id' => 3251,
                'name' => 'Western Cape',
                'country_id' => 202,
            ),
            251 => 
            array (
                'id' => 3252,
                'name' => 'South Georgia',
                'country_id' => 203,
            ),
            252 => 
            array (
                'id' => 3253,
                'name' => 'Central Equatoria',
                'country_id' => 204,
            ),
            253 => 
            array (
                'id' => 3254,
                'name' => 'A Coruna',
                'country_id' => 205,
            ),
            254 => 
            array (
                'id' => 3255,
                'name' => 'Alacant',
                'country_id' => 205,
            ),
            255 => 
            array (
                'id' => 3256,
                'name' => 'Alava',
                'country_id' => 205,
            ),
            256 => 
            array (
                'id' => 3257,
                'name' => 'Albacete',
                'country_id' => 205,
            ),
            257 => 
            array (
                'id' => 3258,
                'name' => 'Almeria',
                'country_id' => 205,
            ),
            258 => 
            array (
                'id' => 3259,
                'name' => 'Andalucia',
                'country_id' => 205,
            ),
            259 => 
            array (
                'id' => 3260,
                'name' => 'Asturias',
                'country_id' => 205,
            ),
            260 => 
            array (
                'id' => 3261,
                'name' => 'Avila',
                'country_id' => 205,
            ),
            261 => 
            array (
                'id' => 3262,
                'name' => 'Badajoz',
                'country_id' => 205,
            ),
            262 => 
            array (
                'id' => 3263,
                'name' => 'Balears',
                'country_id' => 205,
            ),
            263 => 
            array (
                'id' => 3264,
                'name' => 'Barcelona',
                'country_id' => 205,
            ),
            264 => 
            array (
                'id' => 3265,
                'name' => 'Bertamirans',
                'country_id' => 205,
            ),
            265 => 
            array (
                'id' => 3266,
                'name' => 'Biscay',
                'country_id' => 205,
            ),
            266 => 
            array (
                'id' => 3267,
                'name' => 'Burgos',
                'country_id' => 205,
            ),
            267 => 
            array (
                'id' => 3268,
                'name' => 'Caceres',
                'country_id' => 205,
            ),
            268 => 
            array (
                'id' => 3269,
                'name' => 'Cadiz',
                'country_id' => 205,
            ),
            269 => 
            array (
                'id' => 3270,
                'name' => 'Cantabria',
                'country_id' => 205,
            ),
            270 => 
            array (
                'id' => 3271,
                'name' => 'Castello',
                'country_id' => 205,
            ),
            271 => 
            array (
                'id' => 3272,
                'name' => 'Catalunya',
                'country_id' => 205,
            ),
            272 => 
            array (
                'id' => 3273,
                'name' => 'Ceuta',
                'country_id' => 205,
            ),
            273 => 
            array (
                'id' => 3274,
                'name' => 'Ciudad Real',
                'country_id' => 205,
            ),
            274 => 
            array (
                'id' => 3275,
                'name' => 'Comunidad Autonoma de Canarias',
                'country_id' => 205,
            ),
            275 => 
            array (
                'id' => 3276,
                'name' => 'Comunidad Autonoma de Cataluna',
                'country_id' => 205,
            ),
            276 => 
            array (
                'id' => 3277,
                'name' => 'Comunidad Autonoma de Galicia',
                'country_id' => 205,
            ),
            277 => 
            array (
                'id' => 3278,
                'name' => 'Comunidad Autonoma de las Isla',
                'country_id' => 205,
            ),
            278 => 
            array (
                'id' => 3279,
                'name' => 'Comunidad Autonoma del Princip',
                'country_id' => 205,
            ),
            279 => 
            array (
                'id' => 3280,
                'name' => 'Comunidad Valenciana',
                'country_id' => 205,
            ),
            280 => 
            array (
                'id' => 3281,
                'name' => 'Cordoba',
                'country_id' => 205,
            ),
            281 => 
            array (
                'id' => 3282,
                'name' => 'Cuenca',
                'country_id' => 205,
            ),
            282 => 
            array (
                'id' => 3283,
                'name' => 'Gipuzkoa',
                'country_id' => 205,
            ),
            283 => 
            array (
                'id' => 3284,
                'name' => 'Girona',
                'country_id' => 205,
            ),
            284 => 
            array (
                'id' => 3285,
                'name' => 'Granada',
                'country_id' => 205,
            ),
            285 => 
            array (
                'id' => 3286,
                'name' => 'Guadalajara',
                'country_id' => 205,
            ),
            286 => 
            array (
                'id' => 3287,
                'name' => 'Guipuzcoa',
                'country_id' => 205,
            ),
            287 => 
            array (
                'id' => 3288,
                'name' => 'Huelva',
                'country_id' => 205,
            ),
            288 => 
            array (
                'id' => 3289,
                'name' => 'Huesca',
                'country_id' => 205,
            ),
            289 => 
            array (
                'id' => 3290,
                'name' => 'Jaen',
                'country_id' => 205,
            ),
            290 => 
            array (
                'id' => 3291,
                'name' => 'La Rioja',
                'country_id' => 205,
            ),
            291 => 
            array (
                'id' => 3292,
                'name' => 'Las Palmas',
                'country_id' => 205,
            ),
            292 => 
            array (
                'id' => 3293,
                'name' => 'Leon',
                'country_id' => 205,
            ),
            293 => 
            array (
                'id' => 3294,
                'name' => 'Lerida',
                'country_id' => 205,
            ),
            294 => 
            array (
                'id' => 3295,
                'name' => 'Lleida',
                'country_id' => 205,
            ),
            295 => 
            array (
                'id' => 3296,
                'name' => 'Lugo',
                'country_id' => 205,
            ),
            296 => 
            array (
                'id' => 3297,
                'name' => 'Madrid',
                'country_id' => 205,
            ),
            297 => 
            array (
                'id' => 3298,
                'name' => 'Malaga',
                'country_id' => 205,
            ),
            298 => 
            array (
                'id' => 3299,
                'name' => 'Melilla',
                'country_id' => 205,
            ),
            299 => 
            array (
                'id' => 3300,
                'name' => 'Murcia',
                'country_id' => 205,
            ),
            300 => 
            array (
                'id' => 3301,
                'name' => 'Navarra',
                'country_id' => 205,
            ),
            301 => 
            array (
                'id' => 3302,
                'name' => 'Ourense',
                'country_id' => 205,
            ),
            302 => 
            array (
                'id' => 3303,
                'name' => 'Pais Vasco',
                'country_id' => 205,
            ),
            303 => 
            array (
                'id' => 3304,
                'name' => 'Palencia',
                'country_id' => 205,
            ),
            304 => 
            array (
                'id' => 3305,
                'name' => 'Pontevedra',
                'country_id' => 205,
            ),
            305 => 
            array (
                'id' => 3306,
                'name' => 'Salamanca',
                'country_id' => 205,
            ),
            306 => 
            array (
                'id' => 3307,
                'name' => 'Santa Cruz de Tenerife',
                'country_id' => 205,
            ),
            307 => 
            array (
                'id' => 3308,
                'name' => 'Segovia',
                'country_id' => 205,
            ),
            308 => 
            array (
                'id' => 3309,
                'name' => 'Sevilla',
                'country_id' => 205,
            ),
            309 => 
            array (
                'id' => 3310,
                'name' => 'Soria',
                'country_id' => 205,
            ),
            310 => 
            array (
                'id' => 3311,
                'name' => 'Tarragona',
                'country_id' => 205,
            ),
            311 => 
            array (
                'id' => 3312,
                'name' => 'Tenerife',
                'country_id' => 205,
            ),
            312 => 
            array (
                'id' => 3313,
                'name' => 'Teruel',
                'country_id' => 205,
            ),
            313 => 
            array (
                'id' => 3314,
                'name' => 'Toledo',
                'country_id' => 205,
            ),
            314 => 
            array (
                'id' => 3315,
                'name' => 'Valencia',
                'country_id' => 205,
            ),
            315 => 
            array (
                'id' => 3316,
                'name' => 'Valladolid',
                'country_id' => 205,
            ),
            316 => 
            array (
                'id' => 3317,
                'name' => 'Vizcaya',
                'country_id' => 205,
            ),
            317 => 
            array (
                'id' => 3318,
                'name' => 'Zamora',
                'country_id' => 205,
            ),
            318 => 
            array (
                'id' => 3319,
                'name' => 'Zaragoza',
                'country_id' => 205,
            ),
            319 => 
            array (
                'id' => 3320,
                'name' => 'Amparai',
                'country_id' => 206,
            ),
            320 => 
            array (
                'id' => 3321,
                'name' => 'Anuradhapuraya',
                'country_id' => 206,
            ),
            321 => 
            array (
                'id' => 3322,
                'name' => 'Badulla',
                'country_id' => 206,
            ),
            322 => 
            array (
                'id' => 3323,
                'name' => 'Boralesgamuwa',
                'country_id' => 206,
            ),
            323 => 
            array (
                'id' => 3324,
                'name' => 'Colombo',
                'country_id' => 206,
            ),
            324 => 
            array (
                'id' => 3325,
                'name' => 'Galla',
                'country_id' => 206,
            ),
            325 => 
            array (
                'id' => 3326,
                'name' => 'Gampaha',
                'country_id' => 206,
            ),
            326 => 
            array (
                'id' => 3327,
                'name' => 'Hambantota',
                'country_id' => 206,
            ),
            327 => 
            array (
                'id' => 3328,
                'name' => 'Kalatura',
                'country_id' => 206,
            ),
            328 => 
            array (
                'id' => 3329,
                'name' => 'Kegalla',
                'country_id' => 206,
            ),
            329 => 
            array (
                'id' => 3330,
                'name' => 'Kilinochchi',
                'country_id' => 206,
            ),
            330 => 
            array (
                'id' => 3331,
                'name' => 'Kurunegala',
                'country_id' => 206,
            ),
            331 => 
            array (
                'id' => 3332,
                'name' => 'Madakalpuwa',
                'country_id' => 206,
            ),
            332 => 
            array (
                'id' => 3333,
                'name' => 'Maha Nuwara',
                'country_id' => 206,
            ),
            333 => 
            array (
                'id' => 3334,
                'name' => 'Malwana',
                'country_id' => 206,
            ),
            334 => 
            array (
                'id' => 3335,
                'name' => 'Mannarama',
                'country_id' => 206,
            ),
            335 => 
            array (
                'id' => 3336,
                'name' => 'Matale',
                'country_id' => 206,
            ),
            336 => 
            array (
                'id' => 3337,
                'name' => 'Matara',
                'country_id' => 206,
            ),
            337 => 
            array (
                'id' => 3338,
                'name' => 'Monaragala',
                'country_id' => 206,
            ),
            338 => 
            array (
                'id' => 3339,
                'name' => 'Mullaitivu',
                'country_id' => 206,
            ),
            339 => 
            array (
                'id' => 3340,
                'name' => 'North Eastern Province',
                'country_id' => 206,
            ),
            340 => 
            array (
                'id' => 3341,
                'name' => 'North Western Province',
                'country_id' => 206,
            ),
            341 => 
            array (
                'id' => 3342,
                'name' => 'Nuwara Eliya',
                'country_id' => 206,
            ),
            342 => 
            array (
                'id' => 3343,
                'name' => 'Polonnaruwa',
                'country_id' => 206,
            ),
            343 => 
            array (
                'id' => 3344,
                'name' => 'Puttalama',
                'country_id' => 206,
            ),
            344 => 
            array (
                'id' => 3345,
                'name' => 'Ratnapuraya',
                'country_id' => 206,
            ),
            345 => 
            array (
                'id' => 3346,
                'name' => 'Southern Province',
                'country_id' => 206,
            ),
            346 => 
            array (
                'id' => 3347,
                'name' => 'Tirikunamalaya',
                'country_id' => 206,
            ),
            347 => 
            array (
                'id' => 3348,
                'name' => 'Tuscany',
                'country_id' => 206,
            ),
            348 => 
            array (
                'id' => 3349,
                'name' => 'Vavuniyawa',
                'country_id' => 206,
            ),
            349 => 
            array (
                'id' => 3350,
                'name' => 'Western Province',
                'country_id' => 206,
            ),
            350 => 
            array (
                'id' => 3351,
                'name' => 'Yapanaya',
                'country_id' => 206,
            ),
            351 => 
            array (
                'id' => 3352,
                'name' => 'kadawatha',
                'country_id' => 206,
            ),
            352 => 
            array (
                'id' => 3353,
                'name' => 'A\'ali-an-Nil',
                'country_id' => 207,
            ),
            353 => 
            array (
                'id' => 3354,
                'name' => 'Bahr-al-Jabal',
                'country_id' => 207,
            ),
            354 => 
            array (
                'id' => 3355,
                'name' => 'Central Equatoria',
                'country_id' => 207,
            ),
            355 => 
            array (
                'id' => 3356,
                'name' => 'Gharb Bahr-al-Ghazal',
                'country_id' => 207,
            ),
            356 => 
            array (
                'id' => 3357,
                'name' => 'Gharb Darfur',
                'country_id' => 207,
            ),
            357 => 
            array (
                'id' => 3358,
                'name' => 'Gharb Kurdufan',
                'country_id' => 207,
            ),
            358 => 
            array (
                'id' => 3359,
                'name' => 'Gharb-al-Istiwa\'iyah',
                'country_id' => 207,
            ),
            359 => 
            array (
                'id' => 3360,
                'name' => 'Janub Darfur',
                'country_id' => 207,
            ),
            360 => 
            array (
                'id' => 3361,
                'name' => 'Janub Kurdufan',
                'country_id' => 207,
            ),
            361 => 
            array (
                'id' => 3362,
                'name' => 'Junqali',
                'country_id' => 207,
            ),
            362 => 
            array (
                'id' => 3363,
                'name' => 'Kassala',
                'country_id' => 207,
            ),
            363 => 
            array (
                'id' => 3364,
                'name' => 'Nahr-an-Nil',
                'country_id' => 207,
            ),
            364 => 
            array (
                'id' => 3365,
                'name' => 'Shamal Bahr-al-Ghazal',
                'country_id' => 207,
            ),
            365 => 
            array (
                'id' => 3366,
                'name' => 'Shamal Darfur',
                'country_id' => 207,
            ),
            366 => 
            array (
                'id' => 3367,
                'name' => 'Shamal Kurdufan',
                'country_id' => 207,
            ),
            367 => 
            array (
                'id' => 3368,
                'name' => 'Sharq-al-Istiwa\'iyah',
                'country_id' => 207,
            ),
            368 => 
            array (
                'id' => 3369,
                'name' => 'Sinnar',
                'country_id' => 207,
            ),
            369 => 
            array (
                'id' => 3370,
                'name' => 'Warab',
                'country_id' => 207,
            ),
            370 => 
            array (
                'id' => 3371,
                'name' => 'Wilayat al Khartum',
                'country_id' => 207,
            ),
            371 => 
            array (
                'id' => 3372,
                'name' => 'al-Bahr-al-Ahmar',
                'country_id' => 207,
            ),
            372 => 
            array (
                'id' => 3373,
                'name' => 'al-Buhayrat',
                'country_id' => 207,
            ),
            373 => 
            array (
                'id' => 3374,
                'name' => 'al-Jazirah',
                'country_id' => 207,
            ),
            374 => 
            array (
                'id' => 3375,
                'name' => 'al-Khartum',
                'country_id' => 207,
            ),
            375 => 
            array (
                'id' => 3376,
                'name' => 'al-Qadarif',
                'country_id' => 207,
            ),
            376 => 
            array (
                'id' => 3377,
                'name' => 'al-Wahdah',
                'country_id' => 207,
            ),
            377 => 
            array (
                'id' => 3378,
                'name' => 'an-Nil-al-Abyad',
                'country_id' => 207,
            ),
            378 => 
            array (
                'id' => 3379,
                'name' => 'an-Nil-al-Azraq',
                'country_id' => 207,
            ),
            379 => 
            array (
                'id' => 3380,
                'name' => 'ash-Shamaliyah',
                'country_id' => 207,
            ),
            380 => 
            array (
                'id' => 3381,
                'name' => 'Brokopondo',
                'country_id' => 208,
            ),
            381 => 
            array (
                'id' => 3382,
                'name' => 'Commewijne',
                'country_id' => 208,
            ),
            382 => 
            array (
                'id' => 3383,
                'name' => 'Coronie',
                'country_id' => 208,
            ),
            383 => 
            array (
                'id' => 3384,
                'name' => 'Marowijne',
                'country_id' => 208,
            ),
            384 => 
            array (
                'id' => 3385,
                'name' => 'Nickerie',
                'country_id' => 208,
            ),
            385 => 
            array (
                'id' => 3386,
                'name' => 'Para',
                'country_id' => 208,
            ),
            386 => 
            array (
                'id' => 3387,
                'name' => 'Paramaribo',
                'country_id' => 208,
            ),
            387 => 
            array (
                'id' => 3388,
                'name' => 'Saramacca',
                'country_id' => 208,
            ),
            388 => 
            array (
                'id' => 3389,
                'name' => 'Wanica',
                'country_id' => 208,
            ),
            389 => 
            array (
                'id' => 3390,
                'name' => 'Svalbard',
                'country_id' => 209,
            ),
            390 => 
            array (
                'id' => 3391,
                'name' => 'Hhohho',
                'country_id' => 210,
            ),
            391 => 
            array (
                'id' => 3392,
                'name' => 'Lubombo',
                'country_id' => 210,
            ),
            392 => 
            array (
                'id' => 3393,
                'name' => 'Manzini',
                'country_id' => 210,
            ),
            393 => 
            array (
                'id' => 3394,
                'name' => 'Shiselweni',
                'country_id' => 210,
            ),
            394 => 
            array (
                'id' => 3395,
                'name' => 'Alvsborgs Lan',
                'country_id' => 211,
            ),
            395 => 
            array (
                'id' => 3396,
                'name' => 'Angermanland',
                'country_id' => 211,
            ),
            396 => 
            array (
                'id' => 3397,
                'name' => 'Blekinge',
                'country_id' => 211,
            ),
            397 => 
            array (
                'id' => 3398,
                'name' => 'Bohuslan',
                'country_id' => 211,
            ),
            398 => 
            array (
                'id' => 3399,
                'name' => 'Dalarna',
                'country_id' => 211,
            ),
            399 => 
            array (
                'id' => 3400,
                'name' => 'Gavleborg',
                'country_id' => 211,
            ),
            400 => 
            array (
                'id' => 3401,
                'name' => 'Gaza',
                'country_id' => 211,
            ),
            401 => 
            array (
                'id' => 3402,
                'name' => 'Gotland',
                'country_id' => 211,
            ),
            402 => 
            array (
                'id' => 3403,
                'name' => 'Halland',
                'country_id' => 211,
            ),
            403 => 
            array (
                'id' => 3404,
                'name' => 'Jamtland',
                'country_id' => 211,
            ),
            404 => 
            array (
                'id' => 3405,
                'name' => 'Jonkoping',
                'country_id' => 211,
            ),
            405 => 
            array (
                'id' => 3406,
                'name' => 'Kalmar',
                'country_id' => 211,
            ),
            406 => 
            array (
                'id' => 3407,
                'name' => 'Kristianstads',
                'country_id' => 211,
            ),
            407 => 
            array (
                'id' => 3408,
                'name' => 'Kronoberg',
                'country_id' => 211,
            ),
            408 => 
            array (
                'id' => 3409,
                'name' => 'Norrbotten',
                'country_id' => 211,
            ),
            409 => 
            array (
                'id' => 3410,
                'name' => 'Orebro',
                'country_id' => 211,
            ),
            410 => 
            array (
                'id' => 3411,
                'name' => 'Ostergotland',
                'country_id' => 211,
            ),
            411 => 
            array (
                'id' => 3412,
                'name' => 'Saltsjo-Boo',
                'country_id' => 211,
            ),
            412 => 
            array (
                'id' => 3413,
                'name' => 'Skane',
                'country_id' => 211,
            ),
            413 => 
            array (
                'id' => 3414,
                'name' => 'Smaland',
                'country_id' => 211,
            ),
            414 => 
            array (
                'id' => 3415,
                'name' => 'Sodermanland',
                'country_id' => 211,
            ),
            415 => 
            array (
                'id' => 3416,
                'name' => 'Stockholm',
                'country_id' => 211,
            ),
            416 => 
            array (
                'id' => 3417,
                'name' => 'Uppsala',
                'country_id' => 211,
            ),
            417 => 
            array (
                'id' => 3418,
                'name' => 'Varmland',
                'country_id' => 211,
            ),
            418 => 
            array (
                'id' => 3419,
                'name' => 'Vasterbotten',
                'country_id' => 211,
            ),
            419 => 
            array (
                'id' => 3420,
                'name' => 'Vastergotland',
                'country_id' => 211,
            ),
            420 => 
            array (
                'id' => 3421,
                'name' => 'Vasternorrland',
                'country_id' => 211,
            ),
            421 => 
            array (
                'id' => 3422,
                'name' => 'Vastmanland',
                'country_id' => 211,
            ),
            422 => 
            array (
                'id' => 3423,
                'name' => 'Vastra Gotaland',
                'country_id' => 211,
            ),
            423 => 
            array (
                'id' => 3424,
                'name' => 'Aargau',
                'country_id' => 212,
            ),
            424 => 
            array (
                'id' => 3425,
                'name' => 'Appenzell Inner-Rhoden',
                'country_id' => 212,
            ),
            425 => 
            array (
                'id' => 3426,
                'name' => 'Appenzell-Ausser Rhoden',
                'country_id' => 212,
            ),
            426 => 
            array (
                'id' => 3427,
                'name' => 'Basel-Landschaft',
                'country_id' => 212,
            ),
            427 => 
            array (
                'id' => 3428,
                'name' => 'Basel-Stadt',
                'country_id' => 212,
            ),
            428 => 
            array (
                'id' => 3429,
                'name' => 'Bern',
                'country_id' => 212,
            ),
            429 => 
            array (
                'id' => 3430,
                'name' => 'Canton Ticino',
                'country_id' => 212,
            ),
            430 => 
            array (
                'id' => 3431,
                'name' => 'Fribourg',
                'country_id' => 212,
            ),
            431 => 
            array (
                'id' => 3432,
                'name' => 'Geneve',
                'country_id' => 212,
            ),
            432 => 
            array (
                'id' => 3433,
                'name' => 'Glarus',
                'country_id' => 212,
            ),
            433 => 
            array (
                'id' => 3434,
                'name' => 'Graubunden',
                'country_id' => 212,
            ),
            434 => 
            array (
                'id' => 3435,
                'name' => 'Heerbrugg',
                'country_id' => 212,
            ),
            435 => 
            array (
                'id' => 3436,
                'name' => 'Jura',
                'country_id' => 212,
            ),
            436 => 
            array (
                'id' => 3437,
                'name' => 'Kanton Aargau',
                'country_id' => 212,
            ),
            437 => 
            array (
                'id' => 3438,
                'name' => 'Luzern',
                'country_id' => 212,
            ),
            438 => 
            array (
                'id' => 3439,
                'name' => 'Morbio Inferiore',
                'country_id' => 212,
            ),
            439 => 
            array (
                'id' => 3440,
                'name' => 'Muhen',
                'country_id' => 212,
            ),
            440 => 
            array (
                'id' => 3441,
                'name' => 'Neuchatel',
                'country_id' => 212,
            ),
            441 => 
            array (
                'id' => 3442,
                'name' => 'Nidwalden',
                'country_id' => 212,
            ),
            442 => 
            array (
                'id' => 3443,
                'name' => 'Obwalden',
                'country_id' => 212,
            ),
            443 => 
            array (
                'id' => 3444,
                'name' => 'Sankt Gallen',
                'country_id' => 212,
            ),
            444 => 
            array (
                'id' => 3445,
                'name' => 'Schaffhausen',
                'country_id' => 212,
            ),
            445 => 
            array (
                'id' => 3446,
                'name' => 'Schwyz',
                'country_id' => 212,
            ),
            446 => 
            array (
                'id' => 3447,
                'name' => 'Solothurn',
                'country_id' => 212,
            ),
            447 => 
            array (
                'id' => 3448,
                'name' => 'Thurgau',
                'country_id' => 212,
            ),
            448 => 
            array (
                'id' => 3449,
                'name' => 'Ticino',
                'country_id' => 212,
            ),
            449 => 
            array (
                'id' => 3450,
                'name' => 'Uri',
                'country_id' => 212,
            ),
            450 => 
            array (
                'id' => 3451,
                'name' => 'Valais',
                'country_id' => 212,
            ),
            451 => 
            array (
                'id' => 3452,
                'name' => 'Vaud',
                'country_id' => 212,
            ),
            452 => 
            array (
                'id' => 3453,
                'name' => 'Vauffelin',
                'country_id' => 212,
            ),
            453 => 
            array (
                'id' => 3454,
                'name' => 'Zug',
                'country_id' => 212,
            ),
            454 => 
            array (
                'id' => 3455,
                'name' => 'Zurich',
                'country_id' => 212,
            ),
            455 => 
            array (
                'id' => 3456,
                'name' => 'Aleppo',
                'country_id' => 213,
            ),
            456 => 
            array (
                'id' => 3457,
                'name' => 'Dar\'a',
                'country_id' => 213,
            ),
            457 => 
            array (
                'id' => 3458,
                'name' => 'Dayr-az-Zawr',
                'country_id' => 213,
            ),
            458 => 
            array (
                'id' => 3459,
                'name' => 'Dimashq',
                'country_id' => 213,
            ),
            459 => 
            array (
                'id' => 3460,
                'name' => 'Halab',
                'country_id' => 213,
            ),
            460 => 
            array (
                'id' => 3461,
                'name' => 'Hamah',
                'country_id' => 213,
            ),
            461 => 
            array (
                'id' => 3462,
                'name' => 'Hims',
                'country_id' => 213,
            ),
            462 => 
            array (
                'id' => 3463,
                'name' => 'Idlib',
                'country_id' => 213,
            ),
            463 => 
            array (
                'id' => 3464,
                'name' => 'Madinat Dimashq',
                'country_id' => 213,
            ),
            464 => 
            array (
                'id' => 3465,
                'name' => 'Tartus',
                'country_id' => 213,
            ),
            465 => 
            array (
                'id' => 3466,
                'name' => 'al-Hasakah',
                'country_id' => 213,
            ),
            466 => 
            array (
                'id' => 3467,
                'name' => 'al-Ladhiqiyah',
                'country_id' => 213,
            ),
            467 => 
            array (
                'id' => 3468,
                'name' => 'al-Qunaytirah',
                'country_id' => 213,
            ),
            468 => 
            array (
                'id' => 3469,
                'name' => 'ar-Raqqah',
                'country_id' => 213,
            ),
            469 => 
            array (
                'id' => 3470,
                'name' => 'as-Suwayda',
                'country_id' => 213,
            ),
            470 => 
            array (
                'id' => 3471,
                'name' => 'Changhwa',
                'country_id' => 214,
            ),
            471 => 
            array (
                'id' => 3472,
                'name' => 'Chiayi Hsien',
                'country_id' => 214,
            ),
            472 => 
            array (
                'id' => 3473,
                'name' => 'Chiayi Shih',
                'country_id' => 214,
            ),
            473 => 
            array (
                'id' => 3474,
                'name' => 'Eastern Taipei',
                'country_id' => 214,
            ),
            474 => 
            array (
                'id' => 3475,
                'name' => 'Hsinchu Hsien',
                'country_id' => 214,
            ),
            475 => 
            array (
                'id' => 3476,
                'name' => 'Hsinchu Shih',
                'country_id' => 214,
            ),
            476 => 
            array (
                'id' => 3477,
                'name' => 'Hualien',
                'country_id' => 214,
            ),
            477 => 
            array (
                'id' => 3478,
                'name' => 'Ilan',
                'country_id' => 214,
            ),
            478 => 
            array (
                'id' => 3479,
                'name' => 'Kaohsiung Hsien',
                'country_id' => 214,
            ),
            479 => 
            array (
                'id' => 3480,
                'name' => 'Kaohsiung Shih',
                'country_id' => 214,
            ),
            480 => 
            array (
                'id' => 3481,
                'name' => 'Keelung Shih',
                'country_id' => 214,
            ),
            481 => 
            array (
                'id' => 3482,
                'name' => 'Kinmen',
                'country_id' => 214,
            ),
            482 => 
            array (
                'id' => 3483,
                'name' => 'Miaoli',
                'country_id' => 214,
            ),
            483 => 
            array (
                'id' => 3484,
                'name' => 'Nantou',
                'country_id' => 214,
            ),
            484 => 
            array (
                'id' => 3485,
                'name' => 'Northern Taiwan',
                'country_id' => 214,
            ),
            485 => 
            array (
                'id' => 3486,
                'name' => 'Penghu',
                'country_id' => 214,
            ),
            486 => 
            array (
                'id' => 3487,
                'name' => 'Pingtung',
                'country_id' => 214,
            ),
            487 => 
            array (
                'id' => 3488,
                'name' => 'Taichung',
                'country_id' => 214,
            ),
            488 => 
            array (
                'id' => 3489,
                'name' => 'Taichung Hsien',
                'country_id' => 214,
            ),
            489 => 
            array (
                'id' => 3490,
                'name' => 'Taichung Shih',
                'country_id' => 214,
            ),
            490 => 
            array (
                'id' => 3491,
                'name' => 'Tainan Hsien',
                'country_id' => 214,
            ),
            491 => 
            array (
                'id' => 3492,
                'name' => 'Tainan Shih',
                'country_id' => 214,
            ),
            492 => 
            array (
                'id' => 3493,
                'name' => 'Taipei Hsien',
                'country_id' => 214,
            ),
            493 => 
            array (
                'id' => 3494,
                'name' => 'Taipei Shih / Taipei Hsien',
                'country_id' => 214,
            ),
            494 => 
            array (
                'id' => 3495,
                'name' => 'Taitung',
                'country_id' => 214,
            ),
            495 => 
            array (
                'id' => 3496,
                'name' => 'Taoyuan',
                'country_id' => 214,
            ),
            496 => 
            array (
                'id' => 3497,
                'name' => 'Yilan',
                'country_id' => 214,
            ),
            497 => 
            array (
                'id' => 3498,
                'name' => 'Yun-Lin Hsien',
                'country_id' => 214,
            ),
            498 => 
            array (
                'id' => 3499,
                'name' => 'Yunlin',
                'country_id' => 214,
            ),
            499 => 
            array (
                'id' => 3500,
                'name' => 'Dushanbe',
                'country_id' => 215,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 3501,
                'name' => 'Gorno-Badakhshan',
                'country_id' => 215,
            ),
            1 => 
            array (
                'id' => 3502,
                'name' => 'Karotegin',
                'country_id' => 215,
            ),
            2 => 
            array (
                'id' => 3503,
                'name' => 'Khatlon',
                'country_id' => 215,
            ),
            3 => 
            array (
                'id' => 3504,
                'name' => 'Sughd',
                'country_id' => 215,
            ),
            4 => 
            array (
                'id' => 3505,
                'name' => 'Arusha',
                'country_id' => 216,
            ),
            5 => 
            array (
                'id' => 3506,
                'name' => 'Dar es Salaam',
                'country_id' => 216,
            ),
            6 => 
            array (
                'id' => 3507,
                'name' => 'Dodoma',
                'country_id' => 216,
            ),
            7 => 
            array (
                'id' => 3508,
                'name' => 'Iringa',
                'country_id' => 216,
            ),
            8 => 
            array (
                'id' => 3509,
                'name' => 'Kagera',
                'country_id' => 216,
            ),
            9 => 
            array (
                'id' => 3510,
                'name' => 'Kigoma',
                'country_id' => 216,
            ),
            10 => 
            array (
                'id' => 3511,
                'name' => 'Kilimanjaro',
                'country_id' => 216,
            ),
            11 => 
            array (
                'id' => 3512,
                'name' => 'Lindi',
                'country_id' => 216,
            ),
            12 => 
            array (
                'id' => 3513,
                'name' => 'Mara',
                'country_id' => 216,
            ),
            13 => 
            array (
                'id' => 3514,
                'name' => 'Mbeya',
                'country_id' => 216,
            ),
            14 => 
            array (
                'id' => 3515,
                'name' => 'Morogoro',
                'country_id' => 216,
            ),
            15 => 
            array (
                'id' => 3516,
                'name' => 'Mtwara',
                'country_id' => 216,
            ),
            16 => 
            array (
                'id' => 3517,
                'name' => 'Mwanza',
                'country_id' => 216,
            ),
            17 => 
            array (
                'id' => 3518,
                'name' => 'Pwani',
                'country_id' => 216,
            ),
            18 => 
            array (
                'id' => 3519,
                'name' => 'Rukwa',
                'country_id' => 216,
            ),
            19 => 
            array (
                'id' => 3520,
                'name' => 'Ruvuma',
                'country_id' => 216,
            ),
            20 => 
            array (
                'id' => 3521,
                'name' => 'Shinyanga',
                'country_id' => 216,
            ),
            21 => 
            array (
                'id' => 3522,
                'name' => 'Singida',
                'country_id' => 216,
            ),
            22 => 
            array (
                'id' => 3523,
                'name' => 'Tabora',
                'country_id' => 216,
            ),
            23 => 
            array (
                'id' => 3524,
                'name' => 'Tanga',
                'country_id' => 216,
            ),
            24 => 
            array (
                'id' => 3525,
                'name' => 'Zanzibar and Pemba',
                'country_id' => 216,
            ),
            25 => 
            array (
                'id' => 3526,
                'name' => 'Amnat Charoen',
                'country_id' => 217,
            ),
            26 => 
            array (
                'id' => 3527,
                'name' => 'Ang Thong',
                'country_id' => 217,
            ),
            27 => 
            array (
                'id' => 3528,
                'name' => 'Bangkok',
                'country_id' => 217,
            ),
            28 => 
            array (
                'id' => 3529,
                'name' => 'Buri Ram',
                'country_id' => 217,
            ),
            29 => 
            array (
                'id' => 3530,
                'name' => 'Chachoengsao',
                'country_id' => 217,
            ),
            30 => 
            array (
                'id' => 3531,
                'name' => 'Chai Nat',
                'country_id' => 217,
            ),
            31 => 
            array (
                'id' => 3532,
                'name' => 'Chaiyaphum',
                'country_id' => 217,
            ),
            32 => 
            array (
                'id' => 3533,
                'name' => 'Changwat Chaiyaphum',
                'country_id' => 217,
            ),
            33 => 
            array (
                'id' => 3534,
                'name' => 'Chanthaburi',
                'country_id' => 217,
            ),
            34 => 
            array (
                'id' => 3535,
                'name' => 'Chiang Mai',
                'country_id' => 217,
            ),
            35 => 
            array (
                'id' => 3536,
                'name' => 'Chiang Rai',
                'country_id' => 217,
            ),
            36 => 
            array (
                'id' => 3537,
                'name' => 'Chon Buri',
                'country_id' => 217,
            ),
            37 => 
            array (
                'id' => 3538,
                'name' => 'Chumphon',
                'country_id' => 217,
            ),
            38 => 
            array (
                'id' => 3539,
                'name' => 'Kalasin',
                'country_id' => 217,
            ),
            39 => 
            array (
                'id' => 3540,
                'name' => 'Kamphaeng Phet',
                'country_id' => 217,
            ),
            40 => 
            array (
                'id' => 3541,
                'name' => 'Kanchanaburi',
                'country_id' => 217,
            ),
            41 => 
            array (
                'id' => 3542,
                'name' => 'Khon Kaen',
                'country_id' => 217,
            ),
            42 => 
            array (
                'id' => 3543,
                'name' => 'Krabi',
                'country_id' => 217,
            ),
            43 => 
            array (
                'id' => 3544,
                'name' => 'Krung Thep',
                'country_id' => 217,
            ),
            44 => 
            array (
                'id' => 3545,
                'name' => 'Lampang',
                'country_id' => 217,
            ),
            45 => 
            array (
                'id' => 3546,
                'name' => 'Lamphun',
                'country_id' => 217,
            ),
            46 => 
            array (
                'id' => 3547,
                'name' => 'Loei',
                'country_id' => 217,
            ),
            47 => 
            array (
                'id' => 3548,
                'name' => 'Lop Buri',
                'country_id' => 217,
            ),
            48 => 
            array (
                'id' => 3549,
                'name' => 'Mae Hong Son',
                'country_id' => 217,
            ),
            49 => 
            array (
                'id' => 3550,
                'name' => 'Maha Sarakham',
                'country_id' => 217,
            ),
            50 => 
            array (
                'id' => 3551,
                'name' => 'Mukdahan',
                'country_id' => 217,
            ),
            51 => 
            array (
                'id' => 3552,
                'name' => 'Nakhon Nayok',
                'country_id' => 217,
            ),
            52 => 
            array (
                'id' => 3553,
                'name' => 'Nakhon Pathom',
                'country_id' => 217,
            ),
            53 => 
            array (
                'id' => 3554,
                'name' => 'Nakhon Phanom',
                'country_id' => 217,
            ),
            54 => 
            array (
                'id' => 3555,
                'name' => 'Nakhon Ratchasima',
                'country_id' => 217,
            ),
            55 => 
            array (
                'id' => 3556,
                'name' => 'Nakhon Sawan',
                'country_id' => 217,
            ),
            56 => 
            array (
                'id' => 3557,
                'name' => 'Nakhon Si Thammarat',
                'country_id' => 217,
            ),
            57 => 
            array (
                'id' => 3558,
                'name' => 'Nan',
                'country_id' => 217,
            ),
            58 => 
            array (
                'id' => 3559,
                'name' => 'Narathiwat',
                'country_id' => 217,
            ),
            59 => 
            array (
                'id' => 3560,
                'name' => 'Nong Bua Lam Phu',
                'country_id' => 217,
            ),
            60 => 
            array (
                'id' => 3561,
                'name' => 'Nong Khai',
                'country_id' => 217,
            ),
            61 => 
            array (
                'id' => 3562,
                'name' => 'Nonthaburi',
                'country_id' => 217,
            ),
            62 => 
            array (
                'id' => 3563,
                'name' => 'Pathum Thani',
                'country_id' => 217,
            ),
            63 => 
            array (
                'id' => 3564,
                'name' => 'Pattani',
                'country_id' => 217,
            ),
            64 => 
            array (
                'id' => 3565,
                'name' => 'Phangnga',
                'country_id' => 217,
            ),
            65 => 
            array (
                'id' => 3566,
                'name' => 'Phatthalung',
                'country_id' => 217,
            ),
            66 => 
            array (
                'id' => 3567,
                'name' => 'Phayao',
                'country_id' => 217,
            ),
            67 => 
            array (
                'id' => 3568,
                'name' => 'Phetchabun',
                'country_id' => 217,
            ),
            68 => 
            array (
                'id' => 3569,
                'name' => 'Phetchaburi',
                'country_id' => 217,
            ),
            69 => 
            array (
                'id' => 3570,
                'name' => 'Phichit',
                'country_id' => 217,
            ),
            70 => 
            array (
                'id' => 3571,
                'name' => 'Phitsanulok',
                'country_id' => 217,
            ),
            71 => 
            array (
                'id' => 3572,
                'name' => 'Phra Nakhon Si Ayutthaya',
                'country_id' => 217,
            ),
            72 => 
            array (
                'id' => 3573,
                'name' => 'Phrae',
                'country_id' => 217,
            ),
            73 => 
            array (
                'id' => 3574,
                'name' => 'Phuket',
                'country_id' => 217,
            ),
            74 => 
            array (
                'id' => 3575,
                'name' => 'Prachin Buri',
                'country_id' => 217,
            ),
            75 => 
            array (
                'id' => 3576,
                'name' => 'Prachuap Khiri Khan',
                'country_id' => 217,
            ),
            76 => 
            array (
                'id' => 3577,
                'name' => 'Ranong',
                'country_id' => 217,
            ),
            77 => 
            array (
                'id' => 3578,
                'name' => 'Ratchaburi',
                'country_id' => 217,
            ),
            78 => 
            array (
                'id' => 3579,
                'name' => 'Rayong',
                'country_id' => 217,
            ),
            79 => 
            array (
                'id' => 3580,
                'name' => 'Roi Et',
                'country_id' => 217,
            ),
            80 => 
            array (
                'id' => 3581,
                'name' => 'Sa Kaeo',
                'country_id' => 217,
            ),
            81 => 
            array (
                'id' => 3582,
                'name' => 'Sakon Nakhon',
                'country_id' => 217,
            ),
            82 => 
            array (
                'id' => 3583,
                'name' => 'Samut Prakan',
                'country_id' => 217,
            ),
            83 => 
            array (
                'id' => 3584,
                'name' => 'Samut Sakhon',
                'country_id' => 217,
            ),
            84 => 
            array (
                'id' => 3585,
                'name' => 'Samut Songkhran',
                'country_id' => 217,
            ),
            85 => 
            array (
                'id' => 3586,
                'name' => 'Saraburi',
                'country_id' => 217,
            ),
            86 => 
            array (
                'id' => 3587,
                'name' => 'Satun',
                'country_id' => 217,
            ),
            87 => 
            array (
                'id' => 3588,
                'name' => 'Si Sa Ket',
                'country_id' => 217,
            ),
            88 => 
            array (
                'id' => 3589,
                'name' => 'Sing Buri',
                'country_id' => 217,
            ),
            89 => 
            array (
                'id' => 3590,
                'name' => 'Songkhla',
                'country_id' => 217,
            ),
            90 => 
            array (
                'id' => 3591,
                'name' => 'Sukhothai',
                'country_id' => 217,
            ),
            91 => 
            array (
                'id' => 3592,
                'name' => 'Suphan Buri',
                'country_id' => 217,
            ),
            92 => 
            array (
                'id' => 3593,
                'name' => 'Surat Thani',
                'country_id' => 217,
            ),
            93 => 
            array (
                'id' => 3594,
                'name' => 'Surin',
                'country_id' => 217,
            ),
            94 => 
            array (
                'id' => 3595,
                'name' => 'Tak',
                'country_id' => 217,
            ),
            95 => 
            array (
                'id' => 3596,
                'name' => 'Trang',
                'country_id' => 217,
            ),
            96 => 
            array (
                'id' => 3597,
                'name' => 'Trat',
                'country_id' => 217,
            ),
            97 => 
            array (
                'id' => 3598,
                'name' => 'Ubon Ratchathani',
                'country_id' => 217,
            ),
            98 => 
            array (
                'id' => 3599,
                'name' => 'Udon Thani',
                'country_id' => 217,
            ),
            99 => 
            array (
                'id' => 3600,
                'name' => 'Uthai Thani',
                'country_id' => 217,
            ),
            100 => 
            array (
                'id' => 3601,
                'name' => 'Uttaradit',
                'country_id' => 217,
            ),
            101 => 
            array (
                'id' => 3602,
                'name' => 'Yala',
                'country_id' => 217,
            ),
            102 => 
            array (
                'id' => 3603,
                'name' => 'Yasothon',
                'country_id' => 217,
            ),
            103 => 
            array (
                'id' => 3604,
                'name' => 'Centre',
                'country_id' => 218,
            ),
            104 => 
            array (
                'id' => 3605,
                'name' => 'Kara',
                'country_id' => 218,
            ),
            105 => 
            array (
                'id' => 3606,
                'name' => 'Maritime',
                'country_id' => 218,
            ),
            106 => 
            array (
                'id' => 3607,
                'name' => 'Plateaux',
                'country_id' => 218,
            ),
            107 => 
            array (
                'id' => 3608,
                'name' => 'Savanes',
                'country_id' => 218,
            ),
            108 => 
            array (
                'id' => 3609,
                'name' => 'Atafu',
                'country_id' => 219,
            ),
            109 => 
            array (
                'id' => 3610,
                'name' => 'Fakaofo',
                'country_id' => 219,
            ),
            110 => 
            array (
                'id' => 3611,
                'name' => 'Nukunonu',
                'country_id' => 219,
            ),
            111 => 
            array (
                'id' => 3612,
                'name' => 'Eua',
                'country_id' => 220,
            ),
            112 => 
            array (
                'id' => 3613,
                'name' => 'Ha\'apai',
                'country_id' => 220,
            ),
            113 => 
            array (
                'id' => 3614,
                'name' => 'Niuas',
                'country_id' => 220,
            ),
            114 => 
            array (
                'id' => 3615,
                'name' => 'Tongatapu',
                'country_id' => 220,
            ),
            115 => 
            array (
                'id' => 3616,
                'name' => 'Vava\'u',
                'country_id' => 220,
            ),
            116 => 
            array (
                'id' => 3617,
                'name' => 'Arima-Tunapuna-Piarco',
                'country_id' => 221,
            ),
            117 => 
            array (
                'id' => 3618,
                'name' => 'Caroni',
                'country_id' => 221,
            ),
            118 => 
            array (
                'id' => 3619,
                'name' => 'Chaguanas',
                'country_id' => 221,
            ),
            119 => 
            array (
                'id' => 3620,
                'name' => 'Couva-Tabaquite-Talparo',
                'country_id' => 221,
            ),
            120 => 
            array (
                'id' => 3621,
                'name' => 'Diego Martin',
                'country_id' => 221,
            ),
            121 => 
            array (
                'id' => 3622,
                'name' => 'Glencoe',
                'country_id' => 221,
            ),
            122 => 
            array (
                'id' => 3623,
                'name' => 'Penal Debe',
                'country_id' => 221,
            ),
            123 => 
            array (
                'id' => 3624,
                'name' => 'Point Fortin',
                'country_id' => 221,
            ),
            124 => 
            array (
                'id' => 3625,
                'name' => 'Port of Spain',
                'country_id' => 221,
            ),
            125 => 
            array (
                'id' => 3626,
                'name' => 'Princes Town',
                'country_id' => 221,
            ),
            126 => 
            array (
                'id' => 3627,
                'name' => 'Saint George',
                'country_id' => 221,
            ),
            127 => 
            array (
                'id' => 3628,
                'name' => 'San Fernando',
                'country_id' => 221,
            ),
            128 => 
            array (
                'id' => 3629,
                'name' => 'San Juan',
                'country_id' => 221,
            ),
            129 => 
            array (
                'id' => 3630,
                'name' => 'Sangre Grande',
                'country_id' => 221,
            ),
            130 => 
            array (
                'id' => 3631,
                'name' => 'Siparia',
                'country_id' => 221,
            ),
            131 => 
            array (
                'id' => 3632,
                'name' => 'Tobago',
                'country_id' => 221,
            ),
            132 => 
            array (
                'id' => 3633,
                'name' => 'Aryanah',
                'country_id' => 222,
            ),
            133 => 
            array (
                'id' => 3634,
                'name' => 'Bajah',
                'country_id' => 222,
            ),
            134 => 
            array (
                'id' => 3635,
                'name' => 'Bin \'Arus',
                'country_id' => 222,
            ),
            135 => 
            array (
                'id' => 3636,
                'name' => 'Binzart',
                'country_id' => 222,
            ),
            136 => 
            array (
                'id' => 3637,
                'name' => 'Gouvernorat de Ariana',
                'country_id' => 222,
            ),
            137 => 
            array (
                'id' => 3638,
                'name' => 'Gouvernorat de Nabeul',
                'country_id' => 222,
            ),
            138 => 
            array (
                'id' => 3639,
                'name' => 'Gouvernorat de Sousse',
                'country_id' => 222,
            ),
            139 => 
            array (
                'id' => 3640,
                'name' => 'Hammamet Yasmine',
                'country_id' => 222,
            ),
            140 => 
            array (
                'id' => 3641,
                'name' => 'Jundubah',
                'country_id' => 222,
            ),
            141 => 
            array (
                'id' => 3642,
                'name' => 'Madaniyin',
                'country_id' => 222,
            ),
            142 => 
            array (
                'id' => 3643,
                'name' => 'Manubah',
                'country_id' => 222,
            ),
            143 => 
            array (
                'id' => 3644,
                'name' => 'Monastir',
                'country_id' => 222,
            ),
            144 => 
            array (
                'id' => 3645,
                'name' => 'Nabul',
                'country_id' => 222,
            ),
            145 => 
            array (
                'id' => 3646,
                'name' => 'Qabis',
                'country_id' => 222,
            ),
            146 => 
            array (
                'id' => 3647,
                'name' => 'Qafsah',
                'country_id' => 222,
            ),
            147 => 
            array (
                'id' => 3648,
                'name' => 'Qibili',
                'country_id' => 222,
            ),
            148 => 
            array (
                'id' => 3649,
                'name' => 'Safaqis',
                'country_id' => 222,
            ),
            149 => 
            array (
                'id' => 3650,
                'name' => 'Sfax',
                'country_id' => 222,
            ),
            150 => 
            array (
                'id' => 3651,
                'name' => 'Sidi Bu Zayd',
                'country_id' => 222,
            ),
            151 => 
            array (
                'id' => 3652,
                'name' => 'Silyanah',
                'country_id' => 222,
            ),
            152 => 
            array (
                'id' => 3653,
                'name' => 'Susah',
                'country_id' => 222,
            ),
            153 => 
            array (
                'id' => 3654,
                'name' => 'Tatawin',
                'country_id' => 222,
            ),
            154 => 
            array (
                'id' => 3655,
                'name' => 'Tawzar',
                'country_id' => 222,
            ),
            155 => 
            array (
                'id' => 3656,
                'name' => 'Tunis',
                'country_id' => 222,
            ),
            156 => 
            array (
                'id' => 3657,
                'name' => 'Zaghwan',
                'country_id' => 222,
            ),
            157 => 
            array (
                'id' => 3658,
                'name' => 'al-Kaf',
                'country_id' => 222,
            ),
            158 => 
            array (
                'id' => 3659,
                'name' => 'al-Mahdiyah',
                'country_id' => 222,
            ),
            159 => 
            array (
                'id' => 3660,
                'name' => 'al-Munastir',
                'country_id' => 222,
            ),
            160 => 
            array (
                'id' => 3661,
                'name' => 'al-Qasrayn',
                'country_id' => 222,
            ),
            161 => 
            array (
                'id' => 3662,
                'name' => 'al-Qayrawan',
                'country_id' => 222,
            ),
            162 => 
            array (
                'id' => 3663,
                'name' => 'Adana',
                'country_id' => 223,
            ),
            163 => 
            array (
                'id' => 3664,
                'name' => 'Adiyaman',
                'country_id' => 223,
            ),
            164 => 
            array (
                'id' => 3665,
                'name' => 'Afyon',
                'country_id' => 223,
            ),
            165 => 
            array (
                'id' => 3666,
                'name' => 'Agri',
                'country_id' => 223,
            ),
            166 => 
            array (
                'id' => 3667,
                'name' => 'Aksaray',
                'country_id' => 223,
            ),
            167 => 
            array (
                'id' => 3668,
                'name' => 'Amasya',
                'country_id' => 223,
            ),
            168 => 
            array (
                'id' => 3669,
                'name' => 'Ankara',
                'country_id' => 223,
            ),
            169 => 
            array (
                'id' => 3670,
                'name' => 'Antalya',
                'country_id' => 223,
            ),
            170 => 
            array (
                'id' => 3671,
                'name' => 'Ardahan',
                'country_id' => 223,
            ),
            171 => 
            array (
                'id' => 3672,
                'name' => 'Artvin',
                'country_id' => 223,
            ),
            172 => 
            array (
                'id' => 3673,
                'name' => 'Aydin',
                'country_id' => 223,
            ),
            173 => 
            array (
                'id' => 3674,
                'name' => 'Balikesir',
                'country_id' => 223,
            ),
            174 => 
            array (
                'id' => 3675,
                'name' => 'Bartin',
                'country_id' => 223,
            ),
            175 => 
            array (
                'id' => 3676,
                'name' => 'Batman',
                'country_id' => 223,
            ),
            176 => 
            array (
                'id' => 3677,
                'name' => 'Bayburt',
                'country_id' => 223,
            ),
            177 => 
            array (
                'id' => 3678,
                'name' => 'Bilecik',
                'country_id' => 223,
            ),
            178 => 
            array (
                'id' => 3679,
                'name' => 'Bingol',
                'country_id' => 223,
            ),
            179 => 
            array (
                'id' => 3680,
                'name' => 'Bitlis',
                'country_id' => 223,
            ),
            180 => 
            array (
                'id' => 3681,
                'name' => 'Bolu',
                'country_id' => 223,
            ),
            181 => 
            array (
                'id' => 3682,
                'name' => 'Burdur',
                'country_id' => 223,
            ),
            182 => 
            array (
                'id' => 3683,
                'name' => 'Bursa',
                'country_id' => 223,
            ),
            183 => 
            array (
                'id' => 3684,
                'name' => 'Canakkale',
                'country_id' => 223,
            ),
            184 => 
            array (
                'id' => 3685,
                'name' => 'Cankiri',
                'country_id' => 223,
            ),
            185 => 
            array (
                'id' => 3686,
                'name' => 'Corum',
                'country_id' => 223,
            ),
            186 => 
            array (
                'id' => 3687,
                'name' => 'Denizli',
                'country_id' => 223,
            ),
            187 => 
            array (
                'id' => 3688,
                'name' => 'Diyarbakir',
                'country_id' => 223,
            ),
            188 => 
            array (
                'id' => 3689,
                'name' => 'Duzce',
                'country_id' => 223,
            ),
            189 => 
            array (
                'id' => 3690,
                'name' => 'Edirne',
                'country_id' => 223,
            ),
            190 => 
            array (
                'id' => 3691,
                'name' => 'Elazig',
                'country_id' => 223,
            ),
            191 => 
            array (
                'id' => 3692,
                'name' => 'Erzincan',
                'country_id' => 223,
            ),
            192 => 
            array (
                'id' => 3693,
                'name' => 'Erzurum',
                'country_id' => 223,
            ),
            193 => 
            array (
                'id' => 3694,
                'name' => 'Eskisehir',
                'country_id' => 223,
            ),
            194 => 
            array (
                'id' => 3695,
                'name' => 'Gaziantep',
                'country_id' => 223,
            ),
            195 => 
            array (
                'id' => 3696,
                'name' => 'Giresun',
                'country_id' => 223,
            ),
            196 => 
            array (
                'id' => 3697,
                'name' => 'Gumushane',
                'country_id' => 223,
            ),
            197 => 
            array (
                'id' => 3698,
                'name' => 'Hakkari',
                'country_id' => 223,
            ),
            198 => 
            array (
                'id' => 3699,
                'name' => 'Hatay',
                'country_id' => 223,
            ),
            199 => 
            array (
                'id' => 3700,
                'name' => 'Icel',
                'country_id' => 223,
            ),
            200 => 
            array (
                'id' => 3701,
                'name' => 'Igdir',
                'country_id' => 223,
            ),
            201 => 
            array (
                'id' => 3702,
                'name' => 'Isparta',
                'country_id' => 223,
            ),
            202 => 
            array (
                'id' => 3703,
                'name' => 'Istanbul',
                'country_id' => 223,
            ),
            203 => 
            array (
                'id' => 3704,
                'name' => 'Izmir',
                'country_id' => 223,
            ),
            204 => 
            array (
                'id' => 3705,
                'name' => 'Kahramanmaras',
                'country_id' => 223,
            ),
            205 => 
            array (
                'id' => 3706,
                'name' => 'Karabuk',
                'country_id' => 223,
            ),
            206 => 
            array (
                'id' => 3707,
                'name' => 'Karaman',
                'country_id' => 223,
            ),
            207 => 
            array (
                'id' => 3708,
                'name' => 'Kars',
                'country_id' => 223,
            ),
            208 => 
            array (
                'id' => 3709,
                'name' => 'Karsiyaka',
                'country_id' => 223,
            ),
            209 => 
            array (
                'id' => 3710,
                'name' => 'Kastamonu',
                'country_id' => 223,
            ),
            210 => 
            array (
                'id' => 3711,
                'name' => 'Kayseri',
                'country_id' => 223,
            ),
            211 => 
            array (
                'id' => 3712,
                'name' => 'Kilis',
                'country_id' => 223,
            ),
            212 => 
            array (
                'id' => 3713,
                'name' => 'Kirikkale',
                'country_id' => 223,
            ),
            213 => 
            array (
                'id' => 3714,
                'name' => 'Kirklareli',
                'country_id' => 223,
            ),
            214 => 
            array (
                'id' => 3715,
                'name' => 'Kirsehir',
                'country_id' => 223,
            ),
            215 => 
            array (
                'id' => 3716,
                'name' => 'Kocaeli',
                'country_id' => 223,
            ),
            216 => 
            array (
                'id' => 3717,
                'name' => 'Konya',
                'country_id' => 223,
            ),
            217 => 
            array (
                'id' => 3718,
                'name' => 'Kutahya',
                'country_id' => 223,
            ),
            218 => 
            array (
                'id' => 3719,
                'name' => 'Lefkosa',
                'country_id' => 223,
            ),
            219 => 
            array (
                'id' => 3720,
                'name' => 'Malatya',
                'country_id' => 223,
            ),
            220 => 
            array (
                'id' => 3721,
                'name' => 'Manisa',
                'country_id' => 223,
            ),
            221 => 
            array (
                'id' => 3722,
                'name' => 'Mardin',
                'country_id' => 223,
            ),
            222 => 
            array (
                'id' => 3723,
                'name' => 'Mugla',
                'country_id' => 223,
            ),
            223 => 
            array (
                'id' => 3724,
                'name' => 'Mus',
                'country_id' => 223,
            ),
            224 => 
            array (
                'id' => 3725,
                'name' => 'Nevsehir',
                'country_id' => 223,
            ),
            225 => 
            array (
                'id' => 3726,
                'name' => 'Nigde',
                'country_id' => 223,
            ),
            226 => 
            array (
                'id' => 3727,
                'name' => 'Ordu',
                'country_id' => 223,
            ),
            227 => 
            array (
                'id' => 3728,
                'name' => 'Osmaniye',
                'country_id' => 223,
            ),
            228 => 
            array (
                'id' => 3729,
                'name' => 'Rize',
                'country_id' => 223,
            ),
            229 => 
            array (
                'id' => 3730,
                'name' => 'Sakarya',
                'country_id' => 223,
            ),
            230 => 
            array (
                'id' => 3731,
                'name' => 'Samsun',
                'country_id' => 223,
            ),
            231 => 
            array (
                'id' => 3732,
                'name' => 'Sanliurfa',
                'country_id' => 223,
            ),
            232 => 
            array (
                'id' => 3733,
                'name' => 'Siirt',
                'country_id' => 223,
            ),
            233 => 
            array (
                'id' => 3734,
                'name' => 'Sinop',
                'country_id' => 223,
            ),
            234 => 
            array (
                'id' => 3735,
                'name' => 'Sirnak',
                'country_id' => 223,
            ),
            235 => 
            array (
                'id' => 3736,
                'name' => 'Sivas',
                'country_id' => 223,
            ),
            236 => 
            array (
                'id' => 3737,
                'name' => 'Tekirdag',
                'country_id' => 223,
            ),
            237 => 
            array (
                'id' => 3738,
                'name' => 'Tokat',
                'country_id' => 223,
            ),
            238 => 
            array (
                'id' => 3739,
                'name' => 'Trabzon',
                'country_id' => 223,
            ),
            239 => 
            array (
                'id' => 3740,
                'name' => 'Tunceli',
                'country_id' => 223,
            ),
            240 => 
            array (
                'id' => 3741,
                'name' => 'Usak',
                'country_id' => 223,
            ),
            241 => 
            array (
                'id' => 3742,
                'name' => 'Van',
                'country_id' => 223,
            ),
            242 => 
            array (
                'id' => 3743,
                'name' => 'Yalova',
                'country_id' => 223,
            ),
            243 => 
            array (
                'id' => 3744,
                'name' => 'Yozgat',
                'country_id' => 223,
            ),
            244 => 
            array (
                'id' => 3745,
                'name' => 'Zonguldak',
                'country_id' => 223,
            ),
            245 => 
            array (
                'id' => 3746,
                'name' => 'Ahal',
                'country_id' => 224,
            ),
            246 => 
            array (
                'id' => 3747,
                'name' => 'Asgabat',
                'country_id' => 224,
            ),
            247 => 
            array (
                'id' => 3748,
                'name' => 'Balkan',
                'country_id' => 224,
            ),
            248 => 
            array (
                'id' => 3749,
                'name' => 'Dasoguz',
                'country_id' => 224,
            ),
            249 => 
            array (
                'id' => 3750,
                'name' => 'Lebap',
                'country_id' => 224,
            ),
            250 => 
            array (
                'id' => 3751,
                'name' => 'Mari',
                'country_id' => 224,
            ),
            251 => 
            array (
                'id' => 3752,
                'name' => 'Grand Turk',
                'country_id' => 225,
            ),
            252 => 
            array (
                'id' => 3753,
                'name' => 'South Caicos and East Caicos',
                'country_id' => 225,
            ),
            253 => 
            array (
                'id' => 3754,
                'name' => 'Funafuti',
                'country_id' => 226,
            ),
            254 => 
            array (
                'id' => 3755,
                'name' => 'Nanumanga',
                'country_id' => 226,
            ),
            255 => 
            array (
                'id' => 3756,
                'name' => 'Nanumea',
                'country_id' => 226,
            ),
            256 => 
            array (
                'id' => 3757,
                'name' => 'Niutao',
                'country_id' => 226,
            ),
            257 => 
            array (
                'id' => 3758,
                'name' => 'Nui',
                'country_id' => 226,
            ),
            258 => 
            array (
                'id' => 3759,
                'name' => 'Nukufetau',
                'country_id' => 226,
            ),
            259 => 
            array (
                'id' => 3760,
                'name' => 'Nukulaelae',
                'country_id' => 226,
            ),
            260 => 
            array (
                'id' => 3761,
                'name' => 'Vaitupu',
                'country_id' => 226,
            ),
            261 => 
            array (
                'id' => 3762,
                'name' => 'Central',
                'country_id' => 227,
            ),
            262 => 
            array (
                'id' => 3763,
                'name' => 'Eastern',
                'country_id' => 227,
            ),
            263 => 
            array (
                'id' => 3764,
                'name' => 'Northern',
                'country_id' => 227,
            ),
            264 => 
            array (
                'id' => 3765,
                'name' => 'Western',
                'country_id' => 227,
            ),
            265 => 
            array (
                'id' => 3766,
                'name' => 'Cherkas\'ka',
                'country_id' => 228,
            ),
            266 => 
            array (
                'id' => 3767,
                'name' => 'Chernihivs\'ka',
                'country_id' => 228,
            ),
            267 => 
            array (
                'id' => 3768,
                'name' => 'Chernivets\'ka',
                'country_id' => 228,
            ),
            268 => 
            array (
                'id' => 3769,
                'name' => 'Crimea',
                'country_id' => 228,
            ),
            269 => 
            array (
                'id' => 3770,
                'name' => 'Dnipropetrovska',
                'country_id' => 228,
            ),
            270 => 
            array (
                'id' => 3771,
                'name' => 'Donets\'ka',
                'country_id' => 228,
            ),
            271 => 
            array (
                'id' => 3772,
                'name' => 'Ivano-Frankivs\'ka',
                'country_id' => 228,
            ),
            272 => 
            array (
                'id' => 3773,
                'name' => 'Kharkiv',
                'country_id' => 228,
            ),
            273 => 
            array (
                'id' => 3774,
                'name' => 'Kharkov',
                'country_id' => 228,
            ),
            274 => 
            array (
                'id' => 3775,
                'name' => 'Khersonska',
                'country_id' => 228,
            ),
            275 => 
            array (
                'id' => 3776,
                'name' => 'Khmel\'nyts\'ka',
                'country_id' => 228,
            ),
            276 => 
            array (
                'id' => 3777,
                'name' => 'Kirovohrad',
                'country_id' => 228,
            ),
            277 => 
            array (
                'id' => 3778,
                'name' => 'Krym',
                'country_id' => 228,
            ),
            278 => 
            array (
                'id' => 3779,
                'name' => 'Kyyiv',
                'country_id' => 228,
            ),
            279 => 
            array (
                'id' => 3780,
                'name' => 'Kyyivs\'ka',
                'country_id' => 228,
            ),
            280 => 
            array (
                'id' => 3781,
                'name' => 'L\'vivs\'ka',
                'country_id' => 228,
            ),
            281 => 
            array (
                'id' => 3782,
                'name' => 'Luhans\'ka',
                'country_id' => 228,
            ),
            282 => 
            array (
                'id' => 3783,
                'name' => 'Mykolayivs\'ka',
                'country_id' => 228,
            ),
            283 => 
            array (
                'id' => 3784,
                'name' => 'Odes\'ka',
                'country_id' => 228,
            ),
            284 => 
            array (
                'id' => 3785,
                'name' => 'Odessa',
                'country_id' => 228,
            ),
            285 => 
            array (
                'id' => 3786,
                'name' => 'Poltavs\'ka',
                'country_id' => 228,
            ),
            286 => 
            array (
                'id' => 3787,
                'name' => 'Rivnens\'ka',
                'country_id' => 228,
            ),
            287 => 
            array (
                'id' => 3788,
                'name' => 'Sevastopol\'',
                'country_id' => 228,
            ),
            288 => 
            array (
                'id' => 3789,
                'name' => 'Sums\'ka',
                'country_id' => 228,
            ),
            289 => 
            array (
                'id' => 3790,
                'name' => 'Ternopil\'s\'ka',
                'country_id' => 228,
            ),
            290 => 
            array (
                'id' => 3791,
                'name' => 'Volyns\'ka',
                'country_id' => 228,
            ),
            291 => 
            array (
                'id' => 3792,
                'name' => 'Vynnyts\'ka',
                'country_id' => 228,
            ),
            292 => 
            array (
                'id' => 3793,
                'name' => 'Zakarpats\'ka',
                'country_id' => 228,
            ),
            293 => 
            array (
                'id' => 3794,
                'name' => 'Zaporizhia',
                'country_id' => 228,
            ),
            294 => 
            array (
                'id' => 3795,
                'name' => 'Zhytomyrs\'ka',
                'country_id' => 228,
            ),
            295 => 
            array (
                'id' => 3796,
                'name' => 'Abu Zabi',
                'country_id' => 229,
            ),
            296 => 
            array (
                'id' => 3797,
                'name' => 'Ajman',
                'country_id' => 229,
            ),
            297 => 
            array (
                'id' => 3798,
                'name' => 'Dubai',
                'country_id' => 229,
            ),
            298 => 
            array (
                'id' => 3799,
                'name' => 'Ras al-Khaymah',
                'country_id' => 229,
            ),
            299 => 
            array (
                'id' => 3800,
                'name' => 'Sharjah',
                'country_id' => 229,
            ),
            300 => 
            array (
                'id' => 3801,
                'name' => 'Sharjha',
                'country_id' => 229,
            ),
            301 => 
            array (
                'id' => 3802,
                'name' => 'Umm al Qaywayn',
                'country_id' => 229,
            ),
            302 => 
            array (
                'id' => 3803,
                'name' => 'al-Fujayrah',
                'country_id' => 229,
            ),
            303 => 
            array (
                'id' => 3804,
                'name' => 'ash-Shariqah',
                'country_id' => 229,
            ),
            304 => 
            array (
                'id' => 3805,
                'name' => 'Aberdeen',
                'country_id' => 230,
            ),
            305 => 
            array (
                'id' => 3806,
                'name' => 'Aberdeenshire',
                'country_id' => 230,
            ),
            306 => 
            array (
                'id' => 3807,
                'name' => 'Argyll',
                'country_id' => 230,
            ),
            307 => 
            array (
                'id' => 3808,
                'name' => 'Armagh',
                'country_id' => 230,
            ),
            308 => 
            array (
                'id' => 3809,
                'name' => 'Bedfordshire',
                'country_id' => 230,
            ),
            309 => 
            array (
                'id' => 3810,
                'name' => 'Belfast',
                'country_id' => 230,
            ),
            310 => 
            array (
                'id' => 3811,
                'name' => 'Berkshire',
                'country_id' => 230,
            ),
            311 => 
            array (
                'id' => 3812,
                'name' => 'Birmingham',
                'country_id' => 230,
            ),
            312 => 
            array (
                'id' => 3813,
                'name' => 'Brechin',
                'country_id' => 230,
            ),
            313 => 
            array (
                'id' => 3814,
                'name' => 'Bridgnorth',
                'country_id' => 230,
            ),
            314 => 
            array (
                'id' => 3815,
                'name' => 'Bristol',
                'country_id' => 230,
            ),
            315 => 
            array (
                'id' => 3816,
                'name' => 'Buckinghamshire',
                'country_id' => 230,
            ),
            316 => 
            array (
                'id' => 3817,
                'name' => 'Cambridge',
                'country_id' => 230,
            ),
            317 => 
            array (
                'id' => 3818,
                'name' => 'Cambridgeshire',
                'country_id' => 230,
            ),
            318 => 
            array (
                'id' => 3819,
                'name' => 'Channel Islands',
                'country_id' => 230,
            ),
            319 => 
            array (
                'id' => 3820,
                'name' => 'Cheshire',
                'country_id' => 230,
            ),
            320 => 
            array (
                'id' => 3821,
                'name' => 'Cleveland',
                'country_id' => 230,
            ),
            321 => 
            array (
                'id' => 3822,
                'name' => 'Co Fermanagh',
                'country_id' => 230,
            ),
            322 => 
            array (
                'id' => 3823,
                'name' => 'Conwy',
                'country_id' => 230,
            ),
            323 => 
            array (
                'id' => 3824,
                'name' => 'Cornwall',
                'country_id' => 230,
            ),
            324 => 
            array (
                'id' => 3825,
                'name' => 'Coventry',
                'country_id' => 230,
            ),
            325 => 
            array (
                'id' => 3826,
                'name' => 'Craven Arms',
                'country_id' => 230,
            ),
            326 => 
            array (
                'id' => 3827,
                'name' => 'Cumbria',
                'country_id' => 230,
            ),
            327 => 
            array (
                'id' => 3828,
                'name' => 'Denbighshire',
                'country_id' => 230,
            ),
            328 => 
            array (
                'id' => 3829,
                'name' => 'Derby',
                'country_id' => 230,
            ),
            329 => 
            array (
                'id' => 3830,
                'name' => 'Derbyshire',
                'country_id' => 230,
            ),
            330 => 
            array (
                'id' => 3831,
                'name' => 'Devon',
                'country_id' => 230,
            ),
            331 => 
            array (
                'id' => 3832,
                'name' => 'Dial Code Dungannon',
                'country_id' => 230,
            ),
            332 => 
            array (
                'id' => 3833,
                'name' => 'Didcot',
                'country_id' => 230,
            ),
            333 => 
            array (
                'id' => 3834,
                'name' => 'Dorset',
                'country_id' => 230,
            ),
            334 => 
            array (
                'id' => 3835,
                'name' => 'Dunbartonshire',
                'country_id' => 230,
            ),
            335 => 
            array (
                'id' => 3836,
                'name' => 'Durham',
                'country_id' => 230,
            ),
            336 => 
            array (
                'id' => 3837,
                'name' => 'East Dunbartonshire',
                'country_id' => 230,
            ),
            337 => 
            array (
                'id' => 3838,
                'name' => 'East Lothian',
                'country_id' => 230,
            ),
            338 => 
            array (
                'id' => 3839,
                'name' => 'East Midlands',
                'country_id' => 230,
            ),
            339 => 
            array (
                'id' => 3840,
                'name' => 'East Sussex',
                'country_id' => 230,
            ),
            340 => 
            array (
                'id' => 3841,
                'name' => 'East Yorkshire',
                'country_id' => 230,
            ),
            341 => 
            array (
                'id' => 3842,
                'name' => 'England',
                'country_id' => 230,
            ),
            342 => 
            array (
                'id' => 3843,
                'name' => 'Essex',
                'country_id' => 230,
            ),
            343 => 
            array (
                'id' => 3844,
                'name' => 'Fermanagh',
                'country_id' => 230,
            ),
            344 => 
            array (
                'id' => 3845,
                'name' => 'Fife',
                'country_id' => 230,
            ),
            345 => 
            array (
                'id' => 3846,
                'name' => 'Flintshire',
                'country_id' => 230,
            ),
            346 => 
            array (
                'id' => 3847,
                'name' => 'Fulham',
                'country_id' => 230,
            ),
            347 => 
            array (
                'id' => 3848,
                'name' => 'Gainsborough',
                'country_id' => 230,
            ),
            348 => 
            array (
                'id' => 3849,
                'name' => 'Glocestershire',
                'country_id' => 230,
            ),
            349 => 
            array (
                'id' => 3850,
                'name' => 'Gwent',
                'country_id' => 230,
            ),
            350 => 
            array (
                'id' => 3851,
                'name' => 'Hampshire',
                'country_id' => 230,
            ),
            351 => 
            array (
                'id' => 3852,
                'name' => 'Hants',
                'country_id' => 230,
            ),
            352 => 
            array (
                'id' => 3853,
                'name' => 'Herefordshire',
                'country_id' => 230,
            ),
            353 => 
            array (
                'id' => 3854,
                'name' => 'Hertfordshire',
                'country_id' => 230,
            ),
            354 => 
            array (
                'id' => 3855,
                'name' => 'Ireland',
                'country_id' => 230,
            ),
            355 => 
            array (
                'id' => 3856,
                'name' => 'Isle Of Man',
                'country_id' => 230,
            ),
            356 => 
            array (
                'id' => 3857,
                'name' => 'Isle of Wight',
                'country_id' => 230,
            ),
            357 => 
            array (
                'id' => 3858,
                'name' => 'Kenford',
                'country_id' => 230,
            ),
            358 => 
            array (
                'id' => 3859,
                'name' => 'Kent',
                'country_id' => 230,
            ),
            359 => 
            array (
                'id' => 3860,
                'name' => 'Kilmarnock',
                'country_id' => 230,
            ),
            360 => 
            array (
                'id' => 3861,
                'name' => 'Lanarkshire',
                'country_id' => 230,
            ),
            361 => 
            array (
                'id' => 3862,
                'name' => 'Lancashire',
                'country_id' => 230,
            ),
            362 => 
            array (
                'id' => 3863,
                'name' => 'Leicestershire',
                'country_id' => 230,
            ),
            363 => 
            array (
                'id' => 3864,
                'name' => 'Lincolnshire',
                'country_id' => 230,
            ),
            364 => 
            array (
                'id' => 3865,
                'name' => 'Llanymynech',
                'country_id' => 230,
            ),
            365 => 
            array (
                'id' => 3866,
                'name' => 'London',
                'country_id' => 230,
            ),
            366 => 
            array (
                'id' => 3867,
                'name' => 'Ludlow',
                'country_id' => 230,
            ),
            367 => 
            array (
                'id' => 3868,
                'name' => 'Manchester',
                'country_id' => 230,
            ),
            368 => 
            array (
                'id' => 3869,
                'name' => 'Mayfair',
                'country_id' => 230,
            ),
            369 => 
            array (
                'id' => 3870,
                'name' => 'Merseyside',
                'country_id' => 230,
            ),
            370 => 
            array (
                'id' => 3871,
                'name' => 'Mid Glamorgan',
                'country_id' => 230,
            ),
            371 => 
            array (
                'id' => 3872,
                'name' => 'Middlesex',
                'country_id' => 230,
            ),
            372 => 
            array (
                'id' => 3873,
                'name' => 'Mildenhall',
                'country_id' => 230,
            ),
            373 => 
            array (
                'id' => 3874,
                'name' => 'Monmouthshire',
                'country_id' => 230,
            ),
            374 => 
            array (
                'id' => 3875,
                'name' => 'Newton Stewart',
                'country_id' => 230,
            ),
            375 => 
            array (
                'id' => 3876,
                'name' => 'Norfolk',
                'country_id' => 230,
            ),
            376 => 
            array (
                'id' => 3877,
                'name' => 'North Humberside',
                'country_id' => 230,
            ),
            377 => 
            array (
                'id' => 3878,
                'name' => 'North Yorkshire',
                'country_id' => 230,
            ),
            378 => 
            array (
                'id' => 3879,
                'name' => 'Northamptonshire',
                'country_id' => 230,
            ),
            379 => 
            array (
                'id' => 3880,
                'name' => 'Northants',
                'country_id' => 230,
            ),
            380 => 
            array (
                'id' => 3881,
                'name' => 'Northern Ireland',
                'country_id' => 230,
            ),
            381 => 
            array (
                'id' => 3882,
                'name' => 'Northumberland',
                'country_id' => 230,
            ),
            382 => 
            array (
                'id' => 3883,
                'name' => 'Nottinghamshire',
                'country_id' => 230,
            ),
            383 => 
            array (
                'id' => 3884,
                'name' => 'Oxford',
                'country_id' => 230,
            ),
            384 => 
            array (
                'id' => 3885,
                'name' => 'Powys',
                'country_id' => 230,
            ),
            385 => 
            array (
                'id' => 3886,
                'name' => 'Roos-shire',
                'country_id' => 230,
            ),
            386 => 
            array (
                'id' => 3887,
                'name' => 'SUSSEX',
                'country_id' => 230,
            ),
            387 => 
            array (
                'id' => 3888,
                'name' => 'Sark',
                'country_id' => 230,
            ),
            388 => 
            array (
                'id' => 3889,
                'name' => 'Scotland',
                'country_id' => 230,
            ),
            389 => 
            array (
                'id' => 3890,
                'name' => 'Scottish Borders',
                'country_id' => 230,
            ),
            390 => 
            array (
                'id' => 3891,
                'name' => 'Shropshire',
                'country_id' => 230,
            ),
            391 => 
            array (
                'id' => 3892,
                'name' => 'Somerset',
                'country_id' => 230,
            ),
            392 => 
            array (
                'id' => 3893,
                'name' => 'South Glamorgan',
                'country_id' => 230,
            ),
            393 => 
            array (
                'id' => 3894,
                'name' => 'South Wales',
                'country_id' => 230,
            ),
            394 => 
            array (
                'id' => 3895,
                'name' => 'South Yorkshire',
                'country_id' => 230,
            ),
            395 => 
            array (
                'id' => 3896,
                'name' => 'Southwell',
                'country_id' => 230,
            ),
            396 => 
            array (
                'id' => 3897,
                'name' => 'Staffordshire',
                'country_id' => 230,
            ),
            397 => 
            array (
                'id' => 3898,
                'name' => 'Strabane',
                'country_id' => 230,
            ),
            398 => 
            array (
                'id' => 3899,
                'name' => 'Suffolk',
                'country_id' => 230,
            ),
            399 => 
            array (
                'id' => 3900,
                'name' => 'Surrey',
                'country_id' => 230,
            ),
            400 => 
            array (
                'id' => 3901,
                'name' => 'Sussex',
                'country_id' => 230,
            ),
            401 => 
            array (
                'id' => 3902,
                'name' => 'Twickenham',
                'country_id' => 230,
            ),
            402 => 
            array (
                'id' => 3903,
                'name' => 'Tyne and Wear',
                'country_id' => 230,
            ),
            403 => 
            array (
                'id' => 3904,
                'name' => 'Tyrone',
                'country_id' => 230,
            ),
            404 => 
            array (
                'id' => 3905,
                'name' => 'Utah',
                'country_id' => 230,
            ),
            405 => 
            array (
                'id' => 3906,
                'name' => 'Wales',
                'country_id' => 230,
            ),
            406 => 
            array (
                'id' => 3907,
                'name' => 'Warwickshire',
                'country_id' => 230,
            ),
            407 => 
            array (
                'id' => 3908,
                'name' => 'West Lothian',
                'country_id' => 230,
            ),
            408 => 
            array (
                'id' => 3909,
                'name' => 'West Midlands',
                'country_id' => 230,
            ),
            409 => 
            array (
                'id' => 3910,
                'name' => 'West Sussex',
                'country_id' => 230,
            ),
            410 => 
            array (
                'id' => 3911,
                'name' => 'West Yorkshire',
                'country_id' => 230,
            ),
            411 => 
            array (
                'id' => 3912,
                'name' => 'Whissendine',
                'country_id' => 230,
            ),
            412 => 
            array (
                'id' => 3913,
                'name' => 'Wiltshire',
                'country_id' => 230,
            ),
            413 => 
            array (
                'id' => 3914,
                'name' => 'Wokingham',
                'country_id' => 230,
            ),
            414 => 
            array (
                'id' => 3915,
                'name' => 'Worcestershire',
                'country_id' => 230,
            ),
            415 => 
            array (
                'id' => 3916,
                'name' => 'Wrexham',
                'country_id' => 230,
            ),
            416 => 
            array (
                'id' => 3917,
                'name' => 'Wurttemberg',
                'country_id' => 230,
            ),
            417 => 
            array (
                'id' => 3918,
                'name' => 'Yorkshire',
                'country_id' => 230,
            ),
            418 => 
            array (
                'id' => 3919,
                'name' => 'Alabama',
                'country_id' => 231,
            ),
            419 => 
            array (
                'id' => 3920,
                'name' => 'Alaska',
                'country_id' => 231,
            ),
            420 => 
            array (
                'id' => 3921,
                'name' => 'Arizona',
                'country_id' => 231,
            ),
            421 => 
            array (
                'id' => 3922,
                'name' => 'Arkansas',
                'country_id' => 231,
            ),
            422 => 
            array (
                'id' => 3923,
                'name' => 'Byram',
                'country_id' => 231,
            ),
            423 => 
            array (
                'id' => 3924,
                'name' => 'California',
                'country_id' => 231,
            ),
            424 => 
            array (
                'id' => 3925,
                'name' => 'Cokato',
                'country_id' => 231,
            ),
            425 => 
            array (
                'id' => 3926,
                'name' => 'Colorado',
                'country_id' => 231,
            ),
            426 => 
            array (
                'id' => 3927,
                'name' => 'Connecticut',
                'country_id' => 231,
            ),
            427 => 
            array (
                'id' => 3928,
                'name' => 'Delaware',
                'country_id' => 231,
            ),
            428 => 
            array (
                'id' => 3929,
                'name' => 'District of Columbia',
                'country_id' => 231,
            ),
            429 => 
            array (
                'id' => 3930,
                'name' => 'Florida',
                'country_id' => 231,
            ),
            430 => 
            array (
                'id' => 3931,
                'name' => 'Georgia',
                'country_id' => 231,
            ),
            431 => 
            array (
                'id' => 3932,
                'name' => 'Hawaii',
                'country_id' => 231,
            ),
            432 => 
            array (
                'id' => 3933,
                'name' => 'Idaho',
                'country_id' => 231,
            ),
            433 => 
            array (
                'id' => 3934,
                'name' => 'Illinois',
                'country_id' => 231,
            ),
            434 => 
            array (
                'id' => 3935,
                'name' => 'Indiana',
                'country_id' => 231,
            ),
            435 => 
            array (
                'id' => 3936,
                'name' => 'Iowa',
                'country_id' => 231,
            ),
            436 => 
            array (
                'id' => 3937,
                'name' => 'Kansas',
                'country_id' => 231,
            ),
            437 => 
            array (
                'id' => 3938,
                'name' => 'Kentucky',
                'country_id' => 231,
            ),
            438 => 
            array (
                'id' => 3939,
                'name' => 'Louisiana',
                'country_id' => 231,
            ),
            439 => 
            array (
                'id' => 3940,
                'name' => 'Lowa',
                'country_id' => 231,
            ),
            440 => 
            array (
                'id' => 3941,
                'name' => 'Maine',
                'country_id' => 231,
            ),
            441 => 
            array (
                'id' => 3942,
                'name' => 'Maryland',
                'country_id' => 231,
            ),
            442 => 
            array (
                'id' => 3943,
                'name' => 'Massachusetts',
                'country_id' => 231,
            ),
            443 => 
            array (
                'id' => 3944,
                'name' => 'Medfield',
                'country_id' => 231,
            ),
            444 => 
            array (
                'id' => 3945,
                'name' => 'Michigan',
                'country_id' => 231,
            ),
            445 => 
            array (
                'id' => 3946,
                'name' => 'Minnesota',
                'country_id' => 231,
            ),
            446 => 
            array (
                'id' => 3947,
                'name' => 'Mississippi',
                'country_id' => 231,
            ),
            447 => 
            array (
                'id' => 3948,
                'name' => 'Missouri',
                'country_id' => 231,
            ),
            448 => 
            array (
                'id' => 3949,
                'name' => 'Montana',
                'country_id' => 231,
            ),
            449 => 
            array (
                'id' => 3950,
                'name' => 'Nebraska',
                'country_id' => 231,
            ),
            450 => 
            array (
                'id' => 3951,
                'name' => 'Nevada',
                'country_id' => 231,
            ),
            451 => 
            array (
                'id' => 3952,
                'name' => 'New Hampshire',
                'country_id' => 231,
            ),
            452 => 
            array (
                'id' => 3953,
                'name' => 'New Jersey',
                'country_id' => 231,
            ),
            453 => 
            array (
                'id' => 3954,
                'name' => 'New Jersy',
                'country_id' => 231,
            ),
            454 => 
            array (
                'id' => 3955,
                'name' => 'New Mexico',
                'country_id' => 231,
            ),
            455 => 
            array (
                'id' => 3956,
                'name' => 'New York',
                'country_id' => 231,
            ),
            456 => 
            array (
                'id' => 3957,
                'name' => 'North Carolina',
                'country_id' => 231,
            ),
            457 => 
            array (
                'id' => 3958,
                'name' => 'North Dakota',
                'country_id' => 231,
            ),
            458 => 
            array (
                'id' => 3959,
                'name' => 'Ohio',
                'country_id' => 231,
            ),
            459 => 
            array (
                'id' => 3960,
                'name' => 'Oklahoma',
                'country_id' => 231,
            ),
            460 => 
            array (
                'id' => 3961,
                'name' => 'Ontario',
                'country_id' => 231,
            ),
            461 => 
            array (
                'id' => 3962,
                'name' => 'Oregon',
                'country_id' => 231,
            ),
            462 => 
            array (
                'id' => 3963,
                'name' => 'Pennsylvania',
                'country_id' => 231,
            ),
            463 => 
            array (
                'id' => 3964,
                'name' => 'Ramey',
                'country_id' => 231,
            ),
            464 => 
            array (
                'id' => 3965,
                'name' => 'Rhode Island',
                'country_id' => 231,
            ),
            465 => 
            array (
                'id' => 3966,
                'name' => 'South Carolina',
                'country_id' => 231,
            ),
            466 => 
            array (
                'id' => 3967,
                'name' => 'South Dakota',
                'country_id' => 231,
            ),
            467 => 
            array (
                'id' => 3968,
                'name' => 'Sublimity',
                'country_id' => 231,
            ),
            468 => 
            array (
                'id' => 3969,
                'name' => 'Tennessee',
                'country_id' => 231,
            ),
            469 => 
            array (
                'id' => 3970,
                'name' => 'Texas',
                'country_id' => 231,
            ),
            470 => 
            array (
                'id' => 3971,
                'name' => 'Trimble',
                'country_id' => 231,
            ),
            471 => 
            array (
                'id' => 3972,
                'name' => 'Utah',
                'country_id' => 231,
            ),
            472 => 
            array (
                'id' => 3973,
                'name' => 'Vermont',
                'country_id' => 231,
            ),
            473 => 
            array (
                'id' => 3974,
                'name' => 'Virginia',
                'country_id' => 231,
            ),
            474 => 
            array (
                'id' => 3975,
                'name' => 'Washington',
                'country_id' => 231,
            ),
            475 => 
            array (
                'id' => 3976,
                'name' => 'West Virginia',
                'country_id' => 231,
            ),
            476 => 
            array (
                'id' => 3977,
                'name' => 'Wisconsin',
                'country_id' => 231,
            ),
            477 => 
            array (
                'id' => 3978,
                'name' => 'Wyoming',
                'country_id' => 231,
            ),
            478 => 
            array (
                'id' => 3979,
                'name' => 'United States Minor Outlying I',
                'country_id' => 232,
            ),
            479 => 
            array (
                'id' => 3980,
                'name' => 'Artigas',
                'country_id' => 233,
            ),
            480 => 
            array (
                'id' => 3981,
                'name' => 'Canelones',
                'country_id' => 233,
            ),
            481 => 
            array (
                'id' => 3982,
                'name' => 'Cerro Largo',
                'country_id' => 233,
            ),
            482 => 
            array (
                'id' => 3983,
                'name' => 'Colonia',
                'country_id' => 233,
            ),
            483 => 
            array (
                'id' => 3984,
                'name' => 'Durazno',
                'country_id' => 233,
            ),
            484 => 
            array (
                'id' => 3985,
                'name' => 'FLorida',
                'country_id' => 233,
            ),
            485 => 
            array (
                'id' => 3986,
                'name' => 'Flores',
                'country_id' => 233,
            ),
            486 => 
            array (
                'id' => 3987,
                'name' => 'Lavalleja',
                'country_id' => 233,
            ),
            487 => 
            array (
                'id' => 3988,
                'name' => 'Maldonado',
                'country_id' => 233,
            ),
            488 => 
            array (
                'id' => 3989,
                'name' => 'Montevideo',
                'country_id' => 233,
            ),
            489 => 
            array (
                'id' => 3990,
                'name' => 'Paysandu',
                'country_id' => 233,
            ),
            490 => 
            array (
                'id' => 3991,
                'name' => 'Rio Negro',
                'country_id' => 233,
            ),
            491 => 
            array (
                'id' => 3992,
                'name' => 'Rivera',
                'country_id' => 233,
            ),
            492 => 
            array (
                'id' => 3993,
                'name' => 'Rocha',
                'country_id' => 233,
            ),
            493 => 
            array (
                'id' => 3994,
                'name' => 'Salto',
                'country_id' => 233,
            ),
            494 => 
            array (
                'id' => 3995,
                'name' => 'San Jose',
                'country_id' => 233,
            ),
            495 => 
            array (
                'id' => 3996,
                'name' => 'Soriano',
                'country_id' => 233,
            ),
            496 => 
            array (
                'id' => 3997,
                'name' => 'Tacuarembo',
                'country_id' => 233,
            ),
            497 => 
            array (
                'id' => 3998,
                'name' => 'Treinta y Tres',
                'country_id' => 233,
            ),
            498 => 
            array (
                'id' => 3999,
                'name' => 'Andijon',
                'country_id' => 234,
            ),
            499 => 
            array (
                'id' => 4000,
                'name' => 'Buhoro',
                'country_id' => 234,
            ),
        ));
        \DB::table('states')->insert(array (
            0 => 
            array (
                'id' => 4001,
                'name' => 'Buxoro Viloyati',
                'country_id' => 234,
            ),
            1 => 
            array (
                'id' => 4002,
                'name' => 'Cizah',
                'country_id' => 234,
            ),
            2 => 
            array (
                'id' => 4003,
                'name' => 'Fargona',
                'country_id' => 234,
            ),
            3 => 
            array (
                'id' => 4004,
                'name' => 'Horazm',
                'country_id' => 234,
            ),
            4 => 
            array (
                'id' => 4005,
                'name' => 'Kaskadar',
                'country_id' => 234,
            ),
            5 => 
            array (
                'id' => 4006,
                'name' => 'Korakalpogiston',
                'country_id' => 234,
            ),
            6 => 
            array (
                'id' => 4007,
                'name' => 'Namangan',
                'country_id' => 234,
            ),
            7 => 
            array (
                'id' => 4008,
                'name' => 'Navoi',
                'country_id' => 234,
            ),
            8 => 
            array (
                'id' => 4009,
                'name' => 'Samarkand',
                'country_id' => 234,
            ),
            9 => 
            array (
                'id' => 4010,
                'name' => 'Sirdare',
                'country_id' => 234,
            ),
            10 => 
            array (
                'id' => 4011,
                'name' => 'Surhondar',
                'country_id' => 234,
            ),
            11 => 
            array (
                'id' => 4012,
                'name' => 'Toskent',
                'country_id' => 234,
            ),
            12 => 
            array (
                'id' => 4013,
                'name' => 'Malampa',
                'country_id' => 235,
            ),
            13 => 
            array (
                'id' => 4014,
                'name' => 'Penama',
                'country_id' => 235,
            ),
            14 => 
            array (
                'id' => 4015,
                'name' => 'Sanma',
                'country_id' => 235,
            ),
            15 => 
            array (
                'id' => 4016,
                'name' => 'Shefa',
                'country_id' => 235,
            ),
            16 => 
            array (
                'id' => 4017,
                'name' => 'Tafea',
                'country_id' => 235,
            ),
            17 => 
            array (
                'id' => 4018,
                'name' => 'Torba',
                'country_id' => 235,
            ),
            18 => 
            array (
                'id' => 4019,
            'name' => 'Vatican City State (Holy See)',
                'country_id' => 236,
            ),
            19 => 
            array (
                'id' => 4020,
                'name' => 'Amazonas',
                'country_id' => 237,
            ),
            20 => 
            array (
                'id' => 4021,
                'name' => 'Anzoategui',
                'country_id' => 237,
            ),
            21 => 
            array (
                'id' => 4022,
                'name' => 'Apure',
                'country_id' => 237,
            ),
            22 => 
            array (
                'id' => 4023,
                'name' => 'Aragua',
                'country_id' => 237,
            ),
            23 => 
            array (
                'id' => 4024,
                'name' => 'Barinas',
                'country_id' => 237,
            ),
            24 => 
            array (
                'id' => 4025,
                'name' => 'Bolivar',
                'country_id' => 237,
            ),
            25 => 
            array (
                'id' => 4026,
                'name' => 'Carabobo',
                'country_id' => 237,
            ),
            26 => 
            array (
                'id' => 4027,
                'name' => 'Cojedes',
                'country_id' => 237,
            ),
            27 => 
            array (
                'id' => 4028,
                'name' => 'Delta Amacuro',
                'country_id' => 237,
            ),
            28 => 
            array (
                'id' => 4029,
                'name' => 'Distrito Federal',
                'country_id' => 237,
            ),
            29 => 
            array (
                'id' => 4030,
                'name' => 'Falcon',
                'country_id' => 237,
            ),
            30 => 
            array (
                'id' => 4031,
                'name' => 'Guarico',
                'country_id' => 237,
            ),
            31 => 
            array (
                'id' => 4032,
                'name' => 'Lara',
                'country_id' => 237,
            ),
            32 => 
            array (
                'id' => 4033,
                'name' => 'Merida',
                'country_id' => 237,
            ),
            33 => 
            array (
                'id' => 4034,
                'name' => 'Miranda',
                'country_id' => 237,
            ),
            34 => 
            array (
                'id' => 4035,
                'name' => 'Monagas',
                'country_id' => 237,
            ),
            35 => 
            array (
                'id' => 4036,
                'name' => 'Nueva Esparta',
                'country_id' => 237,
            ),
            36 => 
            array (
                'id' => 4037,
                'name' => 'Portuguesa',
                'country_id' => 237,
            ),
            37 => 
            array (
                'id' => 4038,
                'name' => 'Sucre',
                'country_id' => 237,
            ),
            38 => 
            array (
                'id' => 4039,
                'name' => 'Tachira',
                'country_id' => 237,
            ),
            39 => 
            array (
                'id' => 4040,
                'name' => 'Trujillo',
                'country_id' => 237,
            ),
            40 => 
            array (
                'id' => 4041,
                'name' => 'Vargas',
                'country_id' => 237,
            ),
            41 => 
            array (
                'id' => 4042,
                'name' => 'Yaracuy',
                'country_id' => 237,
            ),
            42 => 
            array (
                'id' => 4043,
                'name' => 'Zulia',
                'country_id' => 237,
            ),
            43 => 
            array (
                'id' => 4044,
                'name' => 'Bac Giang',
                'country_id' => 238,
            ),
            44 => 
            array (
                'id' => 4045,
                'name' => 'Binh Dinh',
                'country_id' => 238,
            ),
            45 => 
            array (
                'id' => 4046,
                'name' => 'Binh Duong',
                'country_id' => 238,
            ),
            46 => 
            array (
                'id' => 4047,
                'name' => 'Da Nang',
                'country_id' => 238,
            ),
            47 => 
            array (
                'id' => 4048,
                'name' => 'Dong Bang Song Cuu Long',
                'country_id' => 238,
            ),
            48 => 
            array (
                'id' => 4049,
                'name' => 'Dong Bang Song Hong',
                'country_id' => 238,
            ),
            49 => 
            array (
                'id' => 4050,
                'name' => 'Dong Nai',
                'country_id' => 238,
            ),
            50 => 
            array (
                'id' => 4051,
                'name' => 'Dong Nam Bo',
                'country_id' => 238,
            ),
            51 => 
            array (
                'id' => 4052,
                'name' => 'Duyen Hai Mien Trung',
                'country_id' => 238,
            ),
            52 => 
            array (
                'id' => 4053,
                'name' => 'Hanoi',
                'country_id' => 238,
            ),
            53 => 
            array (
                'id' => 4054,
                'name' => 'Hung Yen',
                'country_id' => 238,
            ),
            54 => 
            array (
                'id' => 4055,
                'name' => 'Khu Bon Cu',
                'country_id' => 238,
            ),
            55 => 
            array (
                'id' => 4056,
                'name' => 'Long An',
                'country_id' => 238,
            ),
            56 => 
            array (
                'id' => 4057,
                'name' => 'Mien Nui Va Trung Du',
                'country_id' => 238,
            ),
            57 => 
            array (
                'id' => 4058,
                'name' => 'Thai Nguyen',
                'country_id' => 238,
            ),
            58 => 
            array (
                'id' => 4059,
                'name' => 'Thanh Pho Ho Chi Minh',
                'country_id' => 238,
            ),
            59 => 
            array (
                'id' => 4060,
                'name' => 'Thu Do Ha Noi',
                'country_id' => 238,
            ),
            60 => 
            array (
                'id' => 4061,
                'name' => 'Tinh Can Tho',
                'country_id' => 238,
            ),
            61 => 
            array (
                'id' => 4062,
                'name' => 'Tinh Da Nang',
                'country_id' => 238,
            ),
            62 => 
            array (
                'id' => 4063,
                'name' => 'Tinh Gia Lai',
                'country_id' => 238,
            ),
            63 => 
            array (
                'id' => 4064,
                'name' => 'Anegada',
                'country_id' => 239,
            ),
            64 => 
            array (
                'id' => 4065,
                'name' => 'Jost van Dyke',
                'country_id' => 239,
            ),
            65 => 
            array (
                'id' => 4066,
                'name' => 'Tortola',
                'country_id' => 239,
            ),
            66 => 
            array (
                'id' => 4067,
                'name' => 'Saint Croix',
                'country_id' => 240,
            ),
            67 => 
            array (
                'id' => 4068,
                'name' => 'Saint John',
                'country_id' => 240,
            ),
            68 => 
            array (
                'id' => 4069,
                'name' => 'Saint Thomas',
                'country_id' => 240,
            ),
            69 => 
            array (
                'id' => 4070,
                'name' => 'Alo',
                'country_id' => 241,
            ),
            70 => 
            array (
                'id' => 4071,
                'name' => 'Singave',
                'country_id' => 241,
            ),
            71 => 
            array (
                'id' => 4072,
                'name' => 'Wallis',
                'country_id' => 241,
            ),
            72 => 
            array (
                'id' => 4073,
                'name' => 'Bu Jaydur',
                'country_id' => 242,
            ),
            73 => 
            array (
                'id' => 4074,
                'name' => 'Wad-adh-Dhahab',
                'country_id' => 242,
            ),
            74 => 
            array (
                'id' => 4075,
                'name' => 'al-\'Ayun',
                'country_id' => 242,
            ),
            75 => 
            array (
                'id' => 4076,
                'name' => 'as-Samarah',
                'country_id' => 242,
            ),
            76 => 
            array (
                'id' => 4077,
                'name' => '\'Adan',
                'country_id' => 243,
            ),
            77 => 
            array (
                'id' => 4078,
                'name' => 'Abyan',
                'country_id' => 243,
            ),
            78 => 
            array (
                'id' => 4079,
                'name' => 'Dhamar',
                'country_id' => 243,
            ),
            79 => 
            array (
                'id' => 4080,
                'name' => 'Hadramaut',
                'country_id' => 243,
            ),
            80 => 
            array (
                'id' => 4081,
                'name' => 'Hajjah',
                'country_id' => 243,
            ),
            81 => 
            array (
                'id' => 4082,
                'name' => 'Hudaydah',
                'country_id' => 243,
            ),
            82 => 
            array (
                'id' => 4083,
                'name' => 'Ibb',
                'country_id' => 243,
            ),
            83 => 
            array (
                'id' => 4084,
                'name' => 'Lahij',
                'country_id' => 243,
            ),
            84 => 
            array (
                'id' => 4085,
                'name' => 'Ma\'rib',
                'country_id' => 243,
            ),
            85 => 
            array (
                'id' => 4086,
                'name' => 'Madinat San\'a',
                'country_id' => 243,
            ),
            86 => 
            array (
                'id' => 4087,
                'name' => 'Sa\'dah',
                'country_id' => 243,
            ),
            87 => 
            array (
                'id' => 4088,
                'name' => 'Sana',
                'country_id' => 243,
            ),
            88 => 
            array (
                'id' => 4089,
                'name' => 'Shabwah',
                'country_id' => 243,
            ),
            89 => 
            array (
                'id' => 4090,
                'name' => 'Ta\'izz',
                'country_id' => 243,
            ),
            90 => 
            array (
                'id' => 4091,
                'name' => 'al-Bayda',
                'country_id' => 243,
            ),
            91 => 
            array (
                'id' => 4092,
                'name' => 'al-Hudaydah',
                'country_id' => 243,
            ),
            92 => 
            array (
                'id' => 4093,
                'name' => 'al-Jawf',
                'country_id' => 243,
            ),
            93 => 
            array (
                'id' => 4094,
                'name' => 'al-Mahrah',
                'country_id' => 243,
            ),
            94 => 
            array (
                'id' => 4095,
                'name' => 'al-Mahwit',
                'country_id' => 243,
            ),
            95 => 
            array (
                'id' => 4096,
                'name' => 'Central Serbia',
                'country_id' => 244,
            ),
            96 => 
            array (
                'id' => 4097,
                'name' => 'Kosovo and Metohija',
                'country_id' => 244,
            ),
            97 => 
            array (
                'id' => 4098,
                'name' => 'Montenegro',
                'country_id' => 244,
            ),
            98 => 
            array (
                'id' => 4099,
                'name' => 'Republic of Serbia',
                'country_id' => 244,
            ),
            99 => 
            array (
                'id' => 4100,
                'name' => 'Serbia',
                'country_id' => 244,
            ),
            100 => 
            array (
                'id' => 4101,
                'name' => 'Vojvodina',
                'country_id' => 244,
            ),
            101 => 
            array (
                'id' => 4102,
                'name' => 'Central',
                'country_id' => 245,
            ),
            102 => 
            array (
                'id' => 4103,
                'name' => 'Copperbelt',
                'country_id' => 245,
            ),
            103 => 
            array (
                'id' => 4104,
                'name' => 'Eastern',
                'country_id' => 245,
            ),
            104 => 
            array (
                'id' => 4105,
                'name' => 'Luapala',
                'country_id' => 245,
            ),
            105 => 
            array (
                'id' => 4106,
                'name' => 'Lusaka',
                'country_id' => 245,
            ),
            106 => 
            array (
                'id' => 4107,
                'name' => 'North-Western',
                'country_id' => 245,
            ),
            107 => 
            array (
                'id' => 4108,
                'name' => 'Northern',
                'country_id' => 245,
            ),
            108 => 
            array (
                'id' => 4109,
                'name' => 'Southern',
                'country_id' => 245,
            ),
            109 => 
            array (
                'id' => 4110,
                'name' => 'Western',
                'country_id' => 245,
            ),
            110 => 
            array (
                'id' => 4111,
                'name' => 'Bulawayo',
                'country_id' => 246,
            ),
            111 => 
            array (
                'id' => 4112,
                'name' => 'Harare',
                'country_id' => 246,
            ),
            112 => 
            array (
                'id' => 4113,
                'name' => 'Manicaland',
                'country_id' => 246,
            ),
            113 => 
            array (
                'id' => 4114,
                'name' => 'Mashonaland Central',
                'country_id' => 246,
            ),
            114 => 
            array (
                'id' => 4115,
                'name' => 'Mashonaland East',
                'country_id' => 246,
            ),
            115 => 
            array (
                'id' => 4116,
                'name' => 'Mashonaland West',
                'country_id' => 246,
            ),
            116 => 
            array (
                'id' => 4117,
                'name' => 'Masvingo',
                'country_id' => 246,
            ),
            117 => 
            array (
                'id' => 4118,
                'name' => 'Matabeleland North',
                'country_id' => 246,
            ),
            118 => 
            array (
                'id' => 4119,
                'name' => 'Matabeleland South',
                'country_id' => 246,
            ),
            119 => 
            array (
                'id' => 4120,
                'name' => 'Midlands',
                'country_id' => 246,
            ),
        ));
        
        
    }
}