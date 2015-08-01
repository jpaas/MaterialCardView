//
//  Dictionary.swift
//  MaterialCardView
//
//  Created by Julian Paas on 2015-08-01.
//  Copyright © 2015 Cem Olcay. All rights reserved.
//

import Foundation

extension Dictionary {
  mutating func unionInPlace(
    dictionary: Dictionary<Key, Value>) {
      for (key, value) in dictionary {
        self[key] = value
      }
  }
  
  // Thanks Airspeed Velocity
  mutating func unionInPlace<S: SequenceType where
    S.Generator.Element == (Key,Value)>(sequence: S) {
      for (key, value) in sequence {
        self[key] = value
      }
  }
}