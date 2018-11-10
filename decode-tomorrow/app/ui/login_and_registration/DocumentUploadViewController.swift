//
//  DocumentUploadViewController.swift
//  decode-tomorrow
//
//  Created by Mark on 11/11/2018.
//  Copyright © 2018 Just Because. All rights reserved.
//

import Foundation

import UIKit

class DocumentUploadViewController: UIViewController, Storyboarded {
    
    static var storyboardId: String = "DocumentUploadViewController"
    static var storyboard: String = "LoginAndRegistrationStoryboard"
    
    // MARK: - Outlets
    @IBOutlet weak var documentImageView: UIImageView!
    
    // END OUTLETS
    
    var feature: DocumentUploadFeature?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initFeature() {
        self.feature = DocumentUploadFeature(self)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapVerifyButton(_ sender: Any) {
        
        guard let documentImage = documentImageView.image else { return }
        guard let data = documentImage.jpegData(compressionQuality: 0.50) else { return }
        self.feature?.uploadDocument(data)
        
    }
    
}

extension DocumentUploadViewController: DocumentUploadFeatureDelegate {
    
    func documentUploadSuccess() {
        showAlert(.info, message: "What's next?")
    }
    
    func documentUploadError(error: String) {
        showAlert(.error, message: error)
    }
    
}