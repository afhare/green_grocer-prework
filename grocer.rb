def consolidate_cart(cart)
  consol_cart = {}
  cart.each do |thing|
    thing.each do |attribute, value|
      if consol_cart[thing] == false 
        consol_cart[thing] ||= {}
        consol_cart[thing][attribute] = value
        consol_cart[thing][count] = 1 
      elsif consol_cart[thing] == true 
        consol_cart[thing] ||= {}
        consol_cart[thing][attribute] = value
        consol_cart[thing][count] +=1
      end
    end
  end
  consol_cart
end

def apply_coupons(cart, coupons)
  
  coupon_cart = {}
 
  cart.each do |item, details|
   coupons.each do |coupon|
     if item == coupon[:item] & details[:count] >= coupon[:num]
       details[:count] = details[:count] - coupon[:num]
       if coupon_cart["#{item} W/COUPON"]
         coupon_cart["#{item} W/COUPON"][:count] += 1 
       else
         coupon_cart["#{item} W/COUPON"] = {
          :price => coupon[:cost],
          :clearance => details[:clearance],
          :count => 1
         }
       end
     end
   end
 coupon_cart[item] = details
 end
 coupon_cart
end

def apply_clearance(cart)
  cart.each do |item, details|
    if cart[item][:clearance] == true
      cart[item][:price] = cart[item][price]* .8
    end
  end
  cart 
end

def checkout(cart, coupons)
  cart = apply_coupons(cart)
  cart = apply_clearance(cart)
  
  subtotal = 0 
  
  cart.each do |item,details|
    total_item_price = details[:price] * details[:count]
    total_item_price.to_f 
    subtotal += total_item_price
    
end
