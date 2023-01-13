NAME="ERC20Bug4.sol"
echo "Running $NAME."
/Users/tadeas/Library/Python/3.9/bin/certoraRun ERC20/$NAME:ERC20 --verify ERC20:ERC20/ERC20.spec \
--solc solc8.0 \
--optimistic_loop \
--send_only \
--msg "$1, $NAME"