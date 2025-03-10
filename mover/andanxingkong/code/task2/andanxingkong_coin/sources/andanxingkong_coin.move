module andanxingkong_coin::andanxingkong_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct ANDANXINGKONG_COIN has drop {}

    fun init(
        witness: ANDANXINGKONG_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<ANDANXINGKONG_COIN>(
            witness,
            9,
            b"ANDANXINGKONG",
            b"ANDANXINGKONG_COIN",
            b"andanxingkong Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/149133275"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(
            treasury_cap,
            tx_context::sender(ctx)
        )
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ANDANXINGKONG_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ANDANXINGKONG_COIN>,
        coin: Coin<ANDANXINGKONG_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
