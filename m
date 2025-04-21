Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0224C369C2
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrfVX/gBeLQiUTHGX4OfY5iM7SyOYw04n25h+TZF3B4=; b=Uz34iyY5OrqTw5PgOxiwXWfAkb
	6MvGk88biByG6+4ugKpgTk4fTodvE1qgAVYe9vi974kB8ExiDd7ewj7jgdFkx5mvPXe9jKNuHCKxK
	XIAcIwDPrZgWswNPmsYrqHEQHnMp2v9ivuI5g2amX5eJucGb0IUqLBFBG3X5ehk7/cAzeluRl8iNQ
	NlDrBcfUP2jH8F5/vhUmUrUnVyPOwtWMpdbYk5hHI9qD+WKhIog+kee2IMtf/szmJpwydP/cqw3kd
	Yds9vXEs09d5lebBdEnHSgk1J8fX8cYKFNkAkeSZ5S4ybKqIOa/Zd7s1nzryGYnsM9pYWzRwK6W1D
	x3jYO3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0J-00000003S4I-1pEw;
	Mon, 21 Apr 2025 02:35:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0G-00000003S3O-0bLF
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNVHZO019612
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nrfVX/gBeLQ
	iUTHGX4OfY5iM7SyOYw04n25h+TZF3B4=; b=hxmy0TNmSg+Ymc+ve17EOuZcwLz
	u8JByzuQWxbuLNs2CzZQxOWNDk5brWrGYuuZOt+EF3KnYk5NUgz8lICBSWOub2yV
	CxdwBF+8utVpCV1POVI92z3VMsV+5z/2GLlchDJgM6pr4XMv5U+Vde3BGdKP5+hH
	k/Jb2YQQ+7p6oewkHzGwJIGw9OdtMqm/c8hUTT7ifo7w9xKkgf1+LrubWw3Owsnp
	fgjgdWuistD5iYoyFj8vNRSbBkdtcvsIEfgb/7iLeUP2LIwc0O1dK3Q7F5U+m8dM
	GnbsoXnQCISzHxb89nWGq0XGzomIpoJ0CDUDTbYTz2leI4oQZ/8xXiInVxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwjstp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3082946f829so4637287a91.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202921; x=1745807721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrfVX/gBeLQiUTHGX4OfY5iM7SyOYw04n25h+TZF3B4=;
        b=g7fyrwl5WJsUBSIN9ad6knGP4nXA9i5w6CzBLrYBpLwYVfwgVIT3uWHwW0YxIrqd6G
         Pe6uon0fEcqX4serIi4lKgk/CZJ3vS3+5n9hpoNOSb3xnchvo9aFG2+C42VK14FRFQV1
         eK68gReVGQTLat0FBZNfMtdXKehFWJQDwDGwlNLqQoqoda4tFjEnOzQuR8LSnSy1wu+B
         yJPLIx1i2J23+dEQfAKiTDsBrnxTpkcEwI7HQiKum69dofe2h+zn2CzlGpgr/A7pc2bY
         hDGW+w5dSgvQiyyd/f4i7KkxbOO59Avgkb0AaVzDGw+VR8rXUw8wIkGBN1dBekpdbdzS
         Hvxw==
X-Gm-Message-State: AOJu0Yy1buoqNeIwThF3bJJC57UeSy7xrczRtDWJOSb3Po5X/YupBINW
	YmmeOY+SdvyZrJTkYtGGKpZRADTv+nF/NTlVS2ync2ajySzvlFM+zZ2QskArlTToebMtpEw5YoA
	YilAoyxHWxxqFiQ/BwIcAFfN/8C93RI0/swvIxNQ0/69I/j1l2tACgzjhc5vYiLBlnFWj1ME=
X-Gm-Gg: ASbGncs5QfBdsnrkOP80r72NtE59zhBhrv4aBdMfyQvwMmRqaeAocWmF9ySjnrBlKGI
	htsdFyeGyKOOOpGq+A28X9qTKWjr3d5htKwKUSQcrNG935NgqnW021BFfGLhqwB4/3Zv6G39aRC
	YvcsHoLt4vWWbsUNP4PCLIaR9ISKtEsGaayp6q9QREyZVyHQUx/H4Im3g2f4Cq4P2HkJgdBpDG/
	rmJvabVXkpKVIiHba7RvPfGd9MMWYIq5JP9IxULGuryj65fmUjQBE0LkMehTq7rsIdofngvdWVj
	9VnFIjGlsf1yDbqAbviIwdrJGYQ8hWVa4eXpHm1yDUNaVFPtJee9gIaGlvsznTCGJOyuB3Fk1Kx
	Jqkhj1pl2VAM=
X-Received: by 2002:a17:90a:c105:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-3087bb579b7mr16101174a91.10.1745202921294;
        Sun, 20 Apr 2025 19:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwIQAaaajvjoyocb0BpfSXshEezhkBoqxZJ+lZKhKxZycXlXlbETJq5aZORWHIEhSCaAa0ew==
X-Received: by 2002:a17:90a:c105:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-3087bb579b7mr16101156a91.10.1745202920814;
        Sun, 20 Apr 2025 19:35:20 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:20 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 01/13] wifi: ath12k: parse msdu_end tlv in ath12k_dp_mon_rx_parse_status_tlv()
Date: Mon, 21 Apr 2025 10:34:32 +0800
Message-Id: <20250421023444.1778-2-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6805aeea cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=IxprkX8A5F3MZX6Gb8UA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fCBD5PRkdhi76gr5DpGLtmJs39cLz3PM
X-Proofpoint-ORIG-GUID: fCBD5PRkdhi76gr5DpGLtmJs39cLz3PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193524_304576_CAAAEF5D 
X-CRM114-Status: GOOD (  14.00  )
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

