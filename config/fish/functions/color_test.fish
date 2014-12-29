function color_test
	for color in (set_color -c)
        set_color $color
        echo $color
    end
end
