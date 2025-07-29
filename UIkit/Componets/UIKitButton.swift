import SwiftUI

// MARK: - UIKitButtonSize

protocol UIKitButtonSize {
	var height: CGFloat { get }
	var imageSize: CGSize { get }
	var horizontalContentInset: CGFloat { get }
}

// MARK: - UIKitButtonAppearance

protocol UIKitButtonAppearance {
	var font: Font { get }
	var weight: Font.Weight { get }
	var foregroundColor: Color { get }
	var backgroundColor: Color { get }
}

// MARK: - UIKitButtonType

protocol UIKitButtonType {
	var `default`: UIKitButtonAppearance { get }
	var enabler: UIKitButtonAppearance { get }
	var pressed: UIKitButtonAppearance { get }
	var disable: UIKitButtonAppearance { get }
}

struct UIKitButtonImage {
	let imageName: String
	let alignment: Alignment

	enum Alignment {
		case leading
		case trailing
	}
}

enum UIKitButtonState {
	case `default`
	case enabler
	case pressed
	case disable
}

//MARK: - UIKitButton

struct UIKitButton: View {
	private let title: String
	private let isExpanded: Bool
	private let image: UIKitButtonImage?
	private let size: UIKitButtonSize
	private let type: UIKitButtonType
	private let state: UIKitButtonState
	private let action: () -> Void

	var body: some View {
		Button(
			action: action,
			label: { content }
		)
		.disabled(state == .disable)
		.buttonStyle(
			UIKitButtonStyle(
				isExpanded: isExpanded,
				appearance: stateConfiguration,
				type: type,
				size: size
			)
		)
	}

	// MARK: - Init

	init(
		title: String,
		isExpanded: Bool = false,
		image: UIKitButtonImage? = nil,
		size: UIKitButtonSize = .medium,
		type: UIKitButtonType = .primary,
		state: UIKitButtonState = .default,
		action: @escaping () -> Void
	) {
		self.title = title
		self.isExpanded = isExpanded
		self.image = image
		self.size = size
		self.type = type
		self.state = state
		self.action = action
	}
}

// MARK: Content

private extension UIKitButton {
	var content: some View {
		HStack(spacing: 8) {
			if image?.alignment == .leading {
				imageContent
			}

			text

			if image?.alignment == .trailing {
				imageContent
			}
		}
		.padding(size.horizontalContentInset)
	}
}

// MARK: - State Configuration

private extension UIKitButton {
	var stateConfiguration: UIKitButtonAppearance {
		switch state {
		case .default: type.default
		case .enabler: type.enabler
		case .pressed: type.pressed
		case .disable: type.disable
		}
	}
}

//MARK: - Text

private extension UIKitButton {
	var text: some View {
		Text(title)
			.font(stateConfiguration.font.customWeight(stateConfiguration.weight))
	}
}

// MARK: - Image

private extension UIKitButton {
	@ViewBuilder
	var imageContent: some View {
		if let image {
			Image(systemName: image.imageName)
				.frame(
					width: size.imageSize.width,
					height: size.imageSize.height
				)
		}
	}
}

// MARK: - Button style

struct UIKitButtonStyle: ButtonStyle {
	private let isExpanded: Bool
	private let appearance: UIKitButtonAppearance
	private let type: UIKitButtonType
	private let size: UIKitButtonSize

	// MARK: - Init

	init(
		isExpanded: Bool,
		appearance: UIKitButtonAppearance,
		type: UIKitButtonType,
		size: UIKitButtonSize
	) {
		self.isExpanded = isExpanded
		self.appearance = appearance
		self.type = type
		self.size = size
	}

	// MARK: - Body

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.if(isExpanded) { label in
				label.frame(maxWidth: .infinity)
			}
			.frame(height: size.height)
			.foregroundColor(
				configuration.isPressed
				? type.pressed.foregroundColor
				: appearance.foregroundColor
			)
			.background(
				configuration.isPressed
				? type.pressed.backgroundColor
				: appearance.backgroundColor
			)
			.cornerRadius(6)
	}
}

#Preview {
	VStack {
		UIKitButton(
			title: "config1",
			isExpanded: true,
			image: UIKitButtonImage(
				imageName: "star.fill",
				alignment: .leading
			),
			size: .medium,
			type: .secondary,
			state: .enabler,
			action: {
				print("hello")
			}
		)

		.padding()

		UIKitButton(
			title: "Кнопка #2",
			image: UIKitButtonImage(
				imageName: "star.fill",
				alignment: .leading
			),
			size: .medium,
			action: {}
		)
		.padding()

		UIKitButton(
			title: "Кнопка #3",
			image: UIKitButtonImage(
				imageName: "star.fill",
				alignment: .trailing
			),
			size: .small,
			action: {}
		)
		.padding()
	}
}
