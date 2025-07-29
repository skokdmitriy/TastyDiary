import Foundation

struct UIKitButtonMedium: UIKitButtonSize {
	var height: CGFloat = 32
	var imageSize: CGSize = CGSize(width: 18, height: 18)
	var horizontalContentInset: CGFloat = 12
}

extension UIKitButtonSize where Self == UIKitButtonMedium {
	static var medium: UIKitButtonSize { UIKitButtonMedium() }
}


