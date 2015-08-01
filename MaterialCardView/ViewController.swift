//
//  ViewController.swift
//  MaterialCardView
//
//  Created by Cem Olcay on 22/01/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        materialDemo()
    }

    func materialDemo () {
        
        let scroll = UIScrollView (frame: view.frame)
        view.addSubview(scroll)
        
        
        let c = MaterialCardView (
            x: 10,
            y: StatusBarHeight + 10,
            w: ScreenWidth-20)
        scroll.addSubview(c)
        
        c.addHeaderWithTitle("Header")
        c.addCellWithString("Item 1") { sender in print("item 1 tapped") }
        c.addCellWithString("Item 2") { sender in print("item 2 tapped") }
        c.addCellWithString("Item 3") { sender in print("item 3 tapped") }
        
        
        let cc = MaterialCardView (x: 10, y: c.bottomWithOffset(10), w: c.w)
        scroll.addSubview(cc)
        
        cc.addHeaderWithTitle("Header")
        cc.addCellWithString("Item 1") { sender in print("item 1 tapped") }
        cc.addCellWithString("Item 2") { sender in print("item 2 tapped") }
        cc.addCellWithString("Item 3") { sender in print("item 3 tapped") }
        
        
        let ccc = MaterialCardView (x: 10, y: cc.bottomWithOffset(10), w: c.w)
        ccc.addCellWithString("\n\nPlain Material Card\n\n")
        
        ccc.addRipple { () -> Void in
            print("all card ripples")
        }
        
        scroll.addSubview(ccc)
        scroll.contentHeight = ccc.bottomWithOffset(10)
    }
    
    func addFooter (c: MaterialCardView) {
        let container = UIView (x: 0, y: 0, w: c.w, h: 0)
        
        let label = UILabel (
            x: 10,
            y: 0,
            width: c.w - 10,
            padding: 10,
            attributedText: NSAttributedString.withAttributedStrings({ (att: NSMutableAttributedString) -> () in
                att.appendAttributedString(NSAttributedString (
                    text: "Footer Label",
                    color: UIColor.TitleColor(),
                    font: UIFont.TitleFont(),
                    style: .plain))
                att.appendAttributedString(NSAttributedString (
                    text: "\nsome attributed string",
                    color: UIColor.TextColor(),
                    font: UIFont.TextFont(),
                    style: .underline(NSUnderlineStyle.StyleSingle, UIColor.blackColor())))
            }),
            textAlignment: .Center)
        
        container.addSubview(label)
        container.h = label.h
    
        c.addFooterWithView(container)
    }
}

