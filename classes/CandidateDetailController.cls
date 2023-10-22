public class CandidateDetailController {
  public Candidate__c candidate { get; set; }
    public Boolean isPdfGenerated { get; set; }
    public String signatureData { get; set; }
    public String signatureImageURL { get; set; }
    public Boolean showSignatureImage { get; set; }
    public Boolean isSignatureSaved { get; set; }

 

    public CandidateDetailController(ApexPages.StandardController controller) {
        candidate = (Candidate__c) controller.getRecord();
        isPdfGenerated = false;
        showSignatureImage = false;
        isSignatureSaved = false;
    }

   /* public List<Opportunity> getOpportunities() {
        return [SELECT Name, StageName FROM Opportunity WHERE ContractId = :candidate.Id];
    }*/
    public PageReference saveAndAttachPDF() {
         PageReference pageRef = Page.CandidateDetails;
        pageRef.getParameters().put('id', candidate.Id);
        pageRef.getParameters().put('renderAs', 'pdf');

 

        Blob pdfBlob = pageRef.getContentAsPDF();

        // Create an Attachment record and save the PDF
        Attachment attachment = new Attachment();
        attachment.ParentId = candidate.Id;
        attachment.Name = 'Contract.pdf';
        attachment.Body = pdfBlob;
        attachment.ContentType = 'application/pdf';

        insert attachment;

 

        isPdfGenerated = true;
        isSignatureSaved = true;

        pageRef.getParameters().put('pdfGenerated', 'true');
        return new ApexPages.StandardController(candidate).cancel();
    }
        public void saveSignatureInSalesforce() {
        Blob signatureBlob = [SELECT Body FROM StaticResource WHERE Name = 'signaturePad'].Body;

 

        Attachment signatureAttachment = new Attachment();
        signatureAttachment.ParentId = candidate.Id;
        signatureAttachment.Name = 'Signature.png';
        signatureAttachment.Body = signatureBlob;
        signatureAttachment.ContentType = 'image/png';
        insert signatureAttachment;

         update candidate;

 

        isSignatureSaved = true;
    }
}