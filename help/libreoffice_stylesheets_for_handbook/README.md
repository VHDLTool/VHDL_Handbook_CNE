# Style sheet to display XML handbook on LibreOffice calc

This repository contains the style sheet and templates to import and export handbook XML files into LibreOffice.

## Introduction

These files allow to import and export XML handbooks from [LibreOffice](https://fr.libreoffice.org/) calc.

## LibreOffice setting to use these stylsheets:

To use these files:

- Open LibreOffice Calc,

- Open XML Filter settings window (Tools / XML Filter Settings... menu),

- Add a new Filter setting (button New),

- On general tab:

  + Set filter name (for example *handbook*).
  
  + Set Application to *LibreOffice Calc (.ods)*.
  
  + Set Name of file type (for example *handbook*).
  
  + File extension shall be kept (*xml*).
  
  + Comments can be added.
  
- On Transformation tab:

  + Set the DocType (for example *handbook*).
  
  + Choose the XSLT for export: The `LibreOfficeExport.xsl` file in this deliver.
  
  + Choose the XSLT for import: The `ImportLibreOffice.xsl` file in this deliver.
  
  + Choose the Template for import: The `handbook.ots` file in this deliver.

These filters don't need XSLT 2.0 processor, then, the check box can be left unchecked.

## Open and save handbook

When opening a file, on calc, select, on file type, the *handbook (*.xml)* choice and then choose the file.

When saving the file, select  this *handbook (*.xml)* type.

## License

The handbook is published under the GNU GPLv3 license, available in the LICENSE file.