Currently, error bitmap and decap format are parsed in
ath12k_dp_mon_parse_rx_dest_tlv(). Then stored into dp_rx_mon_mpdu_list.
ath12k_dp_mon_parse_rx_dest_tlv() and dp_rx_mon_mpdu_list are only used
by QCN9274.

For WCN7850, error bitmap and decap format are also needed. So need to
parse MSDU END TLV in ath12k_dp_mon_rx_parse_status_tlv(), this is the
common function for WCN7850 and QCN9274. Then store error bitmap and
decap format so that QCN9274 can fetch them when processing MSDU payload.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h     |  2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 78 ++++++++++++------------
 2 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 706d766d8c81..2ce6f0d7574f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -121,6 +121,8 @@ struct ath12k_mon_data {
 	u32 mon_last_buf_cookie;
 	u64 mon_last_linkdesc_paddr;
 	u16 chan_noise_floor;
+	u32 err_bitmap;
+	u8 decap_format;
 
 	struct ath12k_pdev_mon_stats rx_mon_stats;
 	/* lock for monitor data */
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 17117315ec7b..7404d21eed3b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1416,6 +1416,40 @@ ath12k_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *rx_usr_
 	}
 }
 
+static void ath12k_dp_mon_parse_rx_msdu_end_err(u32 info, u32 *errmap)
+{
+	if (info & RX_MSDU_END_INFO13_FCS_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_FCS;
+
+	if (info & RX_MSDU_END_INFO13_DECRYPT_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_DECRYPT;
+
+	if (info & RX_MSDU_END_INFO13_TKIP_MIC_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_TKIP_MIC;
+
+	if (info & RX_MSDU_END_INFO13_A_MSDU_ERROR)
+		*errmap |= HAL_RX_MPDU_ERR_AMSDU_ERR;
+
+	if (info & RX_MSDU_END_INFO13_OVERFLOW_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_OVERFLOW;
+
+	if (info & RX_MSDU_END_INFO13_MSDU_LEN_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_MSDU_LEN;
+
+	if (info & RX_MSDU_END_INFO13_MPDU_LEN_ERR)
+		*errmap |= HAL_RX_MPDU_ERR_MPDU_LEN;
+}
+
+static void
+ath12k_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
+				    const struct hal_rx_msdu_end *msdu_end)
+{
+	ath12k_dp_mon_parse_rx_msdu_end_err(__le32_to_cpu(msdu_end->info2),
+					    &pmon->err_bitmap);
+	pmon->decap_format = le32_get_bits(msdu_end->info1,
+					   RX_MSDU_END_INFO11_DECAP_FORMAT);
+}
+
 static enum hal_rx_mon_status
 ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				  struct ath12k_mon_data *pmon,
@@ -1655,6 +1689,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 	case HAL_MON_BUF_ADDR:
 		return HAL_RX_MON_STATUS_BUF_ADDR;
 	case HAL_RX_MSDU_END:
+		ath12k_dp_mon_parse_status_msdu_end(pmon, tlv_data);
 		return HAL_RX_MON_STATUS_MSDU_END;
 	case HAL_RX_MPDU_END:
 		return HAL_RX_MON_STATUS_MPDU_END;
@@ -2223,45 +2258,6 @@ static int ath12k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
 	return 0;
 }
 
-static void ath12k_dp_mon_parse_rx_msdu_end_err(u32 info, u32 *errmap)
-{
-	if (info & RX_MSDU_END_INFO13_FCS_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_FCS;
-
-	if (info & RX_MSDU_END_INFO13_DECRYPT_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_DECRYPT;
-
-	if (info & RX_MSDU_END_INFO13_TKIP_MIC_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_TKIP_MIC;
-
-	if (info & RX_MSDU_END_INFO13_A_MSDU_ERROR)
-		*errmap |= HAL_RX_MPDU_ERR_AMSDU_ERR;
-
-	if (info & RX_MSDU_END_INFO13_OVERFLOW_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_OVERFLOW;
-
-	if (info & RX_MSDU_END_INFO13_MSDU_LEN_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_MSDU_LEN;
-
-	if (info & RX_MSDU_END_INFO13_MPDU_LEN_ERR)
-		*errmap |= HAL_RX_MPDU_ERR_MPDU_LEN;
-}
-
-static int
-ath12k_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
-				    const struct hal_rx_msdu_end *msdu_end)
-{
-	struct dp_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
-
-	ath12k_dp_mon_parse_rx_msdu_end_err(__le32_to_cpu(msdu_end->info2),
-					    &mon_mpdu->err_bitmap);
-
-	mon_mpdu->decap_format = le32_get_bits(msdu_end->info1,
-					       RX_MSDU_END_INFO11_DECAP_FORMAT);
-
-	return 0;
-}
-
 static int
 ath12k_dp_mon_parse_status_buf(struct ath12k *ar,
 			       struct ath12k_mon_data *pmon,
@@ -2335,7 +2331,9 @@ ath12k_dp_mon_parse_rx_dest_tlv(struct ath12k *ar,
 		pmon->mon_mpdu = NULL;
 		break;
 	case HAL_RX_MON_STATUS_MSDU_END:
-		return ath12k_dp_mon_parse_status_msdu_end(pmon, tlv_data);
+		pmon->mon_mpdu->decap_format = pmon->decap_format;
+		pmon->mon_mpdu->err_bitmap = pmon->err_bitmap;
+		break;
 	default:
 		break;
 	}
-- 
2.34.1


