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
        
        
     
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
    
        self.viewController?.performSegue(withIdentifier: "page3", sender: nil)
        
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
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
