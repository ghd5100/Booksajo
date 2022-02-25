//글쓰기 에디터 javascript
ClassicEditor

.create( document.querySelector( '#textarea' ) )  //''안에는 적용하려는 textarea의 id를 입력해야함

.then( editor => {

console.log( editor );

} )

.catch( error => {

console.error( error );

} );