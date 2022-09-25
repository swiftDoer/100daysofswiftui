import Foundation

class PetPersonViewModel: ObservableObject {
    
    @Published var petPersonArray = [
        PetPerson(name: "Josh", hasPets: true, money: 6.47, petAmount: 1, perPetCost: 7.95),
        PetPerson(name: "Drake", hasPets: true, money: 1243.43, petAmount: 3, perPetCost: 75.45),
        PetPerson(name: "Nonie", hasPets: false, money: 1243.43, petAmount: 0, perPetCost: 0),
        PetPerson(name: "Yui", hasPets: true, money: 21243.48, petAmount: 1, perPetCost: 30.00),
        PetPerson(name: "Tasha", hasPets: true, money: 2243.40, petAmount: 8, perPetCost: 50.00),
    ]
    
    
}


