//
//  ViewController.swift
//  SceneKitDemo
//
//  Created by yichen on 2018/3/23.
//  Copyright © 2018年 vDesign. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    let scnView = SCNView()
    
    var goodsEntities: [GoodsEntity]!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        // 实体
        goodsEntities = createGoods()
        
//        createScene(entity: goodsEntities[index])
        let scene = SCNScene(named: "art.scnassets/xd_sofa015_01/xd_sofa015_01.scn")!
        scnView.scene = scene
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - Init
extension ViewController {
    
    func setupUI() {
        // 上一个
        let previousBtn = UIButton(type: .system)
        previousBtn.backgroundColor = UIColor.orange
        previousBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        previousBtn.setTitle("上一个", for: .normal)
        previousBtn.addTarget(self, action: #selector(previousBtnClicked(_:)), for: .touchUpInside)
        self.view.addSubview(previousBtn)
        
        // 下一个
        let nextBtn = UIButton(type: .system)
        nextBtn.backgroundColor = UIColor.orange
        nextBtn.frame = CGRect(x: 500, y: 100, width: 100, height: 100)
        nextBtn.setTitle("下一个", for: .normal)
        nextBtn.addTarget(self, action: #selector(nextBtnClicked(_:)), for: .touchUpInside)
        self.view.addSubview(nextBtn)
        
        // scnView
        scnView.frame = CGRect(x: 0, y: 0, width: 600, height: 400)
        scnView.center = self.view.center
//        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.lightGray
        scnView.delegate = self
        self.view.addSubview(scnView)
    }
    
    func createGoods() -> Array<GoodsEntity> {
        let xd_sofa013_02_a_material = MaterialEntity(materialName: "M_xd_sofa013_02_a",
                                             diffusePath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_a/T_xd_sofa013_02_a_Albedo.tga",
                                             metalnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_a/T_xd_sofa013_02_a_Metalness.png",
                                             roughnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_a/T_xd_sofa013_02_a_Roughness.png",
                                             normalPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_a/T_xd_sofa013_02_a_Normal.tga")
        let xd_sofa013_02_b_material = MaterialEntity(materialName: "M_xd_sofa013_02_b",
                                             diffusePath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_b/T_xd_sofa013_02_b_Albedo.tga",
                                             metalnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_b/T_xd_sofa013_02_b_Metalness.png",
                                             roughnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_b/T_xd_sofa013_02_b_Roughness.png",
                                             normalPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_b/T_xd_sofa013_02_b_Normal.tga")
        let xd_sofa013_02_c_material = MaterialEntity(materialName: "M_xd_sofa013_02_c",
                                             diffusePath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_c/T_xd_sofa013_02_c_Albedo.tga",
                                             metalnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_c/T_xd_sofa013_02_c_Metalness.png",
                                             roughnessPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_c/T_xd_sofa013_02_c_Roughness.png",
                                             normalPath: "art.scnassets/xd_sofa013_02/xd_sofa013_02_c/T_xd_sofa013_02_c_Normal.tga")
        let xd_sofa013_02_pian_material = MaterialEntity(materialName: "M_xd_sofa013_02_pian",
                                                         diffusePath: "art.scnassets/xd_sofa013_02/T_xd_sofa013_02_pian_AO.tga",
                                                         metalnessPath: "",
                                                         roughnessPath: "",
                                                         normalPath: "")
        let xd_sofa013_02 = GoodsEntity(goodsNumber: "xd_sofa013_02",
                                        daePath: "art.scnassets/xd_sofa013_02/xd_sofa013_02.dae",
                                        mainMaterials: [xd_sofa013_02_a_material.materialName: xd_sofa013_02_a_material,
                                                        xd_sofa013_02_b_material.materialName: xd_sofa013_02_b_material,
                                                        xd_sofa013_02_c_material.materialName: xd_sofa013_02_c_material,
                                                        xd_sofa013_02_pian_material.materialName: xd_sofa013_02_pian_material])
        
        let xd_sofa015_01_material = MaterialEntity(materialName: "M_xd_sofa015_01",
                                                    diffusePath: "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_Albedo.tga",
                                                    metalnessPath: "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_Metalness.png",
                                                    roughnessPath: "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_Roughness.png",
                                                    normalPath: "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_Normal.tga")
        let xd_sofa015_01_pian_material = MaterialEntity(materialName: "M_xd_sofa015_01_pian",
                                                         diffusePath: "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_pian_AO.tga",
                                                         metalnessPath: "",
                                                         roughnessPath: "",
                                                         normalPath: "")
        let xd_sofa015_01 = GoodsEntity(goodsNumber: "xd_sofa015_01",
                                        daePath: "art.scnassets/xd_sofa015_01/xd_sofa015_01.dae",
                                        mainMaterials: [xd_sofa015_01_material.materialName: xd_sofa015_01_material,
                                                        xd_sofa015_01_pian_material.materialName: xd_sofa015_01_pian_material])
        
        return [xd_sofa013_02, xd_sofa015_01]
    }
    
    func createScene(entity: GoodsEntity) {
        // 场景
        let scene = SCNScene(named: entity.daePath)!
        scnView.scene = scene
//        scene.background.contents = "art.scnassets/BackLight_4K_32.HDR"
//        scene.lightingEnvironment.contents = "art.scnassets/BackLight_4K_32.HDR"//"art.scnassets/skybox01_cube.png"
        // 模型
        let node = scene.rootNode.childNodes.first!
        let geometry = node.geometry
        
        let materials = geometry?.materials
        materials?.forEach({ (material) in
            print(material.name!)
            let materialEntity = entity.mainMaterials[material.name!]
            if materialEntity?.metalnessPath.count != 0 {
                material.lightingModel = .physicallyBased
                material.diffuse.contents = materialEntity?.diffusePath
                material.roughness.contents = materialEntity?.roughnessPath
                material.metalness.contents = materialEntity?.metalnessPath
                material.normal.contents = materialEntity?.normalPath
            } else {
                material.diffuse.contents = materialEntity?.diffusePath
            }
        })
        
        
//        let mainMaterial = geometry?.material(named: entity.materialName)
//        let shadowMaterial = geometry?.material(named: entity.materialName + "_pian")

        // mainMaterial
//        mainMaterial?.lightingModel = .physicallyBased
//        mainMaterial?.diffuse.contents = entity.diffusePath
//        mainMaterial?.roughness.contents = entity.roughnessPath
//        mainMaterial?.metalness.contents = entity.metalnessPath
//        mainMaterial?.normal.contents = entity.normalPath

        // shadowMaterial
//        shadowMaterial?.diffuse.contents = "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_pian_AO.tga"
//        shadowMaterial?.transparent.contents = "art.scnassets/xd_sofa015_01/T_xd_sofa015_01_pian_AO.tga"
        
        // 光源
//        let lightNode = SCNNode()
//        let light = SCNLight()
//        light.type = .omni
//        light.castsShadow = true
//        lightNode.light = light
//        lightNode.position = SCNVector3(x: 0, y: 50, z: 50)
//        scene.rootNode.addChildNode(lightNode)
//
//        let ambientLightNode = SCNNode()
//        let ambientLight = SCNLight()
//        ambientLight.type = .ambient
//        ambientLight.color = UIColor.darkGray
//        ambientLightNode.light = ambientLight
//        scene.rootNode.addChildNode(ambientLightNode)

//        let lookAt = SCNLookAtConstraint(target: lightNode)
//        lightNode.constraints = [lookAt]
        
        // 照相机
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.automaticallyAdjustsZRange = true
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 400)
        scene.rootNode.addChildNode(cameraNode)
        
        // 地板
//        let floor = SCNFloor()
//        let floorNode = SCNNode(geometry: floor)
//        floorNode.position = SCNVector3(0, 0, 0)
//        scene.rootNode.addChildNode(floorNode)
//        let floorPhysicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.static, shape: SCNPhysicsShape(geometry: floor, options: nil))
//        floorNode.physicsBody = floorPhysicsBody
        
        // retrieve the ship node
//        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        // animate the 3d object
//        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
//        ship.runAction(SCNAction.repeat(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1), count: 1))
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        scnView.addGestureRecognizer(tapGesture)
    }
    
}

// MARK: - Events
extension ViewController {
    
    @objc func previousBtnClicked(_ sender: UIButton) {
        if index > 0 {
            index -= 1
        } else {
            index = goodsEntities.count - 1
        }
        createScene(entity: goodsEntities[index])
    }
    
    @objc func nextBtnClicked(_ sender: UIButton) {
        if index < goodsEntities.count - 1 {
            index += 1
        } else {
            index = 0
        }
        createScene(entity: goodsEntities[index])
    }
    
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            
            // get its material
            let material = result.node.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
}

extension ViewController: SCNSceneRendererDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        print("updateAtTime")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time: TimeInterval) {
        print("didApplyAnimationsAtTime")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didSimulatePhysicsAtTime time: TimeInterval) {
        print("didSimulatePhysicsAtTime")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didApplyConstraintsAtTime time: TimeInterval) {
        print("didApplyConstraintsAtTime")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        print("willRenderScene")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
        print("didRenderScene")
    }
    
}
