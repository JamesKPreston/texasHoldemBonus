
/// chips_for_amount(total, [denoms])
/// Returns a struct { denoms:[], counts:[], remaining, total_chips }
/// Pass denoms in descending order. Defaults to [100,25,5,1].
function chips_for_amount(_total, _denoms)
{
    var denoms = (argument_count >= 2) ? _denoms : [100, 25, 5, 1];

    var n = array_length(denoms);
    var counts = array_create(n, 0);
    var remaining = max(0, floor(_total));

    for (var i = 0; i < n; i++)
    {
        var v = denoms[i];
        var c = remaining div v;
        counts[i]  = c;
        remaining -= c * v;
    }

    // how many chips total?
    var total_chips = 0;
    for (var j = 0; j < n; j++) total_chips += counts[j];

    return {
        denoms      : denoms,
        counts      : counts,
        remaining   : remaining,    // will be 0 with [100,25,5,1]
        total_chips : total_chips
    };
}


/// expand_chips(change_result) -> ds_list of chip values (caller must destroy)
function expand_chips(_res)
{
    var L = ds_list_create();
    var denoms = _res.denoms;
    var counts = _res.counts;

    for (var i = 0; i < array_length(denoms); i++)
    {
        var v = denoms[i];
        var c = counts[i];
        for (var k = 0; k < c; k++) ds_list_add(L, v);
    }
    return L;
}

