Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2A5C4321E
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjrWTJFtQR6I6zfN/itDhNu0PcKNxFWbonDwt5vCw4U=; b=dro/CN1q/Czw92
	Q7S0uGJt0rf+Vo9A1Lr5eS6EuX+RdqeMbVDnrdVNLJZAi/vrt5xi5H0OFmEv5WZv77G3fIOVQM4o5
	sInplUSaP0Dh81K/H25mvrFcnh24csQ7j3mJhzhtn/2r9bKLSmyVCnTEzmMGDvkHgrIEEuDAZq/tU
	ZmaJWAFsdbYQcaOyjp0Nq+lDPk+sU6LAUMxVYyw3kbmJ9vleYLxUbW/76PljFnw6rY4Xlahh6y04I
	5I2wKkGJjk+jf8gvFb6PqgcjGo+LXnFTTYaQzFMhHDt2+dbV7aCt7KBXlGp+j4q67JdN7n9buQEQj
	eFpMW+CGofw2UL7nS0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS9-005yVh-Vb
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS8-005yT5-L2
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a/vFmg/ZO6O7uRDQDRF30mYERb8Wwa6/TS7xVKgQvmA=; b=BDBTM31IYF4Z5sbYyBEItzmk4x
	kfIiUaGr0of69cut4JE/kfQHngVkkc8zecCfxVa+1ndwozpYYw8ektBQCvR/BmIWfwYyoK6tAcC8w
	4CWmfRMA8Ug57+XLakaMLjq8ilbkq5C3hJHGRmyr87MgWDfL2tEckw2FnG09M1qAQCZnShlC+TUH/
	8SxkquQ1f2ARfSJzFr9evlvqRs3OUv7NCHWtQo5A+pwVijSacu4a3Xkm5CO19Xiua4nwPllZR1Fmb
	9+rnpH1uzqL/dcHa30lI5ppmHKDUghXKVRSQoQHl7E+enmYYJL1UOnNyKdk1jz0LPt4kcyXAd354T
	dX1iLIfQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS5-001P39-DX
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28D5061EE6
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B30C433C1;
	Wed, 16 Nov 2022 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616792;
	bh=5F8D0+vl2kZ4/R66S20cfD8525Duset2QibnHedw1qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQ9D+sK27GsLcSFvdXoIMgzaCreO6OmKX8TizfHbCIY093u0vY+uFwSLm8SMeYqJA
	 l/yDn3Cm9X3napEEuwGFiyFpirrIuBye8gvBxcOfqz5HyTbULl594JK+FmMu04irp6
	 QIK8mdGh0JwnDQiHoZqQy+1LbP3Ww44Ev7fguSlspeUet1vBVkU8O6MOk1j7AfZfpR
	 PZ6ODr5yIaVOIQf+TEBXvzE7TRaCuOyVlesPnRRAephkqYvscT1N6H1+MVZCqXBI8Z
	 UDV2k5/AUBhKvauPC7QW3IA3poRyiY8TzJnweppC+s04zTHBfEJqZfc8XHCZvoTJV2
	 lTnscgVRbZveA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 42/50] wifi: ath12k: add reg.h
Date: Wed, 16 Nov 2022 18:38:54 +0200
Message-Id: <20221116163902.24996-43-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163953_763135_41D9F40C 
X-CRM114-Status: GOOD (  13.06  )
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

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/reg.h | 95 +++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
new file mode 100644
index 000000000000..56d009a47234
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_REG_H
+#define ATH12K_REG_H
+
+#include <linux/kernel.h>
+#include <net/regulatory.h>
+
+struct ath12k_base;
+struct ath12k;
+
+/* DFS regdomains supported by Firmware */
+enum ath12k_dfs_region {
+	ATH12K_DFS_REG_UNSET,
+	ATH12K_DFS_REG_FCC,
+	ATH12K_DFS_REG_ETSI,
+	ATH12K_DFS_REG_MKK,
+	ATH12K_DFS_REG_CN,
+	ATH12K_DFS_REG_KR,
+	ATH12K_DFS_REG_MKK_N,
+	ATH12K_DFS_REG_UNDEF,
+};
+
+enum ath12k_reg_cc_code {
+	REG_SET_CC_STATUS_PASS = 0,
+	REG_CURRENT_ALPHA2_NOT_FOUND = 1,
+	REG_INIT_ALPHA2_NOT_FOUND = 2,
+	REG_SET_CC_CHANGE_NOT_ALLOWED = 3,
+	REG_SET_CC_STATUS_NO_MEMORY = 4,
+	REG_SET_CC_STATUS_FAIL = 5,
+};
+
+struct ath12k_reg_rule {
+	u16 start_freq;
+	u16 end_freq;
+	u16 max_bw;
+	u8 reg_power;
+	u8 ant_gain;
+	u16 flags;
+	bool psd_flag;
+	u16 psd_eirp;
+};
+
+struct ath12k_reg_info {
+	enum ath12k_reg_cc_code status_code;
+	u8 num_phy;
+	u8 phy_id;
+	u16 reg_dmn_pair;
+	u16 ctry_code;
+	u8 alpha2[REG_ALPHA2_LEN + 1];
+	u32 dfs_region;
+	u32 phybitmap;
+	bool is_ext_reg_event;
+	u32 min_bw_2g;
+	u32 max_bw_2g;
+	u32 min_bw_5g;
+	u32 max_bw_5g;
+	u32 num_2g_reg_rules;
+	u32 num_5g_reg_rules;
+	struct ath12k_reg_rule *reg_rules_2g_ptr;
+	struct ath12k_reg_rule *reg_rules_5g_ptr;
+	enum wmi_reg_6g_client_type client_type;
+	bool rnr_tpe_usable;
+	bool unspecified_ap_usable;
+	/* TODO: All 6G related info can be stored only for required
+	 * combination instead of all types, to optimize memory usage.
+	 */
+	u8 domain_code_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u8 domain_code_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 domain_code_6g_super_id;
+	u32 min_bw_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 max_bw_6g_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 min_bw_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 max_bw_6g_client[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	u32 num_6g_reg_rules_ap[WMI_REG_CURRENT_MAX_AP_TYPE];
+	u32 num_6g_reg_rules_cl[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+	struct ath12k_reg_rule *reg_rules_6g_ap_ptr[WMI_REG_CURRENT_MAX_AP_TYPE];
+	struct ath12k_reg_rule *reg_rules_6g_client_ptr
+		[WMI_REG_CURRENT_MAX_AP_TYPE][WMI_REG_MAX_CLIENT_TYPE];
+};
+
+void ath12k_reg_init(struct ath12k *ar);
+void ath12k_reg_free(struct ath12k_base *ab);
+void ath12k_regd_update_work(struct work_struct *work);
+struct ieee80211_regdomain *ath12k_reg_build_regd(struct ath12k_base *ab,
+						  struct ath12k_reg_info *reg_info,
+						  bool intersect);
+int ath12k_regd_update(struct ath12k *ar, bool init);
+int ath12k_reg_update_chan_list(struct ath12k *ar);
+
+#endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
