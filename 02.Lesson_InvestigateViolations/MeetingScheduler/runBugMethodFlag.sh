FOLDER="MeetingScheduler"
CONTRACTFILENAME="MeetingSchedulerBug$1.sol"
CONTRACTPATH="$FOLDER/$CONTRACTFILENAME"
CONTRACTNAME="MeetingScheduler"
PROPERTYFILENAME="meetings.spec"
PROPERTYPATH="$FOLDER/$PROPERTYFILENAME"

RULE="startOnTime"
METHOD="scheduleMeeting(uint256, uint256, uint256)"

/Users/tadeas/Library/Python/3.9/bin/certoraRun $CONTRACTPATH:$CONTRACTNAME --verify $CONTRACTNAME:$PROPERTYPATH \
--solc solc8.7 \
--send_only \
--rule $RULE --method "$METHOD"
--msg "Verifying contract $CONTRACTNAME in $CONTRACTFILENAME against rules in $PROPERTYFILENAME."