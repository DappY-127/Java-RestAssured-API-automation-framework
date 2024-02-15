package com.automationexercise.definitions;

import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;

public class VerifyLoginSteps {
    @When("I send a POST request to {string} with email {string} and password {string}")
    public void iSendAPOSTRequestToWithUsernameAndPassword(String endpoint, String email, String password) {
        SerenityRest.given().queryParam("email", email).queryParam("password", password).when().post(endpoint);
    }

    // Add more step definitions related to login verification if needed
}
