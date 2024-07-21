package kg.kindergarten.kashkaldak.controller;


import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import kg.kindergarten.kashkaldak.dto.request.FormRequest;
import kg.kindergarten.kashkaldak.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/form")
@Tag(name = "Forms")
public class MainController {

    private final FormService formService;

    @PostMapping()
    public ResponseEntity<?> sendForm(@Valid FormRequest formRequest,
                                      BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseEntity.badRequest().body(bindingResult.getAllErrors().stream().map(ObjectError::getDefaultMessage));
        }

        formService.fileMimeTypeChecking(formRequest.getDocs());

        formService.save(formRequest);

        return ResponseEntity.ok("Form saved !");

    }

    @PatchMapping("/{inn}")
    public ResponseEntity<?> updateForm(@PathVariable String inn, FormRequest formRequest) {
        formService.updatePartialForm(inn, formRequest);
        return ResponseEntity.ok("Alles gut !");
    }


    @GetMapping("/byInn/{inn}")
    public ResponseEntity<?> getByInn(@PathVariable("inn") String inn) {
        return ResponseEntity.ok(formService.getByInn(inn));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/{id}")
    public ResponseEntity<?> getFormById(@PathVariable("id") Long id) {
        return ResponseEntity.ok(formService.getById(id));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping()
    public ResponseEntity<?> getForms() {
        return ResponseEntity.ok(formService.findAll());
    }


    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @DeleteMapping("{id}")
    public ResponseEntity<?> deleteForm(@PathVariable Long id) {
        formService.delete(id);
        return ResponseEntity.ok("Form with ID:" + id + " deleted");
    }


}
