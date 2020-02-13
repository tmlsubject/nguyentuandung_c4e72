//let a=true
  //      console.log("3"==3)
    //    let b=false
      //  for(let i=1;i<3;i++){
        //    console.log(i)
        //}
      //  nam=prompt('dien nam sinh')
      //  age=2020-nam
        //if(age<18){
          //  console.log('cut con me may di ti tuoi deo hoc')
        //}else if(age<22) {
       // console.log('vao di ban hien :D')
        //else{
          //  console.log('hihi')
        //}
        //console.log(age)
        a=Number( prompt('dien so a'))
        b=Number(prompt('dien so b'))
        c=Number(prompt('dien so c'))
        let d=b**2-4*a*c
        let e=(-b)/(2*a)
        let f=(-b+d**0.5)/(2*a)
        let g=(-b-d**0.5)/(2*a)
        if(d<0){
            console.log('vo nghiem'+'   '+'delta'+d)
            

        } else if(d==0){
           
                console.log('co 1 nghiem'+' '+'delta'+d+' '+e)
                
            } else {
                console.log('co 2 nghiem'+'  '+'delta'+' '+d+' '+'nghiem 1'+' '+f+' '+'nghiem 2'+' '+g)//string formating
            }
        