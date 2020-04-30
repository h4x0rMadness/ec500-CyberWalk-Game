//
//  ViewController.swift
//  FlowerShop
//
//  Created by Brian Advent on 14.06.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SpriteKit

var flag = false


class ViewController: UIViewController, ARSCNViewDelegate {
    
    var isAquireTouched = false
    
    @IBOutlet var sceneView: ARSCNView!
    private lazy var connectButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(NSLocalizedString("Personal Profile", comment: ""), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 0, y: 800)
        button.frame = CGRect(x:0, y:600, width:400, height:50)
        button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)

        return button
    }()
    private lazy var resButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitle(NSLocalizedString("Object Aquired!\n go check", comment: ""), for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 40)
        //button.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 0, y: 800)
        button.frame = CGRect(x:0, y:0, width:400, height:400)
        button.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0.2, alpha: 0.5)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/GameScene.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        sceneView.addSubview(connectButton)
        if(flag){
            sceneView.addSubview(resButton)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Object Detection
        configuration.detectionObjects = ARReferenceObject.referenceObjects(inGroupNamed: "exampleObjects", bundle: Bundle.main)!

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print("first touch, flag is: " + flag.description)
            flag = true
            print("changed, now flag is: " + flag.description)
            self.viewDidLoad()
            
        }
    }
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
    
        let node = SCNNode()
        if let objectAnchor = anchor as? ARObjectAnchor {
            print("going through if condition, now bool is:" + isAquireTouched.description)
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 3), height: CGFloat(objectAnchor.referenceObject.extent.y * 1.5))
            
            plane.cornerRadius = plane.width / 8
            
            let spriteKitScene = SKScene(fileNamed: "ProductInfo")
            
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x + 0.01, objectAnchor.referenceObject.center.y + 0.25, objectAnchor.referenceObject.center.z)
            
            node.addChildNode(planeNode)
            
            
            //let plane2 = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 3), height: CGFloat(objectAnchor.referenceObject.extent.y * 1.5))
            
            //plane2.cornerRadius = plane2.width / 8
            //let spriteKitScene2 = SKScene(fileNamed: "touchedScene")
            
            //plane2.firstMaterial?.diffuse.contents = spriteKitScene2
            //plane2.firstMaterial?.isDoubleSided = true
            //plane2.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            
            //let planeNode2 = SCNNode(geometry: plane2)
            //planeNode2.position = SCNVector3Make(objectAnchor.referenceObject.center.x + 0.01, objectAnchor.referenceObject.center.y + 0.25, objectAnchor.referenceObject.center.z)
            
            
        }
        
        return node
    }
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    

}
