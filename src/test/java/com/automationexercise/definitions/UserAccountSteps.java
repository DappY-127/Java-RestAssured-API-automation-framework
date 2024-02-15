package com.automationexercise.definitions;

import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;

public class UserAccountSteps {

    @When("I send a DELETE request to {string} with email {string} and password {string}")
    public void iSendADELETERequestToWithEmailAndPassword(String endpoint, String email, String password) {
        SerenityRest.given().queryParam("email", email).queryParam("password", password).when().delete(endpoint);
    }

    // Add more step definitions related to user account if needed
}
