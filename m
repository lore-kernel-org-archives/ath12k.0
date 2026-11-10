Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B08606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpQAJD24;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gn913yTV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvGUSowo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FP5lEZOxrRNqCFsQsDOREFHO5Iwdo8IpMMWdWOfuSko=; b=HpQAJD24thsMs6
	C//K2mWEe7d6IHF/OoGSUohCxCGfji2dbAZCxaGPC3g/CO08/PWaYc3KUSMfKRZOPRDzO7Hd6aN4g
	KxMNaa60d2H75i8M5yZ9gq1Q7zhVV4sNsLgajPgMAiNZasCd6Tsr2KuSEi/oPqxS04I+5hFImyhI0
	T7rCEoyeyd70vK1chh4BO54/filRdo87VuTyBk0KliIcvS22HlXABrEZVOboZ/A4xHJVsJr81+1f1
	sCcbGCAW8vS49qK41dCsbVs2nOW+WWxpjGRStUseW7BLV+wl4KEo6nsglDX9rhKjyMk3qV0thrMQP
	KdNx1nK/SKHEimGiWMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXS-00000002g54-01xF;
	Tue, 10 Nov 2026 06:41:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXM-00000002fvy-17ac
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AIMp679825
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FP5lEZOxrRNqCFsQsDOREFHO5Iwdo8IpMMWdWOfuSko=; b=gn913yTVtUW0h2N9
	WQ3d78s5kVK9eDKhVvOrZ7lsMJK23a3e6rx9AUhDt65f0o9WQUA/wVzR/BtC3XC5
	1WhqmKNAm2M+PCgqOYYifGyKq1IJoB9U7G6GFfYEgZmlLS3JglrjnkEhHi47ALv+
	1Brg4Kns8qJHAS0F+R7dPdkMqO1+cej/Uut2pgXa+rzDLedQluofER5S9DE2oLe5
	c9EsIQfRmgxjW91hY9yUwfSMrVyJjJxkYzikeah95BgKQ++JoO034RAiogcd8uju
	W2sq/aypD1Dxshwim42S/nBFC8Fu9bcD8ZXB4CB2xrLZc71G1xjdYRoSMwUxLYc0
	hyUfgg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48sy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso1013830a12.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292855; x=1794897655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FP5lEZOxrRNqCFsQsDOREFHO5Iwdo8IpMMWdWOfuSko=;
        b=WvGUSowoRbgAHC522D9UDb2J+a1UkA4ISyuy3DM39mHYUg7hkWSH58aKPV15Rj+ark
         36nQxEj4qXBqHJFWoklzXlM9pnvFDj1wrXjN1m15/ZjMNs+k/g9bbZZFy3A3xMweFwqs
         dDTQNcjrvyx6z67m1y9yml690L/JmnXkiSo0qdVmIkCrymnlfHlEKsbBj681D8/PHxnr
         DgD8MSo1G/vz6KYEGiurfSUyDWdmH0qYmJ83OvFk+8nogpYvk374CIa3uI/lIRAkjUjB
         FAymM+C3aZj+Mv9dsLqf0TjYww264fHRFJpJPW/DImYR5QoAlHrlTexPUOzmKsGs3F++
         WgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292855; x=1794897655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FP5lEZOxrRNqCFsQsDOREFHO5Iwdo8IpMMWdWOfuSko=;
        b=AvOVknmlgfs2lJQQkGBKYw1/WhWNHjLioAh3OP2gLPTmpVjY1Tl8qv3CO82oRWrVxs
         gCXnKY5t3WTCRmhSczrapnpN+dvb+IbtlpVwGVE+wyQVwFwLoTW5s3/qHcC4pMjbgqLn
         3zO1qj+QXLhDkKX09VrkmsFnNROLRVLz8hZYPQmyiMYVVsDMQhcwifa7s18CdHE+um1p
         Vwr7h4C/1nkLfTdqYufT0V4nbxkXkHfvklTO7kmEpKtsCVN/WGiSZHl6a0mu+rNseEjN
         Npq4BxESLq8l8IRMMLOYdj/g87lgE5/rh1TCdUkOKXBJIbW5MBxpMc8Uw8jeQBVLgIIe
         77Cw==
