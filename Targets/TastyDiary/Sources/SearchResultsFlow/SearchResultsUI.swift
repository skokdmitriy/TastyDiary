import SwiftUI

struct SearchResultsUI: View {

    private let historyData: [String] = [
        "My search history",
        "My favourite recipes",
        "My favourite recipes",
        "My favourite recipes",
        "My favourite recipes",
        "Easy Mexican Casserole",
        "My favourite recipes",
        "My favourite recipes",
        "My favourite recipes",
    ]

    var body: some View {
        NavigationView {
            VStack {
                header
                search
            }
        }
    }

    var search: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(historyData.indices, id: \.self) { index in
                    cell(
                        title: historyData[index],
                        isDiverExist: historyData.count - 1 != index
                    )
                }
            }
        }
        .padding(.top, 6)
        .background(Color.white)
        .cornerRadius(24, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -36)
    }

    func cell(title: String, isDiverExist: Bool) -> some View {
        VStack {
            HStack {
                Text(title)
                .font(.callout)

                Spacer()

                Image(systemName: "arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 11)

            }
            .padding(.vertical, 17)

            Divider()
            .frame(height: 0.5)
            .opacity(isDiverExist ? 1 : 0)

        }
        .padding(.horizontal, 35)
        .foregroundColor(.gray)
    }
}

// MARK: - Header

private extension SearchResultsUI {
    var header: some View {
        ZStack(alignment: .top) {
            headerImage

            HStack {
                backButton
                Spacer()
                helpTooltip
            }
        }
    }

    var headerImage: some View {
        Image("Search-Result-Background")
        .resizable()
//        .scaledToFill()
//        .frame(maxWidth: .infinity)
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
        .scaledToFit()
        .frame(width: 20, height: 14)
        .foregroundColor(.white)
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
        .scaledToFill()
        .frame(width: 10, height: 8)
        .foregroundColor(.black)
    }
}

#Preview {
    SearchResultsUI()
}
