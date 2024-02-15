package com.automationexercise.definitions;

import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;

public class SearchProductSteps {
    @When("I send a POST request to {string} with search_product as {string}")
    public void iSendAPOSTRequestToWithSearchProductAs(String endpoint, String searchProduct) {
        SerenityRest.given().queryParam("search_product", searchProduct).when().post(endpoint);
    }

    // Add more step definitions related to search product if needed
}
