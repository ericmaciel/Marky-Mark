//
//  Created by Menno Lovink on 03/05/16.
//  Copyright © 2016 M2mobi. All rights reserved.
//

import UIKit

public protocol ItemStyling {

    var parent : ItemStyling? { get set }
    func isApplicableOn(markDownItem : MarkDownItem) -> Bool
}

extension ItemStyling {

    /**
    Provides all ansestors, youngest first
    */
    func stylingWithPrecedingStyling() -> [ItemStyling] {

        return anstors(self)
    }

    /**
     Recursive method that collects all styling be looping through the parent

     - returns: A list of all ItemStyling found
     */
    func anstors(current : ItemStyling? = nil,  soFar : [ItemStyling] = []) -> [ItemStyling] {
        let current = current ?? self
        var soFar = soFar

        soFar.append(current)

        if let parent = current.parent {

            return anstors(parent, soFar: soFar)
        } else {

            return soFar
        }
    }
}