import Foundation

struct UIKitButtonSmall: UIKitButtonSize {
	var height: CGFloat = 24
	var imageSize: CGSize = CGSize(width: 12, height: 12)
	var horizontalContentInset: CGFloat = 8
}

extension UIKitButtonSize where Self == UIKitButtonSmall {
	static var small: UIKitButtonSize { UIKitButtonSmall() }
}
