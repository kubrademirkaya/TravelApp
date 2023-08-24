//
//  SignUpVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit
import SnapKit

class SignUpVC: UIViewController {
    
    var user: User?
    
    lazy var viewModel: SignUpViewModel = {
       return SignUpViewModel()
    }()
    
    private lazy var labelSignUp: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: Font.poppinsSemiBold.font, size: 36)
        label.textColor = .white
        return label
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(buttonBackTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var viewContent: UIView = {
        let view = UIView()
        view.layer.backgroundColor = Color.lightGray.color.cgColor
        return view
    }()
    
    private lazy var viewTextUsername: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var labelUsername: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textUsername: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 168, height: 18)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.attributedPlaceholder = NSAttributedString(string: "bilge_adam", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        return text
    }()
    
    private lazy var viewTextEmail: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
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
        return text
    }()
    
    private lazy var viewTextPassword: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
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
        text.isSecureTextEntry = true
        return text
    }()
    
    private lazy var viewTextPasswordValidation: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var labelPasswordValidation: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textPasswordValidation: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 168, height: 18)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.isSecureTextEntry = true
        return text
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 342, height: 54)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: Font.poppinsSemiBold.font, size: 16)
        button.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        button.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        button.isEnabled = false
        
        if let textPassword = textPassword.text,
           let textPasswordValidation = textPasswordValidation.text {
            
            if textPassword.isEmpty && textPasswordValidation.isEmpty {
                print("error")
                button.isEnabled = false
                button.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            } else {
                button.isEnabled = true
                button.backgroundColor = Color.turquoise.color
            }
            
        }
        return button
    }()
    
    @objc func buttonLoginTapped() {
        
        if let username = textUsername.text,
           let password = textPassword.text,
           let email = textEmail.text,
           let validPassword = textPasswordValidation.text {
            if password == validPassword && 8<=password.count && password.count<=12 {
                let user = User(full_name: username, email: email , password: password)
                viewModel.register(user: user)
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    @objc func buttonBackTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        viewContent.roundCorners(corners: .topLeft, radius: 80)
        viewTextUsername.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextEmail.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextPassword.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextPasswordValidation.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
    }
    
    func setupViews() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = Color.turquoise.color
        
        self.view.addSubviews(labelSignUp,
                              buttonBack,
                              viewContent)
        
        viewContent.addSubviews(viewTextUsername,
                                viewTextEmail,
                                viewTextPassword,
                                viewTextPasswordValidation,
                                buttonLogin)
        
        viewTextUsername.addSubviews(labelUsername,
                                     textUsername)
        
        viewTextEmail.addSubviews(labelEmail,
                                  textEmail)
        
        viewTextPassword.addSubviews(labelPassword,
                                     textPassword)
        
        viewTextPasswordValidation.addSubviews(labelPasswordValidation,
                                               textPasswordValidation)
        
        setupLayout()
        
    }
    
    func setupLayout() {
        
        labelSignUp.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-716)
        }
        
        buttonBack.snp.makeConstraints { button in
            button.leading.equalToSuperview().offset(24)
            button.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-716)
        }
        
        viewContent.snp.makeConstraints { view in
            view.bottom.equalToSuperview().offset(0)
            view.leading.equalToSuperview().offset(0)
            view.trailing.equalToSuperview().offset(0)
            view.top.equalToSuperview().offset(124)
        }
        
        viewTextUsername.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(72)
            view.centerX.equalToSuperview()
            view.width.equalTo(342)
            view.height.equalTo(74)
        }
        
        labelUsername.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(12)
        }
        
        textUsername.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(12)
            text.trailing.equalToSuperview().offset(12)
        }
        
        viewTextEmail.snp.makeConstraints { view in
            view.top.equalTo(viewTextUsername.snp.bottom).offset(24)
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
            text.trailing.equalToSuperview().offset(12)
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
            text.trailing.equalToSuperview().offset(12)
        }
        
        viewTextPasswordValidation.snp.makeConstraints { view in
            view.top.equalTo(viewTextPassword.snp.bottom).offset(24)
            view.centerX.equalToSuperview()
            view.width.equalTo(342)
            view.height.equalTo(74)
        }
        
        labelPasswordValidation.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(12)
        }
        
        textPasswordValidation.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(12)
            text.trailing.equalToSuperview().offset(12)
        }
        
        buttonLogin.snp.makeConstraints { button in
            button.top.equalToSuperview().offset(642)
            button.leading.equalToSuperview().offset(24)
            button.trailing.equalToSuperview().offset(-24)
            button.height.equalTo(54)
        }
        
        
    }
    

}
