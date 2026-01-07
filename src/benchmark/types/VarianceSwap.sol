<!-- struct VarianceSwap{
    uint8 vegaAmount;
    uint8 varianceAmount;
    uint8 strikePrice; // this is in vol units
    address currencyUnderlyingPair;    
} -->

type VarianceSwap is uint184;

function vega(VarianceSwap) pure returns(uint8){}
function variance(VarianceSwap) pure returns(uint8){}
function strike(VarianceSwap) pure returns(uint8){}
function currencyUnderlyingReference(VarianceSwap) pure returns(address){}


function uniswapV4(VarianceSwap) pure returns(PoolKey memory){}

function algebra(VarianceSwap)  pure returns(address){}


function equity(VarianceSwap varianceSwap, uint8 realizedVol) pure returns(int256 equityAmount){
    equityAmount = Math.mul(
        int256(varianceAmount(varianceSwap)),
        int256(
            Math.sub(
                Math.squared(realizedVol),
                strikePrice(varianceSwap)
            )
        )
    );
}
