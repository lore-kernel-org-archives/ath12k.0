Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB87C61DD3
	for <ath12k@archiver.kernel.org>; Mon, 31 Aug 2026 22:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvuYd2E9gNoEafLJQR92iLzGR8RBPvPVUyVxGnAPjF4=; b=2TqgPiG9E70b0rth/I9+vIDp4J
	4/DZmMPD3FRYAbZ29Ppvo4TovkK0O0DsZQEFKB0T7Mu9eKGzkJBdcKHPBHYzXk2on5O0TvluGP3eg
	W9c1SdTC/rJ3HExWvOyKxrrrJ9srzf+FdUYUNPUqHpD2vXlAfXPIZR22xtwTSBo0rbJblQ6PVgDDw
	CVTqb7ssuDAZnyL5L/ixz7YK91ldhvypYcWrZY9BaHMDLS9q/w1zSmYEabBCdO8UtbzqGA0uCb7Gz
	umHmHNfn9qCvGwta4Ctg6wGjzUSfIBaWNuhv6r57NE/hp0+WI9eqFEYl/YvhAbRUK2RFwVqXjiDVl
	O3pd014g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1A9q-0000000AZhd-38ML;
	Mon, 31 Aug 2026 22:07:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1A9p-0000000AZhS-0cBL
	for ath12k@lists.infradead.org;
	Mon, 31 Aug 2026 22:07:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 970BB601DE;
	Mon, 31 Aug 2026 22:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6401F000E9;
	Mon, 31 Aug 2026 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788214032;
	bh=OvuYd2E9gNoEafLJQR92iLzGR8RBPvPVUyVxGnAPjF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gYnoG23jCYrZH9URvUkK4HQ8u1Y6rRbB+8IwiaAp6UhhaEmRaPOT3Ngz2Z4VCY7Sv
	 GwmBOowSmdCdbr2xCF4omQIBbTDWpWaNvbBykc8cFezNpu1mRYW0OPHKT2gAYD7sc+
	 EMv1yltzIr/Yz9erkJ0K5dKroK9HsYTt00ckq8iD/xNvg0PD2ZeViy+bGPyrD7T7Df
	 6beBM0whRsZmwsBAUBq/Jz3Ds/ClEqxoQ0jws07Fh5m0S0YmFlkhhxXYZjx2m0VltQ
	 LXnxB55DqI2y3JxXp+9D9uHtZObB9Z6dU302sCKiMgRFW3FzsTcvQOQNbr/50p75N0
	 44dch5lJjT2ag==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	elder@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jjohnson@kernel.org,
	mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com,
	jenswi@kernel.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service support
Date: Mon, 31 Aug 2026 17:07:06 -0500
Message-ID: <178821402262.1706165.9287098624107788227.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702115835.167602-1-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> [...]

Applied, thanks!

[13/14] firmware: qcom_scm: Remove SCM PAS wrappers
        commit: 3eda4fa73e30207eb7afedde6987f7f321f74fbc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

