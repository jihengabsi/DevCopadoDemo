import { LightningElement,track } from 'lwc';
import getRCForCombobox from '@salesforce/apex/comboboxWithDataTableClass.getRCForCombobox';
import getCandidates from '@salesforce/apex/comboboxWithDataTableClass.getCandidates';
import getLateCandidates from '@salesforce/apex/comboboxWithDataTableClass.getLateCandidates';
import getAllCandidates from '@salesforce/apex/comboboxWithDataTableClass.getAllCandidates';


const columns = [
    {label : 'Last Name' , fieldName: 'LastName',type:'url',typeAttributes:{label:{fieldName:'Name'},target:'_blank'}},
    {label : 'First Name' , fieldName: 'First_Name__c'},    
    {label : 'Email', fieldName: 'Email__c'},
    {label : 'Type of diploma', fieldName: 'Type_of_diploma__c'},
    {label : 'Speciality', fieldName: 'Speciality__c'},
    {label : 'University', fieldName: 'University__c'},
    {label : 'Seniority', fieldName: 'Seniority__c'},
]

const columnsLate = [
    {label : 'Last Name' , fieldName: 'LastName',type:'url',typeAttributes:{label:{fieldName:'Name'},target:'_blank'}},
    {label : 'First Name' , fieldName: 'First_Name__c'},    
    {label : 'Email', fieldName: 'Email__c'},
    {label : 'Type of diploma', fieldName: 'Type_of_diploma__c'},
    {label : 'Speciality', fieldName: 'Speciality__c'},
    {label : 'University', fieldName: 'University__c'},
    {label : 'Seniority', fieldName: 'Seniority__c'},
    {label : 'Days after deadline', fieldName: 'Days_after_deadline__c'}
]


export default class ComboboxWithDatatableLwc extends LightningElement {

@track valueoption  = []; //Educational level
@track valueTypeoption  = []; //diploma type
@track value = '';
@track optionsArray = [];
@track cardVisible = false;
@track data = [];
@track latedata = [];
@track alldata = [];
@track columns = columns;
@track columnsLate = columnsLate;

@track Bac5 = false;
@track Bac3 = false;
@track Bac = false;
@track val = 0;
@track sliderValue = 0;
allcandidates;
totalCandidates = 0;
pageSize =10 ;

handleOnClick(event){
    this.cardVisible = true;
    getCandidates({ selectedRcID : this.value, Seniority : this.sliderValue,level:this.valueoption,type:this.valueTypeoption})
    .then( result => {
        let tempRecs =[];
        result.forEach((record) => {
            let tempRec = Object.assign({}, record);
            tempRec.LastName = '/' +tempRec.Id;
            tempRecs.push(tempRec);
        });
        this.data = tempRecs;
    })
    .catch( error => {
        window.alert("error:"+error);
    }
    )
    getLateCandidates({ selectedRcID : this.value, Seniority : this.sliderValue,level:this.valueoption,type:this.valueTypeoption})
    .then( result => {
        let tempRecs =[];
        result.forEach((record) => {
            let tempRec = Object.assign({}, record);
            tempRec.LastName = '/' +tempRec.Id;
            tempRecs.push(tempRec);
        });
        this.latedata = tempRecs;
    })
    .catch( error => {
        window.alert("error:"+error);
    }
    )
   
}
  handleSliderChange(event) {
    this.sliderValue = event.target.value;
  }

get options(){
    return this.optionsArray;
}
get optionsCheck() {
    return [
        { label: 'Bac+5', value: 'Bac+5' },
        { label: 'Bac+3', value: 'Bac+3' },
        { label: 'Bac', value: 'Bac' },
    ];
}
get optionsTypeCheck() {
    return [
        { label: 'Master', value: 'Master' },
        { label: 'Engineering', value: 'Engineering' },
    ];
}

get selectedValues() 
{
    return this.valueoption.push;
}
get selectedTypeValues() {
    return this.valueTypeoption.push;
}
connectedCallback(){

    getRCForCombobox()
    .then(response =>{
        let arr = [];
        for(var i=0; i<response.length ; i++){
            arr.push({ label : response[i].Name , value : response[i].Id})
        }
        this.optionsArray = arr;
    });
    getAllCandidates()
    .then( result => {
        let tempRecs =[];
        this.totalCandidates = result.length; 
        result.forEach((record) => {
            let tempRec = Object.assign({}, record);
            tempRec.LastName = '/' +tempRec.Id;
            tempRecs.push(tempRec);
        });
        this.allcandidates = tempRecs;
        this.alldata = this.allcandidates.slice(0,this.pageSize);
    })
    .catch( error => {
        window.alert("error:"+error);
    }
    )
    
}
handlePagination(event){
    const start = (event.detail-1)*this.pageSize;
    const end = this.pageSize*event.detail;
    console.log(start,end);
    this.alldata = this.allcandidates.slice(start, end);
}
handleTypeChange(event) {
    this.valueTypeoption = event.detail.value; 
}
handleChange(event) {
    this.valueoption = event.detail.value;  
}

handleChangedValue(event){

    this.value = event.detail.value;
}

}