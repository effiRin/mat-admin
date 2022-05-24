<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>조회</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item active">조회</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<section class="content">
  <div class="row">
    <div class="col-12">
      <div class="form-group">
        <a href="/board/list" class="btn btn-secondary">목록</a>
        <button class="btn bg-gradient-info float-right" style="margin-right: 1em">
          <i class="fas fa-pen"></i>수정</button>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="card card-primary card-outline">
        <div class="card-body" style="display: block;">
            <div class="form-group" style="display: flex">
              <label for="inputName" style="width: 10vw;">제목</label>
              <input type="text" id="inputName" name="title" class="for m-control" style="margin-right: 2vw; width: 1800px;"
              value='<c:out value="${board.title}"/>' readonly="readonly">
              <label for="inputName" style="width: 10vw;">닉네임</label>
              <input type="text" name="nickname" class="form-control" value='<c:out value="${board.nickname}"/>' readonly="readonly">
            </div>
            <input type="hidden" value="kim" name="id">
            <div class="form-group board">
              <label for="inputDescription">내용</label>
              <textarea id="inputDescription" class="form-control" rows="5" readonly="readonly"><c:out value="${board.content}"/></textarea>
            </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="card card-info">
        <div class="card-header">
          <h3 class="card-title">댓글</h3>
        </div>
        <div class="replyDIV" style="padding-bottom: 13px; padding-top:13px">
        </div>
        <ul class="pageUL"></ul>

<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal.profile" var="profile" />
  <sec:authentication property="principal.nickname" var="nickname" />
  <sec:authentication property="principal.id" var="id" />
  <div>
  <div style="display: flex">
  <textarea class="form-control" type="text" name="content" placeholder="댓글 작성 시 타인에 대한 배려와 책임을 담아주세요" style="width: 85vw; "></textarea>
  <button class="addReplyBtn" href="#!" style="width: 10vw; margin-left: 10px; border-style: none">등록</button></div>
  <div><input type="hidden" name="id" value="${id}"></div>
  <div><input type="hidden" name="nickname" value="${nickname}"></div>
  <div><input type="hidden" name="profile" value="${profile}"></div>
  <div class="image-upload">
  <i class="fas fa-solid fa-image"></i>
  <input id="file-input" type="file" name="upload" onchange="readURL(this)" class="uploadFile" style="display: none;"/>
  <img class="viewImage" style="display: inline-table"> 여기 </img>
  </div>

  <div class="card-body" style="display: block;">
    <div class="uploadInputDiv">
      <input type="file" name="upload" multiple class="uploadFile">
      <button class="btn bg-gradient-info float-right file-add uploadBtn">업로드</button>
    </div>
  </div>
    <div class="uploadResult">
    </div>

  </div>

</sec:authorize>
        <a class="badge bg-secondary text-decoration-none link-light removeReplyBtn" href="#!">삭제</a>
      </div>
    </div>
  </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</div>

</div>
<style>
    .file-list {
        list-style: none;
    }
</style>

<script type="text/javascript">
    document.querySelector(".file-add").addEventListener("click",(e) =>{
        console.log("123")
        const fileInput = document.querySelector(".file-list");
        //
        fileInput.innerHTML += "<li><input type='file'></li>";
    },false);

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

