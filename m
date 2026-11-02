Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C69606A331
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VCJiI2gG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqyDMNdJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glKAaGxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FZkud3UiFxyI+if5VP4Cl4Ikk8rGXzgRnA5iU5yHVK8=; b=VCJiI2gG/09SG9
	bKzUzW6W/jbKLLrRiQUZ1KF5Ej6U+ZQB9QVNX7HtXePKr9eTsMSo4bDmySPmpsS4TLhJfb0Z+jcGJ
	DtFTaba/j0ac4LdMcmRg7rVdpnddZhxMijjZbKWjsyKm59Uhk1G+Kv0FcWj+e9MVWZb3/z7vN6Xdd
	moTAYopZV6Ze4UPh8/F1r2eZlHIad+hp0SEpPGPmDY1igjBhv377BQFtporqu0FQhp6oYY6y0vWlD
	HT524vfu/+pCt4Qp21Kuk6ymnhM2ez7HZxWGRozf0jEzVM263Md/8K0ZZ+ZvlGDv5OfZqFh1vMmOA
	Jx/ULbM9POVCQonHikZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhC-0000000Ff1D-3yUo;
	Mon, 02 Nov 2026 06:39:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh9-0000000Fev2-0Kpq
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:39:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vH3c3324636
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZkud3UiFxyI+if5VP4Cl4Ikk8rGXzgRnA5iU5yHVK8=; b=LqyDMNdJrvL+mFOX
	c48fmaZ9KbhDpeT9kSfS/k/dhwYyoNjMZCAJ5MShX7sEoHJQv/zchuZ5yVnEurYv
	DTugfOrKatZK2mvvtfQ+Ra3N0xkGDI1jTHblRepha0x50Qpb0cs48HX6XYwdSnaI
	XayzFyFNT2jnYSIXpn3l5S/KU4zhEEzTLZh7/ql782vQYo2eBmNYBDPCxLg+H5qe
	0a06gLMO24rknrV7OCJ9gZLxgwv/4+wpptiZoCLrKHKRNa0w/A91Lq5E3sDQcPbL
	ebpO9+qRHwVhHXgFCKKFPtvWp2E/zecy7sPgYLwJD0zsu7UP931rA7zi06kzxwWq
	f7OKow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nmuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:39:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso25482955ad.0
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601541; x=1794206341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZkud3UiFxyI+if5VP4Cl4Ikk8rGXzgRnA5iU5yHVK8=;
        b=glKAaGxqSR0J8DF+wZrhTxJrlUu2C2sv7NsFnr+hmpnxjFEGwYbHNs3JHqnlOv9yns
         0aOniZIhmpSZ0KfNjAMsNNYpmlOVtOi2LBWHDyuvNh3cOYFgh44HVJR6sG9jHKGj3Uvo
         +XFNxqnCuhY76bBpaK4V0PvsGz164/u42ARovuWAxTcNytP8zepbuoGphhUl7+dHXwvs
         YpyuJG50NFyZ9eu9RfQfM1p362QIxcg79MDehRUqwurpwxzOAnEXzSvDGXri0GK+oyz2
         442FIpbLQbZCm2Q9/aEiLyaL+dGYuhxmwWAftDHFRKQzOiCSw/FDU83Dtwg1MiCNsHxz
         qVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601541; x=1794206341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZkud3UiFxyI+if5VP4Cl4Ikk8rGXzgRnA5iU5yHVK8=;
        b=t4ztGB2UYJ+DFn9BmX0/GG7MCXlH5pbf+ipTnIQnY8yRcVjc9lXEGzu8RzG8I03PAP
         ToStVcC4zl1H9IvjTJznAKWMaA1cV6hxklKLcl8jX6j0fYoSM/iMdnxeSg4c1dPh3Dls
         BeKEcEWeuT2q2kor6zU592T7wtJeAUVFBEwf2KIu9Yw6Ll9wfypEDK6MGFTIVs58ohNU
         WUSQAwO+IOqXKSWCy9Psu+2f6aB6zuAmFm1+JqvrWb4qgkd9vp8QXiW2QBema0CN+a5k
         spS9VyNXfZmESHyfw2SwC2p0c0wwwWzTJX6TUIGymGPqEBm3rFIsOsRPoHlLGIIk6nv/
         TCtQ==
X-Forwarded-Encrypted: i=1; AKwUvBygi3qOERYwdzlj91tvJj2Qh2JM1/daW0k5GjI9C0Q8iJOEv5+PUxB6hJl4vOPPIRx0E/dgFi0=@lists.infradead.org
X-Gm-Message-State: APuU4Z93Rt2J+fIwzo/um61iNmlc/TPmC/a2dAinUNsnF3iBoxYCnfYg
	OIjwqMYoJ66pNMJrSxMulu8Qq4V6FW0w68LXV9dndZgAIHWncyZ8NOjW6ROORCYxWR9h3pV8Haa
	/v25A+T4zqs7Nb+gFxFOEk9JQCANMMwfvPS9sxTXTuHjZ9MTro4TyEzEUkPPIqHfc
