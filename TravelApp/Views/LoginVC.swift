//
//  LoginVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 18.08.2023.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
        
    private lazy var imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "travio-logo 1")
        return imageView
    }()
    
    private lazy var viewContent: UIView = {
        let view = UIView()
        view.layer.backgroundColor = Color.lightGray.color.cgColor
        view.frame = CGRect(x: 0, y: 0, width: 390, height: 598)
        view.roundCorners(corners: .topLeft, radius: 80)
        return view
    }()
    
    private lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.textColor = Color.darkGray.color
        label.text = "Welcome to Travio"
        label.font = UIFont(name: Font.poppinsMedium.font, size: 24)
        return label
    }()
    
    private lazy var viewTextEmail: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        view.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        return view
    }()
    
    private lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textEmail: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 168, height: 18)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.text = "developer@bilgeadam.com"
        return text
    }()
    
    private lazy var viewTextPassword: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        view.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        return view
    }()
    
    private lazy var labelPassword: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textPassword: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 168, height: 18)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.text = "***********"
        return text
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    func setupViews() {
        
        navigationController?.isNavigationBarHidden = true
        
        self.view.backgroundColor = Color.turquoise.color
        
        self.view.addSubviews(imageViewLogo,
                              viewContent)
        
        viewContent.addSubviews(labelWelcome,
                                viewTextEmail,
                                viewTextPassword)
        
        viewTextEmail.addSubviews(labelEmail,
                                  textEmail)
        
        viewTextPassword.addSubviews(labelPassword,
                                     textPassword)
        
        setupLayout()
        
    }
    
    func setupLayout() {
        
        imageViewLogo.snp.makeConstraints { image in
            image.width.equalTo(149)
            image.height.equalTo(178)
            image.centerX.equalToSuperview()
            image.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
        }
        
        viewContent.snp.makeConstraints { view in
            view.bottom.equalToSuperview()
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
            view.top.equalTo(imageViewLogo.snp.bottom).offset(24)
        }
        
        labelWelcome.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(64)
            label.centerX.equalToSuperview()
        }
        
        viewTextEmail.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(141)
            view.centerX.equalToSuperview()
            view.width.equalTo(342)
            view.height.equalTo(74)
        }
        
        labelEmail.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(12)
        }
        
        textEmail.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(12)
        }
        
        viewTextPassword.snp.makeConstraints { view in
            view.top.equalTo(viewTextEmail.snp.bottom).offset(24)
            view.centerX.equalToSuperview()
            view.width.equalTo(342)
            view.height.equalTo(74)
        }
        
        labelPassword.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(12)
        }
        
        textPassword.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(12)
        }
        
    }
}
