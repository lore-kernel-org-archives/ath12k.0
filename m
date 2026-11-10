Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9427606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DqDaEXym;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfWSjXCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hJ40sPs3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=; b=DqDaEXymCULeCG
	HsQmj2YGz1AJHokiEvv6VqyAoIirTrtZVKE71e2davaNeupO66d72AfO9gowKgZgaHxjzy8GPIjme
	KLIthzx5MEWo412WPGxiZ22hH8pVj9fjtAPhrJNJeUsCW3P6lkI9JEzBKQ1YEwnIJ4q20EfJjeFcf
	45Q14HWW5I6UmeybVaAxIikzW0FbsvNKrmJfWgJLBxJDY3Orf+XlM7ZOc5R1GfP3BwSP7RND0NJox
	93B9XIB/v3Z7R6hUkB2I00CHhm9kG5Na9qEnsniXcfIyX7CwVMyZ5q2W6+OyGNB2Q4bGdP0+q6Soa
	s2KTNTA9odxE29wRbNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXZ-00000002gCv-0nvm;
	Tue, 10 Nov 2026 06:41:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXP-00000002g1E-1CI3
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49sSL1330036
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=; b=DfWSjXCvPMl2+nzP
	zknrZDNFM6w6V3VjaSOjqx8VQasFmbCtiZvbMd+YUp5PNBN38n5/zvXoL10KDpfx
	u7g6yVBa+QwsZYdUnwPJD71fKxIRvJ1cZ/ZEkPHGeQ+GVHwgxoa2HOJ+M/wkkVZq
	KckcVwgY44TT3vLHdNnPwnbt6RRhycJQkwtM2i/ty4812POq30w/mW7hr6O77wEe
	6O700IzUjbEoJWpCnt2EPj06TXBaZOna5uu5tERo74bRG8e0OzFbcKto7kYkTjEt
	YDxGt+wdxD9rnhaQBxpAnv7opqAJzbj/l8tYQlRnWWWNWTDEZH6uGMe/Sh/Fcw0r
	zlVisA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjbw0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1114482a12.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292858; x=1794897658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=;
        b=hJ40sPs3KibBVvfIOeT8BXAnAu1sLqswpW4g1uHkmjIMbQO+SMw52QBphtBNiSFc18
         YCDIOmkuXPAWwKp7a4FXp+Y5+6JTbKBu/YZaxXbWhKsNZSDIjJZbsTceUtMz9JQ5QzLa
         8EfzWM4KVk0Iflw58oL0xiGpWjbTqMs9Sfg5i170T/OTH3lMhf+2zBhLTULzbgcAWjyl
         Xrf2IUcF+3T1SgThKsT4JeaifVSPBd9LPC7V5rImeY9ZsV+qZDas8ZH9x1q+wIeTmgEW
         GOnNZEWCAFoZrbZvaM53neuXbz3fsrQhCFDdsv6isx58naKxtBtSnQW9Wuadlqq0BK7L
         LxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292858; x=1794897658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=;
        b=zNQ77mL2i63Gv+omtddoBEDxAMOqFqbzdz48aENxtB60zLjyAhFfmHfi4oicfXjC37
         mZMLBrCGwfNEnjytEUcB0H4Ps3UDqzI/7KllPbECaBswSRCEzDaywPEHNDh1GF75ZBGZ
         YQII+ewYiQgyYQ7k2SlcescY7qFAYol/CMpNetIge6YIWKapc949Ehsleqcn4SmhDva0
         FAdcGyDA4wOBrcecMX3jtQKM9r1e9WYJgf0xa+cyRFJ2d3MCDqlwjKt386aDQfNL8u5M
         VU+gaDFclNZ5nJ8spB1pDn/5BcIVOEHeI31vpLTYH+vuqJDVNBTnwGzzXg3o4phx3hmN
         ItBA==
X-Forwarded-Encrypted: i=1; AL+hErHFjLk4XDqXRtvuHDr347SMJyr4QQaOemaA7WPzZo7hFf2viE2o3FJeMjZha9XMkD16SoxNCqA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+9zXy3dAqNpH6ql1XValxY+LxKkg51el/CYILu4hs8yGbWwyxV
	H9e2dEk8LAfqj621+gXuzrYkMkXILpZJC+oNt+t0ZRbNqoGeKlQuDRR/Xceq6pyOJN07h3IEx1L
	6IwLzfAZ1U76jygggxrthdR5pe5i6fFtB1C5fj3XGYvd9KLy2v+q5Or0PgVhq2bU3
