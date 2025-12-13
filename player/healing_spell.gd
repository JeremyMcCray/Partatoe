extends Node

func heal():
	var random_party_member = PlayerGlobal.party.pick_random()
	print(random_party_member)
	if random_party_member:
		random_party_member.heal(10)
