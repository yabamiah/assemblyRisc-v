.data

.text
	li s0, 0 # g
	li s1, 0 # h
	
if:
	bgt s1, s0, else
	add s0, s0, s1
	j done

else:
	sub s1, s1, s0
	
