trigger orderTrigger1 on Order(before update) {
    OrderItemUtility.addBonusBouquet(Trigger.new);
}