Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E8C25B47
	for <ath12k@archiver.kernel.org>; Wed, 25 Oct 2023 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRxEF/sOZHS199yiup8wTdWUOPrc9WZ0OyBxPbb74is=; b=I9e7GMPK9fXJG7
	aKaMfxqCdezxmZ7euC+mdwfuWR5Dxl/gJyr8iRa1mlI0nkN2AYtXh3vxwmRN4GKAAbVt8u5k56d5v
	bW3hQ38RAag20Vtvsm25/8+RCXmbpes1luxOW4CJTQsKl4MLKoLTp73OqibdSnB2AlUpeXLnZ7VqO
	2vWN2L6kziOge4j9m26A+S0Dsr1eAxA0fR5pE2ad8VfL2rkEwglrb51jn/zEum8fr7tsTafWivhBO
	FNgY0KQUEOv9QBosfp7qcYyj6f61s0IMzkewu/KpwMY9mzANRN5dF8bgz3IGKgCTV3TDonZAFGo+S
	1k8nXxtPrTetaE47Ku8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaiG-00Btw0-16
	for ath12k@archiver.kernel.org;
	Wed, 25 Oct 2023 10:02:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaiD-00BtvW-34
	for ath12k@lists.infradead.org;
	Wed, 25 Oct 2023 10:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3400A62F5D;
	Wed, 25 Oct 2023 10:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806FCC433C7;
	Wed, 25 Oct 2023 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698228125;
	bh=ybu2QhM0g6Ex7UMsUBH7XX68xTRuJ62s71y77gSZog0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=C57jVZDbxfjQWkCIMYu1b+AZGs01SCimI77orisHJYNXv2PPVltTcQTOPSfXwglQb
	 trI9FgmBKoIBQs7Nq9UHwtbokFk1TXVNNdY7oXpErNJ0YDQS7wspi8YGTIx/o2Oywf
	 tvttOm35eD6UUN0+vd2qt53U4SlXrOLDpvevC+dpGq6i0E4AUvIAjUgZQ43RR1nXfr
	 iWjUgGPwduvcH83k1/CQ0XT4Hz6p4IB11TxClNzGEpHuLBNeNBUw3GT2hQ8JfWShiC
	 esXoUt9FwbUZl236S9y1BvbSn2Inl6Og1eDaRxW1Z40Za521/LpyQiUl9R0kB7NAce
	 l0ev8qBHMajFg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath12k: fix dfs-radar and temperature event
 locking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231019113650.9060-2-johan+linaro@kernel.org>
References: <20231019113650.9060-2-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822812144.891844.11172869557869063220.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 10:02:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_030206_036908_85E6FA1E 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Johan Hovold <johan+linaro@kernel.org> wrote:

> The ath12k active pdevs are protected by RCU but the DFS-radar and
> temperature event handling code calling ath12k_mac_get_ar_by_pdev_id()
> was not marked as a read-side critical section.
> 
> Mark the code in question as RCU read-side critical sections to avoid
> any potential use-after-free issues.
> 
> Note that the temperature event handler looks like a place holder
> currently but would still trigger an RCU lockdep splat.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org      # v6.2
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

69bd216e0493 wifi: ath12k: fix dfs-radar and temperature event locking
6afc57ea315e wifi: ath12k: fix htt mlo-offset event locking

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231019113650.9060-2-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
