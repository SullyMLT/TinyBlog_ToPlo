Class {
	#name : 'MASMainApplicationSpace',
	#superclass : 'BlElement',
	#category : 'ApplicationTinyBlogToplo-ToploBlocFeatureForPyramid',
	#package : 'ApplicationTinyBlogToplo',
	#tag : 'ToploBlocFeatureForPyramid'
}

{ #category : 'instance creation' }
MASMainApplicationSpace class >> open [
	<script>
	self new open.
]

{ #category : 'instance creation' }
MASMainApplicationSpace >> open [

| main pane header content themeSwap |
pane := ToPane new.
pane layout: BlLinearLayout vertical.
pane layout cellSpacing: 15.
pane padding: (BlInsets top: 10 left: 10 bottom: 10 right: 10).

pane border: (BlBorder paint: Color lightGray).

pane constraints horizontal matchParent.
pane constraints vertical matchParent.

themeSwap := ToCheckbox new labelText: 'Dark Theme'; beEndToStart.
themeSwap defaultSkin: ToCheckboxSkin new.
themeSwap addEventHandler: (BlEventHandler on: ToCheckableChangedEvent 
														do: [ :event | 
															pane toTheme: (themeSwap isChecked 
																ifTrue: [ ToThemePersoTinyBlogDark new ]
																ifFalse: [ ToThemePersoTinyBlogDefault new ]) ]).
pane addChild: themeSwap.

header := MASHeaderToplo new createHeader.
pane addChild: header.

content := MASBodyToplo new createBodyContent.
pane addChild: content.

main := pane openInSpace.
main extent: 1800@1000.
]
