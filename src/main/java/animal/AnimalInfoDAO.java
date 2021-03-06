package animal;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import paging.PagingDAO;

public class AnimalInfoDAO {
	
	private String url;
	private NodeList nList;
	
	public void init() throws ParserConfigurationException, SAXException, IOException {
		PagingDAO pDAO = new PagingDAO();
		this.url = pDAO.createUrl();
		getXML();
	}
	
	public void updateUrl(String url) throws ParserConfigurationException, SAXException, IOException {
		this.url = url;
		getXML();
		
	}
	
	public String getUrl() {
		return url;
	}


	public ArrayList<AnimalInfoVO> getAniInfo() {
		
		ArrayList<AnimalInfoVO> animalList = new ArrayList<AnimalInfoVO>();
		
		for(int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;
				
				
				String age = getTagValue("age", eElement);
				String popfile = getTagValue("popfile", eElement);
				String sexCd = getTagValue("sexCd", eElement);
				String noticeNo = getTagValue("noticeNo", eElement);
				String noticeSdt = getTagValue("noticeSdt", eElement);
				String filename = getTagValue("filename", eElement);
				String neuterYn = getTagValue("neuterYn", eElement);
				String noticeEdt = getTagValue("noticeEdt", eElement);
				String careNm = getTagValue("careNm", eElement);
				String careTel = getTagValue("careTel", eElement);
				String careAddr = getTagValue("careAddr", eElement);
				String chargeNm = getTagValue("chargeNm", eElement);
				String officetel = getTagValue("officetel", eElement);
				String specialMark = getTagValue("specialMark", eElement);
				String happenPlace = getTagValue("happenPlace", eElement);
				String kindCd = getTagValue("kindCd", eElement);
				String colorCd = getTagValue("colorCd", eElement);
				String weight = getTagValue("weight", eElement);
				String happenDt = getTagValue("happenDt", eElement);
				String orgNm = getTagValue("orgNm", eElement);
				String processState = getTagValue("processState", eElement);
			
				AnimalInfoVO aniVO = new AnimalInfoVO(age, popfile, sexCd, noticeNo, noticeSdt, filename, neuterYn, noticeEdt, careNm, careTel, careAddr, 
						chargeNm, officetel, specialMark, happenPlace, kindCd, colorCd, weight,happenDt, orgNm, processState);
				
				animalList.add(i, aniVO);
				
				//System.out.println("---------------------");
				//System.out.println("?????? : " + getTagValue("age", eElement));
				//System.out.println("????????? : " + getTagValue("popfile", eElement));
				//System.out.println("?????? : " + getTagValue("sexCd", eElement)); //M : ?????? F : ?????? Q : ??????
				//System.out.println("??????????????? : " + getTagValue("noticeEdt", eElement));
				//System.out.println("??????????????? : " + getTagValue("careNm", eElement));
				//System.out.println("????????????????????? : " + getTagValue("careTel", eElement));
				//System.out.println("???????????? : " + getTagValue("careAddr", eElement));
				//System.out.println("????????? : " + getTagValue("chargeNm", eElement));
				//System.out.println("?????????????????? : " + getTagValue("officetel", eElement));
				//System.out.println("???????????? : " + getTagValue("specialMark", eElement));
				//System.out.println("???????????? : " + getTagValue("happenPlace", eElement));
				//System.out.println("?????? : " + getTagValue("kindCd", eElement));
				//System.out.println("?????? : " + getTagValue("colorCd", eElement));
				//System.out.println("?????? : " + getTagValue("weight", eElement)); //????????????
				//System.out.println("???????????? : " + getTagValue("noticeNo", eElement));
				//System.out.println("??????????????? : " + getTagValue("noticeSdt", eElement));
				//System.out.println("????????? : " + getTagValue("filename", eElement));
				//System.out.println("????????? ?????? : " + getTagValue("neuterYn", eElement)); //Y : ??? N : ????????? U : ??????
				
			}
		}
		return animalList;
	}
	
    // tag?????? ????????? ???????????? ?????????
	private static String getTagValue(String tag, Element eElement) {
		if(eElement.getElementsByTagName(tag).item(0) == null) {
			return null;
		}
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	
	//XML?????? ?????? ?????????
	private void getXML() throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(this.url);
		
		//doc.getDocumentElement().normalize();
		//System.out.println("????????? ?????? : " + doc.getDocumentElement().getNodeName()); ????????? ?????? : response
		
		this.nList = doc.getElementsByTagName("item");
		//System.out.println("?????? : " + this.nList.getLength()); //?????? ??????
	}
}
