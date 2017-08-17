//
//  AlertShowTool.swift
//  YZSwiftTool
//
//  Created by wyc on 2017/8/17.
//  Copyright © 2017年 Desperado. All rights reserved.
//

import UIKit

class AlertShowTool: NSObject {
    
    // MARK: - ALERT
    static func showSureAlert(title: String?, message: String?, controller: UIViewController, sureTitle: String?, sureBlock: (() -> Void)?) {
        self.showAlert(title: title, message: message, controller: controller, sureTitle: sureTitle, sureBlock: sureBlock, cancelTitle: nil, cancelBlock: nil)
    }
    
    static func showDefaultAlert(title: String?, message: String?, controller: UIViewController, sureBlock: (() -> Void)?, cancelBlock: (() -> Void)?) {
        self.showAlert(title: title, message: message, controller: controller, sureTitle: "确定", sureBlock: sureBlock, cancelTitle: "取消", cancelBlock: cancelBlock)
    }
    
    static func showAlert(title: String?, message: String?, controller: UIViewController, sureTitle: String?, sureBlock: (() -> Void)?, cancelTitle: String?, cancelBlock:(() -> Void)?) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        if sureTitle != nil {
            
            alertController.addAction(UIAlertAction.init(title: sureTitle, style: .default, handler: { _ in
                if let sureBlock = sureBlock {
                    sureBlock()
                }
            }))
        }
        
        if cancelTitle != nil {
            
            alertController.addAction(UIAlertAction.init(title: cancelTitle, style: .cancel, handler: { _ in
                if let cancelBlock = cancelBlock {
                    cancelBlock()
                }
            }))
        }
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - SHEET
    static func showSheet(title: String?,
                          message: String?,
                          delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate,
                          cameraTitle: String? = "拍照",
                          albumTitle: String? = "相册",
                          cancelTitle: String? = "取消",
                          cancelBlock: (() -> Void)?) {
        
        let delegateVC = delegate as! UIViewController
        
        let sheetController = UIAlertController.init(title: title, message: message, preferredStyle: .actionSheet)
        
        if cameraTitle != nil {
            sheetController.addAction(UIAlertAction.init(title: cameraTitle, style: .default, handler: { _ in
                
                let photoPicker = UIImagePickerController.init()
                photoPicker.videoQuality = .typeMedium
                photoPicker.delegate = delegate
                photoPicker.allowsEditing = false
                
                photoPicker.sourceType = .camera
                delegateVC.present(photoPicker, animated: true, completion: nil)
            }))
        }
        
        if albumTitle != nil {
            sheetController.addAction(UIAlertAction.init(title: albumTitle, style: .default, handler: { _ in
                
                let albumPicker = UIImagePickerController.init()
                albumPicker.videoQuality = .typeMedium
                albumPicker.delegate = delegate
                albumPicker.allowsEditing = false
                
                albumPicker.sourceType = .photoLibrary
                delegateVC.present(albumPicker, animated: true, completion: nil)
                
            }))
        }
        
        if cancelTitle != nil {
            sheetController.addAction(UIAlertAction.init(title: cancelTitle, style: .cancel, handler: { _ in
                if let cancelBlock = cancelBlock {
                    cancelBlock()
                }
            }))
        }
        
        delegateVC.present(sheetController, animated: true, completion: nil)
    }
    
    
}
