//
//  ViewController3.swift
//  Escape Carona
//
//  Created by serhan on 07.04.23.
//

import UIKit

class ViewController3: UIViewController {

    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var HigeScoreLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("page3")
        
        let depo = UserDefaults.standard
        
        let newScore = depo.integer(forKey: "newScore")
        
        let HigeScore = depo.integer(forKey: "HigeScore")
        
        ScoreLabel.text  = "Score: \(newScore)"
        
        
        if newScore > HigeScore {
            
            depo.set(newScore, forKey: "HigeScore")
            HigeScoreLabel.text = "HigeScore: \(newScore)"
            
            
        } else {
            
            HigeScoreLabel.text = "HigeScore: \(HigeScore)"
            
            
        }
        
        
    }
    

  

}
