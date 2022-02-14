/** 원하는 인원클릭 변수 선언  */
let totalNum = 0;
let basicNum = 0;
let studentNum = 0;
let oldNum = 0;
let totalMoney = 0;
let basicMoney = 0;
let studentMoney = 0;
let oldMoney = 0;
let selectedUlAction = '';

/** class로 선언된 값 */
const totalResultPrice = document.querySelector('.selected-price-total');
const totalSelectedNum = document.querySelector('.selected-number');

/** 각각의 li 목록들 가져오기*/
const selectPeopleBasicList = document.querySelectorAll('.select-people-ul-adult li');
const selectPeopleStudentList = document.querySelectorAll('.select-people-ul-student li');
const selectPeopleOldList = document.querySelectorAll('.select-people-ul-old li');

/** 전체 클릭가능한수 36을 초과시 0으로 돌리기위한 선언 */
const selectPeopleBasic = document.querySelectorAll('.select-people-basic');
const selectPeopleStudent = document.querySelectorAll('.select-people-student');
const selectPeopleOld = document.querySelectorAll('.select-people-old');

/**토스트 옵션 설정 */
toastr.options = {
    positionClass: 'toast-top-right',
    progressBar: true,
    timeOut: 1000,
    preventDuplicates: true,
    newestOnTop: true
};

/**클래스 초기화 , 클래스 추가 */
function classAction(list){
    console.log('TEST 1:');
    totalNum=0;
    totalMoney=0;
    list.forEach(li => {
        console.log('TEST 2:');
        cleanList(list, li);
    });

}
function cleanList(list, li){
    console.log('TEST 3:');
    li.addEventListener('click', function() {//먼저 클래스 지워주고 진행
        console.log('TEST 4:');
        list.forEach(li => {
        li.classList.remove('select-people-ul-action');
    });
    li.classList.add('select-people-ul-action');
    selectedUlAction = document.querySelectorAll('.select-people-ul-action');
    selectPeopelUl(selectedUlAction);
    });
}

function selectPeopelUl(selectedUlAction){
    console.log('TdEST 5:');
    selectedUlAction.forEach( li => {
        if(li.parentNode.classList.contains('select-people-ul-adult')){
            basicNum = Number(li.innerHTML);
            basicMoney = 17000 * basicNum;
            totalMoney = basicMoney + studentMoney + oldMoney;
            totalNum = basicNum + studentNum + oldNum;
            totalResultPrice.innerHTML = '17000 X '+basicNum+' = '+ basicMoney +'원'+'<br>';

            if(totalNum > 37){
                li.classList.remove('select-people-ul-action');
                totalMoney -= basicMoney;
                totalNum -= basicNum;
                selectPeopleBasic[0].classList.add('select-people-ul-action');
                totalResultPrice.innerHTML = totalMoney + ' 원';

            }
        }else if(li.parentNode.classList.contains('select-people-ul-student')){
            studentNum = Number(li.innerHTML);
            studentMoney = 11000 * studentNum;
            totalMoney = basicMoney + studentMoney + oldMoney;
            totalNum = basicNum + studentNum + oldNum;
            totalResultPrice.innerHTML = '11000 X '+studentNum+' = '+studentMoney +'원'+'<br>';

            if(totalNum > 37){
                li.classList.remove('select-people-ul-action');
                totalMoney -= studentMoney;
                totalNum -= studentNum;
                selectPeopleStudent[0].classList.add('select-people-ul-action');
                totalResultPrice.innerHTML = totalMoney + ' 원';
            }
        }else if(li.parentNode.classList.contains('select-people-ul-old')){
            oldNum = Number(li.innerHTML);
            oldMoney = 11000 * oldNum;
            totalMoney = basicMoney + studentMoney + oldMoney;
            totalNum = basicNum + studentNum + oldNum;
            totalResultPrice.innerHTML = '11000 X '+oldNum+' = '+oldMoney +'원'+'<br>';

            if(totalNum > 37){
                li.classList.remove('select-people-ul-action');
                totalMoney -= oldMoney;
                totalNum -= oldNum;
                selectPeopleOld[0].classList.add('select-people-ul-action');
                totalResultPrice.innerHTML = totalMoney + ' 원';
            }
        }
           totalResultPrice.innerHTML = ' 일반 : 17000 X '+basicNum+' = '+ basicMoney +'원'+'<br>'+
                                   	    ' 청소년 : 11000 X '+studentNum+' = '+studentMoney +'원'+'<br>'+
                                        ' 경로 : 11000 X '+oldNum+' = '+oldMoney +'원'+'<br>'+'전체금액 :'+totalMoney + ' 원';
        


        if(totalNum > 16){
            li.classList.remove('select-people-ul-action');
            toastr.error(
                '<div>인원수 선택을 초과하였습니다. *최대6명~!</div>',
                '<div>인원수 확인해주세요.</div>',
                {timeOut: 4000}
            );
        }
    

    });
}
classAction(selectPeopleBasicList);
classAction(selectPeopleStudentList);
classAction(selectPeopleOldList);