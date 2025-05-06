Class {
	#name : 'MASCategory',
	#superclass : 'Object',
	#instVars : [
		'categories',
		'postsList'
	],
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'accessing' }
MASCategory >> categories [
	^ categories
]

{ #category : 'accessing' }
MASCategory >> categories: anObject [
	categories := anObject
]

{ #category : 'as yet unclassified' }
MASCategory >> createCategory: aCategory [

| paneCategory btnCategoryTitle |

paneCategory := ToPane new hMatchParent;
										vFitContent.			
paneCategory padding: (BlInsets top: 0 left: 10 bottom: 10 right: 10).

paneCategory layout: BlLinearLayout vertical.
paneCategory layout horizontalAlignment: BlElementAlignment horizontal center.

"======================================================================================================="
"Category"
btnCategoryTitle := ToButton new label: (ToLabel new text: aCategory).

"Très moche mais impossible d'instancier une variable local pour le main pane de postlist"
btnCategoryTitle whenClickedDo: [ ((((self postsList) postsListPaneMain) childAt: 2) children) removeAll. "supprime les posts visible visuellement à l'utilisateur"
											(self postsList tabPostsFromCategory: aCategory) do: [ :each | "récupère les posts grâce à leurs catégories"
																(((self postsList) postsListPaneMain) childAt: 2) addChild: "Parcours de la liste de post (do each)"
																			((self postsList) createPostContent: each) ]. "création du post et l'ajouté dans le pane postList"
										  ].

btnCategoryTitle height: 30.
btnCategoryTitle hMatchParent.
btnCategoryTitle layout: BlLinearLayout vertical.
btnCategoryTitle layout horizontalAlignment: BlElementAlignment horizontal center.
btnCategoryTitle layout verticalAlignment: BlElementAlignment vertical center.

paneCategory addChild: btnCategoryTitle.
"======================================================================================================="

^ paneCategory





















]

{ #category : 'as yet unclassified' }
MASCategory >> createCategoryBody [

| pane categoryLabelPane categoriesList |

pane := ToPane new vMatchParent.

pane width: 250.
pane padding: (BlInsets top: 15 left: 10 bottom: 10 right: 10).

pane layout: BlLinearLayout vertical.
pane layout horizontalAlignment: BlElementAlignment horizontal center.

categoryLabelPane := self createCategoryLabel.
pane addChild: categoryLabelPane.

categoriesList := (self categories allCategories) asSortedCollection.

categoriesList do: [ :each | pane addChild: (self createCategory: each asString) ].

^ pane
]

{ #category : 'as yet unclassified' }
MASCategory >> createCategoryLabel [ 

| paneCategoryPane categoryLabel |

paneCategoryPane := ToPane new hMatchParent;
										vMatchParent.
paneCategoryPane height: 60.

paneCategoryPane layout: BlLinearLayout horizontal.
paneCategoryPane layout horizontalAlignment: BlElementAlignment horizontal center.

categoryLabel := ToLabel new text: 'Categories'.
categoryLabel fontSize: 30.

paneCategoryPane addChild: categoryLabel.

^ paneCategoryPane
]

{ #category : 'accessing' }
MASCategory >> postsList [
	^ postsList
]

{ #category : 'accessing' }
MASCategory >> postsList: aPostsListPane [
	postsList := aPostsListPane
]
