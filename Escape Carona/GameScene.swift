//
//  GameScene.swift
//  Escape Carona
//
//  Created by serhan on 06.04.23.
//

import SpriteKit
import GameplayKit


enum CarpismaTipi:UInt32 {
    case pacman = 1
    case corona = 2
    case elma = 3
    case meyveler = 4
    case visne = 5
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
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
        
        self.physicsWorld.contactDelegate = self
        
        if let tempKarakter = self.childNode(withName: "pacman") as? SKSpriteNode {
            pacman = tempKarakter
            
            
            Carpisma(obj1: pacman, obj2: corona, id1: CarpismaTipi.pacman.rawValue, id2:CarpismaTipi.corona.rawValue)
        }
        
        if let tempKarakter = self.childNode(withName: "corona") as? SKSpriteNode {
            corona = tempKarakter
            
            
            Carpisma(obj1: corona, obj2: pacman, id1: CarpismaTipi.corona.rawValue, id2:CarpismaTipi.pacman.rawValue)
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
    
    func Carpisma(obj1:SKSpriteNode, obj2:SKSpriteNode, id1:UInt32 ,id2:UInt32 ) {
        
        obj1.physicsBody?.categoryBitMask = id1
        obj1.physicsBody?.collisionBitMask = id2
        obj1.physicsBody?.contactTestBitMask = id2
        
        
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
    
 
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("toqqusma")
        
        carpmadanSonra(id1: CarpismaTipi.pacman.rawValue, id2: CarpismaTipi.corona.rawValue, contact: contact)
        
        
    }
    
    func carpmadanSonra(id1:UInt32 ,id2:UInt32, contact:SKPhysicsContact){
        
        if contact.bodyA.categoryBitMask == id1 && contact.bodyB.categoryBitMask == id2 {
          return  print("id1 deydi")
        }
        
        if contact.bodyB.categoryBitMask == id1 && contact.bodyA.categoryBitMask == id2 {
            return  print("id2 deydi")
        }
        
        
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
