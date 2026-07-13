Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD80C44506
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDBEu+jlNx39n24MqQgds1XZP2kLksTv74p2DeHkGi0=; b=sz4lbjqcqfir0pIwJTwnX3xqC4
	0Pfkri/s4TBml2ODnONjm9g0klxlsyqBXUVn3i1d9yYbisJaOP5yoRZHZF30K+ibILVGICDWClEsI
	gFqB1h9dYA+GgQZvHGpNiK95QzsXoptXaRxlLxbHeLKoI2fmy2CY/B2JSef8APIMdl9apElnAPvE9
	o/f1fW7hxQGIlk9VcIlfn4cD0mEmz8HbkgIBrkFVEsUqIyXpTdnzPXH4F5bKQIjKqLOMvQk4U3Gkp
	TfgTXsxnpMvsF8igrDdv0aE76EY6K5bQ0VVNYU10BvRZa5k5X+xSazHnFETUlKPNKxds1Ijywk2KF
	6i3Xy04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAu-00000008R1A-22kM;
	Mon, 13 Jul 2026 07:34:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAs-00000008Qya-0m6T
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O1uP507448
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDBEu+jlNx39n24MqQgds1XZP2kLksTv74p2DeHkGi0=; b=JyVT3FucjLSxjxlx
	SIAakNN258cSe7YF3xe7UU0hGu118MbUrMhygOVOX1RQ+v/LBLhSr3x2vrfiWdgB
	n4iMcpo6E+xJtz6ELJIBRU2403VDbtxDs7YoX8xR9mmXtPvtkUqpPL/PuBMQ06yX
	IzbRBYUgKMcZrmXhePw2dQL44ZMKEFaJnpkPoEfV8vXCJ+MICWP98Y5U+tqwUihe
	4vZ5PiXYj9ENcHwe3I5SPVhOUIGpzrRIgjC+ni4C6qcXSMd1hP+/PtOxw19w/3eT
	gr9o3MwGDAgjIL3iwUqfURJwQIuVISWrH79mNZr6v+fWKPmyhb+NW9FyrFEiaTQ7
	6LGCGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gd1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso70394665ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928037; x=1784532837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDBEu+jlNx39n24MqQgds1XZP2kLksTv74p2DeHkGi0=;
        b=afaZJ5IgmJ3z1C14Z5CSNjYhjgtBMcROU3ZeOKztIkKTaaDzshKQWZw/bzQFlNVIDZ
         SFcYPzMPUcx5gLLLVmJHQz5N0U8/KF7WRpaTaZ9ceorWl0mEyBPrOluWWWDCIxWf+qxk
         T6JxGc5hwE11XnTUkjJdiv6+OJ5uUTeoiuIohj1ui5DoozvqJMqPq/+7RvO7xCtHc08X
         enKakMhRhdiRMq4j45Rq9Hw7zLvMe1fxGenj9Jrao1MTe+wx57YxV0ZQNAvUlaqI8v5m
         CyBgTBkuePIjqE0DCot/RanwV+UK5KZVsaQWz46laXypwQRPDOUsy8Amc02qnf7CG9Uz
         QUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928037; x=1784532837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDBEu+jlNx39n24MqQgds1XZP2kLksTv74p2DeHkGi0=;
        b=C1au/dqV8cxtV3GkGVKkiJzoy7o5RDq5NSjHlBg1BEe5iP38AcTmwWLNMqizbTGjJo
         esjq2LCxE/g2an5hT8Y9IBD/AU8GQnkUOTuOE+DrRj61G04MpZC5dKMfv/z8GoImiqaC
         EOasTBKTESHjViX3FhKWiK0QAEWZKVw6kgVbGLIJs7o1BMI6kn984AxjT3GagpQhAad7
         WogkEg96yRogJ0RDbLLZj1DY9ippTM4Y6+qky0utkHM0E/9e6z+A1Xdflchbg+B45sNz
         rTlLBBwJQL0g7cIXMSPI2VqF0skQSJzkqOJbPqhO0tB5eoCVw8aq2IAb24h6KkWQwSAM
         90Rg==
