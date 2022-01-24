package com.yandex.practicum.devops.task;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;

import static org.mockito.Mockito.*;

class ReportGeneratorTaskTest {
    private final ReportGeneratorTask reportGeneratorTask = new ReportGeneratorTask();
    Logger reporter;
    Logger logger;

    @BeforeEach
    void setUp() {
        reporter = mock(Logger.class);
        logger = mock(Logger.class);
        
        reportGeneratorTask.reporter = reporter;
        reportGeneratorTask.logger = logger;
    }

    @Test
    void shouldGenerateReport() {
        // when
        reportGeneratorTask.generate();

        // then
        verify(reporter, times(5)).info(anyString());
        verify(logger, only()).info(anyString());
    }
}