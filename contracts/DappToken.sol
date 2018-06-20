pragma solidity ^0.4.1;

contract DappToken {
    
    //ERC20 standard variables
    uint256 public totalSupply;
    string public name = "ERC20Token";
    string public symbol = "ET0";
    uint8 public decimals;

    //Non ERC20 standard variable
    string public standard = "ET0 v1.0";

    mapping(address => uint256) public balanceOf;
    mapping (address=>mapping (address=>uint256)) public allowance;

    //Constructor
    constructor(uint256 _totalSupply) public {
        balanceOf[msg.sender] = _totalSupply;
        totalSupply = _totalSupply;
    }
    
    //Events
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    //Methods
    function transfer(address _to, uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    //Approve and transfer to send on your behalf
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    //Set total number of tokens
    //Read total number of tokens
}