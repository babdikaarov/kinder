package kg.kindergarten.kashkaldak.dto.response;

import kg.kindergarten.kashkaldak.enums.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SignInResponse {

    Long id;

    String username;

    String firstname;

    String token;

    Role role;

}
