//
//  EditViewController.swift
//  architecturesAppTutorial
//
//  Created by user on 20/11/21.
//

import UIKit
import Alamofire

class EditViewController: BaseViewController {
    
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    var post = Post()
    
    func apiPostEdit(post: Post){
        self.hideProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
    }
    
    func initViews(){
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    @IBAction func changeButton(_ sender: Any) {
        post.body = bodyLabel.text
        post.title = titleLabel.text
        apiPostEdit(post: post)
        self.dismiss(animated: true, completion: nil)
    }
    
}

     
