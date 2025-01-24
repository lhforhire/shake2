
import WidgetKit
import SwiftUI

@main
struct ShakeFlashlightWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "ShakeFlashlightWidget", provider: Provider()) { entry in
            ShakeFlashlightWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Flashlight Widget")
        .description("Quickly toggle the flashlight from your Home Screen.")
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let entries = [SimpleEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ShakeFlashlightWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Flashlight")
                .font(.headline)
                .padding(.bottom, 5)
            Button("Toggle") {
                if let url = URL(string: "shakeflashlight://") {
                    UIApplication.shared.open(url)
                }
            }
        }
        .padding()
    }
}
