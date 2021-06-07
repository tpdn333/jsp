<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<label for="BIRTH">생년월일</label>
<div class="row form-group">
	<div class="col-4">
		<input id="BIRTH" maxlength="4" placeholder="년(4자)" class="form-control" type="number" name="birth_yy"  maxlength="4" />
	</div>
	<div class="col-4">
		<select class="form-control" name="birth_mm">
			<option value="">월</option>
			<option value="01">1</option>
			<option value="02">2</option>
			<option value="03">3</option>
			<option value="04">4</option>
			<option value="05">5</option>
			<option value="06">6</option>
			<option value="07">7</option>
			<option value="08">8</option>
			<option value="09">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
	</div>
	<div class="col-4">
		<input maxlength="2" placeholder="일" class="form-control" type="number" name="birth_dd"  maxlength="2"/>
	</div>
</div>
