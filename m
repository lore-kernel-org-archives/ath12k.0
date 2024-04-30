Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0D1C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCYrcqZkIxQAesCPMoQh0A9337b9IRQ9ZMWa5hsaqQ4=; b=ib4zrWfjqQNLpgF4KEjhwc6a8W
	rHNsG0fXgr8k2EfHkg4kI503LBF5HIIE9l8IDxcsNv085xDY5uS2ko7o6b+kd8Qr7cvM8B39PNV2T
	AP3pf5hyqvpHiPxbBnblznFDTUfbU0TLnnHz0zp49lLb3t6EKZK5692TzcuTNj5YYmVHH3UPBim76
	HE0Iy23REiQelFfu6E3835DiccE7JBfg6DqnUxI7RCJQUhL60vpS/umHzpHdsBQSwfgjZKPcmRkQR
	WpI8CXraInPlMRVWEPPZ4lNMXPTGArgbTnUgLW51cj5cbKhiIqpWmPXnY8qG9xPz5K/MZF0FD7zvT
	Z57Ax/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ne8-00000006Yqf-1tnL
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 13:35:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ne5-00000006YqE-0WZd
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 13:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3C977CE1044;
	Tue, 30 Apr 2024 13:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E7FC4AF18;
	Tue, 30 Apr 2024 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484142;
	bh=BS4Ex7IDF8ZvIW9lV3JywjDVj9PSW7RLDN20me3TgKw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BV4jsJ5LPmBqPzC0gnQHzmHg0GRz1qo4abBCZ40VXLW9WuWMK1s64EG/lpXzsWc+8
	 2C0gVt7lMECrN8aM833fiAtyBAlSjeK93putnuQDzB1X4YOGlPqW5xzF6sC7xJ9a/Q
	 If3pf5iZhCiif2fFSm/QISn0Lt78/5qB2r2IgOm0RR03yQVe+pbWrDrEh3qHzGYi8t
	 dOb8xro1hlEUREsGqzx+4rBN0m7roJC+OMpUjLQIT20zsbbjEFZhn9ee7YG8aqrSh4
	 eipef7bTxQ63oio702XMvDp1Dfnw1yAyGZ5E13u8wROWACbjqlV2DyeWHtPIIsm2ez
	 4L3CGBDLRoFrw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix flush failure in recovery scenarios
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240426015434.94840-1-quic_bqiang@quicinc.com>
References: <20240426015434.94840-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171448413940.313333.15685357327905271227.kvalo@kernel.org>
Date: Tue, 30 Apr 2024 13:35:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_063545_445218_DB76BAB4 
X-CRM114-Status: GOOD (  14.39  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Commit eaf9f17b861b ("wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc()
> call") moves ath12k_dp_pdev_pre_alloc() from ath12k_core_start() to
> ath12k_mac_allocate(), resulting in ath12k_mac_flush() failure in
> recovery scenarios:
> 
> [ 6849.684104] ath12k_pci 0000:04:00.0: pdev 0 successfully recovered
> [ 6854.907320] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> [ 6860.027353] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> [ 6865.143385] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> 
> This is because, with ath12k_dp_pdev_pre_alloc() moved to ath12k_mac_allocate(),
> dp->num_tx_pending is not reset due to ATH12K_FLAG_REGISTERED set in
> recovery scenarios.
> 
> So a possible fix would be to reset that counter at some proper point,
> just like the old design. But considering that the counter tracks number
> of packets pending to be freed or returned to mac80211, forcefully reset
> it might make it hard to expose some real issues. For example if somehow
> ath12k fails to free/return some TX packets, we don't know that because
> no warnings any more.
> 
> That is to say we should not reset that counter during recovery (which is
> already done due to above commit), instead should decrease it each time
> a packet is freed/returned. Currently almost each related function has
> this logic implemented, except ath12k_dp_cc_cleanup(). So add the same
> there to fix this issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

24de1b7b231c wifi: ath12k: fix flush failure in recovery scenarios

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240426015434.94840-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


