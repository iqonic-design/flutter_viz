<?php

use Illuminate\Database\Seeder;

class CountriesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('countries')->delete();
        
        \DB::table('countries')->insert(array (
            0 => 
            array (
                'id' => 1,
                'code' => 'AF',
                'name' => 'Afghanistan',
                'dial_code' => 93,
                'currency_name' => 'Afghan afghani',
                'symbol' => '؋',
                'currency_code' => 'AFN',
            ),
            1 => 
            array (
                'id' => 2,
                'code' => 'AL',
                'name' => 'Albania',
                'dial_code' => 355,
                'currency_name' => 'Albanian lek',
                'symbol' => 'L',
                'currency_code' => 'ALL',
            ),
            2 => 
            array (
                'id' => 3,
                'code' => 'DZ',
                'name' => 'Algeria',
                'dial_code' => 213,
                'currency_name' => 'Algerian dinar',
                'symbol' => 'د.ج',
                'currency_code' => 'DZD',
            ),
            3 => 
            array (
                'id' => 4,
                'code' => 'AS',
                'name' => 'American Samoa',
                'dial_code' => 1684,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            4 => 
            array (
                'id' => 5,
                'code' => 'AD',
                'name' => 'Andorra',
                'dial_code' => 376,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            5 => 
            array (
                'id' => 6,
                'code' => 'AO',
                'name' => 'Angola',
                'dial_code' => 244,
                'currency_name' => 'Angolan kwanza',
                'symbol' => 'Kz',
                'currency_code' => 'AOA',
            ),
            6 => 
            array (
                'id' => 7,
                'code' => 'AI',
                'name' => 'Anguilla',
                'dial_code' => 1264,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            7 => 
            array (
                'id' => 8,
                'code' => 'AQ',
                'name' => 'Antarctica',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            8 => 
            array (
                'id' => 9,
                'code' => 'AG',
                'name' => 'Antigua And Barbuda',
                'dial_code' => 1268,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            9 => 
            array (
                'id' => 10,
                'code' => 'AR',
                'name' => 'Argentina',
                'dial_code' => 54,
                'currency_name' => 'Argentine peso',
                'symbol' => '$',
                'currency_code' => 'ARS',
            ),
            10 => 
            array (
                'id' => 11,
                'code' => 'AM',
                'name' => 'Armenia',
                'dial_code' => 374,
                'currency_name' => 'Armenian dram',
                'symbol' => '',
                'currency_code' => 'AMD',
            ),
            11 => 
            array (
                'id' => 12,
                'code' => 'AW',
                'name' => 'Aruba',
                'dial_code' => 297,
                'currency_name' => 'Aruban florin',
                'symbol' => 'ƒ',
                'currency_code' => 'AWG',
            ),
            12 => 
            array (
                'id' => 13,
                'code' => 'AU',
                'name' => 'Australia',
                'dial_code' => 61,
                'currency_name' => 'Australian dollar',
                'symbol' => '$',
                'currency_code' => 'AUD',
            ),
            13 => 
            array (
                'id' => 14,
                'code' => 'AT',
                'name' => 'Austria',
                'dial_code' => 43,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            14 => 
            array (
                'id' => 15,
                'code' => 'AZ',
                'name' => 'Azerbaijan',
                'dial_code' => 994,
                'currency_name' => 'Azerbaijani manat',
                'symbol' => '',
                'currency_code' => 'AZN',
            ),
            15 => 
            array (
                'id' => 16,
                'code' => 'BS',
                'name' => 'Bahamas The',
                'dial_code' => 1242,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            16 => 
            array (
                'id' => 17,
                'code' => 'BH',
                'name' => 'Bahrain',
                'dial_code' => 973,
                'currency_name' => 'Bahraini dinar',
                'symbol' => '.د.ب',
                'currency_code' => 'BHD',
            ),
            17 => 
            array (
                'id' => 18,
                'code' => 'BD',
                'name' => 'Bangladesh',
                'dial_code' => 880,
                'currency_name' => 'Bangladeshi taka',
                'symbol' => '৳',
                'currency_code' => 'BDT',
            ),
            18 => 
            array (
                'id' => 19,
                'code' => 'BB',
                'name' => 'Barbados',
                'dial_code' => 1246,
                'currency_name' => 'Barbadian dollar',
                'symbol' => '$',
                'currency_code' => 'BBD',
            ),
            19 => 
            array (
                'id' => 20,
                'code' => 'BY',
                'name' => 'Belarus',
                'dial_code' => 375,
                'currency_name' => 'Belarusian ruble',
                'symbol' => 'Br',
                'currency_code' => 'BYR',
            ),
            20 => 
            array (
                'id' => 21,
                'code' => 'BE',
                'name' => 'Belgium',
                'dial_code' => 32,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            21 => 
            array (
                'id' => 22,
                'code' => 'BZ',
                'name' => 'Belize',
                'dial_code' => 501,
                'currency_name' => 'Belize dollar',
                'symbol' => '$',
                'currency_code' => 'BZD',
            ),
            22 => 
            array (
                'id' => 23,
                'code' => 'BJ',
                'name' => 'Benin',
                'dial_code' => 229,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            23 => 
            array (
                'id' => 24,
                'code' => 'BM',
                'name' => 'Bermuda',
                'dial_code' => 1441,
                'currency_name' => 'Bermudian dollar',
                'symbol' => '$',
                'currency_code' => 'BMD',
            ),
            24 => 
            array (
                'id' => 25,
                'code' => 'BT',
                'name' => 'Bhutan',
                'dial_code' => 975,
                'currency_name' => 'Bhutanese ngultrum',
                'symbol' => 'Nu.',
                'currency_code' => 'BTN',
            ),
            25 => 
            array (
                'id' => 26,
                'code' => 'BO',
                'name' => 'Bolivia',
                'dial_code' => 591,
                'currency_name' => 'Bolivian boliviano',
                'symbol' => 'Bs.',
                'currency_code' => 'BOB',
            ),
            26 => 
            array (
                'id' => 27,
                'code' => 'BA',
                'name' => 'Bosnia and Herzegovina',
                'dial_code' => 387,
                'currency_name' => 'Bosnia and Herzegovi',
                'symbol' => 'KM or КМ',
                'currency_code' => 'BAM',
            ),
            27 => 
            array (
                'id' => 28,
                'code' => 'BW',
                'name' => 'Botswana',
                'dial_code' => 267,
                'currency_name' => 'Botswana pula',
                'symbol' => 'P',
                'currency_code' => 'BWP',
            ),
            28 => 
            array (
                'id' => 29,
                'code' => 'BV',
                'name' => 'Bouvet Island',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            29 => 
            array (
                'id' => 30,
                'code' => 'BR',
                'name' => 'Brazil',
                'dial_code' => 55,
                'currency_name' => 'Brazilian real',
                'symbol' => 'R$',
                'currency_code' => 'BRL',
            ),
            30 => 
            array (
                'id' => 31,
                'code' => 'IO',
                'name' => 'British Indian Ocean Territory',
                'dial_code' => 246,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            31 => 
            array (
                'id' => 32,
                'code' => 'BN',
                'name' => 'Brunei',
                'dial_code' => 673,
                'currency_name' => 'Brunei dollar',
                'symbol' => '$',
                'currency_code' => 'BND',
            ),
            32 => 
            array (
                'id' => 33,
                'code' => 'BG',
                'name' => 'Bulgaria',
                'dial_code' => 359,
                'currency_name' => 'Bulgarian lev',
                'symbol' => 'лв',
                'currency_code' => 'BGN',
            ),
            33 => 
            array (
                'id' => 34,
                'code' => 'BF',
                'name' => 'Burkina Faso',
                'dial_code' => 226,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            34 => 
            array (
                'id' => 35,
                'code' => 'BI',
                'name' => 'Burundi',
                'dial_code' => 257,
                'currency_name' => 'Burundian franc',
                'symbol' => 'Fr',
                'currency_code' => 'BIF',
            ),
            35 => 
            array (
                'id' => 36,
                'code' => 'KH',
                'name' => 'Cambodia',
                'dial_code' => 855,
                'currency_name' => 'Cambodian riel',
                'symbol' => '៛',
                'currency_code' => 'KHR',
            ),
            36 => 
            array (
                'id' => 37,
                'code' => 'CM',
                'name' => 'Cameroon',
                'dial_code' => 237,
                'currency_name' => 'Central African CFA ',
                'symbol' => 'Fr',
                'currency_code' => 'XAF',
            ),
            37 => 
            array (
                'id' => 38,
                'code' => 'CA',
                'name' => 'Canada',
                'dial_code' => 1,
                'currency_name' => 'Canadian dollar',
                'symbol' => '$',
                'currency_code' => 'CAD',
            ),
            38 => 
            array (
                'id' => 39,
                'code' => 'CV',
                'name' => 'Cape Verde',
                'dial_code' => 238,
                'currency_name' => 'Cape Verdean escudo',
                'symbol' => 'Esc or $',
                'currency_code' => 'CVE',
            ),
            39 => 
            array (
                'id' => 40,
                'code' => 'KY',
                'name' => 'Cayman Islands',
                'dial_code' => 1345,
                'currency_name' => 'Cayman Islands dolla',
                'symbol' => '$',
                'currency_code' => 'KYD',
            ),
            40 => 
            array (
                'id' => 41,
                'code' => 'CF',
                'name' => 'Central African Republic',
                'dial_code' => 236,
                'currency_name' => 'Central African CFA ',
                'symbol' => 'Fr',
                'currency_code' => 'XAF',
            ),
            41 => 
            array (
                'id' => 42,
                'code' => 'TD',
                'name' => 'Chad',
                'dial_code' => 235,
                'currency_name' => 'Central African CFA ',
                'symbol' => 'Fr',
                'currency_code' => 'XAF',
            ),
            42 => 
            array (
                'id' => 43,
                'code' => 'CL',
                'name' => 'Chile',
                'dial_code' => 56,
                'currency_name' => 'Chilean peso',
                'symbol' => '$',
                'currency_code' => 'CLP',
            ),
            43 => 
            array (
                'id' => 44,
                'code' => 'CN',
                'name' => 'China',
                'dial_code' => 86,
                'currency_name' => 'Chinese yuan',
                'symbol' => '¥ or 元',
                'currency_code' => 'CNY',
            ),
            44 => 
            array (
                'id' => 45,
                'code' => 'CX',
                'name' => 'Christmas Island',
                'dial_code' => 61,
                'currency_name' => '',
                'symbol' => '$',
                'currency_code' => '',
            ),
            45 => 
            array (
                'id' => 46,
                'code' => 'CC',
            'name' => 'Cocos (Keeling) Islands',
                'dial_code' => 672,
                'currency_name' => 'Australian dollar',
                'symbol' => '$',
                'currency_code' => 'AUD',
            ),
            46 => 
            array (
                'id' => 47,
                'code' => 'CO',
                'name' => 'Colombia',
                'dial_code' => 57,
                'currency_name' => 'Colombian peso',
                'symbol' => '$',
                'currency_code' => 'COP',
            ),
            47 => 
            array (
                'id' => 48,
                'code' => 'KM',
                'name' => 'Comoros',
                'dial_code' => 269,
                'currency_name' => 'Comorian franc',
                'symbol' => 'Fr',
                'currency_code' => 'KMF',
            ),
            48 => 
            array (
                'id' => 49,
                'code' => 'CG',
                'name' => 'Congo',
                'dial_code' => 242,
                'currency_name' => '',
                'symbol' => '$',
                'currency_code' => '',
            ),
            49 => 
            array (
                'id' => 50,
                'code' => 'CD',
                'name' => 'Congo The Democratic Republic Of The',
                'dial_code' => 242,
                'currency_name' => '',
                'symbol' => '$',
                'currency_code' => '',
            ),
            50 => 
            array (
                'id' => 51,
                'code' => 'CK',
                'name' => 'Cook Islands',
                'dial_code' => 682,
                'currency_name' => 'New Zealand dollar',
                'symbol' => '$',
                'currency_code' => 'NZD',
            ),
            51 => 
            array (
                'id' => 52,
                'code' => 'CR',
                'name' => 'Costa Rica',
                'dial_code' => 506,
                'currency_name' => 'Costa Rican colón',
                'symbol' => '₡',
                'currency_code' => 'CRC',
            ),
            52 => 
            array (
                'id' => 53,
                'code' => 'CI',
            'name' => 'Cote D\'Ivoire (Ivory Coast)',
                'dial_code' => 225,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            53 => 
            array (
                'id' => 54,
                'code' => 'HR',
            'name' => 'Croatia (Hrvatska)',
                'dial_code' => 385,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            54 => 
            array (
                'id' => 55,
                'code' => 'CU',
                'name' => 'Cuba',
                'dial_code' => 53,
                'currency_name' => 'Cuban convertible pe',
                'symbol' => '$',
                'currency_code' => 'CUC',
            ),
            55 => 
            array (
                'id' => 56,
                'code' => 'CY',
                'name' => 'Cyprus',
                'dial_code' => 357,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            56 => 
            array (
                'id' => 57,
                'code' => 'CZ',
                'name' => 'Czech Republic',
                'dial_code' => 420,
                'currency_name' => 'Czech koruna',
                'symbol' => 'Kč',
                'currency_code' => 'CZK',
            ),
            57 => 
            array (
                'id' => 58,
                'code' => 'DK',
                'name' => 'Denmark',
                'dial_code' => 45,
                'currency_name' => 'Danish krone',
                'symbol' => 'kr',
                'currency_code' => 'DKK',
            ),
            58 => 
            array (
                'id' => 59,
                'code' => 'DJ',
                'name' => 'Djibouti',
                'dial_code' => 253,
                'currency_name' => 'Djiboutian franc',
                'symbol' => 'Fr',
                'currency_code' => 'DJF',
            ),
            59 => 
            array (
                'id' => 60,
                'code' => 'DM',
                'name' => 'Dominica',
                'dial_code' => 1767,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            60 => 
            array (
                'id' => 61,
                'code' => 'DO',
                'name' => 'Dominican Republic',
                'dial_code' => 1809,
                'currency_name' => 'Dominican peso',
                'symbol' => '$',
                'currency_code' => 'DOP',
            ),
            61 => 
            array (
                'id' => 62,
                'code' => 'TP',
                'name' => 'East Timor',
                'dial_code' => 670,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            62 => 
            array (
                'id' => 63,
                'code' => 'EC',
                'name' => 'Ecuador',
                'dial_code' => 593,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            63 => 
            array (
                'id' => 64,
                'code' => 'EG',
                'name' => 'Egypt',
                'dial_code' => 20,
                'currency_name' => 'Egyptian pound',
                'symbol' => '£ or ج.م',
                'currency_code' => 'EGP',
            ),
            64 => 
            array (
                'id' => 65,
                'code' => 'SV',
                'name' => 'El Salvador',
                'dial_code' => 503,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            65 => 
            array (
                'id' => 66,
                'code' => 'GQ',
                'name' => 'Equatorial Guinea',
                'dial_code' => 240,
                'currency_name' => 'Central African CFA ',
                'symbol' => 'Fr',
                'currency_code' => 'XAF',
            ),
            66 => 
            array (
                'id' => 67,
                'code' => 'ER',
                'name' => 'Eritrea',
                'dial_code' => 291,
                'currency_name' => 'Eritrean nakfa',
                'symbol' => 'Nfk',
                'currency_code' => 'ERN',
            ),
            67 => 
            array (
                'id' => 68,
                'code' => 'EE',
                'name' => 'Estonia',
                'dial_code' => 372,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            68 => 
            array (
                'id' => 69,
                'code' => 'ET',
                'name' => 'Ethiopia',
                'dial_code' => 251,
                'currency_name' => 'Ethiopian birr',
                'symbol' => 'Br',
                'currency_code' => 'ETB',
            ),
            69 => 
            array (
                'id' => 70,
                'code' => 'XA',
                'name' => 'External Territories of Australia',
                'dial_code' => 61,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            70 => 
            array (
                'id' => 71,
                'code' => 'FK',
                'name' => 'Falkland Islands',
                'dial_code' => 500,
                'currency_name' => 'Falkland Islands pou',
                'symbol' => '£',
                'currency_code' => 'FKP',
            ),
            71 => 
            array (
                'id' => 72,
                'code' => 'FO',
                'name' => 'Faroe Islands',
                'dial_code' => 298,
                'currency_name' => 'Danish krone',
                'symbol' => 'kr',
                'currency_code' => 'DKK',
            ),
            72 => 
            array (
                'id' => 73,
                'code' => 'FJ',
                'name' => 'Fiji Islands',
                'dial_code' => 679,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            73 => 
            array (
                'id' => 74,
                'code' => 'FI',
                'name' => 'Finland',
                'dial_code' => 358,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            74 => 
            array (
                'id' => 75,
                'code' => 'FR',
                'name' => 'France',
                'dial_code' => 33,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            75 => 
            array (
                'id' => 76,
                'code' => 'GF',
                'name' => 'French Guiana',
                'dial_code' => 594,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            76 => 
            array (
                'id' => 77,
                'code' => 'PF',
                'name' => 'French Polynesia',
                'dial_code' => 689,
                'currency_name' => 'CFP franc',
                'symbol' => 'Fr',
                'currency_code' => 'XPF',
            ),
            77 => 
            array (
                'id' => 78,
                'code' => 'TF',
                'name' => 'French Southern Territories',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            78 => 
            array (
                'id' => 79,
                'code' => 'GA',
                'name' => 'Gabon',
                'dial_code' => 241,
                'currency_name' => 'Central African CFA ',
                'symbol' => 'Fr',
                'currency_code' => 'XAF',
            ),
            79 => 
            array (
                'id' => 80,
                'code' => 'GM',
                'name' => 'Gambia The',
                'dial_code' => 220,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            80 => 
            array (
                'id' => 81,
                'code' => 'GE',
                'name' => 'Georgia',
                'dial_code' => 995,
                'currency_name' => 'Georgian lari',
                'symbol' => 'ლ',
                'currency_code' => 'GEL',
            ),
            81 => 
            array (
                'id' => 82,
                'code' => 'DE',
                'name' => 'Germany',
                'dial_code' => 49,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            82 => 
            array (
                'id' => 83,
                'code' => 'GH',
                'name' => 'Ghana',
                'dial_code' => 233,
                'currency_name' => 'Ghana cedi',
                'symbol' => '₵',
                'currency_code' => 'GHS',
            ),
            83 => 
            array (
                'id' => 84,
                'code' => 'GI',
                'name' => 'Gibraltar',
                'dial_code' => 350,
                'currency_name' => 'Gibraltar pound',
                'symbol' => '£',
                'currency_code' => 'GIP',
            ),
            84 => 
            array (
                'id' => 85,
                'code' => 'GR',
                'name' => 'Greece',
                'dial_code' => 30,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            85 => 
            array (
                'id' => 86,
                'code' => 'GL',
                'name' => 'Greenland',
                'dial_code' => 299,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            86 => 
            array (
                'id' => 87,
                'code' => 'GD',
                'name' => 'Grenada',
                'dial_code' => 1473,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            87 => 
            array (
                'id' => 88,
                'code' => 'GP',
                'name' => 'Guadeloupe',
                'dial_code' => 590,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            88 => 
            array (
                'id' => 89,
                'code' => 'GU',
                'name' => 'Guam',
                'dial_code' => 1671,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            89 => 
            array (
                'id' => 90,
                'code' => 'GT',
                'name' => 'Guatemala',
                'dial_code' => 502,
                'currency_name' => 'Guatemalan quetzal',
                'symbol' => 'Q',
                'currency_code' => 'GTQ',
            ),
            90 => 
            array (
                'id' => 91,
                'code' => 'XU',
                'name' => 'Guernsey and Alderney',
                'dial_code' => 44,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            91 => 
            array (
                'id' => 92,
                'code' => 'GN',
                'name' => 'Guinea',
                'dial_code' => 224,
                'currency_name' => 'Guinean franc',
                'symbol' => 'Fr',
                'currency_code' => 'GNF',
            ),
            92 => 
            array (
                'id' => 93,
                'code' => 'GW',
                'name' => 'Guinea-Bissau',
                'dial_code' => 245,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            93 => 
            array (
                'id' => 94,
                'code' => 'GY',
                'name' => 'Guyana',
                'dial_code' => 592,
                'currency_name' => 'Guyanese dollar',
                'symbol' => '$',
                'currency_code' => 'GYD',
            ),
            94 => 
            array (
                'id' => 95,
                'code' => 'HT',
                'name' => 'Haiti',
                'dial_code' => 509,
                'currency_name' => 'Haitian gourde',
                'symbol' => 'G',
                'currency_code' => 'HTG',
            ),
            95 => 
            array (
                'id' => 96,
                'code' => 'HM',
                'name' => 'Heard and McDonald Islands',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '$',
            ),
            96 => 
            array (
                'id' => 97,
                'code' => 'HN',
                'name' => 'Honduras',
                'dial_code' => 504,
                'currency_name' => 'Honduran lempira',
                'symbol' => 'L',
                'currency_code' => 'HNL',
            ),
            97 => 
            array (
                'id' => 98,
                'code' => 'HK',
                'name' => 'Hong Kong S.A.R.',
                'dial_code' => 852,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '$',
            ),
            98 => 
            array (
                'id' => 99,
                'code' => 'HU',
                'name' => 'Hungary',
                'dial_code' => 36,
                'currency_name' => 'Hungarian forint',
                'symbol' => 'Ft',
                'currency_code' => 'HUF',
            ),
            99 => 
            array (
                'id' => 100,
                'code' => 'IS',
                'name' => 'Iceland',
                'dial_code' => 354,
                'currency_name' => 'Icelandic króna',
                'symbol' => 'kr',
                'currency_code' => 'ISK',
            ),
            100 => 
            array (
                'id' => 101,
                'code' => 'IN',
                'name' => 'India',
                'dial_code' => 91,
                'currency_name' => 'Indian rupee',
                'symbol' => '₹',
                'currency_code' => 'INR',
            ),
            101 => 
            array (
                'id' => 102,
                'code' => 'ID',
                'name' => 'Indonesia',
                'dial_code' => 62,
                'currency_name' => 'Indonesian rupiah',
                'symbol' => 'Rp',
                'currency_code' => 'IDR',
            ),
            102 => 
            array (
                'id' => 103,
                'code' => 'IR',
                'name' => 'Iran',
                'dial_code' => 98,
                'currency_name' => 'Iranian rial',
                'symbol' => '﷼',
                'currency_code' => 'IRR',
            ),
            103 => 
            array (
                'id' => 104,
                'code' => 'IQ',
                'name' => 'Iraq',
                'dial_code' => 964,
                'currency_name' => 'Iraqi dinar',
                'symbol' => 'ع.د',
                'currency_code' => 'IQD',
            ),
            104 => 
            array (
                'id' => 105,
                'code' => 'IE',
                'name' => 'Ireland',
                'dial_code' => 353,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            105 => 
            array (
                'id' => 106,
                'code' => 'IL',
                'name' => 'Israel',
                'dial_code' => 972,
                'currency_name' => 'Israeli new shekel',
                'symbol' => '₪',
                'currency_code' => 'ILS',
            ),
            106 => 
            array (
                'id' => 107,
                'code' => 'IT',
                'name' => 'Italy',
                'dial_code' => 39,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            107 => 
            array (
                'id' => 108,
                'code' => 'JM',
                'name' => 'Jamaica',
                'dial_code' => 1876,
                'currency_name' => 'Jamaican dollar',
                'symbol' => '$',
                'currency_code' => 'JMD',
            ),
            108 => 
            array (
                'id' => 109,
                'code' => 'JP',
                'name' => 'Japan',
                'dial_code' => 81,
                'currency_name' => 'Japanese yen',
                'symbol' => '¥',
                'currency_code' => 'JPY',
            ),
            109 => 
            array (
                'id' => 110,
                'code' => 'XJ',
                'name' => 'Jersey',
                'dial_code' => 44,
                'currency_name' => 'British pound',
                'symbol' => '£',
                'currency_code' => 'GBP',
            ),
            110 => 
            array (
                'id' => 111,
                'code' => 'JO',
                'name' => 'Jordan',
                'dial_code' => 962,
                'currency_name' => 'Jordanian dinar',
                'symbol' => 'د.ا',
                'currency_code' => 'JOD',
            ),
            111 => 
            array (
                'id' => 112,
                'code' => 'KZ',
                'name' => 'Kazakhstan',
                'dial_code' => 7,
                'currency_name' => 'Kazakhstani tenge',
                'symbol' => '',
                'currency_code' => 'KZT',
            ),
            112 => 
            array (
                'id' => 113,
                'code' => 'KE',
                'name' => 'Kenya',
                'dial_code' => 254,
                'currency_name' => 'Kenyan shilling',
                'symbol' => 'Sh',
                'currency_code' => 'KES',
            ),
            113 => 
            array (
                'id' => 114,
                'code' => 'KI',
                'name' => 'Kiribati',
                'dial_code' => 686,
                'currency_name' => 'Australian dollar',
                'symbol' => '$',
                'currency_code' => 'AUD',
            ),
            114 => 
            array (
                'id' => 115,
                'code' => 'KP',
                'name' => 'Korea North',
                'dial_code' => 850,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            115 => 
            array (
                'id' => 116,
                'code' => 'KR',
                'name' => 'Korea South',
                'dial_code' => 82,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            116 => 
            array (
                'id' => 117,
                'code' => 'KW',
                'name' => 'Kuwait',
                'dial_code' => 965,
                'currency_name' => 'Kuwaiti dinar',
                'symbol' => 'د.ك',
                'currency_code' => 'KWD',
            ),
            117 => 
            array (
                'id' => 118,
                'code' => 'KG',
                'name' => 'Kyrgyzstan',
                'dial_code' => 996,
                'currency_name' => 'Kyrgyzstani som',
                'symbol' => 'лв',
                'currency_code' => 'KGS',
            ),
            118 => 
            array (
                'id' => 119,
                'code' => 'LA',
                'name' => 'Laos',
                'dial_code' => 856,
                'currency_name' => 'Lao kip',
                'symbol' => '₭',
                'currency_code' => 'LAK',
            ),
            119 => 
            array (
                'id' => 120,
                'code' => 'LV',
                'name' => 'Latvia',
                'dial_code' => 371,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            120 => 
            array (
                'id' => 121,
                'code' => 'LB',
                'name' => 'Lebanon',
                'dial_code' => 961,
                'currency_name' => 'Lebanese pound',
                'symbol' => 'ل.ل',
                'currency_code' => 'LBP',
            ),
            121 => 
            array (
                'id' => 122,
                'code' => 'LS',
                'name' => 'Lesotho',
                'dial_code' => 266,
                'currency_name' => 'Lesotho loti',
                'symbol' => 'L',
                'currency_code' => 'LSL',
            ),
            122 => 
            array (
                'id' => 123,
                'code' => 'LR',
                'name' => 'Liberia',
                'dial_code' => 231,
                'currency_name' => 'Liberian dollar',
                'symbol' => '$',
                'currency_code' => 'LRD',
            ),
            123 => 
            array (
                'id' => 124,
                'code' => 'LY',
                'name' => 'Libya',
                'dial_code' => 218,
                'currency_name' => 'Libyan dinar',
                'symbol' => 'ل.د',
                'currency_code' => 'LYD',
            ),
            124 => 
            array (
                'id' => 125,
                'code' => 'LI',
                'name' => 'Liechtenstein',
                'dial_code' => 423,
                'currency_name' => 'Swiss franc',
                'symbol' => 'Fr',
                'currency_code' => 'CHF',
            ),
            125 => 
            array (
                'id' => 126,
                'code' => 'LT',
                'name' => 'Lithuania',
                'dial_code' => 370,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            126 => 
            array (
                'id' => 127,
                'code' => 'LU',
                'name' => 'Luxembourg',
                'dial_code' => 352,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            127 => 
            array (
                'id' => 128,
                'code' => 'MO',
                'name' => 'Macau S.A.R.',
                'dial_code' => 853,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            128 => 
            array (
                'id' => 129,
                'code' => 'MK',
                'name' => 'Macedonia',
                'dial_code' => 389,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            129 => 
            array (
                'id' => 130,
                'code' => 'MG',
                'name' => 'Madagascar',
                'dial_code' => 261,
                'currency_name' => 'Malagasy ariary',
                'symbol' => 'Ar',
                'currency_code' => 'MGA',
            ),
            130 => 
            array (
                'id' => 131,
                'code' => 'MW',
                'name' => 'Malawi',
                'dial_code' => 265,
                'currency_name' => 'Malawian kwacha',
                'symbol' => 'MK',
                'currency_code' => 'MWK',
            ),
            131 => 
            array (
                'id' => 132,
                'code' => 'MY',
                'name' => 'Malaysia',
                'dial_code' => 60,
                'currency_name' => 'Malaysian ringgit',
                'symbol' => 'RM',
                'currency_code' => 'MYR',
            ),
            132 => 
            array (
                'id' => 133,
                'code' => 'MV',
                'name' => 'Maldives',
                'dial_code' => 960,
                'currency_name' => 'Maldivian rufiyaa',
                'symbol' => '.ރ',
                'currency_code' => 'MVR',
            ),
            133 => 
            array (
                'id' => 134,
                'code' => 'ML',
                'name' => 'Mali',
                'dial_code' => 223,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            134 => 
            array (
                'id' => 135,
                'code' => 'MT',
                'name' => 'Malta',
                'dial_code' => 356,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            135 => 
            array (
                'id' => 136,
                'code' => 'XM',
            'name' => 'Man (Isle of)',
                'dial_code' => 44,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            136 => 
            array (
                'id' => 137,
                'code' => 'MH',
                'name' => 'Marshall Islands',
                'dial_code' => 692,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            137 => 
            array (
                'id' => 138,
                'code' => 'MQ',
                'name' => 'Martinique',
                'dial_code' => 596,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            138 => 
            array (
                'id' => 139,
                'code' => 'MR',
                'name' => 'Mauritania',
                'dial_code' => 222,
                'currency_name' => 'Mauritanian ouguiya',
                'symbol' => 'UM',
                'currency_code' => 'MRO',
            ),
            139 => 
            array (
                'id' => 140,
                'code' => 'MU',
                'name' => 'Mauritius',
                'dial_code' => 230,
                'currency_name' => 'Mauritian rupee',
                'symbol' => '₨',
                'currency_code' => 'MUR',
            ),
            140 => 
            array (
                'id' => 141,
                'code' => 'YT',
                'name' => 'Mayotte',
                'dial_code' => 269,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            141 => 
            array (
                'id' => 142,
                'code' => 'MX',
                'name' => 'Mexico',
                'dial_code' => 52,
                'currency_name' => 'Mexican peso',
                'symbol' => '$',
                'currency_code' => 'MXN',
            ),
            142 => 
            array (
                'id' => 143,
                'code' => 'FM',
                'name' => 'Micronesia',
                'dial_code' => 691,
                'currency_name' => 'Micronesian dollar',
                'symbol' => '$',
                'currency_code' => '',
            ),
            143 => 
            array (
                'id' => 144,
                'code' => 'MD',
                'name' => 'Moldova',
                'dial_code' => 373,
                'currency_name' => 'Moldovan leu',
                'symbol' => 'L',
                'currency_code' => 'MDL',
            ),
            144 => 
            array (
                'id' => 145,
                'code' => 'MC',
                'name' => 'Monaco',
                'dial_code' => 377,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            145 => 
            array (
                'id' => 146,
                'code' => 'MN',
                'name' => 'Mongolia',
                'dial_code' => 976,
                'currency_name' => 'Mongolian tögrög',
                'symbol' => '₮',
                'currency_code' => 'MNT',
            ),
            146 => 
            array (
                'id' => 147,
                'code' => 'MS',
                'name' => 'Montserrat',
                'dial_code' => 1664,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            147 => 
            array (
                'id' => 148,
                'code' => 'MA',
                'name' => 'Morocco',
                'dial_code' => 212,
                'currency_name' => 'Moroccan dirham',
                'symbol' => 'د.م.',
                'currency_code' => 'MAD',
            ),
            148 => 
            array (
                'id' => 149,
                'code' => 'MZ',
                'name' => 'Mozambique',
                'dial_code' => 258,
                'currency_name' => 'Mozambican metical',
                'symbol' => 'MT',
                'currency_code' => 'MZN',
            ),
            149 => 
            array (
                'id' => 150,
                'code' => 'MM',
                'name' => 'Myanmar',
                'dial_code' => 95,
                'currency_name' => 'Burmese kyat',
                'symbol' => 'Ks',
                'currency_code' => 'MMK',
            ),
            150 => 
            array (
                'id' => 151,
                'code' => 'NA',
                'name' => 'Namibia',
                'dial_code' => 264,
                'currency_name' => 'Namibian dollar',
                'symbol' => '$',
                'currency_code' => 'NAD',
            ),
            151 => 
            array (
                'id' => 152,
                'code' => 'NR',
                'name' => 'Nauru',
                'dial_code' => 674,
                'currency_name' => 'Australian dollar',
                'symbol' => '$',
                'currency_code' => 'AUD',
            ),
            152 => 
            array (
                'id' => 153,
                'code' => 'NP',
                'name' => 'Nepal',
                'dial_code' => 977,
                'currency_name' => 'Nepalese rupee',
                'symbol' => '₨',
                'currency_code' => 'NPR',
            ),
            153 => 
            array (
                'id' => 154,
                'code' => 'AN',
                'name' => 'Netherlands Antilles',
                'dial_code' => 599,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            154 => 
            array (
                'id' => 155,
                'code' => 'NL',
                'name' => 'Netherlands The',
                'dial_code' => 31,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            155 => 
            array (
                'id' => 156,
                'code' => 'NC',
                'name' => 'New Caledonia',
                'dial_code' => 687,
                'currency_name' => 'CFP franc',
                'symbol' => 'Fr',
                'currency_code' => 'XPF',
            ),
            156 => 
            array (
                'id' => 157,
                'code' => 'NZ',
                'name' => 'New Zealand',
                'dial_code' => 64,
                'currency_name' => 'New Zealand dollar',
                'symbol' => '$',
                'currency_code' => 'NZD',
            ),
            157 => 
            array (
                'id' => 158,
                'code' => 'NI',
                'name' => 'Nicaragua',
                'dial_code' => 505,
                'currency_name' => 'Nicaraguan córdoba',
                'symbol' => 'C$',
                'currency_code' => 'NIO',
            ),
            158 => 
            array (
                'id' => 159,
                'code' => 'NE',
                'name' => 'Niger',
                'dial_code' => 227,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            159 => 
            array (
                'id' => 160,
                'code' => 'NG',
                'name' => 'Nigeria',
                'dial_code' => 234,
                'currency_name' => 'Nigerian naira',
                'symbol' => '₦',
                'currency_code' => 'NGN',
            ),
            160 => 
            array (
                'id' => 161,
                'code' => 'NU',
                'name' => 'Niue',
                'dial_code' => 683,
                'currency_name' => 'New Zealand dollar',
                'symbol' => '$',
                'currency_code' => 'NZD',
            ),
            161 => 
            array (
                'id' => 162,
                'code' => 'NF',
                'name' => 'Norfolk Island',
                'dial_code' => 672,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            162 => 
            array (
                'id' => 163,
                'code' => 'MP',
                'name' => 'Northern Mariana Islands',
                'dial_code' => 1670,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            163 => 
            array (
                'id' => 164,
                'code' => 'NO',
                'name' => 'Norway',
                'dial_code' => 47,
                'currency_name' => 'Norwegian krone',
                'symbol' => 'kr',
                'currency_code' => 'NOK',
            ),
            164 => 
            array (
                'id' => 165,
                'code' => 'OM',
                'name' => 'Oman',
                'dial_code' => 968,
                'currency_name' => 'Omani rial',
                'symbol' => 'ر.ع.',
                'currency_code' => 'OMR',
            ),
            165 => 
            array (
                'id' => 166,
                'code' => 'PK',
                'name' => 'Pakistan',
                'dial_code' => 92,
                'currency_name' => 'Pakistani rupee',
                'symbol' => '₨',
                'currency_code' => 'PKR',
            ),
            166 => 
            array (
                'id' => 167,
                'code' => 'PW',
                'name' => 'Palau',
                'dial_code' => 680,
                'currency_name' => 'Palauan dollar',
                'symbol' => '$',
                'currency_code' => '',
            ),
            167 => 
            array (
                'id' => 168,
                'code' => 'PS',
                'name' => 'Palestinian Territory Occupied',
                'dial_code' => 970,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            168 => 
            array (
                'id' => 169,
                'code' => 'PA',
                'name' => 'Panama',
                'dial_code' => 507,
                'currency_name' => 'Panamanian balboa',
                'symbol' => 'B/.',
                'currency_code' => 'PAB',
            ),
            169 => 
            array (
                'id' => 170,
                'code' => 'PG',
                'name' => 'Papua new Guinea',
                'dial_code' => 675,
                'currency_name' => 'Papua New Guinean ki',
                'symbol' => 'K',
                'currency_code' => 'PGK',
            ),
            170 => 
            array (
                'id' => 171,
                'code' => 'PY',
                'name' => 'Paraguay',
                'dial_code' => 595,
                'currency_name' => 'Paraguayan guaraní',
                'symbol' => '₲',
                'currency_code' => 'PYG',
            ),
            171 => 
            array (
                'id' => 172,
                'code' => 'PE',
                'name' => 'Peru',
                'dial_code' => 51,
                'currency_name' => 'Peruvian nuevo sol',
                'symbol' => 'S/.',
                'currency_code' => 'PEN',
            ),
            172 => 
            array (
                'id' => 173,
                'code' => 'PH',
                'name' => 'Philippines',
                'dial_code' => 63,
                'currency_name' => 'Philippine peso',
                'symbol' => '₱',
                'currency_code' => 'PHP',
            ),
            173 => 
            array (
                'id' => 174,
                'code' => 'PN',
                'name' => 'Pitcairn Island',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            174 => 
            array (
                'id' => 175,
                'code' => 'PL',
                'name' => 'Poland',
                'dial_code' => 48,
                'currency_name' => 'Polish złoty',
                'symbol' => 'zł',
                'currency_code' => 'PLN',
            ),
            175 => 
            array (
                'id' => 176,
                'code' => 'PT',
                'name' => 'Portugal',
                'dial_code' => 351,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            176 => 
            array (
                'id' => 177,
                'code' => 'PR',
                'name' => 'Puerto Rico',
                'dial_code' => 1787,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            177 => 
            array (
                'id' => 178,
                'code' => 'QA',
                'name' => 'Qatar',
                'dial_code' => 974,
                'currency_name' => 'Qatari riyal',
                'symbol' => 'ر.ق',
                'currency_code' => 'QAR',
            ),
            178 => 
            array (
                'id' => 179,
                'code' => 'RE',
                'name' => 'Reunion',
                'dial_code' => 262,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            179 => 
            array (
                'id' => 180,
                'code' => 'RO',
                'name' => 'Romania',
                'dial_code' => 40,
                'currency_name' => 'Romanian leu',
                'symbol' => 'lei',
                'currency_code' => 'RON',
            ),
            180 => 
            array (
                'id' => 181,
                'code' => 'RU',
                'name' => 'Russia',
                'dial_code' => 70,
                'currency_name' => 'Russian ruble',
                'symbol' => '',
                'currency_code' => 'RUB',
            ),
            181 => 
            array (
                'id' => 182,
                'code' => 'RW',
                'name' => 'Rwanda',
                'dial_code' => 250,
                'currency_name' => 'Rwandan franc',
                'symbol' => 'Fr',
                'currency_code' => 'RWF',
            ),
            182 => 
            array (
                'id' => 183,
                'code' => 'SH',
                'name' => 'Saint Helena',
                'dial_code' => 290,
                'currency_name' => 'Saint Helena pound',
                'symbol' => '£',
                'currency_code' => 'SHP',
            ),
            183 => 
            array (
                'id' => 184,
                'code' => 'KN',
                'name' => 'Saint Kitts And Nevis',
                'dial_code' => 1869,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            184 => 
            array (
                'id' => 185,
                'code' => 'LC',
                'name' => 'Saint Lucia',
                'dial_code' => 1758,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            185 => 
            array (
                'id' => 186,
                'code' => 'PM',
                'name' => 'Saint Pierre and Miquelon',
                'dial_code' => 508,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            186 => 
            array (
                'id' => 187,
                'code' => 'VC',
                'name' => 'Saint Vincent And The Grenadines',
                'dial_code' => 1784,
                'currency_name' => 'East Caribbean dolla',
                'symbol' => '$',
                'currency_code' => 'XCD',
            ),
            187 => 
            array (
                'id' => 188,
                'code' => 'WS',
                'name' => 'Samoa',
                'dial_code' => 684,
                'currency_name' => 'Samoan tālā',
                'symbol' => 'T',
                'currency_code' => 'WST',
            ),
            188 => 
            array (
                'id' => 189,
                'code' => 'SM',
                'name' => 'San Marino',
                'dial_code' => 378,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            189 => 
            array (
                'id' => 190,
                'code' => 'ST',
                'name' => 'Sao Tome and Principe',
                'dial_code' => 239,
                'currency_name' => 'São Tomé and Príncip',
                'symbol' => 'Db',
                'currency_code' => 'STD',
            ),
            190 => 
            array (
                'id' => 191,
                'code' => 'SA',
                'name' => 'Saudi Arabia',
                'dial_code' => 966,
                'currency_name' => 'Saudi riyal',
                'symbol' => 'ر.س',
                'currency_code' => 'SAR',
            ),
            191 => 
            array (
                'id' => 192,
                'code' => 'SN',
                'name' => 'Senegal',
                'dial_code' => 221,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            192 => 
            array (
                'id' => 193,
                'code' => 'RS',
                'name' => 'Serbia',
                'dial_code' => 381,
                'currency_name' => 'Serbian dinar',
                'symbol' => 'дин. or din.',
                'currency_code' => 'RSD',
            ),
            193 => 
            array (
                'id' => 194,
                'code' => 'SC',
                'name' => 'Seychelles',
                'dial_code' => 248,
                'currency_name' => 'Seychellois rupee',
                'symbol' => '₨',
                'currency_code' => 'SCR',
            ),
            194 => 
            array (
                'id' => 195,
                'code' => 'SL',
                'name' => 'Sierra Leone',
                'dial_code' => 232,
                'currency_name' => 'Sierra Leonean leone',
                'symbol' => 'Le',
                'currency_code' => 'SLL',
            ),
            195 => 
            array (
                'id' => 196,
                'code' => 'SG',
                'name' => 'Singapore',
                'dial_code' => 65,
                'currency_name' => 'Brunei dollar',
                'symbol' => '$',
                'currency_code' => 'BND',
            ),
            196 => 
            array (
                'id' => 197,
                'code' => 'SK',
                'name' => 'Slovakia',
                'dial_code' => 421,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            197 => 
            array (
                'id' => 198,
                'code' => 'SI',
                'name' => 'Slovenia',
                'dial_code' => 386,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            198 => 
            array (
                'id' => 199,
                'code' => 'XG',
                'name' => 'Smaller Territories of the UK',
                'dial_code' => 44,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            199 => 
            array (
                'id' => 200,
                'code' => 'SB',
                'name' => 'Solomon Islands',
                'dial_code' => 677,
                'currency_name' => 'Solomon Islands doll',
                'symbol' => '$',
                'currency_code' => 'SBD',
            ),
            200 => 
            array (
                'id' => 201,
                'code' => 'SO',
                'name' => 'Somalia',
                'dial_code' => 252,
                'currency_name' => 'Somali shilling',
                'symbol' => 'Sh',
                'currency_code' => 'SOS',
            ),
            201 => 
            array (
                'id' => 202,
                'code' => 'ZA',
                'name' => 'South Africa',
                'dial_code' => 27,
                'currency_name' => 'South African rand',
                'symbol' => 'R',
                'currency_code' => 'ZAR',
            ),
            202 => 
            array (
                'id' => 203,
                'code' => 'GS',
                'name' => 'South Georgia',
                'dial_code' => 0,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            203 => 
            array (
                'id' => 204,
                'code' => 'SS',
                'name' => 'South Sudan',
                'dial_code' => 211,
                'currency_name' => 'South Sudanese pound',
                'symbol' => '£',
                'currency_code' => 'SSP',
            ),
            204 => 
            array (
                'id' => 205,
                'code' => 'ES',
                'name' => 'Spain',
                'dial_code' => 34,
                'currency_name' => 'Euro',
                'symbol' => '€',
                'currency_code' => 'EUR',
            ),
            205 => 
            array (
                'id' => 206,
                'code' => 'LK',
                'name' => 'Sri Lanka',
                'dial_code' => 94,
                'currency_name' => 'Sri Lankan rupee',
                'symbol' => 'Rs or රු',
                'currency_code' => 'LKR',
            ),
            206 => 
            array (
                'id' => 207,
                'code' => 'SD',
                'name' => 'Sudan',
                'dial_code' => 249,
                'currency_name' => 'Sudanese pound',
                'symbol' => 'ج.س.',
                'currency_code' => 'SDG',
            ),
            207 => 
            array (
                'id' => 208,
                'code' => 'SR',
                'name' => 'Suriname',
                'dial_code' => 597,
                'currency_name' => 'Surinamese dollar',
                'symbol' => '$',
                'currency_code' => 'SRD',
            ),
            208 => 
            array (
                'id' => 209,
                'code' => 'SJ',
                'name' => 'Svalbard And Jan Mayen Islands',
                'dial_code' => 47,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            209 => 
            array (
                'id' => 210,
                'code' => 'SZ',
                'name' => 'Swaziland',
                'dial_code' => 268,
                'currency_name' => 'Swazi lilangeni',
                'symbol' => 'L',
                'currency_code' => 'SZL',
            ),
            210 => 
            array (
                'id' => 211,
                'code' => 'SE',
                'name' => 'Sweden',
                'dial_code' => 46,
                'currency_name' => 'Swedish krona',
                'symbol' => 'kr',
                'currency_code' => 'SEK',
            ),
            211 => 
            array (
                'id' => 212,
                'code' => 'CH',
                'name' => 'Switzerland',
                'dial_code' => 41,
                'currency_name' => 'Swiss franc',
                'symbol' => 'Fr',
                'currency_code' => 'CHF',
            ),
            212 => 
            array (
                'id' => 213,
                'code' => 'SY',
                'name' => 'Syria',
                'dial_code' => 963,
                'currency_name' => 'Syrian pound',
                'symbol' => '£ or ل.س',
                'currency_code' => 'SYP',
            ),
            213 => 
            array (
                'id' => 214,
                'code' => 'TW',
                'name' => 'Taiwan',
                'dial_code' => 886,
                'currency_name' => 'New Taiwan dollar',
                'symbol' => '$',
                'currency_code' => 'TWD',
            ),
            214 => 
            array (
                'id' => 215,
                'code' => 'TJ',
                'name' => 'Tajikistan',
                'dial_code' => 992,
                'currency_name' => 'Tajikistani somoni',
                'symbol' => 'ЅМ',
                'currency_code' => 'TJS',
            ),
            215 => 
            array (
                'id' => 216,
                'code' => 'TZ',
                'name' => 'Tanzania',
                'dial_code' => 255,
                'currency_name' => 'Tanzanian shilling',
                'symbol' => 'Sh',
                'currency_code' => 'TZS',
            ),
            216 => 
            array (
                'id' => 217,
                'code' => 'TH',
                'name' => 'Thailand',
                'dial_code' => 66,
                'currency_name' => 'Thai baht',
                'symbol' => '฿',
                'currency_code' => 'THB',
            ),
            217 => 
            array (
                'id' => 218,
                'code' => 'TG',
                'name' => 'Togo',
                'dial_code' => 228,
                'currency_name' => 'West African CFA fra',
                'symbol' => 'Fr',
                'currency_code' => 'XOF',
            ),
            218 => 
            array (
                'id' => 219,
                'code' => 'TK',
                'name' => 'Tokelau',
                'dial_code' => 690,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            219 => 
            array (
                'id' => 220,
                'code' => 'TO',
                'name' => 'Tonga',
                'dial_code' => 676,
                'currency_name' => 'Tongan paʻanga',
                'symbol' => 'T$',
                'currency_code' => 'TOP',
            ),
            220 => 
            array (
                'id' => 221,
                'code' => 'TT',
                'name' => 'Trinidad And Tobago',
                'dial_code' => 1868,
                'currency_name' => 'Trinidad and Tobago ',
                'symbol' => '$',
                'currency_code' => 'TTD',
            ),
            221 => 
            array (
                'id' => 222,
                'code' => 'TN',
                'name' => 'Tunisia',
                'dial_code' => 216,
                'currency_name' => 'Tunisian dinar',
                'symbol' => 'د.ت',
                'currency_code' => 'TND',
            ),
            222 => 
            array (
                'id' => 223,
                'code' => 'TR',
                'name' => 'Turkey',
                'dial_code' => 90,
                'currency_name' => 'Turkish lira',
                'symbol' => '',
                'currency_code' => 'TRY',
            ),
            223 => 
            array (
                'id' => 224,
                'code' => 'TM',
                'name' => 'Turkmenistan',
                'dial_code' => 7370,
                'currency_name' => 'Turkmenistan manat',
                'symbol' => 'm',
                'currency_code' => 'TMT',
            ),
            224 => 
            array (
                'id' => 225,
                'code' => 'TC',
                'name' => 'Turks And Caicos Islands',
                'dial_code' => 1649,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            225 => 
            array (
                'id' => 226,
                'code' => 'TV',
                'name' => 'Tuvalu',
                'dial_code' => 688,
                'currency_name' => 'Australian dollar',
                'symbol' => '$',
                'currency_code' => 'AUD',
            ),
            226 => 
            array (
                'id' => 227,
                'code' => 'UG',
                'name' => 'Uganda',
                'dial_code' => 256,
                'currency_name' => 'Ugandan shilling',
                'symbol' => 'Sh',
                'currency_code' => 'UGX',
            ),
            227 => 
            array (
                'id' => 228,
                'code' => 'UA',
                'name' => 'Ukraine',
                'dial_code' => 380,
                'currency_name' => 'Ukrainian hryvnia',
                'symbol' => '₴',
                'currency_code' => 'UAH',
            ),
            228 => 
            array (
                'id' => 229,
                'code' => 'AE',
                'name' => 'United Arab Emirates',
                'dial_code' => 971,
                'currency_name' => 'United Arab Emirates',
                'symbol' => 'د.إ',
                'currency_code' => 'AED',
            ),
            229 => 
            array (
                'id' => 230,
                'code' => 'GB',
                'name' => 'United Kingdom',
                'dial_code' => 44,
                'currency_name' => 'British pound',
                'symbol' => '£',
                'currency_code' => 'GBP',
            ),
            230 => 
            array (
                'id' => 231,
                'code' => 'US',
                'name' => 'United States',
                'dial_code' => 1,
                'currency_name' => 'United States dollar',
                'symbol' => '$',
                'currency_code' => 'USD',
            ),
            231 => 
            array (
                'id' => 232,
                'code' => 'UM',
                'name' => 'United States Minor Outlying Islands',
                'dial_code' => 1,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            232 => 
            array (
                'id' => 233,
                'code' => 'UY',
                'name' => 'Uruguay',
                'dial_code' => 598,
                'currency_name' => 'Uruguayan peso',
                'symbol' => '$',
                'currency_code' => 'UYU',
            ),
            233 => 
            array (
                'id' => 234,
                'code' => 'UZ',
                'name' => 'Uzbekistan',
                'dial_code' => 998,
                'currency_name' => 'Uzbekistani som',
                'symbol' => '',
                'currency_code' => 'UZS',
            ),
            234 => 
            array (
                'id' => 235,
                'code' => 'VU',
                'name' => 'Vanuatu',
                'dial_code' => 678,
                'currency_name' => 'Vanuatu vatu',
                'symbol' => 'Vt',
                'currency_code' => 'VUV',
            ),
            235 => 
            array (
                'id' => 236,
                'code' => 'VA',
            'name' => 'Vatican City State (Holy See)',
                'dial_code' => 39,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            236 => 
            array (
                'id' => 237,
                'code' => 'VE',
                'name' => 'Venezuela',
                'dial_code' => 58,
                'currency_name' => 'Venezuelan bolívar',
                'symbol' => 'Bs F',
                'currency_code' => 'VEF',
            ),
            237 => 
            array (
                'id' => 238,
                'code' => 'VN',
                'name' => 'Vietnam',
                'dial_code' => 84,
                'currency_name' => 'Vietnamese đồng',
                'symbol' => '₫',
                'currency_code' => 'VND',
            ),
            238 => 
            array (
                'id' => 239,
                'code' => 'VG',
            'name' => 'Virgin Islands (British)',
                'dial_code' => 1284,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            239 => 
            array (
                'id' => 240,
                'code' => 'VI',
            'name' => 'Virgin Islands (US)',
                'dial_code' => 1340,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            240 => 
            array (
                'id' => 241,
                'code' => 'WF',
                'name' => 'Wallis And Futuna Islands',
                'dial_code' => 681,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            241 => 
            array (
                'id' => 242,
                'code' => 'EH',
                'name' => 'Western Sahara',
                'dial_code' => 212,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            242 => 
            array (
                'id' => 243,
                'code' => 'YE',
                'name' => 'Yemen',
                'dial_code' => 967,
                'currency_name' => 'Yemeni rial',
                'symbol' => '﷼',
                'currency_code' => 'YER',
            ),
            243 => 
            array (
                'id' => 244,
                'code' => 'YU',
                'name' => 'Yugoslavia',
                'dial_code' => 38,
                'currency_name' => '',
                'symbol' => '',
                'currency_code' => '',
            ),
            244 => 
            array (
                'id' => 245,
                'code' => 'ZM',
                'name' => 'Zambia',
                'dial_code' => 260,
                'currency_name' => 'Zambian kwacha',
                'symbol' => 'ZK',
                'currency_code' => 'ZMW',
            ),
            245 => 
            array (
                'id' => 246,
                'code' => 'ZW',
                'name' => 'Zimbabwe',
                'dial_code' => 263,
                'currency_name' => 'Botswana pula',
                'symbol' => 'P',
                'currency_code' => 'BWP',
            ),
        ));
        
        
    }
}