<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy"/>

 <section class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Network Statistics</h2>
          <h3>Check the traffic, internet speed, and the AC status here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 탭1============================================ : str -->
      <div id="tabs">
        <ul>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=trMonth">Traffic</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=spMonth" class="hover">Internet Speed</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=acMonth">AC Monitoring</a></li>
        </ul>
		<form id="command">
		
        <div id="tabs-2" class="topLine">
          <!-- 탭2 Traffic============================================ : str -->
          <span class="tab_topLine"></span>
          <section id="tab-container" class="stats">
            <ul>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=spMonth', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_month_on.gif' />" alt="" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=spDay', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_day.gif' />" alt="" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=spTime', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_time.gif' />" alt="" /></a></li>
            </ul>
            <section id="contents-1" class="topLine">
              <!-- Month : srt -->
              <div class="statsSchbox">
                <button type="button" class="statsSch" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=spMonth', 'command', 'post')"></button>
                <select name="strYear" class="Year" style="height: 24px;">
                  <c:forEach var="i" begin="${year-5}" end="${year}">
					<option value="${i}" <c:if test="${requestMap.strYear==i}">selected</c:if> >${i}</option>
				  </c:forEach>
                </select>
              </div>
              <section>
                <table class="boardSch" summary="Month">
                  <colgroup>
                    <col width="80" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="53" />
                    <col width="*" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th rowspan="3">Sort</th>
                      <th colspan="4">Total<em>(bps)</em></th>
                      <th colspan="4">GIGA Wifi<em>(bps)</em></th>
                      <th colspan="4" class="end">LAN<em>(bps)</em></th>
                    </tr>
                    <tr>
                      <th colspan="2">UP</th>
                      <th colspan="2">DOWN</th>
                      <th colspan="2">UP</th>
                      <th colspan="2">DOWN</th>
                      <th colspan="2">UP</th>
                      <th colspan="2" class="end">DOWN</th>
                    </tr>
                    <tr>
                      <th>Min</th>
                      <th>Max</th>
                      <th>Min</th>
                      <th>Max</th>
                      <th>Min</th>
                      <th>Max</th>
                      <th>Min</th>
                      <th>Max</th>
                      <th>Min</th>
                      <th>Max</th>
                      <th>Min</th>
                      <th class="end">Max</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="result" items="${list}" varStatus="status">
                    <tr>
                      <th><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=spDay&strMonth=<c:choose><c:when test="${result.MONTH_NAME=='Jan'}">01</c:when><c:when test="${result.MONTH_NAME=='Feb'}">02</c:when><c:when test="${result.MONTH_NAME=='Mar'}">03</c:when><c:when test="${result.MONTH_NAME=='Apr'}">04</c:when><c:when test="${result.MONTH_NAME=='May'}">05</c:when><c:when test="${result.MONTH_NAME=='Jun'}">06</c:when><c:when test="${result.MONTH_NAME=='Jul'}">07</c:when><c:when test="${result.MONTH_NAME=='Aug'}">08</c:when><c:when test="${result.MONTH_NAME=='Sep'}">09</c:when><c:when test="${result.MONTH_NAME=='Oct'}">10</c:when><c:when test="${result.MONTH_NAME=='Nov'}">11</c:when><c:when test="${result.MONTH_NAME=='Dec'}">12</c:when></c:choose>', 'command', 'post');">${result.MONTH_NAME}</a></th>
                      <td><c:if test="${result.TOT_UP_MIN==null}">0</c:if><fmt:formatNumber value="${result.TOT_UP_MIN}" type="number"/></td>
                      <td><c:if test="${result.TOT_UP_MAX==null}">0</c:if><fmt:formatNumber value="${result.TOT_UP_MAX}" type="number"/></td>
                      <td><c:if test="${result.TOT_DOWN_MIN==null}">0</c:if><fmt:formatNumber value="${result.TOT_DOWN_MIN}" type="number"/></td>
                      <td><c:if test="${result.TOT_DOWN_MAX==null}">0</c:if><fmt:formatNumber value="${result.TOT_DOWN_MAX}" type="number"/></td>
                      <td><c:if test="${result.WIFI_UP_MIN==null}">0</c:if><fmt:formatNumber value="${result.WIFI_UP_MIN}" type="number"/></td>
                      <td><c:if test="${result.WIFI_UP_MAX==null}">0</c:if><fmt:formatNumber value="${result.WIFI_UP_MAX}" type="number"/></td>
                      <td><c:if test="${result.WIFI_DOWN_MIN==null}">0</c:if><fmt:formatNumber value="${result.WIFI_DOWN_MIN}" type="number"/></td>
                      <td><c:if test="${result.WIFI_DOWN_MAX==null}">0</c:if><fmt:formatNumber value="${result.WIFI_DOWN_MAX}" type="number"/></td>
                      <td><c:if test="${result.LAN_UP_MIN==null}">0</c:if><fmt:formatNumber value="${result.LAN_UP_MIN}" type="number"/></td>
                      <td><c:if test="${result.LAN_UP_MAX==null}">0</c:if><fmt:formatNumber value="${result.LAN_UP_MAX}" type="number"/></td>
                      <td><c:if test="${result.LAN_DOWN_MIN==null}">0</c:if><fmt:formatNumber value="${result.LAN_DOWN_MIN}" type="number"/></td>
                      <td class="end alignC"><c:if test="${result.LAN_DOWN_MAX==null}">0</c:if><fmt:formatNumber value="${result.LAN_DOWN_MAX}" type="number"/></td>
                    </tr>
                    </c:forEach>
                    <!-- 
                    <tr class="bottomLine">
                      <th><a href="#">Dec</a></th>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td class="end alignC"><a href="#">15,000</a></td>
                    </tr>
                     -->
                  </tbody>
                </table>
                <p class="unit">(unit: bps)</p>
              </section>
              <div class="excelDown unit">
                <div class="alignCenter">
                  <div class="button1 type2">
                    <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=spMonth&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
                  </div>
                </div>
              </div>
              <!-- Month : end -->
            </section>

          </section>
          <!-- 탭2 Traffic=========================================== : end -->
        </div>
      <!-- 탭1=========================================== : end -->
      
      </form>
    </section>