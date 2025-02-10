Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA02CC0219E
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRldpQYUQvD9jkKM217c1U/kKH2mifVb0NoATjuLbvg=; b=ZCiNZeHthyU4EpPDJucpzE9baK
	I5hGlDSHo+DxDqZDihBjBnxQP2TDzFUuv5unUUKbvYq7VL4qA/naKnDJC2nos9/Gvsi5fo5vSOD1l
	R+aGm9Je50GeuSOf2NzK1/huWJLJdAf83UxBVk0ElRtk3xrhnSQ4nxY5dikro6/av8ps9SZUJfrQU
	w2QRvNmrphvGix3zOeDuLjCv8yLvrV4eTCff5zBqIOhzMOXnXBqJde2eVsKfnmGHRx7vSuYFq9hyY
	lwdCLnPAUEfsU6z8t+d/qf7dDwVh9QHVnQ7cGqik1uFo3o3QRzS+u9X0flHmmdzmNw0+zUC2zeyxi
	rvMBvi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeD-00000001AYx-26G1
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 19:40:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVD-00000000v6B-2hzl
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHgBct019724
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TRldpQYUQvD
	9jkKM217c1U/kKH2mifVb0NoATjuLbvg=; b=CVu0v+lMOXT5Qnw64tY2EIj4Lbb
	jNNYt8dWibWDblAP8tBsqVKvAm1heu5r3V03Wc27zm8N/A1QCFM9jra5wn9dJVge
	AUpx/Lu55SYo7mRL//QWjO/H/tvjMXPHSPgF1jcQGiyBeAJ+EPPXA7M5rclav4f/
	+7aAj4SLxNF4XVaIscdbJZP5coPtZ4rkgkjkUeQmnNJUw41neA1CsHE6KREkijhK
	0akPRfFdlcKE1aGgblsgixFwPNMejMGSqo4smNYgHJqDa7tiAQMYIx73cquXTmdn
	4CwbsQsZmOtlc0PpPaXzcDezGQi3LWVuUiNCEg+I8mMcj8xCL0FjhA7rWlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxna7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa636e5283so3223979a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212045; x=1739816845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRldpQYUQvD9jkKM217c1U/kKH2mifVb0NoATjuLbvg=;
        b=h8Ezjvyjn8uOBiGs8k8laZUWB5og1IbObEg0vmuS0DHeh8JTLRFK6DTdtVzOuaqxWA
         /ZEuFMKtGHMOHQgdIhVEOOhqjXEBtipqOedIMeLG8ifSMwq0SAqhEXDU9CLVocc94wxR
         qwrUz7m7uGvWnDlV7wTO6O+gvrZQ/w0GKIDpMtrEYWWgnrbsYyc4MCqRPvoorqx2N+W9
         085mUOuN8cPmxikx7CGjMVazG+0P+50saKKDGwmq9J6vTLopnjldfOsUhQOdqzglJffR
         fkyZhvixn8plkmMkbsc3n2kAFz0hOaIBC5vbwr9xEmltNaTr+hGRiIw3rKuxC09Nb8Rw
         U+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV42RKO9XT0lWdU6ydwR46+8IuYP1Pw8PO61aE5oWhFkKR09fxD+QSmJVEKnnAYKRll60oElCc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAxU57vpMb5Ms61CKUYK4xAcig3rDy+ivpaPLEcPyesud4u373
	eKHtUMA0fiKWe9Lpeor3Pmh1fJipGnissM7ud1qwtmormhligAJ84HgmytBzPaqcTJkqhwNOnwL
	evLV0ILeoJ9xBpia2ZuDKgTGaBlorTbEKs2DyQWZUs7HvzAXcGFunBLyok5s3
X-Gm-Gg: ASbGncvz/RnxWc8TuCf1F4Kj6Y6fYS6qUeCJGavoOJ20urTY9IpmeuDe6dWOc2SQJPF
	1T0YdUlAt6liyCJTk9wrJb/pQzBvobhkh2Czta4Rpv5iAkdXih57eXI3tVMxTyQpbBQBDhLDaLt
	n/yIgq2L2rdjbh40Wsv5GnnSY/bq3kPUGxHfDGyeMBhPuQtWNIUI2YIwc0FP5EK8IjAp1Bg6YqJ
	XeozUzT9Sa4rMKnAPmr/o6PnAUkRMsgzeSd8En84+K6abQnGJxTCcoPKq84s8xtTNIfNRF8ett3
	Yd7oi+gZSO5vsk4GyUwvwOURKtQfgwm/SEzHOznHQ3Op6bQYYOBVAF9bfuA7
X-Received: by 2002:a05:6a00:9a0:b0:730:937f:e838 with SMTP id d2e1a72fcca58-730937fea2amr6447013b3a.22.1739212045339;
        Mon, 10 Feb 2025 10:27:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeBK/mItKMGA0ZEn/2StC1+xoy1tpmMDTSchldtUYmYaQRFa7Vr5lyV+4W3tx9mXCEgZ4diA==
X-Received: by 2002:a05:6a00:9a0:b0:730:937f:e838 with SMTP id d2e1a72fcca58-730937fea2amr6446972b3a.22.1739212044924;
        Mon, 10 Feb 2025 10:27:24 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:24 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 5/5] wifi: ath12k: pass BSSID index as input for EMA
Date: Mon, 10 Feb 2025 10:27:18 -0800
Message-Id: <20250210182718.408891-6-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K6Nkgk6JLH2OhF959vt0dooklMq2HBR8
X-Proofpoint-ORIG-GUID: K6Nkgk6JLH2OhF959vt0dooklMq2HBR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102727_799378_A94F3384 
X-CRM114-Status: GOOD (  15.59  )
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

Function ath12k_mac_setup_bcn_tmpl_ema() retrieves 'bss_conf'
only to get BSSID index which is an overhead because the
caller ath12k_mac_setup_bcn_tmpl() has already stored this
locally. Pass the index as an input instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7d9975db5f47..67a4f555f30b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1643,24 +1643,15 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 }
 
 static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
-					 struct ath12k_link_vif *tx_arvif)
+					 struct ath12k_link_vif *tx_arvif,
+					 u8 bssid_index)
 {
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
 
-	bss_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!bss_conf) {
-		ath12k_warn(arvif->ar->ab,
-			    "failed to get link bss conf to update bcn tmpl for vif %pM link %u\n",
-			    ahvif->vif->addr, arvif->link_id);
-		return -ENOLINK;
-	}
-
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1676,7 +1667,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	for (i = 0; i < beacons->cnt; i++) {
 		if (tx_arvif != arvif && !nontx_profile_found)
 			ath12k_mac_set_arvif_ies(arvif, beacons->bcn[i].skb,
-						 bss_conf->bssid_index,
+						 bssid_index,
 						 &nontx_profile_found);
 
 		ema_args.bcn_cnt = beacons->cnt;
@@ -1694,7 +1685,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	if (tx_arvif != arvif && !nontx_profile_found)
 		ath12k_warn(arvif->ar->ab,
 			    "nontransmitted bssid index %u not found in beacon template\n",
-			    bss_conf->bssid_index);
+			    bssid_index);
 
 	ieee80211_beacon_free_ema_list(beacons);
 	return ret;
@@ -1729,7 +1720,8 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif,
+							     link_conf->bssid_index);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


