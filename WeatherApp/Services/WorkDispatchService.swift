//
//  WorkDispatchService.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: - Enums

enum WorkDispatchQueue {
	case main, backgroundSerial, backgroundConcurent
}


// MARK: - Protocols

protocol WorkDispacthable {
	var entityName: String { get }
	
	
	// MARK: - Have default implementation
	
	func dispatch(on queueType: WorkDispatchQueue, workItem: @escaping () -> Void)
}

extension WorkDispacthable {
	
	func dispatch(on queueType: WorkDispatchQueue, workItem: @escaping () -> Void) {
		switch queueType {
			case .main:					dispatchOnMainQueue(workItem)
			case .backgroundSerial:		dispatchOnBackgroundSerial(workItem)
			case .backgroundConcurent:	dispatchOnBackgroundConcurent(workItem)
		}
	}
	
	
}

fileprivate extension WorkDispacthable {
	
	var serialQueue: DispatchQueue {
		return DispatchQueue(label: "com.arsenkin.\(entityName).backgroundQueue.sync")
	}
	
	func dispatchOnMainQueue(_ workItem: @escaping () -> Void) {
		if Thread.isMainThread {
			workItem()
		} else {
			DispatchQueue.main.async(execute: workItem)
		}
	}
	
	func dispatchOnBackgroundConcurent(_ workItem: @escaping () -> Void) {
		DispatchQueue.global().async(execute: workItem)
	}
	
	func dispatchOnBackgroundSerial(_ workItem: @escaping () -> Void) {
		serialQueue.async(execute: workItem)
	}
	
	
}
