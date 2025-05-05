Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4D2C3ABBE
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voCDin5qtbzFtYG2WtSj8frTQDwO/cIKAz0Dn22e3ZA=; b=vnxETO13E3n2Wl54fZ56UrJrHV
	xzsBnLzfH5Nc5VSYWO9Rk1oZ9aEKpF9TxjabGHhFbDBvpEDxZZyw/Y39h3vJrSY502fdSsVCGrrMn
	OCwpDCLTJFW4FndVxsWDxqVxbPQww3nswj+x9SlKM2XJCFxl2GgKyTkp78WTPgyYfI25koJwSa3Lt
	4RX7nvf+/Mf4hMCTgyH+QBeoWXEj4DgBsTCMuwQpbe5kPnr+mg+mELtSmMIwF9cLAddg/QcKf8Tsq
	Hb3dGw1ztQmbU3Rin/XuTX7axO4uSeekPdbsscB+CJkNbykQ8/MuWjYdhUjQNsGWzSx6P1ICTWWkl
	y8IP+iTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8wG-00000009yqk-2Oh9;
	Tue, 06 May 2025 03:25:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4t2-00000008xEB-33T3
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 23:06:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 547BAA4C6B1;
	Mon,  5 May 2025 23:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7036C4CEEE;
	Mon,  5 May 2025 23:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486371;
	bh=Eu0Vxmjy+j96zmKQbWqFv06fTIOV9pidgP4pHpT+D9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WHXa2kfyWrlErSsszY91+kJ03HPDAHe3cl+XseLM6he9ulJf0WH4zDgfgMdZ3NJT1
	 pkj41wH/hyJzDP5j4h37kwmXHweUs9DOdJ/D1cc4PO/zGtOblTikG0l0M9wg+Cv1Y7
	 jocJhzkD16//o4dVFEDkXXPnKS7LtfONdMArXMHltiK7hz6XTp/Zq3zvvbYqohUZ7X
	 ntQKURoM3aXmkjFqmsV9CuiqOvMd6/dLnXkQFUaYKVE9Ca0VDpd1EG6FaWXnc1iM1X
	 AWna2lslumUPgCxpl8+p84o+PLYXIdf8i3faQtp1ZOQEQ1r1xipJ6bIqJsvC1PTWb2
	 wepUwGrPh7KSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 289/294] wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
Date: Mon,  5 May 2025 18:56:29 -0400
Message-Id: <20250505225634.2688578-289-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160612_831125_912E543D 
X-CRM114-Status: UNSURE (   9.85  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 6788a666000d600bd8f2e9f991cad9cc805e7f01 ]

End offset for the monitor destination ring descriptor is defined as
16 bits, while the firmware definition specifies only 12 bits.
The remaining bits (bit 12 to bit 15) are reserved and may contain
junk values, leading to invalid information retrieval. Fix this issue
by updating the correct genmask values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Link: https://patch.msgid.link/20241223060132.3506372-8-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 6c17adc6d60b5..1bb840c2bef57 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2918,7 +2918,7 @@ struct hal_mon_buf_ring {
 
 #define HAL_MON_DEST_COOKIE_BUF_ID      GENMASK(17, 0)
 
-#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(15, 0)
+#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(11, 0)
 #define HAL_MON_DEST_INFO0_FLUSH_DETECTED	BIT(16)
 #define HAL_MON_DEST_INFO0_END_OF_PPDU		BIT(17)
 #define HAL_MON_DEST_INFO0_INITIATOR		BIT(18)
-- 
2.39.5


