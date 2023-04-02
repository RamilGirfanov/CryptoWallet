import UIKit

final class LoginScreenView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIObjects
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginBackgroundImage")
        imageView.contentMode = .scaleAspectFill
        imageView.applyBlurEffect()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemGray6
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        return stack
    }()
    
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Введите логин"
        loginTextField.backgroundColor = .clear
        loginTextField.borderStyle = .roundedRect
        loginTextField.autocapitalizationType = .none
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.placeholder = "Введите пароль"
        passTextField.backgroundColor = .clear
        passTextField.isSecureTextEntry = true
        passTextField.borderStyle = .roundedRect
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        return passTextField
    }()
    
    lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = GeneralProperties.color
        enterButton.layer.cornerRadius = GeneralProperties.cornerRadius
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        return enterButton
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [imageView,
         scrollView].forEach { addSubview($0) }
        
        scrollView.addSubview(contentView)
        
        [label,
         stack,
         enterButton].forEach { contentView.addSubview($0) }
        
        [loginTextField,
         passTextField].forEach { stack.addArrangedSubview($0) }
        
        let safeIndent: CGFloat = 16
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            stack.heightAnchor.constraint(equalToConstant: GeneralProperties.heighTapObjects * 2),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: safeIndent),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -safeIndent),
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -safeIndent),
            
            enterButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: safeIndent),
            enterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: safeIndent),
            enterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -safeIndent),
            enterButton.heightAnchor.constraint(equalToConstant: GeneralProperties.heighTapObjects)
        ])
    }
}
