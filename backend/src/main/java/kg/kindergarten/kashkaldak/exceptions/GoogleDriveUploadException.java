package kg.kindergarten.kashkaldak.exceptions;

// Классы исключений для специфических ошибок Google Drive
public class GoogleDriveUploadException extends RuntimeException {
    public GoogleDriveUploadException(String message, Throwable cause) {
        super(message, cause);
    }
}
