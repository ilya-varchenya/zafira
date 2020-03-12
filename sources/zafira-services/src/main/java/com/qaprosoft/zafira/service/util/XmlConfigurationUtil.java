package com.qaprosoft.zafira.service.util;

import com.qaprosoft.zafira.models.db.config.Configuration;
import com.qaprosoft.zafira.service.exception.ProcessingException;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import java.io.ByteArrayInputStream;

import static com.qaprosoft.zafira.service.exception.ProcessingException.ProcessingErrorDetail.UNPROCESSABLE_XML_ENTITY;

public class XmlConfigurationUtil {

    /**
     * Parses configuration xml
     * into Configuration object
     * @param configXML
     * @return Configuration object
     */
    public static Configuration readArguments(String configXML) {
        Configuration configuration = new Configuration();
        try {
            if (!StringUtils.isEmpty(configXML)) {
                ByteArrayInputStream xmlBA = new ByteArrayInputStream(configXML.getBytes());
                configuration = (Configuration) JAXBContext.newInstance(Configuration.class).createUnmarshaller().unmarshal(xmlBA);
                IOUtils.closeQuietly(xmlBA);
            }
        } catch (JAXBException e) {
            throw new ProcessingException(UNPROCESSABLE_XML_ENTITY, "Error parsing XML document", e);
        }
        return configuration;
    }

 }
