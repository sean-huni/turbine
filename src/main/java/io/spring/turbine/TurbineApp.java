package io.spring.turbine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.netflix.turbine.EnableTurbine;

/**
 * PROJECT   : turbine
 * PACKAGE   : io.spring.turbine
 * USER      : sean
 * DATE      : 15-Sat-Sep-2018
 * TIME      : 18:41
 * E-MAIL    : kudzai@bcs.org
 * CELL      : +27-64-906-8809
 */

@SpringBootApplication
@EnableHystrixDashboard
@EnableTurbine
@EnableEurekaClient
public class TurbineApp {
    public static void main(String[] args) {
        SpringApplication.run(TurbineApp.class, args);
    }
}
