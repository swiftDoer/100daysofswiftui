import Foundation

struct PetPerson: Identifiable {
    
    let id = UUID()
    let name : String
    let hasPets : Bool
    let money : Double
    let petAmount : Int
    let perPetCost : Double
    
    var costYabai : Bool {
        if petOneWeekCost < 0 {
            return true
        } else {
            return false
        }
    }
    
    var petWeeklyCost : Double  {
        Double(petAmount) * perPetCost
    }
    
    var petMonthlyCost : Double {
        petWeeklyCost * 4
    }
    
    var petYearlyCost : Double {
        petMonthlyCost * 12
    }
    
    var petOneWeekCost : Double {
        money - petWeeklyCost
    }
    
    var weeklyCalculation : String {
        "$\(String(format: "%.2f", money)) - $\(String(format: "%.2f", petWeeklyCost)) = $\(String(format: "%.2f", petOneWeekCost))"
    }
    
    
    
}
