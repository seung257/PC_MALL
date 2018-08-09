<%@ page contentType="text/html;charset=UTF-8" %>
<HTML>
   <HEAD>
      <TITLE> 신규회원 가입화면</TITLE>
   </HEAD>
<script language="JavaScript">
	var msg;
	function form_check()	
	{
		
		var form = document.form_name;
		msg = "== 가입시 오류 사항 ==\n\n";
		
		if(form.name.value=="")
			msg += "회원 성명을 입력하세요.\n\n";
		
		if(form.uid.value=="")
			msg += "회원ID를 입력하세요.\n\n";
		
		else if(form.uid.value.length < 5)
			msg += "회원ID는 5자 이상 입력하셔야 합니다.\n\n";
		
		else if(!a_or_d(form.uid.value))
			msg += "회원ID는 영문이나 숫자로 입력하셔야 합니다.\n\n";
		
		if(form.pwd.value=="")
			msg += "비밀번호를 입력하세요.\n\n";
		 
		else if(form.pwd.value.length < 5)
			msg += "비밀번호는 4자 이상 입력하셔야 합니다.\n\n";
		
		else if(!a_or_d(form.pwd.value))
			msg += "비밀번호는 영문이나 숫자로 입력하셔야 합니다.\n\n";
		
		if(form.pwd.value != form.repwd.value)
			msg += "비밀번호와 비밀번호확인의 값이 서로 같지 않습니다.\n\n";
		
		if(form.ssn1.value == "")
			msg += "주민등록번호를 입력하세요.\n\n";
	
		if(msg == "== 가입시 오류 사항 ==\n\n") { 
			form.submit();
		} else {
			alert(msg);
			return;
		}
	}

	// 숫자와 영문 입력 체크
	function a_or_d(str) {
		lower_str = str.toLowerCase();
		for(i=0; i<lower_str.length; i++) {
			ch = lower_str.charAt(i);
			if(((ch < 'a') || (ch > 'z')) && ((ch < '0') ||(ch > '9')))
				return 0;
		}
		return 1;
	}

	// ID 공백 체크
	function openuid_check() {
		 if (document.form_name.uid.value == "") {
			 alert("아이디를 입력하세요");
			return;
		 }
		 url = "id_check.jsp?uid=" + 
		document.form_name.uid.value ;
		open(url, "id_repeat_check", "width=300, height=220");
	}
</script>
     
<BODY bgcolor="#EEEEE0">
	<br>
	<table border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>회 원 가 입</b></td>
		</tr>
	</table>
	<br>
	<form name=form_name method=post action="insert.jsp">
	<table border=1 cellpadding=3 cellspacing=0 width=550 valign=top align=center>
		<tr>
			<td width=90 bgcolor=#ccffff> 회원 성명<font color=red> *</font></td>
			<td width=340 bgcolor=white>
				<input type=text name=name size=20 maxlength=20 value="">&nbsp성명은 빈칸없이 입력하세요.
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 주민등록번호<font color=red> *</font></td>
			<td bgcolor=white>
				<input type=text name=ssn1 size=6 maxlength=6 value=""> - 
				<input type=text name=ssn2 size=7 maxlength=7 value="">
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 회원 id<font color=red> *</font></td>
			<td bgcolor=white align=absmiddle>
				<input type=text name=uid size=10 maxlength=16 >
				<input type="button" name="id_chk" value="ID중복 체크" OnClick="openuid_check(document.form_name.uid.value)">
        &nbsp;	5자 이상의 영문이나 숫자로 입력하세요.</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 비밀번호<font color=red> *</font></td>
			<td bgcolor=white>
				<input type=password name=pwd size=8 maxlength=12">
				&nbsp;5자 이상의 영문이나 숫자로 입력하세요.
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 비밀번호확인<font color=red> *</font></td>
			<td bgcolor=white><input type=password name=repwd size=8 maxlength=12 value="" style="width:80">&nbsp다시 한번 입력해 주세요. </td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 우편번호</td>
			<td bgcolor=white>
				<table cellspacing=0 cellpadding=0>
					<tr>
						<td><input type=text name=zip1 size=3 maxlength=3 > -
                  			<input type=text name=zip2 size=3 maxlength=3>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 주소</td>
			<td bgcolor=white><input type=text name=addr size=50 maxlength=60 value=""></td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 전화번호</td>
			<td bgcolor=white>
				<input type=text name=tel1 size=4 maxlength=4 value=""> - 
				<input type=text name=tel2 size=4 maxlength=4 value=""> -
				<input type=text name=tel3 size=4 maxlength=4 value="">
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> e-mail</td>
			<td bgcolor=white valign=middle>
				<input type=text name=email size=30 maxlength=30 value=""></td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> 직업</td>
			<td bgcolor=white>
				<select name=job class="formbox">
 					<option value="0">선택하세요 ---
	 				<option value="학생">학생
 					<option value="교원">교원
 					<option value="회사원">회사원
 					<option value="공무원">공무원
 					<option value="의료인">의료인
	 				<option value="법조인">법조인
 					<option value="주부">주부
 					<option value="기타">기타
				</select>
			</td>                
		</tr>
		<tr bgcolor=#00FF00>
			<td colspan=3 align=left><font color=red> * </font><font color=black>표시항목은 반드시 입력하십시요.</font>&nbsp;&nbsp;
				<input type="button" name="formcheck" value="가   입" OnClick="form_check()">
				<input type="reset" value="취  소">
			</td>
		</tr>
	</table>
	</form>
	</center>
</BODY>
</HTML>