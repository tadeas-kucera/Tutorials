FOLDER="MeetingScheduler"
CONTRACTFILENAME="MeetingSchedulerBug$1.sol"
CONTRACTPATH="$FOLDER/$CONTRACTFILENAME"
CONTRACTNAME="MeetingScheduler"
PROPERTYFILENAME="meetings.spec"
PROPERTYPATH="$FOLDER/$PROPERTYFILENAME"

/Users/tadeas/Library/Python/3.9/bin/certoraRun $CONTRACTPATH:$CONTRACTNAME --verify $CONTRACTNAME:$PROPERTYPATH \
--solc solc8.7 \
--send_only \
--msg "Verifying contract $CONTRACTNAME in $CONTRACTFILENAME against rules in $PROPERTYFILENAME."