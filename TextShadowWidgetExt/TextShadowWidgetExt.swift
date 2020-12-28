//
//  TextShadowWidgetExt.swift
//  TextShadowWidgetExt
//
//  Created by a3 on 28.12.20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct TextShadowWidgetExtEntryView : View {
    var entry: Provider.Entry

    var body: some View {
      //  Text(entry.date, style: .time)
        Text("Hello, world!")
            .shadow(color: .green, radius: 3, x: 1, y: 1)
    }
}

@main
struct TextShadowWidgetExt: Widget {
    let kind: String = "TextShadowWidgetExt"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TextShadowWidgetExtEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TextShadowWidgetExt_Previews: PreviewProvider {
    static var previews: some View {
        TextShadowWidgetExtEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
