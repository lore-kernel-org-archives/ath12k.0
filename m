Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE8606A326
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+us/U8G;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjBgYfw/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FbkMTLCd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=g+us/U8GfDWnMY
	GP+4P4Bo48a6c7YsbnmaGBiHpAITx9HCm3D5BmCmT1KLDlHa4sp5mjPoQl2nVE5jzkkdz9Gc/5Vue
	AJeLxis8zWyiPXXDi9RkuV7GZOksCmZNIP1J+OQqHSt9rotgd4hp6XtFr700v9bWq9XDRmTGaV0Dy
	vSLk6kbgDyrFf5Pk1IRUmqeXmntCQfjvKFLcHneHKjNc9JiD+YD2zVqJKKAl5LeC/5YTHpu+C8S2T
	Q6c1mazJbUCUVORY/ZEllLA7O4bNc6dVzmXmdjUp2NaEVEOlQ74F8gslfptvXeIS/NzxW7I2ADOwN
	pGbH0r1S4elMcAq0rtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdc-00000007APO-1BVY;
	Tue, 24 Nov 2026 16:45:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdM-00000007A7G-0cN0
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL0w3699934
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=FjBgYfw/UuQ0Gigp
	+T2S8w0NBV8TzmUzal3sfMRjAwMh9ySrHe1fyG1MA3pYOIRCO/D7BGQzb2JuFPuQ
	UF04CSih9O1MjRsqR4gupHuNMYAR0lp75ETxJbmsSsgNU6YtuHK1tahTJSzz8Yhb
	HMP8TNks0bA02rkP/bcapjJwz9Vsm3FcVnKOZk1c8Eq/xPsbPwuQUGog6zbiSxS/
	J1wU4CldLAg+t7sbOHKuAWPbuR7h9ZxjG6GUL+Dqa7+8Txn+SthJIzsFAdhOwXin
	UCsbA26gszoDrLHsVSLe0mjQVixdD1ZZtfTAXlTuhMrMm68o+tIiC8xAig9Yy5qt
	iTXdbQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f472n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so4817352eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538683; x=1796143483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=FbkMTLCdyooKwWjb59XTnpcNKrZF8+7bAN+xlvvSBYEsSORhI9Nf4/eWRJZAshReFR
         yRP5xLJjQvjrm8WTjzThqxOXZZ8kSrhPMglOFPAKupXjNufcuDUSFBkXzqTxWhbbR3PW
         POvk1KGBDn0v47qenZ+Vn66sdceAdv1Th6IieTfQsqknzoMD1AZEjYDxcHFq0dZsizlS
         xK/bhF5QP54kx2FSXtfrabl1kU/wCBcMEwvzEfvlUrsg4CHcmCRpbR5n/iwIOrSXmU56
         lndQi1t+/yW6Y9a2QgCZ9wbxfxdIijv3l2QYv4/K2CAhLLP12m2dA3XWdBrP212Y28E3
         36bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538683; x=1796143483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=Kcb3i1psc3uDqG+RY3/8HJ9YhNnkTixih4AwwPf42l31riKYyuSzO1MWHM94bNKVat
         kF+nsxUa2vLrX59JMy9xX3raCJrmw6Ob3Zz48kr7Zy2FPf0ixNOoGa9DIHa+bwjQeX0e
         G8QikO/JujCygHIpJTyoif7JtYZa4B62bMQJd7ifjwTuxoiXcXR2zamDp1xMEBkKwZuX
         85mexDw9jEwd/GzIgPgmH0F86q5+bEKid+oiLukEQ+aF+7tEsj4jD8KBhRymxgT/PJGb
         y+LzMKEF8wViM+RgyNn2MLXG9QHLqpXPfmSpaROIvCqIdMYm+StQp6Bfp9hNp525cRHZ
         AO8A==
