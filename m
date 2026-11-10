Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC486606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zXSnDrP8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EzqVcyJC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GCFk+RiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=; b=zXSnDrP8DXedTB
	nDjjO4h16iHl8m5ugc/Mxk5ry4EyY9UKlh5hhyfgTaDNpxT910NuX7moZuzy9wTPD5J9SOWAWxdko
	AovMKnCDNaIG7MXF2kpXDYU2xNiz//gStZ209Se/FxSWJPoQ9wyluFtSWIbOiyuE28/cXo2UCZumR
	5gFD4yLHSOgKVa8VQbAN0Cs9shHg3B4ZvEwsWEjOsVPXJoNPg6HAbgSOPwFzAlCzswmj0B7cPWJpQ
	ZVeinYEqnU05vV6bkiFkyk6y/h+48f1VQdgMabqhNlnHtrFawzIHDgINrUbXQFX+Z+ARR2YV3ZUO9
	UBtI+qB17Cb/OVjS0pTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXM-00000002fwo-2LGL;
	Tue, 10 Nov 2026 06:40:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXJ-00000002fsM-0Lnk
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A84q1207780
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=; b=EzqVcyJC1dHB484F
	L2TyoB9MCCC9Lq2DGbJVr+hclnWCYdPTIeoECSpkX3OxaarLCVTtGHlOXYjHmmnG
	DAq1sA3tA5M+evWlWEM7PW3QpF4rhrHF2o7SS2L8G6/l22KsJEbmdkrOq5OBQMoI
	mS8uMIAiMrdYjWEryr4lxtdO1z+g1j+y6neFhvUBurevpA8P8t7ux81mV7f/0l2v
	YrfUcZ9Pv/6Zjy4XMHRvFNFz2BP4oU/XEh0eCo2NMv1RrYAjwKKXtxAXG7kEERQZ
	IngLN8bGiRLtQKLycCtOoJZoQg2ngKJt4Zt3ZH/acUOIrITxweIQYijiM+0l9KYH
	Z8iILQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhv1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1314266a91.2
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292851; x=1794897651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=;
        b=GCFk+RiLVnRasu5cridv3qjXv8aXVvV3ib+fFD07MLFCq6s++4D6vlBPkzZF150kG6
         oWBkoORBKvZBV4e8GsaDirJ8zB7H5lbQfJFsOtQdFAWGaU2qaSK028ZshQgfdpsIipb2
         66Z9Mpg1o5VHFbO6iQKZkr8fM4wB94O7oyPgqR2MzCZr+UC3UfZvKuxMmws7grYBNTU/
         YRjm/R8C6GZt+tRUaxy6AzNu5O/mFPh/8pgieSPR2EX6sBXsFKoQSlkV0xZgte1kzLKe
         N+tVwqX0JE+FTOB4rSYzRBCDEX6iec9ehjDUpvzIZIcRiDMvRZ6sKg2kKxmGXkQBPWBB
         Aacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292851; x=1794897651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=;
        b=WU9bD2IH+pV1kle82wg4I8lNpvvHqwWwi/RIums5/tnzRXv778WAPK3ec0lVB460hZ
         2b26CD/qLVsgGwaUhjKD02HGiKxO1gOgCfuzrX1mefFzwUpqA4GBQ0R0oMvUc36sXUad
         is8v64D95EzvnMKLHWafL6WbOkS1uI9ek5L1wLFJ8H3QZ88QByPvqjyniJ1m9yuG8okb
         0OOJ4KhGSJiKWJNGZRUBpi4E+i5XmqtJ47/7jqVTLFrioqY1gycnR16WUdj90HnX3iou
         69z86Lw9seHEFqjN6n75BeC18sWbdV+qrktRuH/skRXWvXN4XTpyC0wj29GQ8FazojzC
         dGVQ==
X-Forwarded-Encrypted: i=1; AL+hErHPmxJW2MIFrOSYmvpPgo8Tsh3UX+AaNbqcr2jMh+ifmcUXfLJMzYuH5IRDFT6O6+hOEzPLmLs=@lists.infradead.org
X-Gm-Message-State: APuU4Z9JLHzB6Nb7m0aJXyo+2ToUkRnsLBtiyp/4cBJAOix2VrT7rJAI
	Z7osIiCVO7pZozfE1/dlJSKz5mo17Fv5vx2uRC+aE/5IBSHa23rDsP8/hmuEYttwryaTQAh94HX
	xMzVXX2hCirv18RUrKgOh3UcZGYJj/g3N+iMRHh75Zes7RZnm7dRRRb36KX9XVTml
