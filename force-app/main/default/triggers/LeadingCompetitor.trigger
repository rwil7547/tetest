trigger LeadingCompetitor on Opportunity (before insert, before update) {

  for (Opportunity opp : Trigger.new){
    // Add all our prices in a list in order of competitor
    List<Decimal> competitorPrices = new List<Decimal>();
    competitorPrices.add(opp.Competitor_1_Price__c);
    competitorPrices.add(opp.Competitor_2_Price__c);
    competitorPrices.add(opp.Competitor_3_Price__c);
    
    // Add all our competitors in a list in order
    List<String> competitors =  new List<String>();
    competitors.add(opp.Competitor_1__c);
    competitors.add(opp.Competitor_2__c);
    competitors.add(opp.Competitor_3__c);
    
    // Loop thorugh all commpetitors to find the position of the lowest price
    Decimal lowestPrice;
    Integer lowestPricePosition;
    for (Integer i = 0; i < competitorPrices.size(); i++){
        Decimal currentPrice = competitorPrices.get(i);
        if(lowestPrice == null || currentPrice < lowestPrice) {
            lowestPrice = currentPrice;
            lowestPricePosition = i;
            }  
    }  
    
    // Populate the lhighest competitor field with the competitor matching the highest price position
    opp.Leading_Competitor__c = competitors.get(lowestPricePosition);
    
        // Loop thorugh all commpetitors to find the position of the lowest price
    Decimal highestPrice;
    Integer highestPricePosition;
    for (Integer i = 0; i < competitorPrices.size(); i++){
        Decimal currentPrice = competitorPrices.get(i);
        if(highestPrice == null || currentPrice > highestPrice) {
            highestPrice = currentPrice;
            highestPricePosition = i;
            }  
    }  
    
    // Populate the highest competitor field with the competitor matching the lowest price position
    opp.Highest_Competitor__c = competitors.get(highestPricePosition);
  }

}