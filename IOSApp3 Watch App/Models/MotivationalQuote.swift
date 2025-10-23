//
//  MotivationalQuote.swift
//  IOSApp3 Watch App
//
//  Created by Jose Flores on 2025-10-23.
//

import Foundation

struct MotivationalQuote {
    static let quotes = [
        "Everything is possible with Christ who strengthens me. - Philippians 4:13",
        "Trust in the Lord with all your heart. - Proverbs 3:5",
        "Be still and know that I am God. - Psalm 46:10",
        "The joy of the Lord is your strength. - Nehemiah 8:10",
        "Do not fear, for I am with you. - Isaiah 41:10"
    ]
    
    static func randomQuote() -> String {
        return quotes.randomElement() ?? "Keep faith and breathe."
    }
}