X-Gm-Gg: AYBFou0sjxkTiGvb6iB3Fa8E9SZR+j0dR3BDdoIIGvBtsG+ZUkBmZzX7yltgJL8rHAb
	gUnhvs7bw7rTZYB++pU5FTWkpKpc7I7HQM2NhHLIaiQ2QXp4zHkgu3+vqMfDdsgu2y6wEEJykrm
	rAkFAfBAak8OkhDqpTaAkouAy3tG5h0WKdF7XFeBGklwBJYcSf6DYlfzX6Vbrgjy3T7fu7/FT/q
	B2T0QEEUUCWQPGEcxPp79FrLhZcpfaTSif1tWMbWITENUKtT+Q4KFs6CAkrpDvNcDtn+Yem+4ak
	FIyCXhmqmBpa+o5kb1JFFt5Y1KIQbw6ivefYJ4CtgKABIfTsR2NK7BOEYzFlPoNsEvONhmxV5yg
	6xPz/YrmliAMOoyJU5EXokFyWfi/xAjgeb9KA+xMuH06oNKxbeW99gl+loSZVQNtxR58SklqQk/
	j26boCp9yW+1OFOhIdaLDQk/Jg8N21nQ==
X-Received: by 2002:a17:90b:3c86:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b166ad25a6mr1918346a91.2.1794292850696;
        Mon, 09 Nov 2026 22:40:50 -0800 (PST)
X-Received: by 2002:a17:90b:3c86:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b166ad25a6mr1918327a91.2.1794292850145;
        Mon, 09 Nov 2026 22:40:50 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:49 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:28 +0800
Subject: [PATCH ath-next v5 07/11] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_PEER_EXTENDED event
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-7-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: SkoRahw9ISZOVCzU_w5ORr0Kiir7DVBp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX90mrjuSci8Y7
 13DS1FinV6HNnYmpyr9wX5n07Pz9Dx8m6S2qxXDWTC/BZP1NVXJomtw7y6jf/nszZd8SJKnii7a
 tNeIQb2HA99SFiHwxX/lSF7GLEN9wIw=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bc73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FAGSEp2nAAAA:8 a=EBqVsfUuMMxUAKVxpnoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Lh16BCjgaU6qELXH5G7V:22
X-Proofpoint-ORIG-GUID: SkoRahw9ISZOVCzU_w5ORr0Kiir7DVBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1RfI6MMn2saR
 oG2yG9jRk5MG0mKI9gZrUj32NmhdPvl0HpP8scTEi8c8Hpm1wa666LUgkXFKu3lJlimYFQfWSos
 rHEAdFpyYEYbmwBwNybV9bdDqy4flLeKgvnMks+oc5Hh8El5O0co+2dGzLaoM0DC7IWiAhuAPdN
 ycNb2D2R24D7vwfdViHnk/cMs9GWTjEqQpVlWI7x61+mHq7/5idrs65jpR3vnMXMkNPEHdeuAGI
 hOPin+L1FcvrBTxvQ/dFYTySZ1ZsqROgBZ8eLbDmNOLGwZwiZO0EvJxpcBXk6EwAnw3ybbpspG/
 kv29y0zm7RKtmU1CFcjj3RfDfLmkfJm+EU5NeFYI79Vx5Iv9JXR/jwb0vUbOuv2OusSZ0USm0ty
 KkQVfb6KDDK4JJP9zKkU8qC7hGRhXyGYWH+bU05Ox5xj7rVsF8aSLzECYllG9uZW27e7QLnrz6Y
 QgQygt7dffA1z/sPRjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224053_288821_964E8870 
X-CRM114-Status: GOOD (  22.33  )
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

WCN7850/QCC2072 hardware/firmware report only the logical link id to
identify the link on which a packet is received. The host, however,
needs the IEEE80211 link id. So a mapping between them needs to
be established.

Add support for the HTT_T2H_MSG_TYPE_PEER_EXTENDED event, which reports
the logical link id for a given link peer. Find the link peer and
populate ath12k_dp_peer::link_id_map, mapping the logical link id to the
IEEE80211 link id. This map is later used in the data path to derive the
IEEE80211 link id.

The firmware sends this event after each peer assoc, but only when it
advertises WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT. On such devices, block
in ath12k_mac_peer_assoc() until the event arrives. The event arrives
before the MLO_RX_PEER_MAP event, so wait for it first.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  1 +
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_htt.c  | 17 ++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h  | 15 +++++++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 66 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c     | 13 ++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  1 +
 8 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index f588a105ca61..719200759ca0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1568,6 +1568,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete_all(&ar->scan.completed);
 			complete(&ar->scan.on_channel);
 			complete(&ar->peer_assoc_done);