X-Forwarded-Encrypted: i=1; AHgh+RrO1cpRDv057Ocuh/4XVJcwLurMCjcfj0hqIqYAY2/Xb+N+qfr3ldy+5PeXBuCtzAEaO4lrLdI=@lists.infradead.org
X-Gm-Message-State: AOJu0YybzflVWPaQVwRQ+CfsxCAERwPtFc+cJPGY4PfDU5eICuO/6sdd
	Bq1tnTh6VZjH7mYBsPsFkClG4HUdvjEqhxDeDjBL8hN2G7M5S94asJ3TsvzX0O0TiNDfPJStym6
	Jw5/03oZcFddr97UEkIg8EuZzLuSAFwPc3Ear2w3FktiPUOK2pHYEOUWR5xbxg8T5
X-Gm-Gg: AfdE7clXYZzVFQhasljXDu/ShRTWlJ1cBPvFgKXSi6ppAGhrTJYjeUXcCCzsdGMiHy1
	eXK581dAzPKu6nFeo4Wdpv+rvbISqslfi9mLs/8CUVMOsQ0tXHsr/PtzXEpVdFGWloIXZYO5o2M
	Nweo4sNY14zkOclBtJI8MfwBn29iFjq50yHku5fup7DdohrFrOKF/XQmfz0C2kZrKYwPJ/u1kFf
	7epQkp+G7y6d4lu8wdkBBpS+J7mhs/s5hWmNYq1ThiDZS1cpiozqNQ/Qy6kYnHXXy5T826oUs9M
	6wazJ9l7K2QgPenwtMcgi/c6NJlQb0vkWWlIjHJHh86Nhm027gezstPy2lny65pNAUH0kuhT/19
	Ja73tSukfSyPaZiBsGgjzVvndShmW+cTuzmXbFXf8Vy1P7HEU1id2IOvrxKdkYJh9
X-Received: by 2002:a17:902:f68b:b0:2cc:7c36:2c23 with SMTP id d9443c01a7336-2ce9f178346mr71019445ad.43.1783928036920;
        Mon, 13 Jul 2026 00:33:56 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2cc:7c36:2c23 with SMTP id d9443c01a7336-2ce9f178346mr71019285ad.43.1783928036366;
        Mon, 13 Jul 2026 00:33:56 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:55 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:23 +0800
Subject: [PATCH ath-current 8/8] wifi: ath12k: resolve PENDING ML peer ID
 from MLO_PEER_MAP HTT event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-8-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zJQQV3bDP5WyKG5v93LswWEQLUbZQbdM
X-Proofpoint-ORIG-GUID: zJQQV3bDP5WyKG5v93LswWEQLUbZQbdM
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5494e5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TDBLFCPSxtiKLUTLmbQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX/KwJ6XqUCPnf
 TWHyfmkcnbX7xx5V9ZiDMOY5YkH6FaoTyO8SJWbZGaEVGJXklFVzixxf1s1QrOJ4B45Vd65N82y
 0axRPN0V4fGoCzmajomOtUqLmKZ/sBU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX8YF0QvDh61fQ
 0EOUYQqj9iiUneX2vIPxUI0meUC5NNgloJ8QOigA8sUus5dtSIkj9LypbjQEMqSaS+XnYoT5fMX
 5dR0tn5MNre+YXVgSqwyshpoVw2ov8IKu7z6QAwhGw+gQIbGHQbdf9AMRZjfKxbrZWhEf4Fzj2R
 jNCuEVV9pZjXunXKRDCy5PeZz/C/D1JsTA+t8aSDm+7F+8aDHuMT8Y/y78uO0CaDzBUE6rEoryP
 oJEdhG79rbJJY73Y5BM8RYJJCj9n94vvDPCzWK7j4zxRytte9SHPpQqo2VuytB8xDr0i7z5iCtI
 stGXcaDiQz8zlsBX7VIli54R7tCu/ECsDmybPIadSNadXGk5AbQqoTeM5SPFECT2yNRNGzw8a+R
 7bbGZWVJXVk45iPPXpem5sop66Fe+0A27LBixioXpooJ3v3NE9nYLfaxu53pflLbkk2I7W72t8L
 6j/X2Qiidi3aNo1GaAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003358_233904_9B58B2EF 