X-Forwarded-Encrypted: i=1; AL+hErHUddm+WHMjMg9fDv7A30qxIvFTxrjPvS4sPZv+pIWCp2+FfamEWNuHIvUzAp2WcVnwuWtWn6E=@lists.infradead.org
X-Gm-Message-State: APuU4Z91RsWLVJvex3LzQfIqYdsX7o2MrC9hbZlN34JMim0Jvscob8cI
	LbbwgDYphwT6ycjtlldghcxSTIqJ4EUUD4xZHbhD8U08GeIJqvB91GXACVuKbBqZni9zrt8ep/p
	BGFeWAvCT8jncw+rab2ju4Fy31a35e602/1DJxEs9fjXErv78Pu+e/Cqj66nGkoNS
X-Gm-Gg: AYBFou0G2KiUQSaTxXvO2VEJ4rk3drKYkUjbO8gN+dkbCYHnRMe6dDGZaZYsyIPcZz/
	cOevJYgfywqiWjy1jgjF7ki7T6wdeBd7u6ADHziazzW3p/7YHPecsHaFcM8btA0aU/N5IMB+fNY
	IyYTx3YE+gTwy29CWZFOb/HhNoIX7FtsSakbsZGgcG759SJRPDHg5UMlvhYM2DfQZgKy5JDwoTB
	z9+8ONtHCEtXWynoFwjc/dIwk/ebXX3nf1H4vSv1D0rNUn+2WyiMrmYQ5bOZCXj6GzQKE/T59tA
	kQ/dNcVmGVWlrV3UeNhjrIraGAc1DUyao5lKma0JkeNnGdiCbr3BdhfFUpu+QwXklQd80D3hxvx
	Y78jYrSyUwcrg+iLrigmU/0l5hEjIdc9K372TJLuMHleScvGyGKvrXN3zbsP1MUWCsiiJ96qrbJ
	5oB7RFTbjrsR2myA5MY8JBXKDSWYiwFg==
X-Received: by 2002:a17:90b:4a09:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1679fcea3mr1150720a91.35.1794292854804;
        Mon, 09 Nov 2026 22:40:54 -0800 (PST)
X-Received: by 2002:a17:90b:4a09:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1679fcea3mr1150708a91.35.1794292854210;
        Mon, 09 Nov 2026 22:40:54 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:53 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:30 +0800
Subject: [PATCH ath-next v5 09/11] wifi: ath12k: derive REO RX drv_link_id
 per device via HAL ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-9-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXyJHQPes6qPmZ
 bsR2z8AMwI+q88hexERjDwRDVkZ718E/sc3FUs+EIEyiiHcPeTYQd5K/SXt+Eipl4sCWc7XTaKh
 xhs03bT2X6ITZ4lmEAWGcQjGM3Ll/MI=
X-Proofpoint-ORIG-GUID: e9rnbFaVhYHtdBvI-w-ccibTd0eiPUQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX6KVXHRY/jT5i
 6saY+AdJx9nKuB4WRwpzP3yVvv0E5qS+6iQ2XrOSpbGcQRIzvyFvtT/IFZ+9BAhk2WlRSzvGxPS
 zCm1bO94I6br0BKQJKDRs0r/IC6E7IEgcBfuawYZeVgo4IqNe1Gcq59BvvbsqLN84sAl8zoP3op
 z9Q1L1RfRpqR38DjBpkka2koCdmMALTaxEq6ex40rIXhZ1EMZevYMH58VZVeeuauPmaDrSnUbui
 Zt/mjUFPvz7XwWc60T5jTWHx6kMCD7frrEgeLDMHt8zCekQjyngRRgAm1pYot8CMjCB6hg7zl/b
 xYWY5L4irjXZz1m/RkUl7DyZi+PEeSnVeyaIJjGQWAzBIlsX02uxjlJYhMndyG8/Yq9nXVCGWdz
 2yIxesGTuzZpcIxaXkALKVV0SL7RWA47Cf53VDNzQsqANn/8/06t1NEubEwi8yc1LSdXemz9MJt
 0cfWfS1E1K96hUuThtA==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2bc77 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=81E_tDjqJRYiFi_8dLoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: e9rnbFaVhYHtdBvI-w-ccibTd0eiPUQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224056_343980_632B7A41 
X-CRM114-Status: GOOD (  19.48  )
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

On the RX path the driver link id stored in ath12k_skb_rxcb::drv_link_id
is later used to index ath12k_dp_peer::link_id_map and derive the
IEEE80211 link id. The source of this driver link id differs per devices:
QCN9274 uses the hw_link_id from the descriptor, while WCN7850/QCC2072
use the logical_link_id carried in the peer metadata.

