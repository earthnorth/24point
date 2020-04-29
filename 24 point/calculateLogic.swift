//
//  calculateLogic.swift
//  24 point
//
//  Created by earth on 2020/4/23.
//  Copyright © 2020 earth. All rights reserved.
//

import Foundation


func calculate(x: Int, y: Int, z: Int, w: Int) -> String {
    var resultString = ""
    if (x+y+z+w == 24) {
        resultString += "\(x)+\(y)+\(z)+\(w)=24; "
    }
    if (x+y+z-w == 24) {
        resultString += "\(x)+\(y)+\(z)-\(w)=24; "
    }
    if ((x+y)*(z+w) == 24) {
        resultString += "(\(x)+\(y))*(\(y)+\(z))=24; "
    }
    if ((x-y)*(z+w) == 24) {
        resultString += "(\(x)-\(y))*(\(z)+\(w))=24; "
    }
    if ((x>y) && (z>w) && (x-y)*(z-w) == 24) { //避免两个负数，重复计算
        resultString += "(\(x)-\(y))*(\(z)-\(w))=24; "
    }
    if ((x+y+z)*w == 24) {
        resultString += "(\(x)+\(y)+\(z))*\(w)=24; "
    }
    if ((x-y-z)*w == 24) {
        resultString += "(\(x)-\(y)-\(z))*\(w)=24; "
    }
    if ((x+y-z)*w == 24) {
        resultString += "(\(x)+\(y)-\(z))*\(w)=24; "
    }
    if (((x*y*z)%w == 0) && (x*y*z)/w == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)*\(y)*\(z))/\(w)=24; "
    }
    if ((x*y)*(z+w) == 24) {
        resultString += "(\(x)*\(y))*(\(z)+\(w))=24; "
    }
    if ((x*y)*(z-w) == 24) {
        resultString += "(\(x)*\(y))*(\(z)-\(w))=24; "
    }
    if ((x*y)*z-w == 24) {
        resultString += "(\(x)*\(y))*\(z)-\(w)=24; "
    }
    if ((x*y)*z+w == 24) {
        resultString += "(\(x)*\(y))*\(z)+\(w)=24; "
    }
    if (x*y*z*w == 24) {
        resultString += "\(x)*\(y)*\(z)*\(w)=24; "
    }
    if ((z%w==0) && (x+y)+(z/w) == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)+\(y))+(\(z)/\(w))=24; "
    }
    if ((z%w==0) && (x+y)*(z/w) == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)+\(y))*(\(z)/\(w))=24; "
    }
    if ((x*y)+z+w == 24) {
        resultString += "(\(x)*\(y))+\(z)+\(w)=24; "
    }
    if ((x*y)+z-w == 24) {
        resultString += "(\(x)*\(y))+\(z)-\(w)=24; "
    }
    if ((z%w==0) && (x*y)-(z/w) == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)*\(y))-(\(z)/\(w))=24; "
    }
    if ((z%w == 0) && (x*y)+(z/w) == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)*\(y))+(\(z)/\(w))=24; "
    }
    if ((x*y)-z-w == 24) {
        resultString += "(\(x)*\(y))-\(z)-\(w)=24; "
    }
    if ((x*y)+(z*w) == 24) {
        resultString += "(\(x)*\(y))+(\(z)*\(w))=24; "
    }
    if ((x*y)-(z*w) == 24) {
        resultString += "(\(x)*\(y))-(\(z)*\(w))=24; "
    }
    if (((x*y)%(z*w)==0) && (x*y)/(z*w) == 24) { //如果是除法必须要是能够整除的才可以
        resultString += "(\(x)*\(y))/(\(z)*\(w))=24; "
    }
    if ((z != w) && ((x*y)%(z-w)==0) && (x*y)/(z-w) == 24) { //如果是除法必须要是能够整除的才可以，同时要确保除数不为0
        //if ((x*y)/(z-w) == 24) {
        resultString += "(\(x)*\(y))/(\(z)-\(w))=24; "
    }
    if (((x*y)%(z+w)==0) && (x*y)/(z+w) == 24) {
        resultString += "(\(x)*\(y))/(\(z)+\(w))=24; "
    }
    if((x%y==0) && (x/y)*z+w == 24) {
        resultString += "((\(x)/\(y))*\(z)+\(w)=24; "
    }
    
    return resultString
}


func calculateAll(a: Int, b: Int, c: Int, d: Int) -> String{
    var returnString = ""
    
    returnString += calculate(x: a, y: b, z: c, w: d)
    returnString += calculate(x: a, y: b, z: d, w: c)
    returnString += calculate(x: a, y: c, z: d, w: b)
    returnString += calculate(x: a, y: c, z: b, w: d)
    returnString += calculate(x: a, y: d, z: b, w: c)
    returnString += calculate(x: a, y: d, z: c, w: b)
    
    returnString += calculate(x: b, y: a, z: c, w: d)
    returnString += calculate(x: b, y: a, z: d, w: c)
    returnString += calculate(x: b, y: c, z: a, w: d)
    returnString += calculate(x: b, y: c, z: d, w: a)
    returnString += calculate(x: b, y: d, z: c, w: a)
    returnString += calculate(x: b, y: d, z: a, w: c)
    
    returnString += calculate(x: c, y: a, z: b, w: d)
    returnString += calculate(x: c, y: a, z: d, w: b)
    returnString += calculate(x: c, y: b, z: d, w: a)
    returnString += calculate(x: c, y: b, z: a, w: d)
    returnString += calculate(x: c, y: d, z: a, w: b)
    returnString += calculate(x: c, y: d, z: b, w: a)
    
    returnString += calculate(x: d, y: a, z: b, w: c)
    returnString += calculate(x: d, y: a, z: c, w: b)
    returnString += calculate(x: d, y: b, z: c, w: a)
    returnString += calculate(x: d, y: b, z: a, w: c)
    returnString += calculate(x: d, y: c, z: a, w: b)
    returnString += calculate(x: d, y: c, z: b, w: a)
    
    if returnString.isEmpty {
        print("The number: \(a), \(b), \(c), \(d) can't equal 24.")
    } else {
        print("The number: \(a), \(b), \(d), \(d) can equal 24 as follows:")
        print(returnString)
    }
    return returnString
}

