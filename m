Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9508DC7115A
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnTTwg/yhIQa1ZK214EnIh/H0vG11rbocIjGvkMTpe8=; b=kv+H/I9cmmsneiOzAEDY8kocwO
	0i6C1AzUMoE2XoJok7UMIrxVjI4x+f6MK0jA3ayryRyr+qs2Ps+ekzVVizpMypJvbCafyXsXMH/ds
	2pyJ1w9vcTjD24w8oj43UZJQAerSlf+Esa/bb1Kd3//H/qK/oGQEVChhd4yARlheq669/0gVYJ7ht
	dMSjtik1s53Zci8QnSjelFoFKp8EPl1HU51N/D0hStIegaOf1ENs7x8jZgqoNxPUbzRnMwtEjSe1O
	SpRS/Tz1dx6T433XSxfj9uLNB4koVTh5gDClvATZTfvOg3CQNdh0lptCh0tlnOOKd/6Z6UChtyMm1
	TXm5lJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRjB-00000006blX-1QN6;
	Tue, 17 Jun 2025 08:31:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQkp-00000006SN5-1ceI;
	Tue, 17 Jun 2025 07:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35D1649B3E;
	Tue, 17 Jun 2025 07:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F31C4CEE3;
	Tue, 17 Jun 2025 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750145350;
	bh=AuWkEGwym3nXMHNk44MsuVeLpiI/Wz8yHeXqHBrVbJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R187Zh0JcPnBZlACGJx9Xo7x7tsUxSKgap3xEnydh4J9ymsL/26rE49zbMEjqjjKn
	 +wJ9ts73AQl5pqagF58b2HkySoF2IFCwmhihqdpXFWvT22ItD7AW+mL64l5y7oVlo6
	 yLckux5yU9bubF36m4L8k4uZaCeKAHt1po7znKJO9b8xd4v1ERB34+g7B0Ma/WHjJq
	 CH1vfHjv6iLOSy2LPmXIL9HM6JTbau712oriVZlEDLflYJRp7dHfD6Egvnfi5cWFyD
	 uTDxUirb0nvDiTYE569P7a2v/0C9MtWbFq1gAOUl8WTQuqGKgSM7toUienTCuewnOp
	 KQ4AasbvxUp9Q==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kunwu Chan <chentao@kylinos.cn>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Troy Hanson <quic_thanson@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com,
	sebastian.reichel@collabora.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH v6] bus: mhi: host: don't free bhie tables during suspend/hibernation
Date: Tue, 17 Jun 2025 12:58:51 +0530
Message-ID: <175014516328.16478.17449149106590025798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516184952.878726-1-usama.anjum@collabora.com>
References: <20250516184952.878726-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_002911_571665_D7AE52F3 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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


On Fri, 16 May 2025 23:49:31 +0500, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: don't free bhie tables during suspend/hibernation
      commit: df75d6d7ce922645e674f5d591c7333f11027cdc

Note: I've modified the patch little bit to rename __mhi_unprepare_keep_dev to
mhi_deinit_dev_ctxt() and also reworded the description.

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

