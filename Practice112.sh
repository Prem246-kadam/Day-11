echo "Welcome to Flip Coin Simulator"

headCount=0
tailCount=0

while true
do
    result=$((RANDOM%2))
    if [ $result -eq 1 ]
    then
        echo "Heads"
        ((headCount++))
    else
        echo "Tails"
        ((tailCount++))
    fi
    echo "Head count: $headCount"
    echo "Tail count: $tailCount"
    if [ $headCount -eq 21 ]
    then
        echo "Heads wins by $(($headCount-$tailCount)) points"
        break
    elif [ $tailCount -eq 21 ]
    then
        echo "Tails wins by $(($tailCount-$headCount)) points"
        break
    elif [ $headCount -ge 20 -a $tailCount -ge 20 ]
    then
        if [ $(($headCount-$tailCount)) -ge 2 ]
        then
            echo "Heads wins by $(($headCount-$tailCount)) points"
            break
        elif [ $(($tailCount-$headCount)) -ge 2 ]
        then
            echo "Tails wins by $(($tailCount-$headCount)) points"
            break
        fi
    fi
done