Add a HAL op rx_reo_desc_get_drv_link_id() to let each device provide its
own driver link id on the REO path, so the RX code no longer needs to
know where the value comes from. For QCN9274 keep the existing behavior;
for WCN7850/QCC2072 extract the logical link id from the peer metadata via
the common ath12k_wifi7_dp_rx_get_logical_link_id() helper.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  7 ++++
 drivers/net/wireless/ath/ath12k/hal.h              |  2 +
 drivers/net/wireless/ath/ath12k/hw.h               |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 49 ++++++++++++++--------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |  2 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  1 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  9 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  9 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |  2 +
 9 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 82700474548a..fcad6a7ad6ba 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -170,6 +170,13 @@ static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_hal *hal,
 	return hal->ops->rx_desc_get_msdu_src_link_id(desc);
 }
 
+static inline u8
+ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
+				 struct hal_reo_dest_ring *reo_desc)
+{
+	return dp->hal->ops->rx_reo_desc_get_drv_link_id(dp, reo_desc);
+}
+
 static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
 {
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 3a874db7968e..c8bb63d92bfd 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1379,6 +1379,8 @@ struct hal_ops {
 	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
 				     struct hal_rx_desc *ldesc);
 	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
+	u8 (*rx_reo_desc_get_drv_link_id)(struct ath12k_dp *dp,
+					  struct hal_reo_dest_ring *reo_desc);
 	void (*extract_rx_desc_data)(struct hal_rx_desc_data *rx_desc_data,
 				     struct hal_rx_desc *rx_desc,
 				     struct hal_rx_desc *ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 41dca4cc6d4f..05902edbb59c 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -130,6 +130,8 @@ enum ath12k_bus {
 #define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
+struct hal_reo_dest_ring;
+struct ath12k_dp;
 struct hal_tcl_data_cmd;
 struct htt_rx_ring_tlv_filter;
 enum hal_encrypt_type;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 08a9f070e4aa..312c7ac74b3b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -44,6 +44,21 @@ static u16 ath12k_wifi7_dp_rx_get_peer_id(struct ath12k_dp *dp,
 	}
 }
 
+u8 ath12k_wifi7_dp_rx_get_logical_link_id(struct ath12k_dp *dp,
+					  __le32 peer_metadata)
+{
+	switch (dp->peer_metadata_ver) {
+	case ATH12K_PEER_METADATA_V1:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V1_LOGICAL_LINK_ID);
+	case ATH12K_PEER_METADATA_V1A:
+		return le32_get_bits(peer_metadata,
+				     RX_MPDU_DESC_META_DATA_V1A_LOGICAL_LINK_ID);
+	default:
+		return ATH12K_GROUP_MAX_RADIO;
+	}
+}
+
 void ath12k_wifi7_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u16 tid,
 					 dma_addr_t paddr)
 {
@@ -608,7 +623,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_base *partner_ab;
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
-	u8 hw_link_id, pdev_idx, device_id;
+	u8 drv_link_id, pdev_idx, device_id;
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -621,11 +636,11 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->drv_link_id;
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		drv_link_id = rxcb->drv_link_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
-						       hw_links[hw_link_id].pdev_idx);
+						       hw_links[drv_link_id].pdev_idx);
 		partner_ab = partner_dp->ab;
 		ar = partner_ab->pdevs[pdev_idx].ar;
 		if (!rcu_dereference(partner_ab->pdevs_active[pdev_idx])) {
@@ -677,7 +692,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 	struct sk_buff_head msdu_list;
 	struct ath12k_skb_rxcb *rxcb;
 	int total_msdu_reaped = 0;
-	u8 hw_link_id, device_id;
+	u8 drv_link_id, device_id;
 	struct hal_srng *srng;
 	struct sk_buff *msdu;
 	bool done = false;
@@ -708,19 +723,18 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 			   le32_to_cpu(desc->buf_va_lo));
 		desc_info = (struct ath12k_rx_desc_info *)((unsigned long)desc_va);
 
