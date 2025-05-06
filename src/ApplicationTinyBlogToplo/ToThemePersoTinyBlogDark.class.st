Class {
	#name : 'ToThemePersoTinyBlogDark',
	#superclass : 'ToStyleSheetTheme',
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'initialization' }
ToThemePersoTinyBlogDark >> initialize [
	super initialize.
	self initializeToPaneStyleRules.
]

{ #category : 'properties' }
ToThemePersoTinyBlogDark >> initializeToPaneStyleRules [

self select: ToPane asTypeSelector style: [ 
	self select: #panneauCate asStampSelector style: [ 
		self when: ToInstallSkinEvent write: (self property: #'background-color') with: [ Color black ]. ]. ].
]
