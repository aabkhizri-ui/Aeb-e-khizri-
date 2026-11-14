-- Order booker: placing orders for shops, and the booker's own order list.
-- Run this once in the Supabase SQL Editor (project pxbqszxpbreyxtsnslrw).

ALTER TABLE aab_orders ADD COLUMN IF NOT EXISTS booked_by text,
  ADD COLUMN IF NOT EXISTS unplanned boolean NOT NULL DEFAULT false;

-- The booker places an order for a shop.
-- Assigned shops are allowed; any other shop only as 'unplanned'.
-- The order goes through the same placement as the shopkeeper's own order,
-- so the rate, discount and tokens apply the same way.
CREATE OR REPLACE FUNCTION public.aab_booker_place(p jsonb DEFAULT '{}'::jsonb)
 RETURNS text LANGUAGE plpgsql SECURITY DEFINER SET search_path TO 'public'
AS $function$
declare bk text := btrim(coalesce(p->>'p_id','')); shop text := btrim(coalesce(p->>'p_shop',''));
        pw text; nm text; oid text; body jsonb;
        addr text; unpl boolean := coalesce((p->>'p_unplanned')::boolean,false);
        tok int := coalesce((p->>'p_tok')::int,0); q int := coalesce((p->>'p_qty')::int,0);
begin
  if not public._aab_auth('booker', bk, p->>'p_h') then return 'denied'; end if;
  select a.pw, a.name into pw, nm from aab_accounts a where a.role='customer' and a.id=shop;
  if pw is null or pw='' then return 'noshop'; end if;
  if not unpl and not exists(select 1 from aab_assign s where s.booker_id=bk and s.shop_cid=shop) then
    return 'notassigned';
  end if;
  if q < 1 then return 'bad'; end if;
  addr := nullif(btrim(coalesce(p->>'p_addr','')),'');
  if addr is null then
    select o.addr into addr from aab_orders o where o.cid=shop order by o.created desc limit 1;
  end if;
  if addr is null or addr='' then return 'noaddr'; end if;
  body := jsonb_build_object('p_id',shop,'p_h',pw,'p_name',coalesce(nm,shop),'p_phone',shop,'p_addr',addr,'p_qty',q);
  oid := public.aab_place(body);
  if oid is null or oid in ('limit','size','bad','min','nopay','txn') then return coalesce(oid,'bad'); end if;
  if tok > 0 then
    perform public.aab_tokens_redeem(jsonb_build_object('p_id',shop,'p_h',pw,'p_oid',oid,'p_tok',tok));
  end if;
  update aab_orders set booked_by=bk, unplanned=unpl where id=oid;
  return oid;
end $function$;
GRANT EXECUTE ON FUNCTION public.aab_booker_place(jsonb) TO anon, authenticated;

-- The booker sees the orders he booked.
CREATE OR REPLACE FUNCTION public.aab_booker_orders(p jsonb DEFAULT '{}'::jsonb)
 RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path TO 'public'
AS $function$
begin
  if not public._aab_auth('booker', btrim(coalesce(p->>'p_id','')), p->>'p_h') then return '[]'::jsonb; end if;
  return coalesce((select jsonb_agg(jsonb_build_object('id',o.id,'shop',o.cid,'qty',o.qty,'total',o.total,
                     'status',o.status,'ship',o.ship_st,'unplanned',o.unplanned,'created',o.created) order by o.created desc)
                   from aab_orders o where o.booked_by=btrim(coalesce(p->>'p_id',''))),'[]'::jsonb);
end $function$;
GRANT EXECUTE ON FUNCTION public.aab_booker_orders(jsonb) TO anon, authenticated;
