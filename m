Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D0DCA5FAB
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 05:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0WHvqPEy1zCdoeR4zoo3J7a0wQn2OXgPRqA4AplJPY=; b=Rf9Vl08e+QBqBPQX1HTcPDE2ao
	xY7fRdMD9UtC32WYBkBNHxyJsVE8prDlfv4FGilMO2ilB/R9WaZadbxkGxspbaSy1RZ9XFpY8BjlT
	zxix4TULKCvuen+0pejAngKeoEQZrRf/VLl5eRDm/UFkYiy1+FePtNXAJBl+ntaE3Us6bd+4IQnRb
	r6wo2tvyrIVRm34TaL/BFnvWzC1jy8otV9g7RcopOkRWLYOIiGGHavKv6FmxzRt7k/uujEPlMX7iS
	Y4oGMzSwR5RikzIATrQmgu6WUu6gW0bkwcOA1ERsDVGrVP0ObZNRsCuOrBfpvijtz3359kkYj7Gev
	2OLBPALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnHv-000000055EW-2CaR;
	Wed, 30 Sep 2026 05:55:31 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnHr-000000055Dl-0tzJ;
	Wed, 30 Sep 2026 05:55:29 +0000
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hvkm5703RzyS4;
	Wed, 30 Sep 2026 08:55:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790747718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0WHvqPEy1zCdoeR4zoo3J7a0wQn2OXgPRqA4AplJPY=;
	b=mi89WtC16ViDEso6lptBHLrWYe4WmAkcOzvBYiG4IdBLL4cuul3g8kAb++WwgW4R31YxAX
	qpLPNQprQzpBsU5RZ5lhhxvgyIKdrSK43CLzaUGNY7TnotPueTdfIQRz5Srgu0qUHbgcL5
	hA1PuBFvq1OWOaUUyYnEVl/9Z31O9H0=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790747718;
	b=taouanStDp19rbXzAw6kFJv4hXOdAUFol/pe49jDLHWlDIl5lP4gyEI1E1kmoH6SDN+wjV
	J6eWoeIrxsjXltLNv+iMQok6m1359fzctQotlk6MF2vAt3sbjcF0P0S33RyvOG61AV/h16
	rrANrQm4AEUCLald818xIgRIa08PTC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790747718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0WHvqPEy1zCdoeR4zoo3J7a0wQn2OXgPRqA4AplJPY=;
	b=nx/Hkgl5Civpx/g4A5wgbIqbjVpgLoxPdm/d7l6nl1xI+MB5tLixw91AtJUqg7PUDAjUj+
	9BsTrDdVQr0OA6boZNS0MVCsfhVgRof+bg8dtVDvChstq71Pt9Y9C4+wHAsvUH33aKIulp
	eSoZt9+VCzs2ZbSqZSukc5somAz05GA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B9DBB198003A;
	Wed, 30 Sep 2026 01:55:16 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 01:55:16 -0400
X-ME-Sender: <xms:QaS8aq-2dFrxDqeERM4INVMEk-f_Q5DIFHuE-lanC2UGp7EpTfGKfw>
    <xme:QaS8aljWtWZDzrZyRwH80vhYAJh8mmf9gwoLUH9sl5D1-Q4br9l6tiWVFB0TiPGAL
    c7b_8R-gBcvfcq04NFpecTzMmm2WQxvhnxUnniR8hnjOXyLLjD6bmxX>
