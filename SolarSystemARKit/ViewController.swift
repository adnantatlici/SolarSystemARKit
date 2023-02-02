//
//  ViewController.swift
//  SolarSystemARKit
//
//  Created by Mustafa Adnan Tatlıcı on 2.02.2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let world = createPlanet(radius: 0.1, content: "world", vector: SCNVector3(0, 0.2, -1))
                
                let mars = createPlanet(radius: 0.2, content: "mars", vector: SCNVector3(0.5, 0.2, -1))
                
                let venus = createPlanet(radius: 0.15, content: "venus", vector: SCNVector3(1, 0.2, -1))
                
                sceneView.scene.rootNode.addChildNode(world)
                sceneView.scene.rootNode.addChildNode(mars)
                sceneView.scene.rootNode.addChildNode(venus)
    }
    
    func createPlanet(radius: CGFloat , content: String, vector: SCNVector3) -> SCNNode {
        
        let myPlanet = SCNSphere(radius: radius)
        let planetMaterial = SCNMaterial()
        planetMaterial.diffuse.contents = UIImage(named: "art/\(content)")
        myPlanet.materials = [planetMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = myPlanet
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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
