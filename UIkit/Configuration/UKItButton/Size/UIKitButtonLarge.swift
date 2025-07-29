import Foundation

struct UIKitButtonLarge: UIKitButtonSize {
	var height: CGFloat = 46
	var imageSize: CGSize = CGSize(width: 18, height: 18)
	var horizontalContentInset: CGFloat = 16
}

extension UIKitButtonSize where Self == UIKitButtonLarge {
	static var large: UIKitButtonSize { UIKitButtonLarge() }
}
