import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    greeting = 'World';
    firstname = '';
    lastname = '';
    changehandler(event){
        this.greeting = event.target.value;
    }
    namechangehandler(event){
        const fieldname = event.target.name;
        if(fieldname == 'firstname'){
            this.firstname = event.target.value;
        }
        if(fieldname == 'lastname'){
            this.lastname = event.target.value;
        }
    }

    get uppercasename(){
        return `${this.firstname} ${this.lastname}`.toUpperCase();
    }

    handleclick(event){
        alert(event.detail);
    }

    clickhandler(){
        this.template.querySelector('c-child-hello-world').displayAlert();
    }
    
}