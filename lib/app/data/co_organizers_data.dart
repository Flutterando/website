const String _baseUrl = 'assets/images/co_organizers/';
const String jacob_circle = '${_baseUrl}jacob_circle.png';
const String mateus_perez_circle = '${_baseUrl}mateus_perez_circle.png';
const String bwolf_circle = '${_baseUrl}bwolf_circle.png';
const String ian_circle = '${_baseUrl}ian_circle.png';
const String mateus_geronimo_circle = '${_baseUrl}mateus_geronimo_circle.png';
const String kelven_galvao = '${_baseUrl}kelven_galvao.png';
const String david_araujo_circle = '${_baseUrl}david_araujo_circle.png';
const String toshi = '${_baseUrl}toshi_circle.png';
const String mateus_felipe = '${_baseUrl}mateus_felipe_circle.png';
const String deivinho = '${_baseUrl}deivinho_circle.png';
const String renato_mota = '${_baseUrl}renato_mota_circle.png';
const String alvaro_circle = '${_baseUrl}alvaro_circle.png';
const String stell_circle = '${_baseUrl}stell_circle.png';
const String jeh2_circle = '${_baseUrl}jeh2_circle.png';
const String fausto_circle = '${_baseUrl}fausto_circle.png';

class CoOrganizersData {
  final List<Map<String, dynamic>> coOrganizers = [
    {
      'name': 'Jacob Moura',
      'pathImage': jacob_circle,
      'linkedin': 'https://www.linkedin.com/in/jacob-moura/',
      'status': 'Founder'
    },
    {
      'name': 'Matheus Perez',
      'pathImage': mateus_perez_circle,
      'linkedin': 'https://www.linkedin.com/in/matheusperez/',
      'status': 'Founder',
    },
    {
      'name': 'Bwolf',
      'pathImage': bwolf_circle,
      'linkedin': 'https://www.linkedin.com/in/bwolfdev/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Ian Oliveira',
      'pathImage': ian_circle,
      'linkedin': 'https://www.linkedin.com/in/ian-oliveira-0701a2130/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Mateus Gerônimo',
      'pathImage': mateus_geronimo_circle,
      'linkedin': 'https://www.linkedin.com/in/mateus-geronimo-rosa-106b6714b/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Kelven Galvão',
      'pathImage': kelven_galvao,
      'linkedin': 'https://www.linkedin.com/in/irvine5k/',
      'status': 'Co-organizer',
    },
    {
      'name': 'David Araujo',
      'pathImage': david_araujo_circle,
      'linkedin': 'https://www.linkedin.com/in/davidsdearaujo/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Kevlin Ossada',
      'pathImage': toshi,
      'linkedin': 'https://www.linkedin.com/in/toshiossada/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Mateus Cordeiro',
      'pathImage': mateus_felipe,
      'linkedin': 'https://www.linkedin.com/in/mateusfccp/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Deivid Rodrigues',
      'pathImage': deivinho,
      'linkedin':
          'https://www.linkedin.com/in/deivid-willyan-rodrigues-fabiano-19776abb/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Renato Mota',
      'pathImage': renato_mota,
      'linkedin': 'https://www.linkedin.com/in/renatomotadeveloper/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Alvaro Vasconcelos',
      'pathImage': alvaro_circle,
      'linkedin': 'https://www.linkedin.com/in/vasconcelosdev/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Sthefanny Gonzaga',
      'pathImage': stell_circle,
      'linkedin': 'https://www.linkedin.com/in/sthefannygonzaga/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Jessica Pereira',
      'pathImage': jeh2_circle,
      'linkedin': 'https://www.linkedin.com/in/jessica-mariane-pereira-dev/',
      'status': 'Co-organizer',
    },
    {
      'name': 'Fausto Blanco',
      'pathImage': fausto_circle,
      'linkedin': 'https://www.linkedin.com/in/faustobdls/',
      'status': 'Co-organizer',
    },
  ];

  List<Map<String, dynamic>> get() {
    return coOrganizers;
  }
}
