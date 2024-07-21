package kg.kindergarten.kashkaldak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
//@EnableAdminServer
public class KashkaldakApplication {

	public static void main(String[] args) {
		SpringApplication.run(KashkaldakApplication.class, args);
	}

}
