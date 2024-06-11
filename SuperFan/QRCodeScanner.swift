//
//  QRCodeScanner.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/11/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class QRCodeScanner: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var square: UIImageView!
    
    //allows the user to see what it is scanning
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating session
        let session = AVCaptureSession()
        
        //define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)!
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch {
            print("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(square)
        session.startRunning()
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count != 0 {

            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    //AudioServicesPlaySystemSound(SystemSoundID())
                    
                    if object.stringValue == "sf.schoolBadge" && whichBadge == "school"{
                        
                    let name = Notification.Name(rawValue: schoolNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    }
                    
                    else if object.stringValue == "sf.clubBadge" && whichBadge == "club"{
                        
                    let name = Notification.Name(rawValue: clubNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    }
                    
                    else if object.stringValue == "sf.womensBadge" && whichBadge == "women"{
                        
                    let name = Notification.Name(rawValue: womensNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    }
                    
                    else if object.stringValue == "sf.mensBadge" && whichBadge == "men"{
                        
                    let name = Notification.Name(rawValue: mensNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    }
                    
                    else if object.stringValue == "sf.musicBadge" && whichBadge == "music"{
                        
                    let name = Notification.Name(rawValue: musicNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    } else if object.stringValue == "sf.artBadge" && whichBadge == "art"{
                        
                    let name = Notification.Name(rawValue: artNotification)
                    NotificationCenter.default.post(name: name, object: nil)
                    self.dismiss(animated: true, completion: nil)

                        
                    } else {
                        //do literally nothing
                    }
                }
            }
        }
    }
}

