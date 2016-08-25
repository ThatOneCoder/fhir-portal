package com.leidos.spring.util;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.model.api.BundleEntry;
import ca.uhn.fhir.model.api.IResource;
import ca.uhn.fhir.model.primitive.IdDt;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.model.api.Bundle;
import ca.uhn.fhir.rest.client.IGenericClient;
import ca.uhn.fhir.model.dstu2.resource.ValueSet;
//import org.hl7.fhir.instance.model.ValueSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import java.util.*;

@SuppressWarnings("Duplicates")
@Component
public class FhirUtil {

    @Autowired
    public FhirUtil(MessageSource messageSource) {
        FhirUtil.messageSource = messageSource;
    }

    private static String fhirServerBase;

    @Value("${fhir.server.base}")
    public void setFhirServerBase(String fhirServerBase) {
        FhirUtil.fhirServerBase = fhirServerBase;
    }


    private static MessageSource messageSource;

    public static String getMessage(String messageKey, Object... args) {
        return messageSource.getMessage(messageKey, args, Locale.getDefault());
    }



}
