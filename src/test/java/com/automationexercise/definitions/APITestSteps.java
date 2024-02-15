package com.automationexercise.definitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import org.junit.Assert;

public class APITestSteps {
    @When("I send a GET request to {string}")
    public void iSendAGETRequestTo(String endpoint) {
        SerenityRest.when().get(endpoint);
    }

    @When("I send a POST request to {string}")
    public void iSendAPOSTRequestTo(String endpoint) {
        SerenityRest.when().post(endpoint);
    }

    // Add more step definitions as needed later

    @Then("the response code should be {int}")
    public void theResponseCodeShouldBe(int expectedStatusCode) {
        int actualStatusCode = SerenityRest.then().extract().statusCode();
        Assert.assertEquals(expectedStatusCode, actualStatusCode);
    }

    @Then("the response should contain {string}")
    public void theResponseShouldContain(String expectedResponse) {
        String actualResponse = SerenityRest.then().extract().asString();
        Assert.assertTrue(actualResponse.contains(expectedResponse));
    }

    @Then("the response message should be {string}")
    public void theResponseMessageShouldBe(String expectedMessage) {
        String actualMessage = SerenityRest.then().extract().asString();
        Assert.assertEquals(expectedMessage, actualMessage);
    }

    // Add more assertion methods as needed later

}