X-Gm-Gg: AYBFou1pnaJBjmiOtRkf47z77zHpUuFEk1UtLhuGmhSz48d5dcHpuC8hlWWMtb6ZrNy
	JGWLeGGCy79n5009pNwDYxUHlGaSkZykc86ZGnS1MfIXi7/VTsVlFsv9Pg4UZdrTidCEKXlwTcn
	A/4p6bXVnzrvMlhtFbCxshCeN3cUcjqjyymWtV0dUBk9yrR063V2dLwas8tkx4wlGueYrLx2BIs
	R/KcYsCZS9sVpokxB5Yetn5t7EZKivzPyMKVoFrxcLpotjdyBZWue0ZbpQOvQ3UvZg8bZsUAl4X
	49MH5nGfbIKpSLGTzOU+iUm0sbvTdydDzC5bFTUAUU/YvrS7us3QZlannII0l9tEE3FcCkbv6Df
	M2ZnY9PEMhrLHr5Tc06+8mfAQH+q9g180xSASR0TlAHXlvlgdgauq/NHX8Zexb3wnKBZRPjZI6M
	7IV2lbLj/rH6ZqYMikrMWllXf22iih
X-Received: by 2002:a17:90b:2d04:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3ae898392c2mr7471864a91.41.1793601540532;
        Sun, 01 Nov 2026 22:39:00 -0800 (PST)
X-Received: by 2002:a17:90b:2d04:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3ae898392c2mr7471839a91.41.1793601539133;
        Sun, 01 Nov 2026 22:38:59 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:58 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:16 +0800
Subject: [PATCH ath-next v4 07/11] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_PEER_EXTENDED event
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-7-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: WpGgPk3GzcBR8iMABuRLCeBwD6Cuf9uP
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae83005 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FAGSEp2nAAAA:8 a=EBqVsfUuMMxUAKVxpnoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Lh16BCjgaU6qELXH5G7V:22
X-Proofpoint-GUID: WpGgPk3GzcBR8iMABuRLCeBwD6Cuf9uP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXyuQmylfcrPow
 DaKfqxYoL84UJQEXVszRkGe0FgMUHW69Qa5bHtTvmwtqMd+n6QEYalgZnz9l4QSXvmYwe62h8YM
 HX+PyQvx7W4BKbfDrOHVeGTQ94YKcLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX7EA3NotaKmYf
 3fazWF5Tgre+qMXozK+ypf+XYSZ42SQR2fp4jZzhTi3an3G2DqYvj96LIWt6hpEXbBTCVHahCP8
 NoKNj6VX6umDal7ZdJusvBLNRlX6MKRRFBLC93gqod1YEwI5OdqiSBgZy+rx0w0h5sjLTsl1Kf7
 /slxESxQVB9w9Dyf07b8GMCviS+jLyCvny9o7UtSkk8MVg8DQG2nBkQYikxhmszGGjEmU+NH9FM
 GjDhyDksfZdXbhlmNOv4UoQ6aHyN1JeC/DA+IBK32kp4StRAqMddYtHKYKf/gqrr50vWXX+68Oa
 0Eo6mwv5arU5yypZ4c+U1OcGYr17C8SK+zsrQ/REcqVJljL+kHX934MIFGk0JKYQZy1yiIv1HYF
 y34PrCrkcJD77DhOMI1/mvdQBr+nWMT9jm2AUZRlnLWcVPkTTPROLmYeR5yMhOPqxuMeleKls2b
 q68jKkTApZ57rXMkHZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223903_257696_B2E0D60D 
X-CRM114-Status: GOOD (  22.69  )
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
index 353fb9c5a69d..1bd26e82a6ec 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1562,6 +1562,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete_all(&ar->scan.completed);
 			complete(&ar->scan.on_channel);
 			complete(&ar->peer_assoc_done);
+			complete(&ar->peer_ext_event_done);
 			ath12k_peer_delete_wait_flush(ar);
 			complete(&ar->install_key_done);
 			complete(&ar->vdev_setup_done);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f1929997a35a..478b51ea1f7c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -682,6 +682,7 @@ struct ath12k {
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
index f73dad49e42b..1e84b9b817f3 100644
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
@@ -544,9 +599,16 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
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
index 87c52ddfe279..1e539388c003 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3864,6 +3864,7 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	int ret;
 
 	reinit_completion(&ar->peer_assoc_done);
+	reinit_completion(&ar->peer_ext_event_done);
 	reinit_completion(&ah->peer_ml_id_done);
 
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
@@ -3879,6 +3880,17 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
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
@@ -15203,6 +15215,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
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


