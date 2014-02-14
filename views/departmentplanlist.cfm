<cfscript>
title 		 		=  request.event.getArg('programname');
qPlanPeriods 		=  request.event.getArg('reviewPeriods');
qReviewPlanPeriods 	=  request.event.getArg('reviewPlanPeriods');
</cfscript>

<!---
<cfdump var="#qPlanPeriods#" abort="false"/>
 --->


<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">

				<cfinclude template="/Assessment/views/page_header.cfm">
				
				<cfif len(trim(layout_message))>
					<div class="row-fluid">
						<div class="text-center">
							<cfoutput>

								<cfif session.layout_message contains "Sorry">
									<div class="alert alert-error">
								<cfelse>
									<div class="alert alert-info">
								</cfif>
								
									
									<button class="close" data-dismiss="alert" type="button" id="closemessage"> x </button>
									#layout_message#

								</div>
							</cfoutput>	
						</div>
					</div>
				</cfif>

				<div class="row-fluid">
					<div class="span12">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-search"></i>
									Department Performance Review Periods
								</h3>

									<div class="actions">
									<a href="##" class='btn' rel="popover" data-trigger="hover" title="" data-placement="left" data-content="This is a list of the available plan periods Click on the plan-period to view the plan specifics." ><i class=" icon-question-sign"></i> Help</a>
								</div>
							</div>
							<div class="box-content nopadding">
								
								<div class="search-results">
									<ul>

										<!--- <cfloop list="2012-2013,2011-2012,2010-2011,2009-2010" index="idx"> --->
										<cfloop query="qPlanPeriods">									
											<cfoutput>		
												<li>
													<!---
													<div class="thumbnail"> 
														<img src="http://www.placehold.it/80" alt="">		
													</div>
													--->
													<div class="span12 search-info">
														<a href="index.cfm?event=showDeptReview&reportingUnitID=#reportingUnitID#&ReviewID=#ReviewID#" rel="tooltip" data-placement="right" title="View/Modify Plan">Review Period: #qPlanPeriods.ReviewPeriod#</a>
														<!--- <p class="url">www.loremasdasdd.com/</p> --->
														
														<br>Status:
															<!---
															<cfset tmp = ListGetRandom("Approved (complete),Submitted for review,Collect data,Revise Plan") />

															<cfswitch expression="#tmp#">
																<cfcase value="Approved (complete)">
																	<cfset class = "text-success" />
																</cfcase>
																<cfcase value="Revise Plan">
																	<cfset class = "text-error" />
																</cfcase>
																<cfdefaultcase>
																	<cfset class = "text-info" />
																</cfdefaultcase>
															</cfswitch>
															--->
															<span class="text-success"> 
																#qPlanPeriods.ReviewStatus#
															</span>
														  <br>Last Updated: 
														  	<cfif len(trim(#qPlanPeriods.ActivityDate#))>
																<span class="text-info">#DateFormat(qPlanPeriods.ActivityDate,'mm-dd-yyyy')# @ #TimeFormat(qPlanPeriods.ActivityDate,'long')# </span>
															<cfelse>
																<span class="text-error">N/A</span>
															</cfif>
														 
													</div>
												</li>
											</cfoutput>
										</cfloop>									
								</div>								
									
								</div>
							</div>
						</div>
					</div>
				</div>


</div></div>

<cfscript>
/**
 * Returns a random selection from a comma delimited list.
 * Modified by Raymond Camden
 * 
 * @param List 	 The list to grab a random element from. (Required)
 * @param Delimiter 	 The list delimiter. Defaults to a comma. (Optional)
 * @return Returns a random element from the list. 
 * @author Brad Breaux (&#98;&#98;&#114;&#101;&#97;&#117;&#120;&#64;&#98;&#108;&#105;&#112;&#122;&#46;&#99;&#111;&#109;) 
 * @version 2, March 12, 2004 
 */
function ListGetRandom(instring) {
	var delim = ",";
	var rnum = 0;
	var r = '';
 	if(ArrayLen(Arguments) GTE 2) delim = Arguments[2];
   	if(listlen(instring) gt 0) {
		rnum = randrange(1,listlen(instring,delim));
    		r = listgetat(instring,rnum,delim);
	}
	return r;
 }
</cfscript>