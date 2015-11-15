<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
		<div class=listzone>
			<table cellspacing=0 cellpadding=3 width="100%" align=center border=0 >
				<tbody>
					<tr class=list id=head>
						<td width="25" height=28 class=biaoti>
						<table>
							<tr><td colspan="10" class="content">千位</td></tr>
							<tr><td class="content">0</td><td class="content">1</td><td class="content">2</td><td class="content">3</td>
							<td class="content">4</td><td class="content">5</td><td class="content">6</td><td class="content">7</td>
							<td class="content">8</td><td class="content">9</td></tr>
						</table>
						</td>
						<td width="25" height=28 class=biaoti>
						<table>
							<tr><td colspan="10" class="content">百位</td></tr>
							<tr><td class="content">0</td><td class="content">1</td><td class="content">2</td><td class="content">3</td>
							<td class="content">4</td><td class="content">5</td><td class="content">6</td><td class="content">7</td>
							<td class="content">8</td><td class="content">9</td></tr>
						</table>
						</td>
						<td width="25" height=28 class=biaoti>
						<table>
							<tr><td colspan="10" class="content">十位</td></tr>
							<tr><td class="content">0</td><td class="content">1</td><td class="content">2</td><td class="content">3</td>
							<td class="content">4</td><td class="content">5</td><td class="content">6</td><td class="content">7</td>
							<td class="content">8</td><td class="content">9</td></tr>
						</table>
						</td>
						<td width="25" height=28 class=biaoti>
						<table>
							<tr><td colspan="10" class="content">个位</td></tr>
							<tr><td class="content">0</td><td class="content">1</td><td class="content">2</td><td class="content">3</td>
							<td class="content">4</td><td class="content">5</td><td class="content">6</td><td class="content">7</td>
							<td class="content">8</td><td class="content">9</td></tr>
						</table>
						</td>
					</tr>
					<tr class=list>
						<c:forEach items="${lots}" var="lot">
						<td width="25" height=28 class=biaoti>
							<table>
							<tr><td class="content">${lot.zero}</td><td class="content">${lot.one}</td><td class="content">${lot.two}</td><td class="content">${lot.three}</td><td class="content">${lot.four}</td><td class="content">${lot.five}</td>
							<td class="content">${lot.six}</td><td class="content">${lot.seven}</td><td class="content">${lot.eight}</td><td class="content">${lot.nine}</td></tr>
							</table>
						</td>
						</c:forEach>
					</tr>		
				</tbody>
			</table>
		</div>
