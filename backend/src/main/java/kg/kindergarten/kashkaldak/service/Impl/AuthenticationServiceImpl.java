package kg.kindergarten.kashkaldak.service.Impl;


import jakarta.annotation.PostConstruct;
import jakarta.transaction.Transactional;
import kg.kindergarten.kashkaldak.config.JwtService;
import kg.kindergarten.kashkaldak.dto.request.SignInRequest;
import kg.kindergarten.kashkaldak.dto.response.SignInResponse;
import kg.kindergarten.kashkaldak.entity.User;
import kg.kindergarten.kashkaldak.enums.Role;
import kg.kindergarten.kashkaldak.exceptions.BadCredentialsException;
import kg.kindergarten.kashkaldak.repository.UserRepository;
import kg.kindergarten.kashkaldak.service.AuthenticationService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthenticationServiceImpl implements AuthenticationService {

    final UserRepository userRepository;

    final PasswordEncoder passwordEncoder;

    final JwtService jwtService;

    final AuthenticationManager authenticationManager;

    @Override
    public SignInResponse signIn(SignInRequest signInRequest) {
        User user = userRepository.getUserByUsername(signInRequest.getUsername()).orElseThrow(() ->
                new BadCredentialsException(String.format("User: %s not found !", signInRequest.getUsername())));

        if (!passwordEncoder.matches(signInRequest.getPassword(), user.getPassword())) {
            log.info("Password incorrect !");
            throw new BadCredentialsException("Password incorrect !");
        }
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        signInRequest.getUsername(),
                        signInRequest.getPassword()));
        String token = jwtService.generateToken(user);
        return SignInResponse.builder()
                .id(user.getId())
                .username(user.getUsername())
                .firstname(user.getFirstName())
                .token(token)
                .role(user.getRole())
                .build();
    }

    @PostConstruct
    public void initSaveAdmin() {
        User user = User.builder()
                .firstName("admin")
                .username("admin")
                .password(passwordEncoder.encode("admin"))
                .role(Role.ADMIN)
                .build();
        if (!userRepository.existsByUsername(user.getUsername())) {
            userRepository.save(user);
            log.info("Admin successfully is saved with ID: %s".formatted(user.getId()));
        }
    }
}
