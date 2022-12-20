Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B140CC4167B
	for <ath12k@archiver.kernel.org>; Tue, 20 Dec 2022 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuNjL5BD3CAwFMnWu6LFINqNEkikNvj4AtfHoNuRBUA=; b=nOqjysfrffIf7q
	ceCMePy0YXf53V1QExaUziMFKM/oigOuXZi6wLXcnjACgJVq5942mEEjfs1x9ztwAw4mP2gnqlnHd
	ylTaUbe2eajiD4UZ6AWHV3Lmt0XavRC66UJvRWgTgQQYkdtJ0nYmYw/vOwlOUsHwQxTawwjIyGLuX
	LQcZo3sPGA+bAtbIkEFXaYy18RwpIiwSp1/f1Y/iHMUEtbccUO/kYd1pN4CxI9gWzAMa42/GVaAiX
	Enh8xHA7CaVr2kMLvyfeSUJ8yfKF3wTrCnU2OO7TAm5TnbB0SH4NRmpGSsGwf/ckwcYx5QhOWq3AB
	eOC4JqQBZdtN1DMY73Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOq-00EMJ9-2g
	for ath12k@archiver.kernel.org; Tue, 20 Dec 2022 12:07:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOl-00EM9T-R1
	for ath12k@lists.infradead.org; Tue, 20 Dec 2022 12:07:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C09D6B811A2
	for <ath12k@lists.infradead.org>; Tue, 20 Dec 2022 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD1BC433D2;
	Tue, 20 Dec 2022 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671538024;
	bh=H8hOmQQXa73xd1vfaYZBM6AE2cK7nY9g5yp5NjMcdZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=unmmMtD0wPOaTDkTNSs8pgTQNYNPgSBGuDLpsDn51lkT6oEJWx1PqynePy5fHOHIE
	 UG2WC/0r3p6buehOZ4xXPWvZV+jmogsCsqL1ulRAKOC7iVrdxVORqPiVqmF9eUqyaM
	 t1/lmgCQ8aFhRDYjcPcPCMds6XpiVHnP5S9FsyHsxx1EBi2XrG68F9r2XS7M81AZpP
	 Hd7J3yw5+DwBh72baaSI+afxvaFbV2hu8mLevzPfM8BbMqxGjB6ELQoTKP5jjHaYQU
	 av1gXjgriiH/Yqc5Rmpmjh6NJ4RsArv6f04UCekJnzl9mnksODTG1Bn70u/rIG8888
	 L7+dik1uXGaCA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/3] wifi: ath12k: wmi: delete PSOC_HOST_MAX_NUM_SS
Date: Tue, 20 Dec 2022 14:06:55 +0200
Message-Id: <20221220120655.19389-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221220120655.19389-1-kvalo@kernel.org>
References: <20221220120655.19389-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_040708_237479_2500CA21 
X-CRM114-Status: GOOD (  14.73  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Both PSOC_HOST_MAX_NUM_SS and WMI_MAX_NUM_SS are set to 8. The host assumes
that the values are the same but there's no check for that, so things will
break if either of the values change. It's simpler and safer to have just one
define so delete PSOC_HOST_MAX_NUM_SS and use WMI_MAX_NUM_SS everywhere.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 10 +++++-----
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 338082719631..f6df14149531 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -428,7 +428,7 @@ static int ath12k_pull_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	arg->ppet.numss_m1 = le32_to_cpu(ev->ppet.numss_m1);
 	arg->ppet.ru_bit_mask = le32_to_cpu(ev->ppet.ru_info);
 
-	for (i = 0; i < PSOC_HOST_MAX_NUM_SS; i++)
+	for (i = 0; i < WMI_MAX_NUM_SS; i++)
 		arg->ppet.ppet16_ppet8_ru3_ru0[i] =
 			le32_to_cpu(ev->ppet.ppet16_ppet8_ru3_ru0[i]);
 
@@ -520,7 +520,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_caps->he_ppet2g.numss_m1);
 		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_caps->he_ppet2g.ru_info);
 
-		for (i = 0; i < PSOC_HOST_MAX_NUM_SS; i++)
+		for (i = 0; i < WMI_MAX_NUM_SS; i++)
 			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
 				le32_to_cpu(mac_caps->he_ppet2g.ppet16_ppet8_ru3_ru0[i]);
 	}
@@ -541,7 +541,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_caps->he_ppet5g.numss_m1);
 		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_caps->he_ppet5g.ru_info);
 
-		for (i = 0; i < PSOC_HOST_MAX_NUM_SS; i++)
+		for (i = 0; i < WMI_MAX_NUM_SS; i++)
 			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
 				le32_to_cpu(mac_caps->he_ppet5g.ppet16_ppet8_ru3_ru0[i]);
 
@@ -559,7 +559,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_caps->he_ppet5g.numss_m1);
 		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_caps->he_ppet5g.ru_info);
 
-		for (i = 0; i < PSOC_HOST_MAX_NUM_SS; i++)
+		for (i = 0; i < WMI_MAX_NUM_SS; i++)
 			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
 				le32_to_cpu(mac_caps->he_ppet5g.ppet16_ppet8_ru3_ru0[i]);
 	}
@@ -1935,7 +1935,7 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 			cpu_to_le32(arg->peer_he_cap_phyinfo[i]);
 	cmd->peer_ppet.numss_m1 = cpu_to_le32(arg->peer_ppet.numss_m1);
 	cmd->peer_ppet.ru_info = cpu_to_le32(arg->peer_ppet.ru_bit_mask);
-	for (i = 0; i < PSOC_HOST_MAX_NUM_SS; i++)
+	for (i = 0; i < WMI_MAX_NUM_SS; i++)
 		cmd->peer_ppet.ppet16_ppet8_ru3_ru0[i] =
 			cpu_to_le32(arg->peer_ppet.ppet16_ppet8_ru3_ru0[i]);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index c193aea704a2..84e3fb918e43 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -43,8 +43,6 @@ static inline s32 a_sle32_to_cpu(a_sle32 val)
 	return le32_to_cpu((__force __le32)val);
 }
 
-#define PSOC_HOST_MAX_NUM_SS (8)
-
 /* defines to set Packet extension values which can be 0 us, 8 usec or 16 usec */
 #define MAX_HE_NSS               8
 #define MAX_HE_MODULATION        8
@@ -2233,7 +2231,7 @@ struct ath12k_wmi_pdev_band_arg {
 struct ath12k_wmi_ppe_threshold_arg {
 	u32 numss_m1;
 	u32 ru_bit_mask;
-	u32 ppet16_ppet8_ru3_ru0[PSOC_HOST_MAX_NUM_SS];
+	u32 ppet16_ppet8_ru3_ru0[WMI_MAX_NUM_SS];
 };
 
 #define PSOC_HOST_MAX_PHY_SIZE (3)
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