+			complete(&ar->peer_ext_event_done);
 			ath12k_peer_delete_wait_flush(ar);
 			complete(&ar->install_key_done);
 			complete(&ar->vdev_setup_done);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fcb26a6878a1..3a92a4b03359 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -697,6 +697,7 @@ struct ath12k {
 	u8 radio_idx;
 
 	struct completion peer_assoc_done;
+	struct completion peer_ext_event_done;
 	struct list_head peer_delete_waits;
 
 	int install_key_status;
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..25c1f915defd 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -627,6 +627,7 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct htt_resp_msg *resp = (struct htt_resp_msg *)skb->data;
 	enum htt_t2h_msg_type type;
+	u8 logical_link_id, valid;
 	u16 peer_id;
 	u8 vdev_id;
 	u8 mac_addr[ETH_ALEN];
@@ -708,6 +709,22 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 	case HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP:
 		ath12k_dp_htt_mlo_peer_map_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PEER_EXTENDED:
+		peer_id = le32_get_bits(resp->peer_extended_ev.info,
+					HTT_T2H_PEER_EXT_INFO_PEER_ID);
+		vdev_id = le32_get_bits(resp->peer_extended_ev.info,
+					HTT_T2H_PEER_EXT_INFO_VDEV_ID);
+		peer_mac_h16 = le32_get_bits(resp->peer_extended_ev.info1,
+					     HTT_T2H_PEER_EXT_INFO1_MAC_ADDR_H16);
+		ath12k_dp_get_mac_addr(le32_to_cpu(resp->peer_extended_ev.mac_addr_l32),
+				       peer_mac_h16, mac_addr);
+		logical_link_id = le32_get_bits(resp->peer_extended_ev.info1,
+						HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID);
+		valid = le32_get_bits(resp->peer_extended_ev.info1,
+				      HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID_VALID);
+		ath12k_dp_link_peer_extended_event(ab, vdev_id, peer_id, mac_addr,
+						   logical_link_id, valid);
+		break;
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "dp_htt event %d not handled\n",
 			   type);
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.h b/drivers/net/wireless/ath/ath12k/dp_htt.h
index 2db7fb27c036..1d192bde0c29 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.h
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.h
@@ -933,6 +933,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP = 0x29,
 	HTT_T2H_MSG_TYPE_PEER_MAP3	= 0x2b,
 	HTT_T2H_MSG_TYPE_VDEV_TXRX_STATS_PERIODIC_IND = 0x2c,
+	HTT_T2H_MSG_TYPE_PEER_EXTENDED	= 0x39,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
@@ -985,12 +986,26 @@ struct htt_t2h_mlo_peer_map_event {
 	__le32 reserved[5];
 } __packed;
 
+#define HTT_T2H_PEER_EXT_INFO_PEER_ID		GENMASK(23, 8)
+#define HTT_T2H_PEER_EXT_INFO_VDEV_ID		GENMASK(31, 24)
+#define HTT_T2H_PEER_EXT_INFO1_MAC_ADDR_H16	GENMASK(15, 0)
+#define HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID	GENMASK(18, 16)
+#define HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID_VALID	BIT(19)
+
+struct htt_t2h_peer_extended_event {
+	__le32 info;
+	__le32 mac_addr_l32;
+	__le32 info1;
+	__le32 info2;
+} __packed;
+
 struct htt_resp_msg {
 	union {
 		struct htt_t2h_version_conf_msg version_msg;
 		struct htt_t2h_peer_map_event peer_map_ev;
 		struct htt_t2h_peer_unmap_event peer_unmap_ev;
 		struct htt_t2h_mlo_peer_map_event mlo_peer_map_ev;
+		struct htt_t2h_peer_extended_event peer_extended_ev;
 	};
 } __packed;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 94d98f80f9f9..2e2672a082a9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -8,6 +8,7 @@
 #include "dp_peer.h"
 #include "debug.h"
 #include "debugfs.h"
+#include "mac.h"
 
 void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer)
 {
@@ -195,6 +196,60 @@ void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_
 	spin_unlock_bh(&dp->dp_lock);
 }
 
