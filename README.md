# CNES Ruleset
This repository stores the CNES VHDL Ruleset for the Design and VHDL handbook for VLSI development project

## Introduction

The handbook is a set of rules for VHDL code, with associated examples and figures. It is divided into two chapters :

- The first one is called the "Standard Rules" which includes general rules or recommendations that are common between all companies working with VHDL. These rules share a general agreement between companies originally involved. Addition and changes to these rules have to be agreed by everyone.

- The second one is called "Custom Rules" which includes specific company rules that are adapted/refined from standard rules or completely new. These custom rules allow third party companies to create their own version of the VHDL Handbook.

This repository host the CNES custom rules.

## Dependencies

To create a pdf the toolchain must be used.

## Project structure

The project is structured as follows :


- A `src` folder containing:

    - The XSD folder, in which you will find the handbook schema (`handbook.xsd`) describing how a rule is structured
        
    - The rulesets standard
    
    - An Extras folder, in which can be found :
    
        + The images to be inserted to illustrate rules (only SVG format)
                
        + The VHDL examples

- A `help` folder containing:
    - Additionnal information to help designer following CNES Rules

## Building

See the toolchain repository to see how to create a pdf handbook from XML files

## Handbook rules

The rules are described by a set of XML tags according to the `handbook.xsd` schema.

A rule has the following template :

```XML
<hb:Rule UID="LLL_DDD">
	<hb:RuleUID>LLL_DDDDD</hb:RuleUID>
	<hb:RuleHist>
		<hb:Status>Status</hb:Status>
		<hb:Engine>Engine</hb:Engine>
		<hb:Version>X</hb:Version>
		<hb:Creation>YYYY-MM-DD</hb:Creation>
		<hb:Modified>YYYY-MM-DD</hb:Modified>
		<hb:Revision>
			V1 : YYYY-MM-DD : Creation
			V2 : YYYY-MM-DD : CatModified1 ; CatModified2
            		V3 : YYYY-MM-DD : CatModified3
        	</hb:Revision>
	</hb:RuleHist>
	<hb:RuleContent>
		<hb:Name>Rule name</hb:Name>
		<hb:IsParent>false</hb:IsParent>
		<hb:IsSon>false</hb:IsSon>
		<hb:ParentUID xsi:nil="true" />
		<hb:Technology>Technology</hb:Technology>
		<hb:ApplicationFields>ApplicationFields</hb:ApplicationFields>
		<hb:Category>Category</hb:Category>
		<hb:SubCategory>SubCategory</hb:SubCategory>
		<hb:Severity>Severity</hb:Severity>
		<hb:Rationale>Some rationale related to the rule.</hb:Rationale>
		<hb:ShortDesc>A Short description of the rule.</hb:ShortDesc>
		<hb:LongDesc>A longer description in which you can do some formatting that will be kept</hb:LongDesc>
	</hb:RuleContent>
	<hb:Sonarqube>
		<hb:SonarType>Type of problem</hb:SonarType>
		<hb:SonarSeverity>Problem severity</hb:SonarSeverity>
		<hb:RemediationEffort>Estimated effort for correction</hb:RemediationEffort>
		<hb:SonarTag>Tag</hb:SonarTag>
	</hb:Sonarqube>
	<hb:RuleDesc>
		<hb:GoodExDesc>A description of the good example (leave empty if none needed)</hb:GoodExDesc>
		<hb:GoodExample>GoodExampleFileName</hb:GoodExample>
		<hb:BadExDesc>A description of the bad example (leave empty if none needed)</hb:BadExDesc>
		<hb:BadExample>BadExampleFileName</hb:BadExample>
		<hb:FigureDesc>A description of the figure illustrating the rule</hb:FigureDesc>
		<hb:Figure>TheFileNameOfTheFigure</hb:Figure>
	</hb:RuleDesc>
</hb:Rule>
```

The Sonarqube section is optional.

## License

The handbook is published under the GNU GPLv3 license, available in the LICENSE file.
