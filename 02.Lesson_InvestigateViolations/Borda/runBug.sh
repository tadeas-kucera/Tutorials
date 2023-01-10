NAME="BordaBug1"
echo "Running $NAME."
/Users/tadeas/Library/Python/3.9/bin/certoraRun Borda/$NAME.sol:Borda --verify Borda:Borda/Borda.spec \
  --solc solc7.5 \
  --msg "Verification of Tutorial02:Borda:$NAME"