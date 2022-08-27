//
//  Model.swift
//  FurnitureARKit
//
//  Created by Taewoo Kim on 2022/08/27.
//

import RealityKit
import Combine
import UIKit

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: Entity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName+".usdz"
        self.cancellable = ModelEntity.loadAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                //Handle our error
            }, receiveValue: { modelEntity in
                //Get our modelEntity
                self.modelEntity = modelEntity
            })
    }
}
