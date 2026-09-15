![version](https://img.shields.io/badge/version-21.1%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_4DWP_Print

A 4D **HDI** (How Do I) example demonstrating how to drive **4D Write Pro printing** from a form: choosing a rendering layout (HTML WYSIWYG vs. native 4D Write Pro layout), a page range, paper size/orientation, scale, and copy count, then sending the document to the printer or a preview — all backed by the `SET/GET PRINT OPTION` and `WP PRINT` command family. Originally published by 4D as a binary `.4DB` example for **4D v15 R5**; converted to the modern `.4DProject` architecture so it runs on current 4D releases.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v15 R5. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (syntax, localisation, dark mode) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/4d-write-pro-pagination-printing/
- **Original download:** https://download.4d.com/Demos/4D_v15_R5/HDI_4D_Write_Pro_Printing.zip

## What it demonstrates

- **`SET PRINT OPTION` / `GET PRINT OPTION`** — reading and writing the paper size, orientation, number of copies, scale, and page range for the printer currently targeted by the document.
- **`PRINT OPTION VALUES`** — listing every paper size the current printer supports, to populate the paper-size dropdown/popup.
- **`WP PRINT`** — printing `writeProDoc` using either the `wk html wysiwyg` or `wk 4D Write Pro layout` rendering constant, driven by a radio-button choice.
- **`WP Get page count`** — reading the document's current page count so the page-range fields can be validated and clamped.
- **`PRINT SETTINGS`** / **`WP USE PAGE SETUP`** — opening the OS page-setup dialog and the printer's full print dialog from the form.
- **`OPEN PRINTING JOB` / `CLOSE PRINTING JOB`** — bracketing more than one `WP PRINT` call into a single printing job, demonstrated both by a Shift-click easter egg (print both layouts back-to-back) and by a small standalone reference method.
- **`SET PRINT PREVIEW`** — toggling whether `WP PRINT` opens a preview before sending to the printer.
- A live orientation thumbnail that redraws a small portrait/landscape rectangle as the paper size or orientation changes.

## Key commands

| Command | Used for |
|---|---|
| `SET PRINT OPTION` / `GET PRINT OPTION` | Reading/writing paper size, orientation, copies, scale, and page range (`updateUIprintSettings`, `m_modifyPrintRange`, and every form-object method) |
| `PRINT OPTION VALUES` | Populating the paper-size popup with every size the current printer supports |
| `WP PRINT` | Printing `writeProDoc` with the selected layout (`bPrint`, `Button4`, `Printing job`) |
| `WP Get page count` | Clamping the page-range start/end fields to the document's real page count (`m_modifyPrintRange`) |
| `PRINT SETTINGS` | Opening the page-setup dialog (`Button`) or the full print dialog (`Button4`) |
| `WP USE PAGE SETUP` | Applying the printer's page setup directly to `writeProDoc` (`Button10`) |
| `OPEN PRINTING JOB` / `CLOSE PRINTING JOB` | Bracketing multiple `WP PRINT` calls into one job (`bPrint` on Shift-click, `Printing job`) |
| `SET PRINT PREVIEW` | Switching `WP PRINT` between direct printing and print preview |
| `WP Import document` | Loading the bundled `description.4wp` / `doc.4wp` sample documents at startup (`initHdi`) |

## How it works

`00_Start` opens the `HDI` splash form, gated on a minimum 4D version. `BtnDemo` opens the `HDI2` demo form, whose `On Load` calls `initHdi` (imports `description.4wp`/`doc.4wp`, sets tab and page-range labels, and picks the default layout/paper/copies) and then `updateUIprintSettings`, which reads the printer's current options into the form's controls (page range visibility, copy count, scale, orientation, paper size and its resulting thumbnail).

Every control that changes a print option — the paper popup, the layout/orientation radio buttons, the page-range combo box, or the start/end rulers — writes the new value back with `SET PRINT OPTION` and then re-runs `m_modifyPrintRange` and/or `resizePageThumbnail` to keep the range fields and the orientation preview in sync. Clicking the print button (`bPrint`) prints `writeProDoc` with whichever layout is selected; holding Shift while clicking instead opens a single printing job and prints both layouts back-to-back, illustrating `OPEN PRINTING JOB`/`CLOSE PRINTING JOB`.

## Points of interest

- **Layout choice is just a `WP PRINT` argument** — the HTML WYSIWYG vs. 4D Write Pro Layout radio group doesn't touch the document at all; it only changes which `wk` layout constant is passed to `WP PRINT`, showing the same document can be rendered/printed two different ways.
- **Page-range clamping** in `m_modifyPrintRange` guards against a start/end typed by the user that exceeds the document's real page count (`WP Get page count`) or an inverted range (end before start), including the sentinel value 2147483647 meaning "to the last page."
- **The Shift-click "print both layouts" behaviour in `bPrint.4dm`** is deliberate demo code for `OPEN PRINTING JOB`/`CLOSE PRINTING JOB` bracketing multiple prints into one job — left in place rather than removed, since it is the functional subject of part of this demo, not dead debug scaffolding.
- **`Printing job.4dm`** is an intentionally standalone, unreferenced project method showing the minimal `OPEN PRINTING JOB` / `WP PRINT` / `CLOSE PRINTING JOB` pattern in isolation; it is deliberately kept visible in the Run Method dialog as a copy-pasteable reference snippet rather than marked `invisible`.
- Startup uses the modern splash pattern: window-reuse detection, `CALL WORKER`, non-blocking `DIALOG(...;*)`, and `Form.quit`/`BtnDemo` object method instead of interprocess variables and `QUIT 4D`.
- Full XLIFF localisation (English) covers the menu and both forms' text/labels, plus the tab, page-range, and paper-format strings produced in method code (`Localized string(...)`).
- The splash form's one button is sized via `form-theme` CSS media queries (27px Liquid Glass / 23px classic) on both `.default` and `button.default` selectors, rather than a hardcoded `height`, so it stays correctly rounded under macOS Tahoe.
- No listboxes are used anywhere in this project, so the usual `truncateMode`/`resizingMode` listbox defaults don't apply here.

## Project structure

```
Project/Sources/
  Forms/HDI/               Splash/startup form (version gate) and its BtnDemo object method
  Forms/HDI2/               Main demo form: layout/paper/orientation/copies/scale/page-range controls, print
  Methods/                 Startup (00_Start), initHdi, updateUIprintSettings, m_modifyPrintRange,
                            resizePageThumbnail, and Printing job (standalone reference snippet)
  DatabaseMethods/         onStartup.4dm -> calls 00_Start
  styleSheets*.css         Dark mode + Liquid Glass button sizing
Resources/
  description.4wp, doc.4wp  Sample 4D Write Pro documents imported at startup
  en.lproj/                 XLIFF localisation (English source)
```

## Requirements

- 4D 21.1 or later (project `compatibilityVersion: 2101`)
- A valid 4D Write license to pass the splash screen's license check
- A configured printer (real or virtual) to exercise the print/preview/page-setup commands

## References

- [4D blog: 4D Write Pro pagination & printing](https://blog.4d.com/4d-write-pro-pagination-printing/)
- [`WP PRINT`](https://developer.4d.com/docs/commands/wp-print)
- [`SET PRINT OPTION`](https://developer.4d.com/docs/commands/set-print-option) / [`GET PRINT OPTION`](https://developer.4d.com/docs/commands/get-print-option)
- [`PRINT OPTION VALUES`](https://developer.4d.com/docs/commands/print-option-values)
- [`WP Get page count`](https://developer.4d.com/docs/commands/wp-get-page-count)
- [`OPEN PRINTING JOB`](https://developer.4d.com/docs/commands/open-printing-job) / [`CLOSE PRINTING JOB`](https://developer.4d.com/docs/commands/close-printing-job)
- [4D CSS stylesheets (dark mode, Liquid Glass)](https://developer.4d.com/docs/FormEditor/stylesheets)
- [Original download](https://download.4d.com/Demos/4D_v15_R5/HDI_4D_Write_Pro_Printing.zip)

## Screenshots
