Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD40FB5190
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 04:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IUV6hslcfI+Ok9AhwyGImSnTrIY8mm+rIGvnqvMqPs=; b=VoWLOEwpUitNsQip3IBYhlBgPm
	5sD5Lc338Ogm/VV71aRGllHzgcs2Is7FQR5iiIOaun63rAFy0uq+LD13M9dVcVc/kmGI2e7xZIXJ6
	jp94/FpSTHv4DD0jIeRxcI7bGTDOR+cheWtvcqrRtEIGDcliOx4RKqE1bhfk3/zEhDlMXfcGU9faV
	BQki2UL2QM18nDq1ikhm+YWGrOyaF3gRO2cpHWcRTC7ZOiekFvz8nC5aPDWslzA6dWWxuwfYcTUbE
	NsFUpen2xJ0k08yH75oL25nIvWM3hRquLZ+gfG49LqI3Hws82OwaA7BJVkpdOiaR+Cw03sFmG4x/o
	MsscAxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ySv-00000005tOs-0hoN;
	Tue, 07 Apr 2026 04:55:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ySu-00000005tOa-01Ke
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 04:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D27460180;
	Tue,  7 Apr 2026 04:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60815C116C6;
	Tue,  7 Apr 2026 04:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775537702;
	bh=rvu7/o0Lwq7mvoGpGDMuVDAnB7mMlRjy9d5tc7U+Cb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=og8fhcTrcSW1XpExdd/a68mQ3sOlxr3SXLyjG8HBdY4XWYM29iTLx0Vs0oZzLQBYD
	 tu/RPZiAfSuTwJv5JHbdFaiitpZ6bXxgjdlLLxffWjK89/+jrNtXEyaJ4DJU/d0LCi
	 R6uKK10Vn0UY5G1a0lvKWQphTQ5vpl4v7DMcIZPNotI5UlcQAmshX1P/Wvpvltcgkl
	 vD400kR01f5mLCkLuTrZxTVTIz3eLkCsqiEBguYacQ0aKOGIUaWkZrKUIb0uWeIiYs
	 L/vTx3jbOsZk2PnifHxjEUKls3C4t+Wnbflcd+lJMRWwJLFmxogFFi7/Fue/xF+WPg
	 BLYdUjWFdKV2w==
Date: Tue, 7 Apr 2026 10:24:44 +0530
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
Message-ID: <adSOFCL26y5qt1Cu@sumit-xelite>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <adPLx3nCBb8IHz2b@baldur>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adPLx3nCBb8IHz2b@baldur>
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

Hi Bjorn,

On Mon, Apr 06, 2026 at 10:09:27AM -0500, Bjorn Andersson wrote:
> On Fri, Mar 27, 2026 at 06:40:28PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> > 
> 
> Please get our colleagues involved in this discussion, because this
> non-SCM interface does not match the direction we are taking.

I thought I have already involved folks from QTEE perspective (Apurupa
and Sree) actively working on FF-A implementation aligned to this
interface. It would have been better if you could let me know where is
the direction mismatch here. In case there is a better alternative
design proposal for PAS service with FF-A, I would be happy to hear
that.

Anyhow for the legacy SoCs like KLMT, we really don't have any
alternative but have to stick to existing QTEE PAS design with OP-TEE
providing as an alternative backend. Surely we want to support loading
of existing signed firmware present in linux-firmware repo for KLMT with
OP-TEE being the TZ.

-Sumit

