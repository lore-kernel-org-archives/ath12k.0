Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97406C3ABC0
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BiW5KJi/4s4q13VbI38sMNWJWIEfh7wiCYItyMRVVQ=; b=YxlkUpVVi4kA880edbAntA3VGG
	cnHZuPDatvur+YFl1jW/6WqnLhliiz8U546UTyJvDmaMTrq7nxBYz42XdhOzwS3VHVneE+4h6N7GJ
	BGE4XwmvjLRjcyV53uxlsw4mWmRyDixk2dRcmtuPcPBueqVNEWwMJDwO2XXY9GYb8UfL5YmLrCD2E
	N9ty5j24ZmJZAM5TCaGR2q2I+Bl7sKIQhf3V2pM8xxxsv8RtfXzNpe2z/it9ZJynWU09+O0eZEB70
	INIe3nfFXKxuvBmVs8rMNp02jM9pc9Mv80TJPo/z4hHZmZx65D8uvYcXSRN6YyfHPQGbO86bla7cs
	89TyBVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6LU-00000009Koi-1VOO;
	Tue, 06 May 2025 00:39:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Rb-00000008oVV-17E7
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 377FD43AF4;
	Mon,  5 May 2025 22:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3405C4CEEF;
	Mon,  5 May 2025 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484670;
	bh=lqhKCAY77koNv/uMHWNWMDW2vBWWPyKqPu5DipKfz/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge22sTKQbMTDnxYMnaZtpFQqhLfts82fHg2Z5oCB31rbIHPQIaLeVf+s74Ion+VBN
	 uaXRS9bNgfgmgTUfH3kMdNXsISc3E3ZhZfX//Zogh1JwVyyaI4I+HIEJ3u1aQ6E4pY
	 2DjQJedY7XwJfmTvwFQ2GaOmT8tdhPI2OpwkMwXaeXUpTFw6BtxXqDiBQhRFikx4l0
	 +Yen+sETZ6SgmkgrE+k0fUnIxRhlWoni5aUh4snj4m32NhAyQp2lpmGAySdzdM2V54
	 V+ADmx/B94F2GbTBXl5t2hY2jpmDthuEECvlg4bQZhEh4cwWBAFwogaFRSECR44/4+
	 ZEN3+8t8qQMWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 598/642] wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
Date: Mon,  5 May 2025 18:13:34 -0400
Message-Id: <20250505221419.2672473-598-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153751_324430_8B147371 
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
index 7b0403d245e59..a102d27e5785f 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2968,7 +2968,7 @@ struct hal_mon_buf_ring {
 
 #define HAL_MON_DEST_COOKIE_BUF_ID      GENMASK(17, 0)
 
-#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(15, 0)
+#define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(11, 0)
 #define HAL_MON_DEST_INFO0_FLUSH_DETECTED	BIT(16)
 #define HAL_MON_DEST_INFO0_END_OF_PPDU		BIT(17)
 #define HAL_MON_DEST_INFO0_INITIATOR		BIT(18)
-- 
2.39.5


