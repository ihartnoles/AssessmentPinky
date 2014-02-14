<div id="pjax">
		<div id="wrapper">
			<div class="isolate">				
					<div class="main_container full_size container_16 clearfix">
						<div class="box">
						<div class="block">
							<!--- <a href="index.cfm?event=showLoginform" id="small_logo" width="154" height="80"><span>FAU</span></a> --->
							<br>
							<h2 class="section">Assessment Database Username/Password Recovery</h2>
							
							<div class="toggle_container">
							<div class="wizard">
							<div class="wizard_steps">
								<ul class="clearfix">
									<li class="current">
										<a href="#step_1" class="clearfix">
											<span>1. <strong>FAU Email Address</strong></span>
											<small>Enter your FAU email address below</small>
										</a>
									</li>
									<li class="current">
										<a href="#step_2" class="clearfix">
											<span>2. <strong>Click "Get Login Information"</strong></span>
											<small>Your Username and Password will be sent to your mailbox.</small>
										</a>
									</li>
									
									<li class="current">
										<a href="#step_3" class="clearfix">
											<span>3. <strong>Check Your Email</strong></span>
											<small>You will receive your login credentials within 24 hours.</small>
										</a>
									</li>
									
								</ul>
							</div>
							</div>
							</div>

							<form action="index.cfm?event=showDashboard" method="post" class="validate_form">
							
							<fieldset class="label_side top">
								<label for="username_field">FAU Email</label>
								<div>
									<input type="text" id="fauid" name="fauid" class="required text">
									<div class="required_tag"></div>
								</div>
							</fieldset>	

						


							<div class="button_bar clearfix">
								<button class="blue" type="submit">
									<img height="24" width="24" alt="Bended Arrow Right" src="images/icons/small/white/bended_arrow_right.png">
									<span>Get Login Information</span>
								</button>
							</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>