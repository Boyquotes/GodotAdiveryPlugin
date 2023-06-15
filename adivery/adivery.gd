@icon("res://adivery/adivery.svg")
class_name Adivery
extends Node

## Adivery is a platform for displaying ads in mobile applications, which displays the best ads from thousands of active campaigns and uses smart optimization algorithms to maximize the efficiency of displaying ads in your application!
##
## This plugin uses Adivery sdk so that you can easily implement and display ads.[br]We recommend use it in editor, but you can also use it in side code.
## to use it in editor just add node Adivery as child as Node and added in autoload, now enable configure check box and fill [code]App ID[/code] with yours, you can also check rewarded ad enable box or any other ads box and there [code]Placement ID[/code] with yours.
## to use it in code, follow examples:[br]
##     [codeblock]
## var adivery
##     func _ready():
##         adivery = Adivery.new()
##         add_child(adivery)
##         adivery.configure("59c36ce3-7125-40a7-bd34-144e6906c796")
##         adivery.prepare_rewarded_ad("16414bae-368e-4904-b259-c5b89362206d")
##         adivery.prepare_interstitial_ad("38b301f2-5e0c-4776-b671-c6b04a612311")
##         adivery.prepare_app_open_ad([YOUR PLACEMENT ID])
##     [/codeblock]
##     [br]
##     Or:
##     [codeblock]
## var adivery
##     func _ready():
##         adivery = Adivery.new()
##         add_child(adivery)
##         adivery.configure_app_id = "59c36ce3-7125-40a7-bd34-144e6906c796"
##         adivery.configure_enable = true
##         adivery.rewarded_placement_id = "16414bae-368e-4904-b259-c5b89362206d"
##         adivery.rewarded_enable = true
##         adivery.interstitial_placement_id = "38b301f2-5e0c-4776-b671-c6b04a612311"
##         adivery.interstitial_enable = true
##         adivery.app_open_placement_id = [YOUR PLACEMENT ID]
##         adivery.app_open_enable = true
##     [/codeblock][br]
## If you want to show rewarded ad or interstitial ad, just call [code]show_ad[/code].[br]
## Usage:
##     [codeblock]
##     func _on_button_pressed():
##         adivery.show.ad(adivery.rewarded_placement_id)
##     [/codeblock][br]
## Or:
##     [codeblock]
##     func _on_button_pressed():
##         adivery.show.ad(adivery.interstitial_placement_id)
##     [/codeblock][br]
## For app open ad, just call [code]show_app_open_ad[/code].[br]
## Usage:
##     [codeblock]
##     func _on_button_pressed():
##         adivery.show_app_open_ad.ad(adivery.app_open_placement_id)
##     [/codeblock][br]
##

## Emitted when rewarded ad is loaded and ready.
signal on_rewarded_ad_loaded (placement_id : String)

## Emitted when rewarded ad is clicked.
signal on_rewarded_ad_clicked (placement_id : String)

## Emitted when user close the rewarded ad.
## You can check [code]is_rewarded[/code] to reward the user.
signal on_rewarded_ad_closed (placement_id : String, is_rewarded : bool)

## Emitted when rewarded ad is show.
signal on_rewarded_ad_shown (placement_id : String)

## Emitted when interstitial ad is loaded.
signal on_interstitial_ad_loaded (placement_id : String)

## Emitted when interstitial ad is clicked.
signal on_interstitial_ad_clicked (placement_id : String)

## Emitted when interstitial ad is closed.
signal on_interstitial_ad_closed (placement_id : String)

## Emitted when interstitial ad is show.
signal on_interstitial_ad_shown (placement_id : String)

## Emitted when app open ad is loaded.
signal on_app_open_ad_loaded (placement_id : String)

## Emitted when app open ad is clicked.
signal on_app_open_ad_clicked (placement_id : String)

## Emitted when app open ad is closed.
signal on_app_open_ad_closed (placement_id : String)

## Emitted when app open ad is show.
signal on_app_open_ad_shown (placement_id : String)

@export_category("Adivery")

@export_group("Configure","configure_")

## Configure and enable Adivery.[br]Make sure [code]App ID[/code] is not empty.
@export var configure_enable : bool = false: ## Configure and enable Adivery.[br]Make sure [code]App ID[/code] is not empty.
	set(value):
		configure_enable = value
		if configure_enable and configure_app_id != "":
			configure(configure_app_id)
	get:
		return configure_enable

## Set the [code]App ID[/code] for configure Adivery.
@export var configure_app_id : String = "": ## Set the [code]App ID[/code] for configure Adivery.
	set(value):
		configure_app_id = value.strip_escapes().replace(" ","")
	get:
		return configure_app_id.strip_escapes().replace(" ","")

@export_group("Rewarded AD","rewarded_")

## Prepare and enable rewarded ad.[br]Make sure [code]Placement ID[/code] is not empty.
@export var rewarded_enable : bool = false: ## Prepare and enable rewarded ad.[br]Make sure [code]Placement ID[/code] is not empty.
	set(value):
		rewarded_enable = value
		if rewarded_enable and rewarded_placement_id != "":
			prepare_rewarded_ad(rewarded_placement_id)
	get:
		return rewarded_enable