+void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
+					u16 peer_id, u8 *mac_addr,
+					u8 logical_link_id, u8 valid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp_link_peer *peer;
+	struct ath12k_dp_peer *dp_peer;
+	struct ath12k *ar;
+
+	if (!valid || logical_link_id >= ATH12K_GROUP_MAX_RADIO) {
+		ath12k_warn(ab, "invalid logical link id %u valid %u\n",
+			    logical_link_id, valid);
+		goto exit;
+	}
+
+	spin_lock_bh(&dp->dp_lock);
+
+	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id, mac_addr);
+	if (!peer) {
+		ath12k_warn(ab, "failed to find link peer with vdev id %u addr %pM\n",
+			    vdev_id, mac_addr);
+		goto unlock;
+	}
+
+	if (peer->peer_id != peer_id) {
+		ath12k_warn(ab, "link peer id mismatch, expected %u got %u\n",
+			    peer->peer_id, peer_id);
+		goto unlock;
+	}
+
+	dp_peer = peer->dp_peer;
+
+	peer->drv_link_id = logical_link_id;
+	dp_peer->link_id_map[peer->drv_link_id] = peer->link_id;
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
+		   "htt peer extended vdev %d peer %pM id %d logical_link_id %u link_id %u\n",
+		   vdev_id, mac_addr, peer_id, logical_link_id, peer->link_id);
+
+unlock:
+	spin_unlock_bh(&dp->dp_lock);
+
+exit:
+	rcu_read_lock();
+
+	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
+	if (ar)
+		complete(&ar->peer_ext_event_done);
+	else
+		ath12k_warn(ab, "failed to get ar with vdev id %u\n", vdev_id);
+
+	rcu_read_unlock();
+}
+
 static int ath12k_dp_link_peer_rhash_addr_tbl_init(struct ath12k_dp *dp)
 {
 	struct ath12k_base *ab = dp->ab;
@@ -543,9 +598,16 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		dp_peer->peer_id = peer->peer_id;
 
 	peer->dp_peer = dp_peer;
-	peer->drv_link_id = hw_link_id;
 
-	dp_peer->link_id_map[peer->drv_link_id] = link_id;
+	/*
+	 * Only devices that use hw_link_id can map it to the IEEE80211
+	 * link id here. Devices that do not support hw_link_id fill
+	 * link_id_map later from the PEER_EXTENDED HTT event.
+	 */
+	if (dp->hw_params->support_hw_link_id) {
+		peer->drv_link_id = hw_link_id;
+		dp_peer->link_id_map[peer->drv_link_id] = link_id;
+	}
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index d2752b35ba0f..ea36947d1707 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -122,6 +122,9 @@ struct ath12k_dp_link_peer {
 void ath12k_dp_link_peer_unmap_event(struct ath12k_base *ab, u16 peer_id);
 void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_id,
 				   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id);
+void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
+					u16 peer_id, u8 *mac_addr,
+					u8 logical_link_id, u8 valid);
 
 struct ath12k_dp_peer {
 	struct list_head list;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..f32d391bc10e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3875,6 +3875,7 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	int ret;
 
 	reinit_completion(&ar->peer_assoc_done);
+	reinit_completion(&ar->peer_ext_event_done);
 	reinit_completion(&ah->peer_ml_id_done);
 
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
@@ -3890,6 +3891,17 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 		return -ETIMEDOUT;
 	}
 
+	if (!ar->ab->hw_params->support_hw_link_id &&
+	    test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     ar->ab->wmi_ab.svc_map) &&
+	    peer_arg->ml.enabled &&
+	    peer_arg->is_assoc &&
+	    !wait_for_completion_timeout(&ar->peer_ext_event_done, 1 * HZ)) {
+		ath12k_warn(ar->ab, "failed to get peer extended event for %pM vdev %u\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id);
+		return -ETIMEDOUT;
+	}
+
 	/*
 	 * For devices where the firmware allocates the MLD peer ID, the host
 	 * learns the real ID only from the MLO_RX_PEER_MAP HTT event, which is
@@ -15214,6 +15226,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->vdev_setup_done);
 	init_completion(&ar->vdev_delete_done);
 	init_completion(&ar->peer_assoc_done);
+	init_completion(&ar->peer_ext_event_done);
 	init_completion(&ar->install_key_done);
 	init_completion(&ar->bss_survey_done);
 	init_completion(&ar->scan.started);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5d0afbf0bd0c..94c5def03137 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2278,6 +2278,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_WMSK_COMPACTION_RX_TLVS = 361,
 
 	WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT = 365,
+	WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT = 380,
 	WMI_TLV_SERVICE_THERM_THROT_POUT_REDUCTION = 410,
 	WMI_TLV_SERVICE_WDS_NULL_FRAME_SUPPORT = 421,
 	WMI_TLV_SERVICE_IS_TARGET_IPA = 425,

-- 
2.25.1


