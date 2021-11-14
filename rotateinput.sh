# dont forget to touch the screen first with the pen.
touchscreen=""
pen=""

OIFS=$IFS
search=""04F30732:00""

# note that the pen didnt show up until I mapped the standard one or clicked the screen.
# so need to do that first
echo $search

list=$(xinput | grep $search | grep pointer)
echo "list $list"

# just a text file to work with the list.
if [ -f tempxinput.txt ]
then
    echo " removing tempxinput"
    rm tempxinput.txt
fi

device_id=$(echo "$list" | sed -n 's/.*04F30732:00.*id=\([0-9]*\).*/\1/p')

for i in $device_id
do
echo "id is $i"
xinput map-to-output $i DSI-1

done