-		hw_link_id = le32_get_bits(desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+		drv_link_id = ath12k_dp_rx_reo_get_drv_link_id(dp, desc);
+		if (unlikely(drv_link_id >= ATH12K_GROUP_MAX_RADIO)) {
 			if (desc_info && desc_info->skb) {
 				dev_kfree_skb_any(desc_info->skb);
 				desc_info->skb = NULL;
 			}
 
-			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			ath12k_warn(ab, "invalid drv link id %u\n", drv_link_id);
 			continue;
 		}
 
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			if (desc_info->skb) {
@@ -775,7 +789,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
 		rxcb->is_continuation = !!(le32_to_cpu(msdu_info->info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		rxcb->drv_link_id = hw_link_id;
+		rxcb->drv_link_id = drv_link_id;
 		rxcb->peer_id = ath12k_wifi7_dp_rx_get_peer_id(dp, dp->peer_metadata_ver,
 							       mpdu_info->peer_meta_data);
 		rxcb->tid = le32_get_bits(mpdu_info->info0,
@@ -1446,7 +1460,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 	struct dp_srng *reo_except;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
 	struct ath12k_pdev_dp *dp_pdev;
-	u8 hw_link_id, device_id;
+	u8 drv_link_id, device_id;
 	u32 desc_bank, num_msdus;
 	struct hal_srng *srng;
 	dma_addr_t paddr;
@@ -1475,14 +1489,13 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 		drop = false;
 		dp->device_stats.err_ring_pkts++;
 
-		hw_link_id = le32_get_bits(reo_desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
-			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+		drv_link_id = ath12k_dp_rx_reo_get_drv_link_id(dp, reo_desc);
+		if (unlikely(drv_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			ath12k_warn(ab, "invalid drv link id %u\n", drv_link_id);
 			continue;
 		}
 
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 
 		/* Below case is added to handle data packet from un-associated clients.
@@ -1509,7 +1522,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 		}
 
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
-						       hw_links[hw_link_id].pdev_idx);
+						       hw_links[drv_link_id].pdev_idx);
 
 		link_desc_banks = partner_dp->link_desc_banks;
 		link_desc_va = link_desc_banks[desc_bank].vaddr +
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index d68489ff7b03..8a16fb3dd005 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -12,6 +12,8 @@
 
 struct ath12k_hal_reo_cmd;
 
+u8 ath12k_wifi7_dp_rx_get_logical_link_id(struct ath12k_dp *dp,
+					  __le32 peer_metadata);
 int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 				       struct napi_struct *napi, int budget);
 int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *napi,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 7ea7559e882c..edf122fd46b5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -472,6 +472,7 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcc2072,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcc2072,
 	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcc2072,
+	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcc2072,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_qcc2072,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 6109421f239e..7c19098f06c7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -898,6 +898,14 @@ u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc)
 			     RX_MSDU_END_64_TLV_SRC_LINK_ID);
 }
 
+static u8
+ath12k_hal_rx_reo_desc_get_drv_link_id_qcn9274(struct ath12k_dp *dp,
+					       struct hal_reo_dest_ring *reo_desc)
+{
+	return le32_get_bits(reo_desc->info0,
+			     HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+}
+
 u16 ath12k_hal_rx_mpdu_start_wmask_get_qcn9274(void)
 {
 	return QCN9274_MPDU_START_WMASK;
@@ -1199,6 +1207,7 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
 	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
+	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_qcn9274,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index abe982faeb2b..fec625a0ea0b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include "dp_rx.h"
 #include "hal_desc.h"
 #include "hal_wcn7850.h"
 #include "hw.h"
@@ -509,6 +510,13 @@ u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc)
 	return 0;
 }
 
+u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						  struct hal_reo_dest_ring *reo_desc)
+{
+	return ath12k_wifi7_dp_rx_get_logical_link_id(dp,
+						      reo_desc->rx_mpdu_info.peer_meta_data);
+}
+
 static u32 ath12k_hal_rx_h_mpdu_err_wcn7850(struct hal_rx_desc *desc)
 {
 	u32 info = __le32_to_cpu(desc->u.wcn7850.msdu_end.info13);
@@ -796,6 +804,7 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
 	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
+	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
index a56ca9fd3de4..c7e1fba9bb4b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
@@ -28,6 +28,8 @@ u32 ath12k_hal_rx_desc_get_mpdu_start_offset_wcn7850(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_wcn7850(void);
 u32 ath12k_hal_get_rx_desc_size_wcn7850(void);
 u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc);
+u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						  struct hal_reo_dest_ring *reo_desc);
 void ath12k_hal_rx_desc_get_crypto_hdr_wcn7850(struct hal_rx_desc *desc,
 					       u8 *crypto_hdr,
 					       enum hal_encrypt_type enctype);

-- 
2.25.1


