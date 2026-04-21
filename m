Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4BCF8FA6D
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+F5bGDiqkjPkUrDy7gvdDcnuav6OoF1GwOXYBPJwsQ=; b=03qQ2kfeqhPmPXfj9mZYAWNSiY
	mWnTq9gic07H0okqgGvelwlM9jkwzl91MwQDIKRnaV0+a8Wlx431wBxLBwxyeoLQWBjLMhCVI48AY
	wJCF8MsfjFZkh8jCtY2cgfWv60naFdAhSpCjto/MyLUA5M3R3VMtMGpfBVAuzaShuk0b0nm2kn3XW
	Tr4+87kzlhXoVpzHMnNpaf8bH97BYKhNPT0HjOuI0UcFjnV/SPmLDiQ1tmDILad3ZiSG15XwcxteY
	VrT/o+YxtM9G2T4D0q7d86PSG7h5ypYqH7+or+ZD0md8xoam8B3LF5mdqgjANXw1sGm7TNVnedwWt
	binrfTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFA7n-00000008aFk-30fC;
	Tue, 21 Apr 2026 12:22:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFA7l-00000008aFO-3Z4i
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 12:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8224A44157;
	Tue, 21 Apr 2026 12:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5106C2BCB0;
	Tue, 21 Apr 2026 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776774160;
	bh=FjTWTBKyxU9wnoOFIU6eC+Zsg/ak07chnRRJ6hIxvXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDUCyVwGb8ya/GZDqDieIScgOVrPOl3I/FJS9ccMew51Xp1PwcmYEtedShhwnrxmc
	 RCa1sJsDGPFZz7l6xh8HYRvZ9j5G0bWWeLPo1qSM5vCkcLDW5wJx2OyFKcOZhGoLOI
	 YwnWftevNO1eAx5/cWBBv5WlkJhG/5+YfhdJ7vYHIkPT3IgE3VLw8p3NofnqsNgFtH
	 RYEOsuva6FlMuZC1XmZz9dmSpii3t/okBhMPqO1l7pjE1ED/sH7WZTsW/w8Cyns2AW
	 HTHIQlNviNnES+NmZ/S8HynmnxRzzgDyzjO6jdJPH1Z83lN19f1bjFMnu8aORK25oM
	 Z2/yYBPfJux+A==
Date: Tue, 21 Apr 2026 17:52:22 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/15] firmware: qcom: Add OP-TEE PAS service support
Message-ID: <aedr_gE2Sxs-UvbL@sumit-xelite>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <adPLx3nCBb8IHz2b@baldur>
 <adSOFCL26y5qt1Cu@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adSOFCL26y5qt1Cu@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_052241_940994_6E9B4EB0 
X-CRM114-Status: GOOD (  20.90  )
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

On Tue, Apr 07, 2026 at 10:24:44AM +0530, Sumit Garg wrote:
> Hi Bjorn,
> 
> On Mon, Apr 06, 2026 at 10:09:27AM -0500, Bjorn Andersson wrote:
> > On Fri, Mar 27, 2026 at 06:40:28PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > 
> > > Qcom platforms has the legacy of using non-standard SCM calls
> > > splintered over the various kernel drivers. These SCM calls aren't
> > > compliant with the standard SMC calling conventions which is a
> > > prerequisite to enable migration to the FF-A specifications from Arm.
> > > 
> > 
> > Please get our colleagues involved in this discussion, because this
> > non-SCM interface does not match the direction we are taking.
> 
> I thought I have already involved folks from QTEE perspective (Apurupa
> and Sree) actively working on FF-A implementation aligned to this
> interface. It would have been better if you could let me know where is
> the direction mismatch here. In case there is a better alternative
> design proposal for PAS service with FF-A, I would be happy to hear
> that.
> 
> Anyhow for the legacy SoCs like KLMT, we really don't have any
> alternative but have to stick to existing QTEE PAS design with OP-TEE
> providing as an alternative backend. Surely we want to support loading
> of existing signed firmware present in linux-firmware repo for KLMT with
> OP-TEE being the TZ.

After further offline internal Qcom discussions, the teams are aligned
on the vision to use and extend generic Qcom PAS layer for all the TZ
backends whether it's legacy SCM backend based on QTEE, OP-TEE backend
as proposed by this patch-set or future object invoke (based on
SMCInvoke) for QTEE.

I hope with that we can progress to get this patch-set merged in next
merge window. I will send v4 shortly after merge window closes to
address misc. comments from Harshal on patch 04/15.

-Sumit

