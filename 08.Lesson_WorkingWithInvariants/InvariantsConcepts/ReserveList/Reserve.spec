
methods {
    getTokenAtIndex(uint256) returns (address) envfree
    getIdOfToken(address) returns (uint256) envfree
    getReserveCount() returns (uint256) envfree

    addReserve(address, address, address, uint256) envfree
    removeReserve(address) envfree
}

// invariant listsCorrelatedInv(address token)
//     getTokenAtIndex(getIdOfToken(token)) == token
invariant idIsUnique(address token, address tokenOther)
    token != tokenOther => getIdOfToken(token) != getIdOfToken(tokenOther)


rule listsCorrelated(env e, method f) {
    address token;
    address tokenOther;
    requireInvariant idIsUnique(token, tokenOther);

    calldataarg args;
    f(e,args);
    assert getTokenAtIndex(getIdOfToken(token)) == token;
}

rule idIsUniqueRule() {
    address t1;
    address t2;
    assert t1 != t2 => getIdOfToken(t1) != getIdOfToken(t2);
}

rule listsCorrelatedWithoutInvariant(env e, method f, address t1, address t2) {
    assert getTokenAtIndex(getIdOfToken(t1)) == t1;
}
