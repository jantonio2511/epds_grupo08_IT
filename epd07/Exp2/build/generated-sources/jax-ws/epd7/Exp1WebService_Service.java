
package epd7;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "exp1WebService", targetNamespace = "http://epd7/", wsdlLocation = "http://localhost:8080/Ex1/exp1WebService?WSDL")
public class Exp1WebService_Service
    extends Service
{

    private final static URL EXP1WEBSERVICE_WSDL_LOCATION;
    private final static WebServiceException EXP1WEBSERVICE_EXCEPTION;
    private final static QName EXP1WEBSERVICE_QNAME = new QName("http://epd7/", "exp1WebService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/Ex1/exp1WebService?WSDL");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        EXP1WEBSERVICE_WSDL_LOCATION = url;
        EXP1WEBSERVICE_EXCEPTION = e;
    }

    public Exp1WebService_Service() {
        super(__getWsdlLocation(), EXP1WEBSERVICE_QNAME);
    }

    public Exp1WebService_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), EXP1WEBSERVICE_QNAME, features);
    }

    public Exp1WebService_Service(URL wsdlLocation) {
        super(wsdlLocation, EXP1WEBSERVICE_QNAME);
    }

    public Exp1WebService_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, EXP1WEBSERVICE_QNAME, features);
    }

    public Exp1WebService_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public Exp1WebService_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns Exp1WebService
     */
    @WebEndpoint(name = "exp1WebServicePort")
    public Exp1WebService getExp1WebServicePort() {
        return super.getPort(new QName("http://epd7/", "exp1WebServicePort"), Exp1WebService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns Exp1WebService
     */
    @WebEndpoint(name = "exp1WebServicePort")
    public Exp1WebService getExp1WebServicePort(WebServiceFeature... features) {
        return super.getPort(new QName("http://epd7/", "exp1WebServicePort"), Exp1WebService.class, features);
    }

    private static URL __getWsdlLocation() {
        if (EXP1WEBSERVICE_EXCEPTION!= null) {
            throw EXP1WEBSERVICE_EXCEPTION;
        }
        return EXP1WEBSERVICE_WSDL_LOCATION;
    }

}