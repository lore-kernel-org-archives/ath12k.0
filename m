Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD7606B245
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rky15R30;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdjY9OuS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqxB8F6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=rky15R300H+Slo
	fx9ROuFEGulLE4NxXNSVlx1VPNWJPIeX1OjUgWfcLvKO7rRMlqC6xLoWfLE8jafho4iNiqcYQuPDt
	wyMceBcpwUaflwunDfCxkRZn/BrU1xu08bq1lYQ7gPUnP88bwABKnovKOCd1+2dcxytaqmd0gieQb
	2FhzJBY0TkDc9/siUShwlwV/ksvFT78zZs2fegUsKRgo3uQdN+KKLg+osQkzJKNUttWHIqNWqYNFP
	vTV9hP1ngP87HNpR1YO4yFCfu6ZkCXDEK9ZI2Tz4q4vAPX32oHGyhP5TgUoaoc9+nl6I4vMdHQBSd
	gRZpO38BvD1SP6RepR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQLB-00000009BLC-3Nlt;
	Thu, 12 Nov 2026 08:39:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFa-000000098eN-0j5w
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:34:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aUX91475352
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=UdjY9OuSvQm3A81k
	05cL+rGaENhnUBUtacA+EpTYh3vzW4TRXM48Dp0DqmBrTMot8rWrepuLxNoN+6gm
	eJGJM8puKjezRz1IHTUtQw1MSxxfh3bGh/fLtHVXRWoHBaWP2gc8X+3I+ZNboNoY
	aWVMErVNDLoJGlrqrR3GAsRgEjyk0g6CQW/PiAJOrOxtYTBWNDH2cqWHLTgs781g
	5B8iXQyRq6KjiQRhOxqSbbGZEx5I6qmTj49tReKwaY0FVKdIbmiocT1JOL205GSj
	686TSYXBms/+3a+aLY0j9YJA9VWVtnMhJhLnVvJQcsGtMomtEWLzJ81BKJFZTOpB
	Lk7tPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymug7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so4670573a91.3
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472420; x=1795077220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=DqxB8F6B5lI+mBhMdvYZaDOPntcNA08CyPO2cCM1XBKsjQHhv71MRsQlDRYmhR7jRP
         dvVdcRrLzeZPCJkyiyD+eFnW+xes/XHjP2+d3Xs6BJBgFcWZMjx2ihNsxZxLKYUn4gfN
         1dMwnYHLXHCY/qod8wfPJZ66WCR5REF3ceP8NHGX2Tcd4qE5u7bRs/y8dI34eRIEbBbk
         lGuEw4QSbCOWYR0CPapSK93s284F4dXsYCa2XmQVKUQeWv+RKL+Q20p701WjH3FUXOAb
         XqXJiaI3Wa75rNZGy/z1LfMNSqRKnqjIUI/mPhAJ8TApD3KXFC6TU/dE0lm6onu4p6hq
         jU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472420; x=1795077220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ZhUQno543wKiOisY6r27oMjYdENTKW5QPhgYRQnxrZd9Ws+yHvkBUSTQsxeZBovwWO
         LAr94Mq9fAESAeM4rfWU9ZRZSkco/MA3nreH5MDqxrz4f2DMdz7AVEgwtOKyZg95QHmB
         Lv9mGpBP3lEc2xj8CeO+aZlBkwi7Y1/JHf7IiXd2scMkgyJ9pb2Dv4kswSRWfeoMri4M
         R7fEdwCu21ZnZYUXz5WOcB6G1sYUDCyer/d7RmJwpCafDKoD95DqnUau3ibbu3QaHlni
         IDOd5yKE4/vSpnvpnKRPpe0W+sDax/FTjPV1B+kmZ7n8XE/dMddMN1WLwswv5IY8F1Tg
         WgNA==
X-Forwarded-Encrypted: i=1; AL+hErFnvSKWqCfK+uQ1hmUtsH+XWd9RG1q4zX7Re8AEYzYEKEXN16wQd/2uRuUdGKXcTH4mrUv9w10=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Hxp1EX7Ow9fDK5LvM8G8MGJGW6dopZ4lY8ZEiPQgSy87ODWwj
	JMvz16HDf7yNiwb2p1uO76gm/t1x4APZknr57++mNKcbabIH/brRZvZOS9iS+CYAnsyurvAGqv+
	HttPJJcbYe6kVn+XddGNzepFGGQOjChe8JfNkmg8u8SHy4SspG4aBSD5T37jz54RR
X-Gm-Gg: AYBFou2wtUTtfEnkCe6iI5vJ6mGdf93eyOr5WjVqklnU4VFZd3/7xYxevhVZrSzJwtl
	k9OcbitXLvElpCBXBa6455S1CvalVX4b/bQVHTwcxryxf4yqHqMY1guXYPbazG9gCToMGcomizN
	fmmIW31frAtrjkHMuv1u8+pasikWuLCj0b3ubEyvQTAOyZGWuBl+FUTP1M0/SyrlCeT2jLIpo92
	VYV1AbzR/V4drABZ5z1PyCnb02LtVFZkFw/BpqwGQ+pD+TE3tZzHrvdHW7IoEmnfw0YiKNaHlgY
	7pKD6Qe+jcNSFZbTSgW0t5DaA2TWxezhhRg7Kvs7c+9Uu0N5+4BZUUYtLCs1sovG/KKREGIRDXx
	ZU3H/CrHVSVcbmKrzz5Iz2t+4RZuncw8xvEA/RcOahV5Df6FNB5BBoqM1A/ksyVsK0rPAWrMVJr
	nb8qK2ibh3r106u3QqJJFUJBe/R8QrbQsjR/lJ9H0ua8sLlzl3ebdbCjtNwW5LRtdNrzpMIugdu
	A==
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525579a91.26.1794472419938;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525548a91.26.1794472419328;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:28 +0530
Subject: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8 mac80211
 ops skeleton for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: RZ4g0_dyhDSU3yAiVmuw0LjooOW95qQY
X-Proofpoint-ORIG-GUID: RZ4g0_dyhDSU3yAiVmuw0LjooOW95qQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxuD7GTHO6oIS
 Ckovrm9qDCLirw8gB5kGVEQHR7uYGiw0NgdGDsdKNclShOUZyECI2lvKAKNjldpLt9i1BhuT1n5
 4kDs+nuEQAkfSxFxOFPnh+HuLCnMXui+nWjCJCpcPizTjvA2XfK13R7P0IqVt6PsYeckXxtVeNp
 91e9SLVjqq/1LZGWTZepVRJewtz2PwHMhKt7rsATtGJce60jWeu8IkI3yhMAc8gfX/N0j63IIeK
 GGH2o5G1wxpnpgkLNFRnmdd/n7JCvTz0tqsPKTIRCxQnPb8tMjWMajZ7rFG1bNcuZec5bvzEuDn
 wqY261D2cnUwPRussbTC/OCeqxY9PHQCuApXG7e4mSAKd6KJ+Gjk5KV1caO8f3VsxHThYOlWea/
 qej7P+qaC1w71NEbhQ7DD9h1h+rXbMa6+m/IeEl3SVYuI8yUtIV6Z2zjTJaeNRSiOBeir8VhkBQ
 AsOCHhAFw2QNvjC7xyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4199b7t07PpJ
 iypUB5KWnoOeT9C4ZwSkfdydejkc+JUO/iD5VoYUhoGiC3AwIF5ocbAqkAelFuNN41PtZoYr1Uu
 BVDHtc3qf+mVr35E576EwaJDILA0rFA=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af579e5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003348_651263_CBF46893 
X-CRM114-Status: GOOD (  12.24  )
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


