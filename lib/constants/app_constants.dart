const String defaultLanaguage = 'English';
const String hindiLanaguage = 'Hindi';
const String marathiLanaguage = 'Marathi';

List<String> lanaguagePreferences = [defaultLanaguage, marathiLanaguage];

const String bride = 'Bride';
const String groom = 'Groom';

const int indiaCountryID = 105;
const int mhStateID = 21;

List<String> marriagePreferences = [bride, groom];

List<String> profileFor = ['Self', 'Parents'];

List<String> yesOrNo = ['Yes', 'No'];

List<String> approvalStatuses = ['Approved', 'Reject'];

List<String> castes = ['Maratha', 'Vanjari'];

List<String> marathaSubCastes = ['96Kuli', 'Kunbi'];
List<String> vanjariSubCastes = ['Vanjari', 'Ladjin Vanjari', 'Ravjin Vanjari', 'Madhurajin Vanjari'];

List<String> languages = ['Marathi', 'Hindi', 'English'];

List<String> profilesFor = ['Self', 'Son', 'Daughter', 'Brother', 'Sister'];

List<String> genders = ['Male', 'Female', 'Other'];

List<String> maritalStatuses = ['Unmarried', 'Divorsed', 'Widow/Widower', 'Awaiting Divorce'];

List<String> bodyTypes = ['Slim', 'Athletic', 'Average', 'Heavy'];

List<String> bloodGroups = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];

List<String> physicalStatuses = ['Normal', 'Physically Challenged', 'Partially Challenged'];

List<String> eatingHabits = ['Vegetarian', 'Non Vegetarian', 'Eggetarian'];
List<String> smokDrinkHabits = ['No', 'Yes', 'Ocassionally'];

List<String> highestEducations = [
  'Bachelor of Engineering (BE/B.Tech)',
  'Bachelor of Architecture',
  'BCA',
  'MCA',
  'MBBS',
  'BAMS',
  'BHMS',
  'Bachelor of Dental Surgery (BDS)',
  'Bachelor of Laws',
  'Primary Education',
  'Secondary Education',
  'Bachelor Degree',
  'Master Degree',
  'PHD',
  'Uneducated'
];

List<String> occupations = ['Unemployed', 'Farmer', 'Gov Job', 'Private Job', 'Business', 'Self Employed', 'Others'];

List<String> religions = [
  'Hindu',
  // 'Islam',
  // 'Christianity',
  // 'Judaism',
  // 'Buddhism',
  // 'Jainism',
  // 'Sikhism',
  // 'Zoroastrianism'
];

List<String> get heights {
  double i = 3.9;
  List<String> floats = [];

  while (i < 7) {
    i = double.parse((i + 0.1).toStringAsFixed(2));
    floats.add(i.toString());
    i = (i).toDouble();
  }
  return floats;
}

List<String> get weights {
  List<String> weights = [];
  for (int i = 31; i <= 120; i += 5) {
    weights.add('$i - ${i + 4} Kg');
  }
  return weights;
}

List<String> get annualIncomes {
  return [
    'No Income',
    '0-2L',
    '2-4L',
    '4-6L',
    '6-8L',
    '8-10L',
    '10-12L',
    '12-15L',
    '15-20L',
    '20-25L',
    '25L-1CR',
    '1CR - Above',
  ];
}

List<String> get totalWorkExperiences {
  List<String> exps = ['0'];
  for (int i = 1; i <= 10; i++) {
    exps.add('$i');
  }
  // exps.add('More than 10 Year');
  return exps;
}

List<String> searchByParams = [
  'Id',
  'Surname',
  'Living Location',
  'Office Location',
  'Education',
  'Age',
  'Marrital Status',
  'Caste',
  'All'
];

String nbsp(int length) {
  String exps = "\u{00A0}";
  for (int i = 1; i <= length; i++) {
    exps += "\u{00A0}";
  }
  return exps;
}
