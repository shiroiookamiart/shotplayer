extends StaticBody2D

func init_efect() -> void:
	$AnPlay.play("Init")
	await get_tree().create_timer(2).timeout
	stop_anim()
	pass

func stop_anim() -> void:
	$AnPlay.play("RESET")
	pass
