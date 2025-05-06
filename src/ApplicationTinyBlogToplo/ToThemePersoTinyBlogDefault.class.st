Class {
	#name : 'ToThemePersoTinyBlogDefault',
	#superclass : 'ToStyleSheetTheme',
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'initialization' }
ToThemePersoTinyBlogDefault >> initialize [
	super initialize.
	self initializeToPaneStyleRules.
]

{ #category : 'properties' }
ToThemePersoTinyBlogDefault >> initializeToPaneStyleRules [

self select: ToPane asTypeSelector style: [ 
	self select: #panneauCate asStampSelector style: [ 
		self when: ToInstallSkinEvent write: (self property: #'background-color') with: [ Color blue ]. ]. ].
]