## Set the [code]Placement ID[/code] for prepare rewarded ad.
@export var rewarded_placement_id : String = "": ## Set the [code]Placement ID[/code] for prepare rewarded ad.
	set(value):
		rewarded_placement_id = value.strip_escapes().replace(" ","")
	get:
		return rewarded_placement_id.strip_escapes().replace(" ","")

@export_group("Interstitial AD","interstitial_")

## Prepare and enable interstitial ad.[br]Make sure [code]Placement ID[/code] is not empty.
@export var interstitial_enable : bool = false: ## Prepare and enable interstitial ad.[br]Make sure [code]Placement ID[/code] is not empty.
	set(value):
		interstitial_enable = value
		if interstitial_enable and interstitial_placement_id != "":
			prepare_rewarded_ad(interstitial_placement_id)
	get:
		return interstitial_enable

## Set the [code]Placement ID[/code] for prepare interstitial ad.
@export var interstitial_placement_id : String = "": ## Set the [code]Placement ID[/code] for prepare interstitial ad.
	set(value):
		interstitial_placement_id = value.strip_escapes().replace(" ","")
	get:
		return interstitial_placement_id.strip_escapes().replace(" ","")

@export_group("App Open AD","app_open_")

## Prepare and enable app open ad.[br]Make sure [code]Placement ID[/code] is not empty.
@export var app_open_enable : bool = false: ## Prepare and enable app open ad.[br]Make sure [code]Placement ID[/code] is not empty.
	set(value):
		app_open_enable = value
		if app_open_enable and app_open_placement_id != "":
			prepare_rewarded_ad(app_open_placement_id)
	get:
		return app_open_enable

## Set the [code]Placement ID[/code] for prepare app open ad.
@export var app_open_placement_id : String = "": ## Set the [code]Placement ID[/code] for prepare app open ad.
	set(value):
		app_open_placement_id = value.strip_escapes().replace(" ","")
	get:
		return app_open_placement_id.strip_escapes().replace(" ","")

## Use [code]User ID[/code] to identify the user in server side.
var user_id : String:
	set(value):
		if _adivery:
			user_id = value
			_adivery.set_user_id(value)
	get:
		return user_id

var _plugin_name = "GodotAdiveryPlugin"
var _adivery

func _ready():
	if configure_enable and configure_app_id != "":
			configure(configure_app_id)
			if rewarded_enable and rewarded_placement_id != "":
				prepare_rewarded_ad(rewarded_placement_id)
			if interstitial_enable and interstitial_placement_id != "":
				prepare_interstitial_ad(interstitial_placement_id)
			if app_open_enable and app_open_placement_id != "":
				prepare_app_open_ad(app_open_placement_id)
	pass

## Call the [code]configure[/code] command as follows. Replace the [code]app_id[/code] value with your app ID that you get from the publisher dashboard.
##
## Usage:
##     [codeblock]
##     func _ready():
##         adivery.configure("59c36ce3-7125-40a7-bd34-144e6906c796")
##     [/codeblock]
##     [br]
##     Or:
##     [codeblock]
##     func _ready():
##         adivery.configure_app_id = "59c36ce3-7125-40a7-bd34-144e6906c796"
##         adivery.configure_enable = true
##     [/codeblock]
func configure(app_id : String) -> void:
	if Engine.has_singleton(_plugin_name):
		_adivery = Engine.get_singleton(_plugin_name)
		_adivery.configure(app_id.strip_escapes().replace(" ",""))


## Call the [code]prepare_rewarded_ad[/code] command as follows. Replace the [code]placement_id[/code] value with your placement ID that you get from the publisher dashboard.
##
## Usage:
##     [codeblock]
##     func _ready():
##         adivery.prepare_rewarded_ad("16414bae-368e-4904-b259-c5b89362206d")
##     [/codeblock]
##     [br]
##     Or:
##     [codeblock]
##     func _ready():
##         adivery.rewarded_placement_id = "16414bae-368e-4904-b259-c5b89362206d"
##         adivery.rewarded_enable = true
##     [/codeblock]
func prepare_rewarded_ad(placement_id : String) -> void:
	if _adivery:
		_adivery.prepare_rewarded_ad(placement_id.strip_escapes().replace(" ",""))
		_adivery.on_rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
		_adivery.on_rewarded_ad_clicked.connect(_on_rewarded_ad_clicked)
		_adivery.on_rewarded_ad_closed.connect(_on_rewarded_ad_closed)
		_adivery.on_rewarded_ad_shown.connect(_on_rewarded_ad_shown)
		

