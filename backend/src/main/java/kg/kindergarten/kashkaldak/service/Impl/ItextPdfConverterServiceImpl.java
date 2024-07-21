package kg.kindergarten.kashkaldak.service.Impl;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.itextpdf.layout.property.VerticalAlignment;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.service.ItextPdfConverterService;
import kg.kindergarten.kashkaldak.service.MakingDirectoryService;
import lombok.RequiredArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
public class ItextPdfConverterServiceImpl implements ItextPdfConverterService {

    @Override
    public List<kg.kindergarten.kashkaldak.entity.Document> convertImageToPdf(Map<DocumentTypes, List<File>> imageFiles, Form form) throws IOException {
        List<kg.kindergarten.kashkaldak.entity.Document> documentList = new ArrayList<>();
        for (DocumentTypes documentTypes : imageFiles.keySet()) {
            List<File> list = imageFiles.get(documentTypes);
            String absolutePath = MakingDirectoryService.makingDirectory(form.getInn(), documentTypes);
            PdfWriter writer = new PdfWriter(absolutePath);
            PdfDocument pdfDocument = new PdfDocument(writer);
            Document doc = new Document(pdfDocument);

            float imagesPerRow = 2.5f; // Количество изображений в одной строке
            float pageWidth = pdfDocument.getDefaultPageSize().getWidth(); // Ширина страницы
            float imageWidth = pageWidth / imagesPerRow;

            // Создаем таблицу с одной строкой и нужным количеством столбцов
            Table table = new Table(new float[]{imageWidth, imageWidth}); // 2 столбца
            table.setWidth(UnitValue.createPercentValue(100));
            table.setHorizontalAlignment(HorizontalAlignment.CENTER);

            int imagesAdded = 0;
            for (File imageFile : list) {
                Thumbnails.of(imageFile)
                        .scale(0.4)
                        .outputQuality(1)
                        .toFile(imageFile);
                ImageData imageData = ImageDataFactory.create(imageFile.getAbsolutePath());

                Image image = new Image(imageData);
                image.setWidth(UnitValue.createPointValue(imageWidth));

                // Добавляем изображение в ячейку таблицы
                Cell cell = new Cell();
                cell.setHorizontalAlignment(HorizontalAlignment.CENTER);
                cell.setVerticalAlignment(VerticalAlignment.MIDDLE);
                cell.add(image);
                cell.setBorder(Border.NO_BORDER);
                table.addCell(cell);

                FileUtils.forceDelete(imageFile);
                imagesAdded++;
            }

            // Добавляем пустую ячейку, если изображений нечетное количество
            if (imagesAdded % 2 != 0) {
                Cell emptyCell = new Cell();
                emptyCell.setBorder(Border.NO_BORDER);
                table.addCell(emptyCell);
            }

            kg.kindergarten.kashkaldak.entity.Document document = new kg.kindergarten.kashkaldak.entity.Document();
            document.setForm(form);
            document.setDocumentTypes(documentTypes);
            document.setPath(absolutePath);
            document.setName(documentTypes.name().toLowerCase() + ".pdf");
            documentList.add(document);
            doc.add(table);
            doc.close();
        }

        return documentList;
    }

    @Async
    @Override
    public CompletableFuture<List<kg.kindergarten.kashkaldak.entity.Document>> convertImageToPdfAsync(Map<DocumentTypes, List<File>> imageFiles, Form form) {
        try {
            List<kg.kindergarten.kashkaldak.entity.Document> documents = convertImageToPdf(imageFiles, form);
            return CompletableFuture.completedFuture(documents);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
