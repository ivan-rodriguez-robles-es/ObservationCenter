//
//  ObservationCenter.swift
//  ObservationCenter
//
//  Created by ivk on 15/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import Foundation

protocol ObserverProtocol {
    var id: Int { get }
    var observerObj: Any { get }
    var suscriptionId: String { get }
    var action: ((Any) -> ()) { get }
}

protocol ObservableProtocol {
    
    associatedtype T
    
    var observers: [ObserverProtocol] { get set }
    
    func addObserver (_ observer: ObserverProtocol)
    func removeObserver (_ observer: ObserverProtocol)
    func notifyAllObservers (with message: T,
                             suscriptionId: String)
}

class Observable<T> : ObservableProtocol {
    
    private var _message : T! = nil
    private var _observers : [ObserverProtocol] = []
    
    var observers: [ObserverProtocol] {
        get { return self._observers }
        set { self._observers = newValue}
    }
    
    func addObserver(_ observer: ObserverProtocol) {
        observers.append(observer)
    }
    
    func removeObserver (_ observer: ObserverProtocol) {
        observers = observers.filter(
            { $0.id != observer.id }
        )
    }
    
    func notifyAllObservers (with message: T,
                             suscriptionId: String) {
        
        for observer in observers {
            
            if (suscriptionId ==
                observer.suscriptionId){
                
                observer.action(message)
            }
        }
    }
}

class Observer: ObserverProtocol {
    
    private var _id: Int = 0
    private var _observerObj: Any
    private var _suscriptionId: String
    private var _action: ((Any) -> ())
    
    var id: Int {
        get { return self._id }
    }
    var observerObj: Any {
        get { return self._observerObj }
    }
    var suscriptionId: String {
        get { return self._suscriptionId }
    }
    
    var action: (((Any) -> ())) {
        get { return self._action }
    }
    
    init (id: Int, observerObj: Any, suscriptionId: String, action:  @escaping ((Any) -> ())){
        self._id = id
        self._observerObj = observerObj
        self._suscriptionId = suscriptionId
        self._action = action
        print ("\(type(of: self._observerObj))is an observer for \(self._suscriptionId)")
    
    }
}


class observationCenter{
    
    static let instance = observationCenter()
    private let observable = Observable<String>()
    
    private init (){ }
    
    public func addObserver (id: Int,
                             observerObj: Any,
                             suscriptionId: String,
                             action: @escaping (Any) -> ()) {
        
        let observer = Observer(id: id,
                                observerObj: observerObj,
                                suscriptionId: suscriptionId,
                                action: action)
        
        observable.addObserver(observer)
    }
    public func post (message: String,
                      suscriptionId: String){

        observable
            .notifyAllObservers (with: message,
                                 suscriptionId: suscriptionId)
    }
}
