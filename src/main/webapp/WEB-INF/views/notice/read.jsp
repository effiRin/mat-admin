<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"></h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
</div>

<div class="row">
    <section class="content-header" style="margin-left: 10px; width: 300px;">
        <div class="container-fluid">
            <div class="row mb-2" >
                <div class="col-sm-6" style="">
                    <ol class="breadcrumb float-sm-right" >
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active"><a href="/notice/list?page=${listDTO.page}&size=${listDTO.size}" style="color:#3c3b3b;">공지 목록</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>


    <div class="col-md-12">
        <div class="card card-primary card-outline">
            <div class="card-body" style="display: block;">
                <div class="form-group" style="display: flex">
                    <label style="width: 7vw;">제 목</label>
                    <c:out value="${dto.title}"></c:out>
                    <label style="width: 10vw;  margin-left: 5vw;">닉네임</label>
                    <c:out value="${dto.nickName}"></c:out>
                    <label style="width: 10vw; margin-left: 5vw;">등록일</label>
                    <c:out value="${dto.regDate}"></c:out>
                </div>
                <div class="form-group">
                    <label for="inputDescription">내용</label>
                    <textarea id="inputDescription" class="form-control inputContent" rows="5" readonly><c:out value="${dto.content}"></c:out></textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="card card-info card-body" id="replyArea">
            <div class="card-header">
                <h3 class="card-title">댓글</h3>
            </div>
            <div class="replyDIV" style="padding-bottom: 13px; padding-top:13px">
            </div>
            <ul class="pageUL"></ul>

            <form class="mb-4">
                <div>
                    <div style="display: flex">
                        <textarea class="form-control" type="text" name="content" placeholder="댓글 작성 시 타인에 대한 배려와 책임을 담아주세요" style="width: 85vw; "></textarea>
                        <button class="btn btn-default float-right addReplyBtn" href="#!" style="width: 10vw; margin-left: 10px; border-style: none">등록</button></div>
                    <div><input type="hidden" name="nickName" value="아바라한잔"></div>
                    <div><input type="hidden" name="id" value="aaa14"></div>
                </div>
            </form>
            <a class="badge bg-secondary text-decoration-none link-light removeReplyBtn" href="#!">삭제</a>

        </div>
    </div>
</div>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

<%-- Axios --%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    <%-- 댓글 --%>
    let initState = {
        board_seq :${dto.board_seq},
        replyArr : [],
        replyCount : 0,
        size : 10,
        pageNum : 1
    }

    const replyDIV = document.querySelector(".replyDIV")
    const pageUL = document.querySelector(".pageUL")

    pageUL.addEventListener("click", (e) => {
        if(e.target.tagName != 'LI'){
            return
        }
        const dataNum = parseInt(e.target.getAttribute("data-num"))
        replyService.setState({pageNum:dataNum})
    }, false)

    document.querySelector(".addReplyBtn").addEventListener("click", (e) => {
        const replyObj = {
            board_seq:${dto.board_seq},
            content: document.querySelector("textarea[name='content']").value,
            id:document.querySelector("input[name='id']").value,
            nickName:document.querySelector("input[name='nickName']").value
        }

        replyService.addServerReply(replyObj)

    },false)

    const modReplyContent = document.querySelector("input[name='modReplyContent']")
    const modNickNameInput = document.querySelector("input[name='modNickName']")
    const modNickId = document.querySelector("input[name='modId']")
    const removeReplyBtn = document.querySelector(".removeReplyBtn")

    let targetLi;

    replyDIV.addEventListener("click", (e) => {
        if(!e.target.getAttribute("data-reply_seq")){
            return;
        }

        targetLi = e.target.closest("li")
        const reply_seq = parseInt(e.target.getAttribute("data-reply_seq"))

        const replyObj = replyService.findReply(reply_seq)
        modReplyContent.value = replyObj.content
        modNickNameInput.value = replyObj.nickName
        modNickId.value = replyObj.id
        removeReplyBtn.setAttribute("data-reply_seq", reply_seq)

    },false)

    removeReplyBtn.addEventListener("click", (e) => {
        const reply_seq = parseInt(e.target.getAttribute("data-reply_seq"))

        replyService.removeServer(reply_seq).then(result => {
            targetLi.innerHTML = "삭제된 댓글입니다."
        })
    }, false)


    function render(obj){
        console.dir(obj)
        //console.log("render.....")

        function printList(){
            const arr = obj.replyArr


            replyDIV.innerHTML = arr.map(reply =>
                 `<div class="d-flex replyRead" style="padding-bottom: 7px; padding-top:7px">
                <div class="flex-shrink-0" style="display: table-cell">
                    <img class="rounded-circle" style="width: 50px; height: 50px; display: table-cell" src="/resources/image/person.png" alt="..." /></div>
                <div class="ms-3 replyContent" style="margin-left: 10px">
                    <div class="fw-bold" style="font-weight: bolder">\${reply.nickName}</div>
                    <div class="replyUL" style="padding-left:1px; display: table-cell">\${reply.content}</div>
                </div>
                <ul class="regDate" style="position:absolute; right: 5%;font-size: 13px">\${reply.regDate}
                    <i class="fas fa-solid fa-bars modBtn" data-reply_seq=\${reply.reply_seq} style="margin-left: 10px"></i></ul><br><br>
            </div>`).join(" ")
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





    /* ---Aios 통신 부분-----------------------------------------------------------------*/

    //오늘은 그냥 객체로
    const replyService = (function (initState, callbackFn){
        let state = initState
        const callback = callbackFn

        const setState = (newState)=> {
            state = {...state, ...newState} //전개연산자를 이용하여 스테이트 상태값을 변경시키기

            //여기서 비동기를 들어가서 자동으로 바뀌도록 하자!
            //console.log(state)

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
            const res = await axios.get(`/replies/list/\${state.board_seq}`, {params: paramObj})
            console.log(res.data)

            //pageNum setState의 넘기면 안돼...

            state.pageNum = pageNum
            // 일단 수동으로 수정

            setState({replyArr:res.data})
            //호출이 되는 지 확인

        }

        //View 를 하는데 있어서 model 데이터 ViewModel

        async function addServerReply(replyObj){
            const res = await axios.post(`/replies/`, replyObj)
            const data = res.data
            //console.log("addReplyResult:",data)

            setState({replyCount: data.result})
        }

        function findReply(reply_seq){
            return state.replyArr.find(reply => reply.reply_seq === reply_seq)
        }

        async function removeServer(reply_seq){
            const res = await axios.delete(`/replies/\${reply_seq}`);

            //success
            const result = res.data.result
            return result
        }

        return {setState, addServerReply, findReply ,removeServer}

    })(initState, render)


    replyService.setState({replyCount: ${dto.replyCount}})

</script>

    <style>
        .replyDIV{
            list-style: none;
        }

        .pageUL{
            list-style: none;
            display:flex;
        }

        .pageUL li{
            list-style: none;
            margin : 0.2em;
            border: 1px solid;
            cursor: pointer;
        }

    </style>
