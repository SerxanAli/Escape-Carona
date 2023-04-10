//
//  GameScene.swift
//  Escape Carona
//
//  Created by serhan on 06.04.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var pacman: SKSpriteNode = SKSpriteNode()
    var corona: SKSpriteNode = SKSpriteNode()
    
    var elma: SKSpriteNode = SKSpriteNode()
    var meyveler: SKSpriteNode = SKSpriteNode()
    var visne: SKSpriteNode = SKSpriteNode()
    
    var scoreLabel: SKLabelNode = SKLabelNode()
    
    var viewController: UIViewController?
    
    var dokunmaKontrol = false
    
    var timer: Timer?
    var zaman: Timer?
    
    
    var Score = 50 {
        didSet {
            scoreLabel.text = "Score: \(Score)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        
        
        
        if let tempKarakter = self.childNode(withName: "pacman") as? SKSpriteNode {
            pacman = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "corona") as? SKSpriteNode {
            corona = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "elma") as? SKSpriteNode {
            elma = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "meyveler") as? SKSpriteNode {
            meyveler = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "visne") as? SKSpriteNode {
            visne = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "scoreLabel") as? SKLabelNode {
            scoreLabel = tempKarakter
            
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(haraket), userInfo: nil, repeats: true)
        
        
        zaman = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zamanAxisi), userInfo: nil, repeats: true)
    }
    
    @objc func zamanAxisi(){
        
        Score = Score - 1
        
        if Score < 0 {
            
            timer?.invalidate()
            zaman?.invalidate()
            
            self.viewController?.performSegue(withIdentifier: "page3", sender: nil)
        }
        
    }
    
    @objc func haraket() {
        
        if dokunmaKontrol {
            
            let yuxari = SKAction.moveBy(x: 0, y: +20, duration: 1)
            pacman.run(yuxari)
            
        } else {
            
            let asagi = SKAction.moveBy(x: 0, y: -20, duration: 1)
            pacman.run(asagi)
        }
        
        
        hereket(obje: corona)
        hereket(obje: elma)
        
        hereket(obje: meyveler)
        hereket(obje: visne)
        
        
    }
    
    
    func hereket(obje:SKSpriteNode){
        
        var yer = obje.position.x
        
        if yer < 0 {
            yer = 900
            obje.position.x = yer
            obje.position.y = CGFloat(Float.random(in: 10...1250))
        } else {
            yer -= 10
            obje.position.x = yer
        }
        
        
    }
    

    func touchDown(atPoint pos : CGPoint) {
        
        dokunmaKontrol = true
        print(pos.y)
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        dokunmaKontrol = false
        
    }
    
 
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