<%-- Axios --%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

    /* 댓글 */
    let initState = {
        boardSeq :${board.boardSeq},
        replyArr : [],
        replyCount : 0,
        size : 50,
        pageNum : 1
    }

    const imageDiv = document.querySelector(".imageDiv")
    const replyDIV = document.querySelector(".replyDIV")
    const pageUL = document.querySelector(".pageUL")
    const secondReplyDIV  = document.querySelector(".secondReplyDIV")

    document.querySelector(".addReplyBtn").addEventListener("click", (e) => {

        e.preventDefault()
        e.stopPropagation()

        const replyObj = {
            boardSeq:${board.boardSeq},
            content: document.querySelector("textarea[name='content']").value,
            id:document.querySelector("input[name='id']").value,
            nickname:document.querySelector("input[name='nickname']").value,
            profile:document.querySelector("input[name='profile']").value
        }

        console.log(replyObj)

        replyService.addServerReply(replyObj)

        document.querySelector("textarea[name='content']").value="";

    },false)



    function render(obj){
        console.dir(obj)
        //console.log("render.....")

        function printList(){
            const arr = obj.replyArr

            replyDIV.innerHTML = arr.map(reply =>
                `<div class="d-flex replyRead" style="\${reply.root}; padding-bottom: 7px; padding-top:7px">
                <div class="flex-shrink-0" style="display: table-cell">
                    <img class="rounded-circle" style="width: 50px; height: 50px; display: table-cell" src=\${reply.profile} alt="..." /></div>
                <div class="ms-3 replyContent" style="margin-left: 10px">
                    <div class="fw-bold" style="font-weight: bolder">\${reply.nickname}</div>
                    <div class="replyUL" style="padding-left:1px; display: table-cell">\${reply.content}\${reply.image}</div>
                    \${reply.buttonIcon}
                </div>
                <ul class="regDate" style="position:absolute; right: 5%;font-size: 13px">\${reply.dateStr}
                    <i class="fas fa-solid fa-bars modBtn" data-replySeq=\${reply.replySeq} style="margin-left: 10px"></i></ul><br><br>
            </div>
        `).join(" ")


        }

        function printPage(){
            const currentPage = obj.pageNum
            const size = obj.size

            let endPage = Math.ceil(currentPage/10)*10
            const startPage = endPage-9;

            //이전 페이지 startPage가 1이 아니면 보이기
            const prev = startPage != 1
            endPage = obj.replyCount < endPage * obj.size? Math.ceil(obj.replyCount/obj.size) : endPage

            //다음 페이지
            //endPage * obj.size가 replyCount 보다 크다면 다음페이지 존재
            const next = obj.replyCount > endPage * obj.size

            //console.log("startPage:",startPage, "endPage",endPage, "currentPage",currentPage)
            let str = ''
            if(prev){
                str += `<li data-num=\${startPage-1}>이전</li>`
            }

            for(let i = startPage; i <= endPage; i++){
                if(i===currentPage){
                    str += `<li data-num=\${i} style="color:#e54545; cursor:default">\${i}</li>`
                }else{
                    str += `<li data-num=\${i}>\${i}</li>`
                }
            }
            if(next){
                str += `<li data-num=\${endPage+1}>다음</li>`
            }

            pageUL.innerHTML = str

        }

        printList()
        printPage()
    }


    const replyService = (function (initState, callbackFn){
        let state = initState
        const callback = callbackFn

        const setState = (newState)=> {
            state = {...state, ...newState} //전개연산자를 이용하여 스테이트 상태값을 변경시키기

            //여기서 비동기를 들어가서 자동으로 바뀌도록 하자!
            console.log(state)

            //newState 안에 replyCount 값 속성이나 pageNum 속성이 있다면!
            if(newState.replyCount || newState.pageNum ){
                //서버의 데이터를 가져와야만 한다
                getServerList(newState)
            }
            callback(state)
        }

        async function getServerList(newState){

            let pageNum
            //setState가 아니다 setState를 하게 되면 랜더링이 일어나고, 이건 그냥 내부값을 바꾸는 것...
            //replyCount.. 지금처럼 하면 ... 나중에 댓글 삭제 할 때 문제가 될 거야...

            if(newState.pageNum){
                pageNum = newState.pageNum
            }else{
                pageNum = Math.ceil(state.replyCount/state.size)
            }

            const paramObj = {page:pageNum, size:state.size}
            const res = await axios.get(`/replies/list/\${state.boardSeq}`, {params: paramObj})
            console.log(res.data)

            //pageNum setState의 넘기면 안돼...

            state.pageNum = pageNum
            // 일단 수동으로 수정

            setState({replyArr:res.data})
        }


        async function addServerReply(replyObj){
            // console.log('async')
            // console.log(replyObj)
            try {
                const res = await axios.post(`/replies/`, replyObj)
                const data = res.data
                console.log("addReplyResult:", data)

                setState({replyCount: data.result})
            }catch(error) {

                //console.log("--------------------------")
                //console.log(error.response.data)
            }
        }

        function findReply(replySeq){
            return state.replyArr.find(reply => reply.replySeq === replySeq)
        }

        async function removeServer(replySeq){
            const res = await axios.delete(`/replies/\${replySeq}`);

            //success
            const result = res.data.result
            return result
        }
        return {setState, addServerReply, findReply ,removeServer}

    })(initState, render)


    replyService.setState({replyCount: ${board.replyCount}})

</script>

<style>
    .replyDIV{
        list-style: none;
    }

    .pageUL{
        list-style: none;
        display: flex;
        margin-left: auto;
        margin-right: auto
    }

    .pageUL li{
        list-style: none;
        margin: 0.2em;
        cursor: pointer;
        font-size: 20px;
    }

    .secondReply{
        font-size: 10px;
        background-color: unset;
        color: darkcyan;
        border-color: white;
    }

</style>
