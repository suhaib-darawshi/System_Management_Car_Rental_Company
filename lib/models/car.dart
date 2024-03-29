class Car {
  late int id;
  late String carName; //
  late String status;
  late String brand; //
  late String model; //
  late String licence; //
  late String VIN; //
  late String category; //
  late String branch; //
  late int kilometers; //
  late String fuelStatus; //
  late String tyres;
  late String barkingBox;
  late String damages;
  late String carIn;
  late String carLocation;
  late int toBePrepared;
  late int toBeTransferred;
  /*
final String carNameColumnName = 'Car Name';
  final String carStatusColumnName = 'Status';
  final String carBrandColumnName = 'Brand';
  final String carLicencePlateColumnName = 'Licence';
  final String carVinColumnName = 'VIN';
  final String carCategoryColumnName = 'Category';
  final String carBranchColumnName = 'Branch';
  final String carKilometersColumnName = 'Kilometers';
  final String carFuelStatusColumnName = 'Fuel Status';
  final String carTyresColumnName = 'Tyres';
  final String carParkingBoxColumnName = 'Barking Box';
  final String carDamagesColumnName = 'Damages';
  final String carCarInColumnName = 'Car In';
  final String carLocationColumnName = 'Car Location';
*/
  Car.fromMap(Map<String, dynamic> map) {
    this.id = map['id']??0;
    this.carName = map['Car_Name'];
    this.status = map['Status'];
    this.brand = map['Brand'];
    this.licence = map['Licence'];
    this.VIN = map['VIN'];
    this.category = map['Category'];
    this.branch = map['Branch'];
    this.kilometers = map['Kilometers'];
    this.fuelStatus = map['Fuel_Status'];
    this.tyres = map['Tyres'];
    this.barkingBox = map['Barking_Box'];
    this.damages = map['Damages']??'No Damage';
    this.carIn = map['Car_In']??'Car Out';
    this.carLocation = map['Car_Location'];
    this.model = map['Model'];
    this.toBePrepared = map['To_Be_Prepared'] ?? 0;
    this.toBeTransferred = map['To_Be_Transferred'] ?? 0;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'Car_Name': this.carName,
      'Status': this.status,
      'Brand': this.brand,
      'Model': this.model,
      'Licence': this.licence,
      'VIN': this.VIN,
      'Category': this.category,
      'Branch': this.branch,
      'Kilometers': this.kilometers,
      'Fuel_Status': this.fuelStatus,
      'Tyres': this.tyres,
      'Barking_Box': this.barkingBox,
      'Damages': this.damages,
      'Car_In': this.carIn,
      'Car_Location': this.carLocation,
      'To_Be_Prepared': this.toBePrepared,
      'To_Be_Transferred': this.toBeTransferred
    };
  }
}
