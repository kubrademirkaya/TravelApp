//
//  LoginVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 18.08.2023.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    var user: User?
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
        
    private lazy var imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "travio-logo 1")
        return imageView
    }()
    
    private lazy var viewContent: UIView = {
        let view = UIView()
        view.layer.backgroundColor = Color.lightGray.color.cgColor
        view.frame = CGRect(x: 0, y: 0, width: 390, height: 598)
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
        text.attributedPlaceholder = NSAttributedString(string: "developer@bilgeadam.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        text.text = "furk@n.dev"
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
        text.attributedPlaceholder = NSAttributedString(string: "**********", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        text.isSecureTextEntry = true
        text.text = "123123123"
        return text
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 342, height: 54)
        button.backgroundColor = Color.turquoise.color
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var viewToSignUp: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 238, height: 21)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var labelToSignUp: UILabel = {
        let label = UILabel()
        label.text = "Don't have any account?"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var buttonSignUp: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(Color.darkGray.color, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        button.addTarget(self, action: #selector(buttonSignUpTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonLoginTapped() {
        if let email = textEmail.text, let password = textPassword.text {
            let user = logInUser(email: email , password: password)
            //viewModel.logIn(user: user)
            viewModel.logInRouter(user: user)
            navigationController?.pushViewController(MainTabBarController(), animated: true)
        }
    }
    
    @objc func buttonSignUpTapped() {
        navigationController?.pushViewController(SignUpVC(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    override func viewDidLayoutSubviews() {
        
        viewContent.roundCorners(corners: .topLeft, radius: 80)
        viewTextEmail.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextPassword.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        buttonLogin.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        
    }
    
    func setupViews() {
        
        navigationController?.isNavigationBarHidden = true
        
        self.view.backgroundColor = Color.turquoise.color
        
        self.view.addSubviews(imageViewLogo,
                              viewContent)
        
        viewContent.addSubviews(labelWelcome,
                                viewTextEmail,
                                viewTextPassword,
                                buttonLogin,
                                viewToSignUp)
        
        viewTextEmail.addSubviews(labelEmail,
                                  textEmail)
        
        viewTextPassword.addSubviews(labelPassword,
                                     textPassword)
        
        viewToSignUp.addSubviews(labelToSignUp,
                                 buttonSignUp)
        
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
        
        buttonLogin.snp.makeConstraints { button in
            button.top.equalToSuperview().offset(361)
            button.leading.equalToSuperview().offset(24)
            button.trailing.equalToSuperview().offset(-24)
            button.height.equalTo(54)
        }
        
        viewToSignUp.snp.makeConstraints { view in
            view.bottom.equalToSuperview().offset(-21)
            view.leading.equalToSuperview().offset(78)
            view.height.equalTo(21)
            view.width.equalTo(238)
        }
        
        labelToSignUp.snp.makeConstraints { label in
            label.centerY.equalToSuperview()
            label.leading.equalToSuperview()
        }
        
        buttonSignUp.snp.makeConstraints { button in
            button.centerY.equalToSuperview()
            button.trailing.equalToSuperview()
        }
        
    }
}

