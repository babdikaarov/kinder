package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.dto.request.SignInRequest;
import kg.kindergarten.kashkaldak.dto.response.SignInResponse;
import org.springframework.stereotype.Service;

@Service
public interface AuthenticationService {
    SignInResponse signIn(SignInRequest signInRequest);

}
