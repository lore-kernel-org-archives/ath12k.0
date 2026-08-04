Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69009C55ABA
	for <ath12k@archiver.kernel.org>; Tue,  4 Aug 2026 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rNKgpIx6sZKzmYQ6FweqLBwIUVjPux1He9OuvdAw/w=; b=l/+RrOhUp7Pixf6K5A7dYGdj+H
	x9hvcAoTHnzmsu2yySy2CythKH24pdMw8MRYjVLemYZUWryi7F//EymCVwirbJoMENQx7HZ8hOJLo
	HNhOERvrSjoNgxJ2fGHiu9hJRyh0u1TrYMxkfvxWQA3WMYVjnOIqYHF56oPW0rJy7aUi8Ib5y1aP9
	CJ7N17Zzh1ZZ+0aZRHOJnYZulZpOCO7xZiaWjpxA0kgx654qQuePQx66+vZdp95nzKDt7rmp3srn6
	xNnb3AkWeVPuNkifKJLhrjx4MY506QLKQ1ExyM/gnqlOPTbdlVMQ/Vbwv4sqajhjm/vKH+t7qiH0h
	EgMCfiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNfT-00000002sHx-3qBw;
	Tue, 04 Aug 2026 22:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNfS-00000002sHj-1Wfe
	for ath12k@lists.infradead.org;
	Tue, 04 Aug 2026 22:31:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8399243F42;
	Tue,  4 Aug 2026 22:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C731F00A3D;
	Tue,  4 Aug 2026 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785882685;
	bh=1rNKgpIx6sZKzmYQ6FweqLBwIUVjPux1He9OuvdAw/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VSdW48Lc4jRQjSvOYK6+1RkSCe23ufhDsOsXhNt4Ddw8D/YQHxmW320dvP2P7ORz+
	 Nzz4hCaj/lJheSxjNhu3iK8vKtbjkdRaSYOp9A3xKfMCmjo1wFCtcIoxttJJ7CHyTW
	 6FMLdwzCEAHkqLj2FEznUUNVP76O0jKtDVItxv3ED11ABBaD/MjbZTwf7dKQLMYfYP
	 dEaRKsKWQs/SpA7P9pNqP15pttyCi9lzKbUd8DJdKNkfS4l3ybZmwCkpxRabdDxoZc
	 l51MfSH06sfXgb8HFBXSqbR2LPPJEGwI4O/DC9mCeNnBGbOkIY2Ycs3abL1ZRO0ZNw
	 8giP29bCtxPug==
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
Date: Tue,  4 Aug 2026 17:31:15 -0500
Message-ID: <178588267268.451855.11887423649046062153.b4-ty@kernel.org>
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

[09/14] media: qcom: Switch to generic PAS TZ APIs
        commit: 94d3305d990b055e1561e3b78275344b1f40c86e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