X-CRM114-Status: GOOD (  24.38  )
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

Add ath12k_dp_peer_fixup_peer_id() and call it from the
HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP handler. For devices where the
firmware allocates the MLD peer ID, this is the point at which
all data structures that were left with ATH12K_MLO_PEER_ID_PENDING
or ATH12K_MLO_PEER_ID_INVALID get their real ID:

  - dp_peer->peer_id is updated and the dp_peer is published into
    dp_hw->dp_peers[];
  - every existing dp_link_peer in dp_peer->link_peers[] gets its
    ml_id set to the same value;
  - ahsta->ml_peer_id is updated to the same value so peer_assoc,
    sta_state and cleanup paths see a consistent ID.

Devices with host_alloc_ml_id == true also receive the same HTT
event, but the firmware-reported ID always matches the
host-allocated one and everything has already been populated by
ath12k_dp_peer_create(); Skips the helper entirely on those devices.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221039
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  2 ++
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_htt.c  | 19 +++++++++++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 52 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp_peer.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c     | 24 ++++++++++++++
 6 files changed, 100 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0e7c732f8222..cf9c5b068fa6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1547,6 +1547,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		}
 
 		wiphy_unlock(ah->hw->wiphy);
+
+		complete(&ah->peer_ml_id_done);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 8769b41f5db5..30726e580833 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -795,6 +795,7 @@ struct ath12k_hw {
 	bool regd_updated;
 	bool use_6ghz_regd;
 	bool host_alloc_ml_id;
+	struct completion peer_ml_id_done;
 
 	u8 num_radio;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 150b190f9c7f..68968f96b4f1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -6,6 +6,7 @@
 
 #include "core.h"
 #include "peer.h"
+#include "dp_peer.h"
 #include "htc.h"
 #include "dp_htt.h"
 #include "debugfs_htt_stats.h"
@@ -582,6 +583,7 @@ static void ath12k_dp_htt_mlo_peer_map_handler(struct ath12k_base *ab,
 	struct htt_t2h_mlo_peer_map_event *ev = &resp->mlo_peer_map_ev;
 	u16 raw_peer_id, peer_id, addr_h16;
 	u8 peer_addr[ETH_ALEN];
+	int ret;
 
 	if (skb->len < sizeof(*ev)) {
 		ath12k_warn(ab, "unexpected htt mlo peer map event len %u\n",
@@ -600,6 +602,23 @@ static void ath12k_dp_htt_mlo_peer_map_handler(struct ath12k_base *ab,
 
 	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt mlo peer map peer %pM id %u\n",
 		   peer_addr, peer_id);
+
+	/*
+	 * Fix up the dp_peer entry created with ATH12K_MLO_PEER_ID_PENDING
+	 * earlier; on chips with host_alloc_ml_id == false this is the only
+	 * point at which the host learns the firmware-assigned ID. Chips
+	 * that allocate the ID on the host also receive this event but the
+	 * firmware-reported ID matches the host-allocated one, so there is
+	 * nothing to fix up.
+	 */
+	if (!ab->hw_params->host_alloc_ml_id) {
+		ret = ath12k_dp_peer_fixup_peer_id(ab, peer_addr,
+						   peer_id);
+		if (ret)
+			ath12k_warn(ab,
+				    "failed to fix up peer id %u for dp peer %pM: %d\n",
+				    peer_id, peer_addr, ret);
+	}
 }
 
 void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2a2eae194007..09142dcb74f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -695,3 +695,55 @@ void ath12k_dp_link_peer_reset_rx_stats(struct ath12k_dp *dp, const u8 *addr)
 	if (rx_stats)
 		memset(rx_stats, 0, sizeof(*rx_stats));
 }
+
+int ath12k_dp_peer_fixup_peer_id(struct ath12k_base *ab,
+				 const u8 *peer_addr, u16 peer_id)
+{
+	struct ath12k_dp_link_peer *link_peer;
+	struct ath12k_dp_peer *dp_peer = NULL;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_dp_hw *dp_hw = NULL;
+	struct ath12k_hw *ah;
+	int i;
+
+	if (peer_id >= (ATH12K_PEER_ML_ID_VALID | ATH12K_MAX_MLO_PEERS))
+		return -EINVAL;
+
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		spin_lock_bh(&ah->dp_hw.peer_lock);
+		dp_peer = ath12k_dp_peer_find_by_addr(&ah->dp_hw,
+						      (u8 *)peer_addr);
+		if (dp_peer) {
+			dp_hw = &ah->dp_hw;
+			break;
+		}
+		spin_unlock_bh(&ah->dp_hw.peer_lock);
+	}
+
+	if (!dp_peer)
+		return -ENOENT;
+
+	/* dp_hw->peer_lock is held */
+
+	dp_peer->peer_id = peer_id;
+	rcu_assign_pointer(dp_hw->dp_peers[peer_id], dp_peer);
+
+	for (i = 0; i < ATH12K_NUM_MAX_LINKS; i++) {
+		link_peer = rcu_dereference_protected(dp_peer->link_peers[i],
+						      lockdep_is_held(&dp_hw->peer_lock));
+		if (link_peer)
+			link_peer->ml_id = peer_id;
+	}
+
+	ath12k_sta_to_ahsta(dp_peer->sta)->ml_peer_id = peer_id;
+
+	spin_unlock_bh(&dp_hw->peer_lock);
+
+	complete(&ah->peer_ml_id_done);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index f5067e66f1e1..9842671b5475 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -180,4 +180,6 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_p
 struct ath12k_dp_link_peer *
 ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id);
 void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer);