X-Forwarded-Encrypted: i=1; AL+hErFIkaByUEyg3Yb50rXdwcDcRtSP34PvxB+yPSEwx7csUnU2atGVCwrXndJzuUY2zM4KkM3OFqQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z81ZBcjo4Y69qHmA+lFVQ3gkJU56iCCPVQGedgpCzo2TR6J+VW3
	rbK+/eeXfXokqonF7mCf9hGA3hCMi6E2DI3UAERJUHuj0B0YXPOBfw0lKrJrF0pzx64EMLhIvJG
	MWC9gU220SIMdZDWL0ZQvLDXFd3fR8S5+2MuMjPqVwrVNycB391glHZ+E3RCrBljZ
X-Gm-Gg: AZFdTZdBwuXFkDEjY1MthR27MeZIvrG2PtIePv0OL8Ob/hHy3qt+Z2xK2j17FwaGz05
	s34kNFZJvjPBMkEonWE1gHCQuq5W7gKLw5qws048TPDOT7w5vOyoA8nLJnmvxTmZ6yTp1uymIG+
	s+cHXHQAsev558JWhblBWrGxx0VSEgBFGS5r8jWCjhOxBrZBdj7l4zmfayxdNyMkpCiys/HLpWS
	505VXr7/cZxN+a96kpz1tkKVSCFjbBrMXmrGVU0USxMezSK34taju4IiSTjP/ASXI8owtkqqd+H
	nhEAdXVEdc3fuz8mlQxnq0QiTirN9NbqqjtW8oySSq5DIB0UiEwucCbQrvlVEjpD+PWzhMD1Jte
	L7qAkBzL8tBrvSjmLbG7tpj9xfIfxhYt0WKKB+B1/OdcS83gZU2XbXiCWZctCdzLgyiPRf+XVLG
	uFTYmNob3UbY9l4cpZPA/xdSAV+MTmNw4WCDbddc4T2PmsV+rDHfXTqF+kHkdLw0MmQH4w5x1ht
	hU=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562841eec.22.1795538682962;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562805eec.22.1795538682417;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:39 +0530
Subject: [PATCH ath-next v4 13/14] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-13-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8TcGLUfSygzf
 1V1PLnQmIYPOD/VlKTgJg9Vcm27IxWugw/OavWmRkpnYKU6Tcea3H2wK3ZiX0mOx/9b0lKkd4No
 juTMmVrsN3+jwcAwQOfEGl2LmNzMOSE=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05befb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sqNAGmH-5hgGYBlkxrAb4Bue4XfLgxz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/uplHf2OKNJf
 EuPCxgugjz8ZGXnmuXFKMZYkvGh7X+Q/iFtPkkLNU7hTShKYRN7YvuFEVZvwqT234QuLepPVCs9
 1xetUwfBJBGA9xiHPhjoEkVm70gUykPzzG9GMLRZ91qs4qTUGbg2/lL3A33ETy7gcPKhP+Z/Q7w
 bTtc5R2LbLgTHMDatszE4l3ZdJeYoLMWlkym70M183y/0KjCg4r+h9i4P43/G3eF83PWDCe+3ne
 PEDqpSov/Xpne3g9f6t62gudKp9/hKiL6lUBOp8KDbEh8aMvVRWeHS0O01GeJXv9eVG8A5LzThD
 nYVPJTEMkaLWTlJIr2h8jVza86dA3FL2HIfToju4BAERJv8P3qfwP+JEBkqDGdeErMdNY+5G/Mh
 XD4gqVgdfsfm/ZjKjDG/6kMJ+XqnahTifdpU8QJPm8ZA+bW+oUlnqI7c0pnJtqiigG9ZMlfVOIc
 SKZw9/tqHqL1UwC74HA==
X-Proofpoint-ORIG-GUID: sqNAGmH-5hgGYBlkxrAb4Bue4XfLgxz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084444_223081_88B647F0 
X-CRM114-Status: GOOD (  12.49  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1


