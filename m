Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C9AC4450A
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 03:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Sawr9XzpFp2rxdJvgZDvuQs9ByLR9DjNmLMSBWdSiQ=; b=qngfzQ6X/UqqT3rTkED++N2wVo
	MgJC4TiZBFsxiDX6KF/QwsXLT3ckSfKBCkElelDPTGwDFUEKLACaSNkkHlox+zqllaL1Y1cqGdZ37
	PnorZfVPKXSzrBl1/zqbI/JQMExIalCUbRBdD6VYblRV7ymC2SVaroJjmGBPlGIwanqkMSE+t57/Z
	GA5coU42MQkJwTZtOUz1+aTd6nIi0PGuv0tHoIVCzP6xrJASEpjr0/j2g7BDl52n4uhZxJ1fp8sQ4
	UbPZQymU+HkvICfUyzMReH0ybTOW8czO8DT3xTnuDgB9u3Nh3IEdEvS32lBgE6q/M45LxLH3oHMyf
	1Njc8O0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZAt-000000012Zb-0xJF;
	Fri, 17 Jul 2026 03:23:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZAs-000000012ZQ-021p
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 03:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BEED40A36;
	Fri, 17 Jul 2026 03:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2FA1F00A3E;
	Fri, 17 Jul 2026 03:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258621;
	bh=2Sawr9XzpFp2rxdJvgZDvuQs9ByLR9DjNmLMSBWdSiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JUqzZrRQ35Qd5vZtf84WVjc55Pe+9QyiuUlC2fPQI3Emosr2TfhiCPsVYcjYv6Y+9
	 7rB2f9bUmKXUDcOq6jq6c6twbVnweBxRJJ1w1c7zm3pP7tZ4ZTknIgYVUjtAvwRXoo
	 h8wTaCURvriVcBDQKHRFsf12bXNYqFxWHuemCFAJ9C6G1fcAOA6uBs+0llH5+Lls1Q
	 nZKUKxnkmN+C5L5L2sDBIE3/mLvt/V9WuJcXXuvkuv0h7JMX7LFHA6a3h1PxoWcd/J
	 J4xYNaMSSSGcCBM2ZIGkBsnMh2rsw3k1b/fDJWL864fh9m8H1D0rhr3kvaZ54101+W
	 cMArFnvJ2P4Fg==
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
Date: Thu, 16 Jul 2026 22:23:28 -0500
Message-ID: <178425854615.1084804.10241911437238961566.b4-ty@kernel.org>
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

[11/14] net: ipa: Switch to generic PAS TZ APIs
        commit: 85b88ceeeeb7bb93cd0af7ccaf2a4b010d5bc5c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

