import SwiftUI

struct SearchResultsUI: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                header
                Spacer()
            }
        }
    }
}

// MARK: - Header

private extension SearchResultsUI {
    var header: some View {
        ZStack(alignment: .top) {
            headerImage

            HStack(spacing: 0) {
                backButton
                Spacer()
                helpTooltip
            }
        }
    }

    var headerImage: some View {
        Image("Search-Result-Background")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
    }
}

// MARK: - Toolbar

private extension SearchResultsUI {
    var backButton: some View {
        Button(
            action: { print("backButton") },
            label: { backButtonImage }
        )
        .frame(width: 40, height: 40)
        .background(Color.background.ghost, in: Circle())
        .padding(.leading, 20)
    }

    var backButtonImage: some View {
        Image(systemName: "arrow.backward")
            .resizable()
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 17, height: 14)
    }

    var helpTooltip: some View {
        HStack(spacing: 10) {
            helpTooltipTitle
            helpTooltipImage
        }
        .padding(8)
        .background(Color.white.opacity(0.7),
                    in: RoundedRectangle(cornerRadius: 12)
        )
        .padding(.leading, 10)
        .padding(.trailing, 20)
    }

    var helpTooltipTitle: some View {
        Text("Swipe to search by ingredients")
        .font(.callout)
        .fontWeight(.bold)
        .foregroundColor(.black)
    }

    var helpTooltipImage: some View {
        Image(systemName: "chevron.right")
        .resizable()
        .scaledToFit()
        .frame(width: 10, height: 8)
        .foregroundColor(.black)
    }
}

#Preview {
    SearchResultsUI()
}
