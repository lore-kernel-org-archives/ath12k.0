Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192CC36014
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hlqgc+M3YYX4Eb0y5KQ/PHEfD9KlRSCtoOKyGmlaoZk=; b=y4C5+EuNhjnkR+QHCwaGOPZb63
	ueAX3Q43sTZn84hQARb8N+81YRF4FmMLHzBeZAJtUUUHhxvZ7kTXsc9yf51yachSUSyS7noWawz9b
	QeKcMvEczSRXBapTQnJ+EkQV9fcYAUHVdOdWAtXMBYxSL7ODHL2jIqM2iSIPu10l1SteFrN6AaYx9
	i979OuJ/Ax43iZQHUJGc5vhnsosKj6CakBS+Bw5IzG1gNnJDUyfXszDAHgH/BWbnPa+eiqiseHDWo
	UUYpl21CGtIz3Cg1v6pk/j0MoLgdbTuOaN1VthOC3b+NU61zeUD/MChpul0ohSjTj+81eutNEIG62
	nsC98X2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q1f-00000009gcU-1dyD
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 19:14:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pup-00000009eh7-1dGI
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 19:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C121A5C6C74;
	Thu,  3 Apr 2025 19:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFB4C4CEE3;
	Thu,  3 Apr 2025 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707270;
	bh=DmUNrENmIO/tvvF53YKKC/KhVFbiso1i3NPfSHucRLE=;
	h=From:To:Cc:Subject:Date:From;
	b=nbIZI58Rsv4ZbeCYvfZR2G0dvN/Jg0DdGUimPaFQ5y52GuujEe/z2YoEPIXeIBmCx
	 ZGQky9b2FTUPnqadR1399/5I1WxoHT8MOtkOkrBQrC6/4MfkfCxL99NlWv5YYtBtfG
	 4nL3bXdi9J+T9UQO0K8vwdjJGJ3TwYkq2ZF+ZBMk4Ca4fwxJsw37MdCpkQ8t8Qxcmg
	 j3XU08eEvTU+mz5Xt/VQIn7uM0KJqC3uybKhnDQQO09xJAMLTXx51Px/yEUGwyHOxB
	 5XteVPoobJFYLnm2cYwrGioLjUu2ZA9VptZH/3biAB9+0wXrirosi2vsKhgYCItS2i
	 IMZdaa6l6pw5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 01/26] wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
Date: Thu,  3 Apr 2025 15:07:20 -0400
Message-Id: <20250403190745.2677620-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120751_488095_95F4A024 
X-CRM114-Status: GOOD (  11.92  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 63fdc4509bcf483e79548de6bc08bf3c8e504bb3 ]

Currently, ath12k_dp_mon_srng_process uses ath12k_hal_srng_src_get_next_entry
to fetch the next entry from the destination ring. This is incorrect because
ath12k_hal_srng_src_get_next_entry is intended for source rings, not destination
rings. This leads to invalid entry fetches, causing potential data corruption or
crashes due to accessing incorrect memory locations. This happens because the
source ring and destination ring have different handling mechanisms and using
the wrong function results in incorrect pointer arithmetic and ring management.

To fix this issue, replace the call to ath12k_hal_srng_src_get_next_entry with
ath12k_hal_srng_dst_get_next_entry in ath12k_dp_mon_srng_process. This ensures
that the correct function is used for fetching entries from the destination
ring, preventing invalid memory accesses.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Link: https://patch.msgid.link/20241223060132.3506372-7-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f1e57e98bdc60..35f22a4a16cf2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2571,7 +2571,7 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 		dest_idx = 0;
 move_next:
 		ath12k_dp_mon_buf_replenish(ab, buf_ring, 1);
-		ath12k_hal_srng_src_get_next_entry(ab, srng);
+		ath12k_hal_srng_dst_get_next_entry(ab, srng);
 		num_buffs_reaped++;
 	}
 
-- 
2.39.5