X-Gm-Gg: AYBFou2R2mX9AMsKBiA+KcdaQ6F3uxfK+00fDKIs8hJ3SGInbTywxbzDpSZQ69wENOi
	VThAlvhjK/vv2XZf7w/zdyxKGtYmL5+cA6eQGU8niY3bFrk171oa9XmeroLViOwYrUHiFC8SeuS
	IGzkDsTbmewlN4GK7ozpiWye/SFEOKzC1H57VGQYxVZtPu9LAIF22fLJaBeH2vr4qksM/p/DMVK
	2Yyi20eR56JFSWLaqtxIoZ69w0VzKEDfh8SovUbRQ/s6tzjcPnhXnS4uPsoCWY55yi5VUl3aE0P
	xFI9EYVsJmvWMfwU2VdYZaVoM15kHIEEi7BpRmfYeny+h4zFsNzDi6PxT6edVdJ/7ro3/ZA6j56
	i1+bUARtFGTIkdgJDxhp5+IDMQ1ZzmsjIFBnYqeHsJo0diYVrBiF/WEZDCoBcuFeFm3PE0CjKr+
	HYhrPgEOdA3+2XD9rSwBNHRCCkM3zklA==
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2048819a91.66.1794292857850;
        Mon, 09 Nov 2026 22:40:57 -0800 (PST)
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2048804a91.66.1794292857247;
        Mon, 09 Nov 2026 22:40:57 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:56 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:31 +0800
Subject: [PATCH ath-next v5 10/11] wifi: ath12k: derive WBM RX drv_link_id
 per device via HAL ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-10-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: F4h_z4c3QL8f3hcvHLlzo0heoHK7aiZu
X-Proofpoint-ORIG-GUID: F4h_z4c3QL8f3hcvHLlzo0heoHK7aiZu
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2bc7a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yDf83h2jVu8ggHpUoVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX5foS9sWMxjeN
 joV/MRi9imSFBljZSo2p9skpSxJbdQ+rcy26Ei5Fnq7uKWVuMK0gTQFPJP9c/H1HFlJ/cXAA64w
 Vx3Up8r1bpJEM1bpfcZV9jje0Ud16Sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1JcShSeDNhSR
 cmcO/k1FeKZVjNOPchAUruBXW0bj2dxS+AixPyR1a2rS2B7J59/wnjjx5fHrady8aUT5L4E1zjS
 E8GkX5LF1PRio0+DILsE5b75RL98OO5/KnOd2JkYQlxoFpJc0dF6NCChXJTx5zdhWbrRcT5QyrQ
 vgFcwxKuwiWvJ7AoIq6L/nw8+1KlA3KzhyF8HbaGFrZtwYwcrbDC2aP/lyZDX1OcSkLStGc/ozH
 WGNR1Tb/0x0mFE3z92euGBLt2Tu7roZpDT7ygxS0K2OTy5VUMVVpRFI+iJFJeyb08WMS+aPQqH+
 MDivq9MLa8nJdHDXhlkkAJ5VrrVigRdEld6b4CdNvPHkgJiw+FWdqtiKN6pdF0ayonxLp0LkF9P
 Vvba1qT0QcDiGDboyKwb6/qpVTuo7oVY96fzmfS61TZQsCLce1LMBKbZsalOUJdJzV+xk2/Iq59
 rNNrrIwvdHl5xlT6abw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224059_375047_578AD870 
X-CRM114-Status: GOOD (  15.97  )
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

The WBM error path also stores a driver link id in
ath12k_skb_rxcb::drv_link_id, previously derived from the source link id
via rx_desc_get_msdu_src_link_id(). Like the REO path, the source of
this id differs per device.

Add a HAL op rx_msdu_desc_get_drv_link_id() to let each device provide its
own driver link id on the WBM error path. For QCN9274 keep the existing
behavior; for WCN7850/QCC2072 extract the logical link id from the peer
metadata via ath12k_wifi7_dp_rx_get_logical_link_id().

This replaces the old rx_desc_get_msdu_src_link_id op, which had no
other user and is removed along with its per-device implementations.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h            | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/hal.h              |  4 +++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 22 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  7 +------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  7 +++++--
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  8 +++++---
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |  4 +++-
 8 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index fcad6a7ad6ba..a78efa1d9569 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -164,12 +164,6 @@ static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_hal *hal,
 	hal->ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
 }
 
-static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_hal *hal,
-						struct hal_rx_desc *desc)
-{
-	return hal->ops->rx_desc_get_msdu_src_link_id(desc);
-}
-
 static inline u8
 ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 				 struct hal_reo_dest_ring *reo_desc)
@@ -177,6 +171,15 @@ ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 	return dp->hal->ops->rx_reo_desc_get_drv_link_id(dp, reo_desc);
 }
 
+static inline u8
+ath12k_dp_rx_wbm_get_drv_link_id(struct ath12k_dp *dp,
+				 struct hal_rx_desc *rx_desc,
+				 __le32 peer_metadata)
+{
+	return dp->hal->ops->rx_msdu_desc_get_drv_link_id(dp, rx_desc,
+							  peer_metadata);
+}
+
 static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
 {
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index c8bb63d92bfd..343e1636b4cc 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1378,9 +1378,11 @@ struct hal_ops {
 					  enum hal_encrypt_type enctype);
 	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
 				     struct hal_rx_desc *ldesc);
