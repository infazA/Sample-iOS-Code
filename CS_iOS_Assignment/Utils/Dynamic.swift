//
//  Dynamic.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

class Dynamic<T> {
    
    // MARK: - Typealias
    
    typealias Listener = (T) -> ()
    
    // MARK: - Vars & Lets
    
    var listener: Listener?
    var value: T {
        didSet {
            self.fire()
        }
    }
    
    // MARK: - Initialization
    
    init(_ v: T) {
        value = v
    }
    
    // MARK: - Public func
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    // MARK: -
    
    internal func fire() {
        self.listener?(value)
    }
    
}
