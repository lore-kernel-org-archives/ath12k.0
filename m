Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CC5C44507
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXZ1rcqmiiZoIildEIFOR3w8PfogXYlRD2D++r0wb0c=; b=Tg2OLDHbzv+4WVnO/FHufkBdBo
	ouC13jMz6WPUuzAwRaDFHoJhUxt587b8ibbivBs4p9teRdHAMrzx6O6JvegS54KIj7c/Pk7tewJJS
	ofXgWHgWnbaZBb1GhmqG6eByjb/maDT/c1GoCL6sacXJPOU4Grgkhltf1wSKL844AEb2mOJPCDDdv
	2Mj4GeVrOAPxOCJwRnYT9h+UhCXxeGV4Tz3/di0YXIsrR/q0rVuDH0EDDa7pwkkfbo6/XAebwQkBU
	QlvTFGajE9ms0Ho0fVCLdhEAVpltSqVVU9t9HBnglz5MpKyxaN8qFsthdZ0gAjCaKl8cpcsi/4Jog
	MY7ZEgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFW-00000009jKJ-0HLc;
	Mon, 13 Jul 2026 15:07:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFN-00000009jEU-2iGi
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 15:07:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D829E6136B;
	Mon, 13 Jul 2026 15:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF7C1F00ADE;
	Mon, 13 Jul 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955224;
	bh=CXZ1rcqmiiZoIildEIFOR3w8PfogXYlRD2D++r0wb0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CcI3puINEWHumtKm/k5ofO6hjUX8VkNaypq4XypKEWenfIerBEGMQ8ypzso8ImTU1
	 E95VXYvBiAyLhz7ACy9Xt1kBxdZ5iPBFWFLN1WAcAE07mWoKof8uvFZTY08e0S6uQn
	 o4w004dTyjD356rb8g/2SDtPs1X6yjMbetP+Hyp3YNuWSjnBUZHz3bnZWTZgZDQ9zl
	 sppz/lieiSeyiSxOhKzrjGTzCqZF+n5IkicL9X9FpqKMBbGQ4lNNVmc/QB8LKH8F+f
	 N3pnK2L7vYZdUpdyjHna0kdDfzvvWbe1ntTsRxLo7fuk9JACVty2U8b04nqWG9roZL
	 OnOdsko5ITBvg==
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
Date: Mon, 13 Jul 2026 10:06:55 -0500
Message-ID: <178395521263.422064.7191945657582916493.b4-ty@kernel.org>
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

[08/14] drm/msm: Switch to generic PAS TZ APIs
        commit: 0be72be03ca7de55f22dd4c0622d81ac98aee38a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

