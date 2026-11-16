-- Order booker: the assigned shops with name, city and area (no phone number is returned).
-- Run once in the Supabase SQL Editor (project pxbqszxpbreyxtsnslrw).
CREATE OR REPLACE FUNCTION public.aab_booker_shops_info(p jsonb DEFAULT '{}'::jsonb)
 RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path TO 'public'
AS $function$
declare bk text := btrim(coalesce(p->>'p_id',''));
begin
  if not public._aab_auth('booker', bk, p->>'p_h') then return '[]'::jsonb; end if;
  return coalesce((select jsonb_agg(jsonb_build_object('id',a.shop_cid,
                     'name',coalesce(nullif(c.shop_name,''),c.name,a.shop_cid),
                     'city',coalesce(c.shop_city,''),'area',coalesce(c.shop_area,''))
                   order by a.shop_cid)
                   from aab_assign a left join aab_accounts c on c.role='customer' and c.id=a.shop_cid
                   where a.booker_id=bk and a.shop_cid is not null),'[]'::jsonb);
end $function$;
GRANT EXECUTE ON FUNCTION public.aab_booker_shops_info(jsonb) TO anon, authenticated;
