//
//  GlobeVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//

import UIKit
import SceneKit

class GlobeVC: BaseViewController {

    @IBOutlet weak var globeBGView: SCNView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGlobe()
        setup()
    }
    

    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }
    
    func setupGlobe() {
        
        let scene = SCNScene()
        globeBGView.scene = scene
        
        globeBGView.backgroundColor = .black
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)
        
        // ✅ Ambient Light (NO SHADOW)
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        ambientLight.light?.intensity = 1000
        ambientLight.light?.color = UIColor.white
        scene.rootNode.addChildNode(ambientLight)
        
        // Globe
        let sphere = SCNSphere(radius: 1.5)
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "earth_texture")
        sphere.firstMaterial?.specular.contents = UIColor.white
        sphere.firstMaterial?.shininess = 0.5
        
        let globeNode = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(globeNode)
        
        // Atmosphere
        let atmosphere = SCNSphere(radius: 1.55)
        atmosphere.firstMaterial?.diffuse.contents = UIColor.clear
        atmosphere.firstMaterial?.emission.contents = UIColor.blue
        atmosphere.firstMaterial?.transparent.contents = UIColor.blue.withAlphaComponent(0.2)
        
        let atmosphereNode = SCNNode(geometry: atmosphere)
        scene.rootNode.addChildNode(atmosphereNode)
        
        // ❌ NO auto rotation
        
        // Enable manual rotate + zoom
        globeBGView.allowsCameraControl = true
        
        // Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        globeBGView.addGestureRecognizer(tap)
        
        countryLabel = UILabel(frame: CGRect(x: 20, y: 120, width: 250, height: 40))
        countryLabel.textColor = .white
        countryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        countryLabel.text = ""
        view.addSubview(countryLabel)
    }
        
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: globeBGView)
        let hits = globeBGView.hitTest(location, options: nil)
        
        if let result = hits.first {
            
            let position = result.worldCoordinates
            
            // ❌ remove label
            countryLabel.text = ""
            
            // ✅ Globe pe show
            //addTextOnGlobe(text: "India 🇮🇳", position: position)
        }
    }
       
    func addTextOnGlobe(text: String, position: SCNVector3) {
        
        let textGeo = SCNText(string: text, extrusionDepth: 1)
        textGeo.font = UIFont.systemFont(ofSize: 5)
        textGeo.firstMaterial?.diffuse.contents = UIColor.white
        
        let textNode = SCNNode(geometry: textGeo)
        
        // Scale chhota rakho (important)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        
        // Position thoda bahar (globe ke upar float kare)
        textNode.position = SCNVector3(
            position.x * 1.1,
            position.y * 1.1,
            position.z * 1.1
        )
        
        // Always face camera
        let billboard = SCNBillboardConstraint()
        billboard.freeAxes = .all
        textNode.constraints = [billboard]
        
        globeBGView.scene?.rootNode.addChildNode(textNode)
    }
    
    func showCountryName(name: String) {
        let alert = UIAlertController(title: "Country", message: name, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
    @IBAction func backTapBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
