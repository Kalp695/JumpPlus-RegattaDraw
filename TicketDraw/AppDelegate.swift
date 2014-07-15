//
//  AppDelegate.swift
//  TicketDraw
//
//  Created by Jon Grenning on 14/07/14.
//  Copyright (c) 2014 Jon Grenning. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    
    @IBOutlet var window: NSWindow
    
    @IBOutlet var firstName: NSTextField
    @IBOutlet var lastName: NSTextField
    @IBOutlet var email: NSTextField
    @IBOutlet var phoneNumber: NSTextField
    @IBOutlet var subscribe: NSButton

    
    
    
    

    func applicationDidFinishLaunching(aNotification: NSNotification?) {

        
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    
    
    
    
    @IBAction func pickWinner(sender: AnyObject) {
        let dir = "~/Desktop/"
        let file = "JumpRegattaData.csv"
        let path = dir.stringByExpandingTildeInPath
        let filePath:NSString = path.stringByAppendingPathComponent(file)

        var readData : String? = File.read(filePath)
        var numberCount = readData?.componentsSeparatedByString("\n").count
         var winner = arc4random_uniform(UInt32(numberCount!))
        
        var winningNumber = NSAlert()
        winningNumber.messageText = "And the Winner is... #\(winner)! Open up the JumpData.csv file on the Desktop to find the row corresponding to \(winner)!"
        winningNumber.runModal()
            println("count: \(numberCount) Filepath: \(filePath) Winner is : \(winner)")
    }
    

    @IBAction func enterName(sender: AnyObject) {
       
        //Check if email is valid
        if email.stringValue.rangeOfString("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", options: .RegularExpressionSearch) {
            
            // email is valid, check marketing
            var acceptsMarketing = "Accept"
            if subscribe.stringValue == "1" {
                acceptsMarketing = "Accept"
            }
            else if subscribe.stringValue == "0" {
                acceptsMarketing = "Decline"
            }
            
            // load file and append data
            let dir = "~/Desktop/"
            let file = "JumpRegattaData.csv"
            let path = dir.stringByExpandingTildeInPath
            let filePath:NSString = path.stringByAppendingPathComponent(file)
            
            let readData : String? = File.read(filePath)
        
            
            let write : Bool = File.write(filePath, content: "\(readData)\n\(firstName.stringValue),\(lastName.stringValue),\(email.stringValue),\(phoneNumber.stringValue),\(acceptsMarketing)")
            
            println(write)
            
            var myAlert = NSAlert()
            myAlert.messageText = "You have been entered! Be sure to check our Store in the Avalon Mall for all the latest deals!"
            
            println("name: \(firstName.stringValue) \(lastName.stringValue) email: \(email.stringValue) phone: \(phoneNumber.stringValue) subcribed?: \(acceptsMarketing) \n You are now entered for the draw!")
            myAlert.runModal()
            
            firstName.stringValue = ""
            lastName.stringValue = ""
            email.stringValue = ""
            phoneNumber.stringValue = ""
            
            
            println("\(email.stringValue) is valid")
            
        } else {
            // If email is invalid, popup error
            
            println( "\(email.stringValue) is not valid")
            var myAlert = NSAlert()
            myAlert.messageText = "Please Enter a Valid email so we can contact you"
            
            myAlert.runModal()
        }
        
    }

}


