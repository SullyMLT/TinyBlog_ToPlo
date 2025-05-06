Class {
	#name : 'MASBlog',
	#superclass : 'Object',
	#instVars : [
		'adminUser',
		'posts'
	],
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'as yet unclassified' }
MASBlog class >> createDemoPosts [
	"TBBlog createDemoPosts"
	self current
	writeBlogPost: ((MASPost title: 'Welcome in TinyBlog' text:
		'TinyBlog is a small blog engine made with Pharo.' category:
		'TinyBlog') visible: true);
		
	writeBlogPost: ((MASPost title: 'Report Pharo Sprint' text:
		'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
		nice event with more than 15 motivated sprinters. With the help
		of candies, cakes and chocolate, huge work has been done'
		category: 'Pharo') visible: true);
		
	writeBlogPost: ((MASPost title: 'Brick on top of Bloc -
		Preview' text: 'We are happy to announce the first preview
		version of Brick, a new widget set created from scratch on top
		of Bloc. Brick is being developed primarily by Alex Syrel
		(together with Alain Plantec, Andrei Chis and myself), and the
		work is sponsored by ESUG.
		Brick is part of the Glamorous Toolkit effort and will provide
		the basis for the new versions of the development tools.'
		category: 'Pharo') visible: true);
		
	writeBlogPost: ((MASPost title: 'The sad story of unclassified
		blog posts' text: 'So sad that I can read this.') visible: true);
		
	writeBlogPost: ((MASPost title: 'Working with Pharo on the
		Raspberry Pi' text: 'Hardware is getting cheaper and many new
		small devices like the famous Raspberry Pi provide new
		computation power that was one once only available on regular
		desktop computers.' category: 'Pharo') visible: true)
]

{ #category : 'initialization' }
MASBlog class >> current [
	"^ self selectAll
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]"
	^ self

]

{ #category : 'as yet unclassified' }
MASBlog class >> defaultAdminLogin [
	^ 'admin'
]

{ #category : 'as yet unclassified' }
MASBlog class >> defaultAdminPassword [
	^ 'topsecret'
]

{ #category : 'initialization' }
MASBlog class >> initialize [ 
	self reset
]

{ #category : 'testing' }
MASBlog class >> isVoyageRoot [ 
	"Indique que cetet instance est en top level documents in no sql databases"
	^ true
]

{ #category : 'initialization' }
MASBlog class >> reset [ 
self initializeVoyageOnMemoryDB 
]

{ #category : 'as yet unclassified' }
MASBlog >> administrator [
	^ adminUser
]

{ #category : 'action' }
MASBlog >> allBlogPosts [
	^ posts
]

{ #category : 'action' }
MASBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : 'action' }
MASBlog >> allCategories [
	^ (self allBlogPosts collect: [:p | p category]) asSet
]

{ #category : 'action' }
MASBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : 'action' }
MASBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : 'accessing' }
MASBlog >> blog [
	^ posts
]

{ #category : 'as yet unclassified' }
MASBlog >> createAdministrator [
	^ TBAdministrator
		login: self class defaultAdminLogin 
		password: self class defaultAdminPassword 
]

{ #category : 'as yet unclassified' }
MASBlog >> createDemoPosts [
	"TBBlog createDemoPosts"
	self 
	writeBlogPost: ((MASPost title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.'
		category: 'TinyBlog') visible: true);
		
	writeBlogPost: ((MASPost title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done'
		category: 'Pharo') visible: true);
		
	writeBlogPost: ((MASPost title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.'
		category: 'Pharo') visible: true);
		
	writeBlogPost: ((MASPost title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true);
		
	writeBlogPost: ((MASPost title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : 'initialization' }
MASBlog >> initialize [
	super initialize.
	posts := OrderedCollection new.
	"adminUser := self createAdministrator "
]

{ #category : 'accessing' }
MASBlog >> posts [
	^ posts
]

{ #category : 'accessing' }
MASBlog >> posts: anObject [
	posts := anObject
]

{ #category : 'removing' }
MASBlog >> removeAllPosts [
	posts do: [ :each | each remove ].
	posts := OrderedCollection new.
"	self save."
]

{ #category : 'removing' }
MASBlog >> size [ 
	^ posts size
]

{ #category : 'removing' }
MASBlog >> writeBlogPost: aPost [
	"Écrit le blog dans la database"
	posts add: aPost.
"	aPost save.
	self save"
]