-	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
 	u8 (*rx_reo_desc_get_drv_link_id)(struct ath12k_dp *dp,
 					  struct hal_reo_dest_ring *reo_desc);
+	u8 (*rx_msdu_desc_get_drv_link_id)(struct ath12k_dp *dp,
+					   struct hal_rx_desc *rx_desc,
+					   __le32 peer_metadata);
 	void (*extract_rx_desc_data)(struct hal_rx_desc_data *rx_desc_data,
 				     struct hal_rx_desc *rx_desc,
 				     struct hal_rx_desc *ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 312c7ac74b3b..4132578085cc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1961,7 +1961,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
-	u8 hw_link_id, device_id;
+	u8 drv_link_id, device_id;
 	int ret, pdev_idx;
 	struct hal_rx_desc *msdu_data;
 
@@ -2057,9 +2057,9 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 			continue;
 		}
 
-		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
-							    msdu_data);
-		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
+		drv_link_id = ath12k_dp_rx_wbm_get_drv_link_id(partner_dp, msdu_data,
+							       err_info.peer_metadata);
+		if (drv_link_id >= ATH12K_GROUP_MAX_RADIO) {
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_INV_HW_ID);
 
@@ -2075,7 +2075,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->drv_link_id = hw_link_id;
+				rxcb->drv_link_id = drv_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2083,7 +2083,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->drv_link_id = hw_link_id;
+		rxcb->drv_link_id = drv_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2114,21 +2114,21 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->drv_link_id;
+		drv_link_id = rxcb->drv_link_id;
 
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,
-				   "Unable to process WBM error msdu due to invalid hw link id %d device id %d\n",
-				   hw_link_id, device_id);
+				   "Unable to process WBM error msdu due to invalid drv link id %d device id %d\n",
+				   drv_link_id, device_id);
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_NULL_PROC_DP);
 			continue;
 		}
 
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
-						       hw_links[hw_link_id].pdev_idx);
+						       hw_links[drv_link_id].pdev_idx);
 
 		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index edf122fd46b5..bad2b60409d9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -173,11 +173,6 @@ static void ath12k_hal_rx_desc_copy_end_tlv_qcc2072(struct hal_rx_desc *fdesc,
 	       sizeof(struct rx_msdu_end_qcn9274));
 }
 
-static u8 ath12k_hal_rx_desc_get_msdu_src_link_qcc2072(struct hal_rx_desc *desc)
-{
-	return 0;
-}
-
 static u8 ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072(struct hal_rx_desc *desc)
 {
 	return le16_get_bits(desc->u.qcc2072.msdu_end.info5,
@@ -471,8 +466,8 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcc2072,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcc2072,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcc2072,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcc2072,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcc2072,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_qcc2072,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 7c19098f06c7..0f85ae69b5e0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -892,7 +892,10 @@ u32 ath12k_hal_get_rx_desc_size_qcn9274(void)
 	return sizeof(struct hal_rx_desc_qcn9274_compact);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc)
+static u8
+ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274(struct ath12k_dp *dp,
+						struct hal_rx_desc *desc,
+						__le32 peer_metadata)
 {
 	return le64_get_bits(desc->u.qcn9274_compact.msdu_end.msdu_end_tag,
 			     RX_MSDU_END_64_TLV_SRC_LINK_ID);
@@ -1206,8 +1209,8 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9274,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_qcn9274,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 5c593773109d..b9c2b97105fe 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -33,7 +33,6 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_qcn9274(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcn9274(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_qcn9274(void);
 u32 ath12k_hal_get_rx_desc_size_qcn9274(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc);
 u16 ath12k_hal_rx_mpdu_start_wmask_get_qcn9274(void);
 u32 ath12k_hal_rx_msdu_end_wmask_get_qcn9274(void);
 void ath12k_hal_rx_desc_get_crypto_hdr_qcn9274(struct hal_rx_desc *desc,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index fec625a0ea0b..2d66d71d1b9b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -505,9 +505,11 @@ u32 ath12k_hal_get_rx_desc_size_wcn7850(void)
 	return sizeof(struct hal_rx_desc_wcn7850);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc)
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata)
 {
-	return 0;
+	return ath12k_wifi7_dp_rx_get_logical_link_id(dp, peer_metadata);
 }
 
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
@@ -803,8 +805,8 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_wcn7850,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
index c7e1fba9bb4b..3fa919352686 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
@@ -27,9 +27,11 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_wcn7850(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_wcn7850(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_wcn7850(void);
 u32 ath12k_hal_get_rx_desc_size_wcn7850(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc);
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
 						  struct hal_reo_dest_ring *reo_desc);
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata);
 void ath12k_hal_rx_desc_get_crypto_hdr_wcn7850(struct hal_rx_desc *desc,
 					       u8 *crypto_hdr,
 					       enum hal_encrypt_type enctype);

-- 
2.25.1


