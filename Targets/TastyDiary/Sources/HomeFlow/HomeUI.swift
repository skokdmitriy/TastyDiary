import SwiftUI

struct HomeUI: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("Hello")
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 14) {
                        toolbarImage(name: "mappin.and.ellipse")
                        toolbarTitle
                        toolbarImage(name: "chevron.down")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Circle()
                    .frame(width: 42, height: 42)
                    .foregroundStyle(.secondary)
                }
            }
        }
    }
}

// MARK: - Toolbar Image

private extension HomeUI {
    func toolbarImage(name: String) -> some View {
        Image(systemName: name)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 12, height: 21)
        .foregroundColor(.secondary)
        .padding(.vertical, 2)
    }
}

// MARK: Toolbar Title

private extension HomeUI {
    var toolbarTitle: some View {
        Text("Mohammed, Dhaka")
        .font(.caption)
        .foregroundStyle(.primary)
    }
}

//#Preview {
//    HomeUI()
//}
