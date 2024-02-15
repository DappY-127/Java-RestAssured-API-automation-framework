package com.automationexercise.testrunner;
import org.junit.runner.RunWith;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(plugin = { "pretty" }, features = "src/test/resources/features/API.feature", glue = {
        "com.automationexercise.definitions" })
public class SerenityAPITestRunner {
}
