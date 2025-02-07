pragma solidity ^0.7.0;

library SafeMath {
    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function safeSub(uint256 x, uint256 y) internal pure returns(uint256) {
		assert(x >= y);
		uint256 z = x - y;
		return z;
    }
}

contract Bank {
	using SafeMath for uint256;

    // mapping from a user to its balance
    mapping (address => uint256) private funds;
    // total funds in the bank
	uint256  totalFunds;

    // deposit amount into bank and update the user's balance in the bank accordingly
    function deposit(uint256 amount) public payable {
		funds[msg.sender] = funds[msg.sender].safeAdd(amount);
		totalFunds += totalFunds.safeAdd(amount);
    }
    
    // 
    function transfer(address to, uint256 amount) public {
		require(funds[msg.sender] > amount);
		uint256 fundsTo = funds[to];
		funds[msg.sender] -= amount;
		funds[to] = fundsTo + amount;		
    }

    // withdraw the total balance of user into its personal wallet address
    function withdraw() public returns (bool success)  {
		uint256 amount = getFunds(msg.sender);
		funds[msg.sender] = 0;
		success = msg.sender.send(amount);
		totalFunds -=amount;
    }
	
    // retrieves the user's recorded balance in the bank
	function getFunds(address account) public view returns (uint256) {
		return funds[account];
	}
	
    // retrieves the total funds that the bank stores
	function getTotalFunds() public view returns (uint256) {
		return totalFunds;
	}
	
    // retrieves the account's ETH balance in its personal wallet address
	function getEthBalance(address account) public view returns (uint256){
		return account.balance;
	}
}
