Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44727C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3nmUpv3Y8HdEf4idOouiiVdVWFH7olg5v8qS1f+BvE=; b=k0pS/Tl97CMIDcs4kTp/ZLQBvg
	hWR+XImM3TnE3bCKykBqtTvxV3fQmNeiZxVPf/IcAm57GTeEs7BXH1k+j3YG3X6jbWKD9Z3zlq10G
	sV/aXfXaMylegfTCx+DN/9RpAQdUBPOR/JhqA6wZ+ysguKywwJj7eWEmZ8WRzRB54n0Iq0EryE2g8
	2+Fd2CpA82ae9/Be7HWG1/ach9VphxuczrYPrASqSLx1ir5nQcO8BhIdJkYU1JfqVIZiNi9Pyy/Fc
	y9/iNztIqJF65f+fGaVYH9fYRgYt9nhPH2QMWw2lu5IGavkhfltg3GBzw66+gjNNnsyI4DJ9yBGpg
	H7LeWDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbD01-0000000Dzi1-3FTP
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 06:17:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCzy-0000000Dzgd-3XJC
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 06:16:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NK1b9W025017;
	Fri, 24 Jan 2025 06:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3nmUpv3Y8HdEf4idOouiiVdVWFH7olg5v8qS1f+BvE=; b=bNoBIcXmuVgSS69H
	wmgc2O+tvOhcQJf+7vjKr8+XLHsppH0tdl8dKRrDj7+uU7nMW7jrqsuGTqase+u2
	eH6pU9R88HOaiEHvjTDngEQVHhtNy3jMTKmmMnxOHft6wXjwZiRgGkDmpE2elESr
	OCE3O93krYgzRLl0A0mnKN758TR8m+jy+ps8PW2xrd/pf2bt85eJBrDLF3GDDOMp
	s64Y2cJnImz/cC8DLuBBDnen6JoSBwtl2ea+PMheJ5FRqYCO57dgx4UoIFMOFjP3
	Z74acPMucxcWRClLvdqVhHiypBITzSnm9DYi1lFUBs36MpeQhkVngxtSxFupFxcP
	PbemOQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bvenh1pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O6Guw9013567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:56 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 22:16:53 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 11:46:36 +0530
Subject: [PATCH v2 2/4] wifi: ath12k: fix handling of CSA offsets in beacon
 template command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
In-Reply-To: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JCm4PVYEDANlaZA4NlpKiOn4if-34O4y
X-Proofpoint-ORIG-GUID: JCm4PVYEDANlaZA4NlpKiOn4if-34O4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_221658_890080_30B5DFC3 
X-CRM114-Status: GOOD (  17.38  )
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

The driver is informed of the counter offsets in the beacon during CSA
through the ieee80211_mutable_offsets structure. According to the
documentation for the cntdwn_counter_offs member, "This array can contain
zero values which should be ignored." However, the current implementation
uses these values unconditionally, without checking for zeros.

Whenever CSA is active, these offsets are guaranteed to be set. Therefore,
add a check for CSA active status before setting the CSA switch count
offsets. This ensures that the offsets are only set when CSA is active,
preventing incorrect configurations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c |  2 +-
 drivers/net/wireless/ath/ath12k/mac.h |  3 ++-
 drivers/net/wireless/ath/ath12k/wmi.c | 23 ++++++++++++++++++++---
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 417d53dd9c79d15b69642793c6846005a9da4cf3..53c01debf8f8fd6eae675f189e4dfd00717555db 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -503,7 +503,7 @@ static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
 	return 0;
 }
 
-static struct ieee80211_bss_conf *
+struct ieee80211_bss_conf *
 ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->ahvif->vif;
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 3594729b63974e942b91eed0ebdfcabcb6a3c3a1..58897217d63b3644a78a49bb580cf4235d2f9985 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_MAC_H
@@ -108,5 +108,6 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
 void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 					  struct ieee80211_chanctx_conf *conf,
 					  void *data);
+struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index c129dce5832aa76e0c084548c5019dfd63386186..6ed3d2e8e86e362bb2fafa6bd267c45e2b2e314f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1896,8 +1896,11 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 {
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct ath12k_base *ab = ar->ab;
 	struct wmi_bcn_tmpl_cmd *cmd;
 	struct ath12k_wmi_bcn_prb_info_params *bcn_prb_info;
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_bss_conf *conf;
 	u32 vdev_id = arvif->vdev_id;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
@@ -1906,6 +1909,14 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 	int ret, len;
 	size_t aligned_len = roundup(bcn->len, 4);
 
+	conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!conf) {
+		ath12k_warn(ab,
+			    "unable to access bss link conf in beacon template command for vif %pM link %u\n",
+			    ahvif->vif->addr, arvif->link_id);
+		return -EINVAL;
+	}
+
 	len = sizeof(*cmd) + sizeof(*bcn_prb_info) + TLV_HDR_SIZE + aligned_len;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
@@ -1917,8 +1928,14 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 						 sizeof(*cmd));
 	cmd->vdev_id = cpu_to_le32(vdev_id);
 	cmd->tim_ie_offset = cpu_to_le32(offs->tim_offset);
-	cmd->csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[0]);
-	cmd->ext_csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[1]);
+
+	if (conf->csa_active) {
+		cmd->csa_switch_count_offset =
+				cpu_to_le32(offs->cntdwn_counter_offs[0]);
+		cmd->ext_csa_switch_count_offset =
+				cpu_to_le32(offs->cntdwn_counter_offs[1]);
+	}
+
 	cmd->buf_len = cpu_to_le32(bcn->len);
 	cmd->mbssid_ie_offset = cpu_to_le32(offs->mbssid_off);
 	if (ema_args) {
@@ -1948,7 +1965,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 
 	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_BCN_TMPL_CMDID);
 	if (ret) {
-		ath12k_warn(ar->ab, "failed to send WMI_BCN_TMPL_CMDID\n");
+		ath12k_warn(ab, "failed to send WMI_BCN_TMPL_CMDID\n");
 		dev_kfree_skb(skb);
 	}
 

-- 
2.34.1