## Call the [code]prepare_interstitial_ad[/code] command as follows. Replace the [code]placement_id[/code] value with your placement ID that you get from the publisher dashboard.
##
## Usage:
##     [codeblock]
##     func _ready():
##         adivery.prepare_interstitial_ad("38b301f2-5e0c-4776-b671-c6b04a612311")
##     [/codeblock]
##     [br]
##     Or:
##     [codeblock]
##     func _ready():
##         adivery.interstitial_placement_id = "38b301f2-5e0c-4776-b671-c6b04a612311"
##         adivery.interstitial_enable = true
##     [/codeblock]
func prepare_interstitial_ad(placement_id : String) -> void:
	if _adivery:
		_adivery.prepare_interstitial_ad(placement_id.strip_escapes().replace(" ",""))
		_adivery.on_interstitial_ad_loaded.connect(_on_interstitial_ad_loaded)
		_adivery.on_interstitial_ad_clicked.connect(_on_interstitial_ad_clicked)
		_adivery.on_interstitial_ad_closed.connect(_on_interstitial_ad_closed)
		_adivery.on_interstitial_ad_shown.connect(_on_interstitial_ad_shown)
		

## Call the [code]prepare_app_open_ad[/code] command as follows. Replace the [code]placement_id[/code] value with your placement ID that you get from the publisher dashboard.
##
## Usage:
##     [codeblock]
##     func _ready():
##         adivery.prepare_app_open_ad([YOUR PLACEMENT ID])
##     [/codeblock]
##     [br]
##     Or:
##     [codeblock]
##     func _ready():
##         adivery.app_open_placement_id = [YOUR PLACEMENT ID]
##         adivery.app_open_enable = true
##     [/codeblock]
func prepare_app_open_ad(placement_id : String) -> void:
	if _adivery:
		_adivery.prepare_app_open_ad(placement_id.strip_escapes().replace(" ",""))
		_adivery.on_app_open_ad_loaded.connect(_on_app_open_ad_loaded)
		_adivery.on_app_open_ad_clicked.connect(_on_app_open_ad_clicked)
		_adivery.on_app_open_ad_closed.connect(_on_app_open_ad_closed)
		_adivery.on_app_open_ad_shown.connect(_on_app_open_ad_shown)
		

## Show rewarded ad or interstitial ad with given [code]placement_id[/code].[br]Make sure Adivery [code]configure[/code] and [code]prepare_rewarded_ad[/code] or [code]prepare_interstitial_ad[/code] is called before.
func show_ad(placement_id : String) -> void:
	if _adivery:
		_adivery.show_ad(placement_id.strip_escapes().replace(" ",""))
		

## Show app open ad with given [code]placement_id[/code].[br]Make sure Adivery [code]configure[/code] and [code]prepare_app_open_ad[/code] is called before.
func show_app_open_ad(placement_id : String) -> void:
	if _adivery:
		_adivery.show_app_open_ad(placement_id.strip_escapes().replace(" ",""))
		

## Check when ad is loaded and ready.
func is_loaded(placement_id : String) -> bool:
	if _adivery:
		return _adivery.is_loaded(placement_id.strip_escapes().replace(" ",""))
	return false
	

func _on_rewarded_ad_loaded(placement_id : String):
	emit_signal("on_rewarded_ad_loaded", placement_id.strip_escapes().replace(" ",""))
	

func _on_rewarded_ad_clicked(placement_id : String):
	emit_signal("on_rewarded_ad_clicked", placement_id.strip_escapes().replace(" ",""))
	

func _on_rewarded_ad_closed(placement_id : String, is_rewarded : String):
	var r = 0 if is_rewarded == "false" else 1
	emit_signal("on_rewarded_ad_closed", placement_id.strip_escapes().replace(" ",""), bool(r))
	

func _on_rewarded_ad_shown(placement_id : String):
	emit_signal("on_rewarded_ad_shown", placement_id.strip_escapes().replace(" ",""))
	

func _on_interstitial_ad_loaded(placement_id : String):
	emit_signal("on_interstitial_ad_loaded", placement_id.strip_escapes().replace(" ",""))
	

func _on_interstitial_ad_clicked(placement_id : String):
	emit_signal("on_interstitial_ad_clicked", placement_id.strip_escapes().replace(" ",""))
	

func _on_interstitial_ad_closed(placement_id : String):
	emit_signal("on_interstitial_ad_closed", placement_id.strip_escapes().replace(" ",""))
	

func _on_interstitial_ad_shown(placement_id : String):
	emit_signal("on_interstitial_ad_shown", placement_id.strip_escapes().replace(" ",""))
	

func _on_app_open_ad_loaded(placement_id : String):
	emit_signal("on_app_open_ad_loaded", placement_id.strip_escapes().replace(" ",""))
	

func _on_app_open_ad_clicked(placement_id : String):
	emit_signal("on_app_open_ad_clicked", placement_id.strip_escapes().replace(" ",""))
	

func _on_app_open_ad_closed(placement_id : String):
	emit_signal("on_app_open_ad_closed", placement_id.strip_escapes().replace(" ",""))
	

func _on_app_open_ad_shown(placement_id : String):
	emit_signal("on_app_open_ad_shown", placement_id.strip_escapes().replace(" ",""))
	
