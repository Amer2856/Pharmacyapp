class Medicine {
  String name;
  String category;
  double price;

  Medicine(this.name, this.category, this.price);
}

List<Medicine> medicines = [
  Medicine('Paracetamol', 'Pain reliever', 5.00),
  Medicine('Ibuprofen', 'Pain reliever', 6.00),
  Medicine('Aspirin', 'Pain reliever', 4.00),
  Medicine('Amoxicillin', 'Antibiotic', 10.00),
  Medicine('Penicillin', 'Antibiotic', 12.00),
  Medicine('Tetracycline', 'Antibiotic', 8.00),
  Medicine('Salbutamol', 'Asthma medication', 15.00),
  Medicine('Fluticasone', 'Asthma medication', 20.00),
  Medicine('Beclomethasone', 'Asthma medication', 16.00),
  Medicine('Lisinopril', 'Blood pressure medication', 25.00),
  Medicine('Enalapril', 'Blood pressure medication', 30.00),
  Medicine('Atenolol', 'Blood pressure medication', 20.00),
  Medicine('Metformin', 'Diabetes medication', 35.00),
  Medicine('Glipizide', 'Diabetes medication', 40.00),
  Medicine('Glibenclamide', 'Diabetes medication', 30.00),
  Medicine('Citalopram', 'Antidepressant', 45.00),
  Medicine('Sertraline', 'Antidepressant', 50.00),
  Medicine('Fluoxetine', 'Antidepressant', 40.00),
  Medicine('Alprazolam', 'Anti-anxiety medication', 55.00),
  Medicine('Lorazepam', 'Anti-anxiety medication', 60.00),
  Medicine('Diazepam', 'Anti-anxiety medication', 50.00),
];