X-ME-Proxy-Cause: dmFkZTFp4NH+YWpk8RRtOx7/9/eJYhhRF0wfwR+qn9fmA0oEIQrIu+sy7ZWXMsFF9LAvVM
    SzfwpA0Tf+EgBAQ3rHRnsEGdl4HiNVUiyvbIC4JFIhF1rdlZiPSv0L+N5KHe9Oqohxp70I
    ofLhf90YJnnXnyUNgykBjUrru4MOOiGzSHELeoY2UKCrZNeDPRp/0wWt53PTFKf3y6cUd3
    zcNd434ipqiO8/tYVE0McZzgmOXQrmxVTOki7dlgcQ6L66mQSNNlCS+Nmwst3TClrhaDW+
    jnL6bxTvP43a9NQjoQRsLlDqTjAbZmmdddYC1bEepu6oC5ImfqbchtR2bBvdPDUxnLIePg
    t89nxml+h4BBpA7zMiiztQorDh42JLvPo5ob+kM4IBUYS4ixZJO0khvcLOEQFWRThOg97U
    GjNQ1d0hR/hi1AD3FXPrTi0CSpRKReJgHpeSVxCh4AJ+UukwMJf7Glh8Gofd9EU6PMLhML
    /kf4v0ebmNLcaN8KFwZoIHqttW6IcxOmHE6TnPfD9gGes0ONvOyEdK6qkssOTuJ2/fGMbN
    1G9LvVOBGdfV/7Um4zCbSUXfC5jwc1/oVMjBPHGsBAN2aNIJ/nZcaUeo70SVLCHdSOLwm3
    s+SUPfDaQBVm768N7gxb72e0uQBNdIlUvFBJdpmPQPq40UL3UdF4h+Ko3JOQ
X-ME-Proxy: <xmx:RKS8ariZTGfwhc1rJ1dsuaOh-1QRQ5pCVL52yaVPkrRP1T_rflQZBA>
    <xmx:RKS8apV0KrErLbqYgeVLZ4PpgYKuIqDL2mkucfSbYNNXXeYrnyXtRA>
    <xmx:RKS8avuFXN4B4TKRuhud6s4p1pE1mkGZaI2dZAjcHVYIo1-blS3w0g>
    <xmx:RKS8aq815KUJNwDbNDPTXI6eaxznnNTpR0eCkL4jmvRlZfUsCz7OeQ>
    <xmx:RKS8avuy3y9T435MADUjjZwuuVzQ62ieA5fMTiBpPyFnUX44JsOsSs7S>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 73D7CF8008F; Wed, 30 Sep 2026 01:55:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0G5p0OZ_htJ
Date: Wed, 30 Sep 2026 08:54:53 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Marcel Holtmann" <marcel@holtmann.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
In-Reply-To: <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_225527_607812_B325D14C 
X-CRM114-Status: GOOD (  19.73  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2026, at 23:37, Marcel Holtmann wrote:
> >> I'm still willing to submit a new version of that patchset originally by
> >> Denis, if the kernel devs so decide that it's the way. For example, the
> >> "radix tree of radix trees" approach could be replaced with a hash
> >> table.
> >> 
> >> There was also some criticism about a layering violation in storing the
> >> endpoint id to mhi controller. However, maybe that could be reduced by
> >> providing a correct abstraction around it, so that other code doesn't
> >> touch the mhi controller structure directly.
> >> 
> >> Other criticism for that patchset by Denis was its overt complexity.
> >> Yes, it has more lines of code changed.
> >> 
> >> This dual-card setup needs to be handled somehow, either by Denis's
> >> patchset or by Manivannan's patchset.
> >> 
> > 
> > I wish to go ahead with my series as it is simple and tested across the
> > multi-WLAN setups. For concern around exposing the nid to userspace, I'll
> > implement it in next version, thanks!
> 
> actually no. Seems you have no plan on how to address the userspace problem.
> 
> It would be useful to actually review the endpoint_id concept introduced by Denis since it has a userspace facing API. What is your plan? Are you planning to break all existing userspace code?

Well, in defense of Manivannan's patchset it currently works for PCI+AHB
setups better than the last version of that by Denis/Mihai/me (although 
I could easily fix that), and it may be simpler for userspace to
continue using nid than having to bind to an endpoint, which requires
more changes in userspace code.

The userspace just needs to know the nid.

BR, Juha-Matti

