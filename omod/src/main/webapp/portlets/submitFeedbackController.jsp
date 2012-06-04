<%@ include file="/WEB-INF/template/include.jsp" %>

<script type="text/javascript">
    $(function(){
        $("#feedbackForm").formwizard({
            formPluginEnabled: true,
            validationEnabled: true,
            focusFirstInput : true
        }
                );
    });
</script>

<script type="text/javascript">
    var c=document.getElementById("myCanvas");
    var ctx=c.getContext("2d");
    ctx.fillStyle="#FF0000";
    ctx.drawRect(0,0,200,100);
</script>

<div id="dialog" title="<spring:message code="feedback.submit"/>">
<form id="feedbackForm" method="post" action="<openmrs:contextPath/>/module/feedback/addFeedback.form" class="bbq" enctype="multipart/form-data" >
    <div id="fieldWrapper">
                <span id="step1" class="step">
	                <span><spring:message code="feedback.wizard.step1"/></span><br /><br/>
                    <table>
                        <tr>
                            <td><spring:message code="feedback.subject"/> </td>
                            <td>
                                <select name="subject">
                                    <c:forEach items="${model.predefinedsubjects}" var="predefinedsubjectObj" >
                                        <option value="<c:out value="${predefinedsubjectObj.subject}"/>"> <c:out value="${predefinedsubjectObj.subject}"/> </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><spring:message code="feedback.severity"/>  </td>
                            <td>
                                <select name="severity">
                                    <c:forEach items="${model.severities}" var="severityObj">
                                        <option value="<c:out value="${severityObj.severity}"/>"> <c:out value="${severityObj.severity}"/> </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><spring:message code="feedback.wizard.receiver"/>  </td>
                            <td>
                                <select id="fdbk_receiver" >
                                    <option value="admin">Admin</option>
                                    <option value="user1">User1</option>
                                </select>
                            </td>
                        </tr>
                    </table>
	            </span>
	             <span id="step2" class="step">
					<span><spring:message code="feedback.wizard.step2"/></span><br />
					<spring:message code="feedback.feedback"/><br />
                    <textarea id="fdbk_msg" rows="4" cols="40" ></textarea><br />
		        </span>
		        <span id="step3" class="step">
					<span><spring:message code="feedback.wizard.step3"/></span><br />
					<spring:message code="feedback.pageContext"/><br />
                    <textarea id="fdbk_stack" rows="4" cols="40" ></textarea><br />
				</span>
				<span id="step4" class="step">
					<span><spring:message code="feedback.wizard.step4"/></span><br />
                    <spring:message code="feedback.wizard.editscreenshot"/><br /><br />
                    <table>
                        <tr>
                            <td><input type="button" id="fdbk_highlight" value="Highlight" /></td>
                            <td><spring:message code="feedback.wizard.edit.highlight"/></td>
                        </tr>
                        <tr>
                            <td><input class="navigation_button" type="button" id="fdbk_blackout" value="Blackout" /></td>
                            <td><spring:message code="feedback.wizard.edit.blackout"/></td>
                        </tr>
                    </table>
				</span>
   				<span id="step5" class="step">
					<span><spring:message code="feedback.wizard.step5"/></span><br /><br />
                    <center>
                        <canvas id="fdbk_processed_screenshot" width="400" height="200" style="border:3px solid #c3c3c3;"></canvas><br/>
                        <spring:message code="feedback.wizard.screenshot"/><br />
                        <hr/>
                    </center>
                       <spring:message code="feedback.attachment"/><br /><br />
                       <input type="button" id="fdbk_upload" value="Upload" /><spring:message code="feedback.wizard.attach2"/><br />
				</span>
                <span id="confirmation" class="step">
					<span><spring:message code="feedback.wizard.step6"/></span><br />
                    <center>
                        <h3><spring:message code="feedback.wizard.fdbkconfirm"/></h3>
                        <canvas id="fdbk_screenshot" width="400" height="200" style="border:3px solid #c3c3c3;"></canvas><br/>
                        <spring:message code="feedback.wizard.screenshot.preview"/><br />
                    </center>
                    <hr/>
                    <u><spring:message code="feedback.feedback"/></u><br/>
                    <label>Error occurred while adding a new patient</label>
                    <hr/>
                    <u><spring:message code="feedback.pageContext"/></u><br/>
                    <label>"Thread-5" (TID:0xee703b78, sys_thread_t:0xee261db8, state:R) prio=5
                        mythread.stopper(exec3.java:10)
                        mythread.run(exec3.java:16)</label>
                    <hr/>
                     <table>
                        <tr>
                            <td><spring:message code="feedback.subject"/></td>
                            <td>Record Not Found</td>
                        </tr>
                        <tr>
                            <td><spring:message code="feedback.severity"/></td>
                            <td>Urgent</td>
                        </tr>
                        <tr>
                            <td><spring:message code="feedback.wizard.receiver"/></td>
                            <td>Admin</td>
                        </tr>
                     </table>
                    <hr/></a><label><spring:message code="feedback.wizard.pageInfo"/>http://localhost:8080/openmrs/patient.html</label>
                    <hr/>
                       <u><spring:message code="feedback.wizard.attach"/></u><br />
                       <label>Attachment1.zip, Attachment2.png</label>
                    <hr/>
				</span>
    </div>
    <br/>
    <div id="bottomNavigation">
        <input id="back" value="Back" type="reset" />
        <input id="next" value="Next" type="submit" />
    </div>
    <br/>
</form>
</div>
