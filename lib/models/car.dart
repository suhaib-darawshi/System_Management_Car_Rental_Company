class Car {
  late int id;
  late String carName;
  late String status;
  late String brand;
  late String model;
  late String licence;
  late String VIN;
  late String category;
  late String branch;
  late int kilometers;
  late String fuelStatus;
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
    this.carName = map['Car Name'];
    this.status = map['Status'];
    this.brand = map['Brand'];
    this.licence = map['Licence'];
    this.VIN = map['VIN'];
    this.category = map['Category'];
    this.branch = map['Branch'];
    this.kilometers = map['Kilometers'];
    this.fuelStatus = map['Fuel Status'];
    this.tyres = map['Tyres'];
    this.barkingBox = map['Barking Box'];
    this.damages = map['Damages'];
    this.carIn = map['Car In'];
    this.carLocation = map['Car Location'];
    this.model = map['Model'];
    this.toBePrepared = map['To Be Prepared']??0;
    this.toBeTransferred = map['To Be Transferred']??0;
  }
  Map<String, dynamic> toMap() {
    return {
      'Car Name': this.carName,
      'Status': this.status,
      'Brand': this.brand,
      'Model': this.model,
      'Licence': this.licence,
      'VIN': this.VIN,
      'Category': this.category,
      'Branch': this.branch,
      'Kilometers': this.kilometers,
      'Fuel Status': this.fuelStatus,
      'Tyres': this.tyres,
      'Barking Box': this.barkingBox,
      'Damages': this.damages,
      'Car In': this.carIn,
      'Car Location': this.carLocation,
      'To Be Prepared': this.toBePrepared,
      'To Be Transferred':this.toBeTransferred
    };
  }
}