+int ath12k_dp_peer_fixup_peer_id(struct ath12k_base *ab, const u8 *peer_addr,
+				 u16 peer_id);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 818eb3aa919e..ae874114dc51 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3855,9 +3855,11 @@ static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 static int ath12k_mac_peer_assoc(struct ath12k *ar,
 				 struct ath12k_wmi_peer_assoc_arg *peer_arg)
 {
+	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
 	int ret;
 
 	reinit_completion(&ar->peer_assoc_done);
+	reinit_completion(&ah->peer_ml_id_done);
 
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
@@ -3872,6 +3874,27 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 		return -ETIMEDOUT;
 	}
 
+	/*
+	 * For devices where the firmware allocates the MLD peer ID, the host
+	 * learns the real ID only from the MLO_RX_PEER_MAP HTT event, which is
+	 * handled in a softirq (BH workqueue) context that cannot take the
+	 * wiphy lock. Block here, while still holding the wiphy lock, until
+	 * that event has fixed up the ID. This serialises the fixup against
+	 * all other wiphy-locked ml_peer_id accesses.
+	 *
+	 * The firmware sends the event only once, in response to the assoc-link
+	 * peer assoc, so block only for that link.
+	 */
+	if (!ah->host_alloc_ml_id &&
+	    peer_arg->is_assoc &&
+	    peer_arg->ml.enabled &&
+	    peer_arg->ml.assoc_link &&
+	    !wait_for_completion_timeout(&ah->peer_ml_id_done, 1 * HZ)) {
+		ath12k_warn(ar->ab, "failed to get MLO peer map event for %pM vdev %i\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id);
+		return -ETIMEDOUT;
+	}
+
 	return 0;
 }
 
@@ -15332,6 +15355,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 	ah->num_radio = num_pdev_map;
 
 	mutex_init(&ah->hw_mutex);
+	init_completion(&ah->peer_ml_id_done);
 
 	spin_lock_init(&ah->dp_hw.peer_lock);
 	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);

-- 
2.25.1


