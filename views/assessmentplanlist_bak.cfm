<cfscript>
title = "BA Anthropology";
</cfscript>

<div id="main" style="margin-left: 0px;">
			<div class="container-fluid">
				<cfinclude template="/Assessment/views/page_header.cfm">
				<div class="page-header">
					<div class="pull-left">
						<h1>Assessment Plan List</h1>
					</div>
					

					<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								
							
								<div class="row-fluid">
									<ul class="shop-items green">

										<cfloop list="2012-2013,2011-2012,2010-2011,2009-2010" index="idx">	
											<cfoutput>									
												<li class="span3">
													<a href="more-shop-product.html">
														<div class="details" >
															<span><i class="icon-folder-open-alt pull-left"></i></span>
															<div class="name" >
																Plan Period: #idx#<br>
																Status: #ListGetRandom("Approved (complete) ,Submitted for review, Collect data")#
															</div>
															<!---
															<div class="price">
																$25.00
															</div>
															--->
														</div>
													</a>
													<div class="extended">
														<!---
														<div class="pull-left">
															<ul class="colors small">
																<li class="red">
																	<a href="##"></a>
																</li>
																<li class="pink">
																	<a href="##"></a>
																</li>
																<li class="lightgrey">
																	<a href="##"></a>
																</li>
															</ul>
														</div>
														--->
														<div class="pull-right">
															<a href="##" rel='tooltip' title="View Details"><i class="icon-search"></i></a>
															<a href="##" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
														</div>
														
													</div>
												</li>
											</cfoutput>	
										</cfloop>
									</ul>
								</div>
								<hr>
								<!---
								<div class="row-fluid margin-top">
									<ul class="shop-items">
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/1.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/4.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/4.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/6.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="row-fluid margin-top">
									<ul class="shop-items">
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/6.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/4.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/1.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
										<li class="span3">
											<a href="more-shop-product.html">
												<img src="img/demo/shop/6.jpg" alt="">
												<div class="details">
													<div class="name">
														Simple jeans
													</div>
													<div class="price">
														$25.00
													</div>
												</div>
											</a>
											<div class="extended">
												<div class="pull-left">
													<ul class="colors small">
														<li class="red">
															<a href="#"></a>
														</li>
														<li class="pink">
															<a href="#"></a>
														</li>
														<li class="lightgrey">
															<a href="#"></a>
														</li>
													</ul>
												</div>
												<div class="pull-right">
													<a href="#" rel='tooltip' title="Add to cart"><i class="icon-shopping-cart"></i></a>
													<a href="#" rel='tooltip' title="Add to whishlist"><i class="icon-cloud"></i></a>
												</div>
											</div>
										</li>
									</ul>
								</div> --->
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