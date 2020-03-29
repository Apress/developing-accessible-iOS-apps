//
//  AccessibilityLabelsViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 07/04/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class AccessibilityLabelsViewController: UIViewController {
    @IBOutlet weak var timeExampleLabel: UILabel!
    @IBOutlet weak var nonReadableTimeLabel: UILabel!
    @IBOutlet weak var timeExampleVsLabel: UILabel!
    @IBOutlet weak var readableTimeLabel: UILabel!
    @IBOutlet weak var mostReadExampleLabel: UILabel!
    @IBOutlet weak var incorrectMostReadLabel: UILabel!
    @IBOutlet weak var mostReadVsLabel: UILabel!
    @IBOutlet weak var correctMostReadLabel: UILabel!
    @IBOutlet weak var languageExampleLabel: UILabel!
    @IBOutlet weak var incorrectLanguageLabel: UILabel!
    @IBOutlet weak var languageExampleVsLabel: UILabel!
    @IBOutlet weak var correctLanguageLabel: UILabel!
    @IBOutlet weak var ipaExampleLabel: UILabel!
    @IBOutlet weak var nonIpaLabel: UILabel!
    @IBOutlet weak var ipaVsLabel: UILabel!
    @IBOutlet weak var ipaLabel: UILabel!
    @IBOutlet weak var punctuationExampleLabel: UILabel!
    @IBOutlet weak var withoutPuntuationLabel: UILabel!
    @IBOutlet weak var punctuationVSLabel: UILabel!
    @IBOutlet weak var withPunctuationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTimeExample()
        configureMostReadExample()
        configureLanguageExample()
        configureIpaExample()
        configurePunctuationExample()
    }

    private func configureTimeExample() {
        let time = "02:48"
        let dateComponentsFormatter = DateComponentsFormatter()
        let timeFormatter = DateFormatter()

        timeFormatter.dateFormat = "mm:ss"
        dateComponentsFormatter.allowedUnits = [.minute, .second]
        dateComponentsFormatter.unitsStyle = .short

        timeExampleLabel.text = NSLocalizedString("timeExample", bundle: .main, comment: "")
        timeExampleLabel.accessibilityTraits = UIAccessibilityTraits.header
        nonReadableTimeLabel.text = time
        timeExampleVsLabel.text = NSLocalizedString("vs", bundle: .main, comment: "")
        readableTimeLabel.text = time

        if let date = timeFormatter.date(from: time) {
            let components = Calendar.current.dateComponents([.minute, .second], from: date)
            readableTimeLabel.accessibilityLabel = dateComponentsFormatter.string(from: components)
        }
    }

    private func configureMostReadExample() {
        mostReadExampleLabel.text = NSLocalizedString("mostReadExample", bundle: .main, comment: "")
        mostReadExampleLabel.accessibilityLabel = NSLocalizedString(
            "accessibilityMostReadExample", bundle: .main, comment: ""
        )
        mostReadExampleLabel.accessibilityTraits = UIAccessibilityTraits.header
        incorrectMostReadLabel.text = NSLocalizedString("mostRead", bundle: .main, comment: "")
        mostReadVsLabel.text = NSLocalizedString("vs", bundle: .main, comment: "")
        correctMostReadLabel.text = NSLocalizedString("mostRead", bundle: .main, comment: "")
        correctMostReadLabel.accessibilityLabel = NSLocalizedString("accessibilityMostRead", bundle: .main, comment: "")
    }

    private func configureLanguageExample() {
        languageExampleLabel.text = NSLocalizedString("languageExample", bundle: .main, comment: "")
        languageExampleLabel.accessibilityTraits = UIAccessibilityTraits.header
        incorrectLanguageLabel.text = "Paella"
        languageExampleVsLabel.text = NSLocalizedString("vs", bundle: .main, comment: "")
        correctLanguageLabel.text = "Paella"
        correctLanguageLabel.accessibilityAttributedLabel = NSAttributedString(
            string: "Paella", attributes: [.accessibilitySpeechLanguage: "es-ES"]
        )
    }

    private func configureIpaExample() {
        let text = "Paella is a Valencian rice dish"
        ipaExampleLabel.text = NSLocalizedString("IPA Notation Example", bundle: .main, comment: "")
        ipaExampleLabel.accessibilityTraits = UIAccessibilityTraits.header
        nonIpaLabel.text = text
        ipaVsLabel.text = NSLocalizedString("vs", bundle: .main, comment: "")
        let ipaAttributedText = NSMutableAttributedString(string: "Paella is a Valencian rice dish")
        let ipaRange = ipaAttributedText.string.range(of: "Paella")!
        ipaAttributedText.addAttributes(
            [.accessibilitySpeechIPANotation: "paˈeʎa"], range: NSRange(ipaRange, in: ipaAttributedText.string)
        )
        ipaLabel.text = text
        ipaLabel.accessibilityAttributedLabel = ipaAttributedText
    }

    private func configurePunctuationExample() {
        let text = "Text within ‘ and ’ or \" denote either speech or a quotation"
        punctuationExampleLabel.text = NSLocalizedString("Punctuation Example", bundle: .main, comment: "")
        punctuationExampleLabel.accessibilityTraits = UIAccessibilityTraits.header
        withoutPuntuationLabel.text = text
        punctuationVSLabel.text = NSLocalizedString("vs", bundle: .main, comment: "")
        withPunctuationLabel.text = text
        withPunctuationLabel.accessibilityAttributedLabel = NSAttributedString(
            string: text, attributes: [.accessibilitySpeechPunctuation: true]
        )
    }
}
