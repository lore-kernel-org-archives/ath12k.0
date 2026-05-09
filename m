Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638FFCD3447
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50H5oNb0zAgUgWNo0Pb+zr76atRJ4QpFRMqVAVEcQGA=; b=JBeaDx4cExhh1AULG599CRF+gD
	k6lC6JSPAyYUKjAuDZEL+oeZS8bYIfHl0Sqrm2f9MZwbSmCJQu3JpEickyrb8GLdsAxhU3/pSUgCg
	nXNSCRq3OeDV6j++QzQXS7pKqV8dj/AzC6oEXhh4onRZhmxD1r1YgEJgoNQOW8Wh9kM8rTAm6U1tg
	Mww50//xGMyUdpv7feBT+YnFkF+0rIcD2ViOx1q+taI2z2lI7Z8dOkTa4DYHmv343NqkU2Nb58U+k
	/E/9rgERS+Pfjb+N25d+xxd9rYM5lGyENBggi9ULihlxOsImVW4n6Dd8Qu7UiaWdSB3ScJ4Tin1ef
	H7hx/csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuT-000000084Gp-0gAy;
	Sat, 09 May 2026 02:59:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuQ-000000084FY-2giq
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492poOb2866538
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=50H5oNb0zAg
	UgWNo0Pb+zr76atRJ4QpFRMqVAVEcQGA=; b=R57fLsvC6VYbYI4+r/5guUpNZB3
	icSJvR29RuDLbIC89fMRBQaEL9VuoJ3cLchhnzGX1RKXBB+631DtNfUBFlnGXFo0
	evvasNmM+3tZvLRAtkD38KWswGsczpn1XRV0lYQ6a131YYfFkOHIDFcbSc4k60KR
	7nJuovowP/rpywz4tEzPkgS3wRoyyAOns1lD9TkkMj30Q8b+J0JRoOii4tKzrkRC
	ecjTptfkZ8g5aOMyEV50bvOvdRmlB/86yIrd09n/rQLjtYHkbB39IPfmFGOFoI+m
	3v6eAG4UHBJKZbs71tGjiy9ZfXKBalk/sR3x5tAUvveL10f6JSsbSQL9Elw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy00ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso2003690a91.0
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295556; x=1778900356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50H5oNb0zAgUgWNo0Pb+zr76atRJ4QpFRMqVAVEcQGA=;
        b=i8BK4vvWkaRUiZAElrg8E8Gz7sTtJhgtEWaSyX4tzG+ZFZdhk/32zKowi57tuMfmRh
         qpO+FbGHXmPLwjXSoFZbapt+D+y0OWDpiFIe/A9v4iYA/ltsYo9fiWAfOtlMrmkki2uF
         l484xgWtG1+Hem+hLjGdRung5gFDggtcMFrrkDAzDf8HY66m5fJf1JzMC8UX69W8fUkt
         jdG6ojhM3vjdGaj1/akGQGEaJDda4DL8YFV+nfBWCWhE6WQtz6rxm5byFzdD3xNS3HDT
         Pk2NOFWkJQUYySSkftkvCd3wUthbgSYXSO1XBB3GTBq5NRZPLoYv0XYqS1+KZXuiFTSl
         vVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295556; x=1778900356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=50H5oNb0zAgUgWNo0Pb+zr76atRJ4QpFRMqVAVEcQGA=;
        b=LJJ6gzc5YWHJAGnmtY9d6W5e0gE5vJQeVK+LZa6Ru/jesWwOF7B2DdPIVX3JFdlK9G
         uD8WRoJkV2UWlJiprKVv8Pm7VehJptwMe2lqT1UfUGAff+fvb/gX1aNPFXb3E99MKEVg
         2GuPQoRYNqlDgDb8bn6Olkz6CuQlFLoJJFJLQesorgg/L4HN/e+wsjSpOUqtPG13zLiA
         Q/vgTs71MoQcMl20HkebUAXX5++aSsEAKTB0WBSHbEQZQyXlcfPMP+ft3Kv3ylncFCRR
         9vjuDK7Vdcob5OR2vt6DoTMHBYiFwDilegtBDn3oN2rc3qPDsbnJjvRKwpjiULzXNnIZ
         rkSA==
X-Gm-Message-State: AOJu0YzE7u8To62ZZCS4aFCWrI3Zaa5UT5ZTCVdD8jF8gTUmw1/up2Ff
	o009tB0QB1HMt43USH1O772Oq10uv+83dBbrZLzYDrM7iS646doHZpjLV2Iaf6iMdU3HWsqAj7c
	MU+v+ETRcKemXr3VJRzmmi3YD1FTVd6L8LM3iuiucQCfffVfy/a5v3d0wmn8tr921BuyinNrWq2
	g=
X-Gm-Gg: Acq92OH7NpWU4J5MZqvIi5ijl4lJj5gQU20FQKNbTGWLFGPMSpGww/lK0tme1/ppeHo
	9lkNWJej8HwEH82Fcdh2+sl+g+BBlmbapdiAfa3zEdcqYAZRzX2v0DipCHy77PnIeKMOB5XIQT5
	JhplbwSxECXXuH7n/IViPsx+CxCDyvzDMSEqDjjHYlhs/pnwRx+sPSWnBSQHlz2fmt6WdK83kM7
	tlcwNtFariql0Ii2/QD0kdWco9uLlez7jXp/WbfmTiTVaYueC+iPMkyUh3PMIJziKJB58mQN2/i
	uz+TsCvGyJkhh51EtHjCacrgMYkeg6f/L9yVV+SONxJgbHuX7xWHopX329zyH4AfS/6E8ANhDsw
	R5RMlVLR17gX2hzCAMKRKD2ZXs7YSTjI6tqDkDCUkhATYE4oYguYqX7gXOwqSsIyMKjr+RvqQIh
	FJYvmI
X-Received: by 2002:a17:90b:45:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-367d468cf75mr1169876a91.6.1778295556340;
        Fri, 08 May 2026 19:59:16 -0700 (PDT)
X-Received: by 2002:a17:90b:45:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-367d468cf75mr1169852a91.6.1778295555804;
        Fri, 08 May 2026 19:59:15 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:15 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/5] wifi: ath12k: refactor HAL TLV32/64 decode helpers
Date: Sat,  9 May 2026 10:58:16 +0800
Message-Id: <20260509025819.1641630-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=69fea305 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=R17iYGmNITDVIwCHYO4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: vD-sEmoxisVC7GJq6-Sirn-AvQ3PWXNF
X-Proofpoint-GUID: vD-sEmoxisVC7GJq6-Sirn-AvQ3PWXNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfXxbyuha+0laey
 HCgIp5jkoX2kimIq0CfkNpXbkGBRz3WbHKVByQQrXP/wqmh9508Unmha8wxNDyj/nfFX0vxmuXd
 7nEoMx86xiBoyYT+DCoDYlF0Z8qZK70AbGtBuOkL46fGgoI1hADsMCJkq3hwiOHv9FS1gy51npR
 W0Y/77ECIxKQ13hfph1WfTWhkhQtazJSriOMV3+/LrJwe/Ivy5cbiLOGquUs46YwUNM/+PkMmvM
 /QBydyPkUiUPjHfdJqe3o6m1mIS/xKJkEmcr6DpGkNQeeRZtD67v4iWqxI5loEuWguklLKfa5B4
 v2WBQBer5RU9m4rmRd/7T8nUvePDWwwhnQEwJjCt8ZWhSSN5ci7eeQfzBaZgo4evwvQYUgwrzmB
 Pwf3jlhd0z16NdLcpzaubguQTpYnknVHRQxF5VKFvstMNB+b6mZD+M2ONG8/nErnx7yGVAEDxNh
 l5on+yz/yQIzhwoZ8/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1011 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195918_802473_F2DE3622 
X-CRM114-Status: GOOD (  14.43  )
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

Change TLV decode helpers to return the TLV value pointer and optionally
decode tag/len/usrid via out parameters. This allows reusing the helpers
for DP monitor RX status header TLV parsing and avoids duplicated header
decoding in callers.

No functional change intended.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c         | 26 ++++++++++++-------
 drivers/net/wireless/ath/ath12k/hal.h         |  4 +--
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  2 +-
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 11 +++++++-
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 11 +++++++-
 5 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index f03817b2fbc5..d940f83cd92f 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -846,26 +846,32 @@ void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len)
 }
 EXPORT_SYMBOL(ath12k_hal_encode_tlv32_hdr);
 
-u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc)
+void *ath12k_hal_decode_tlv64_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid)
 {
 	struct hal_tlv_64_hdr *tlv64 = tlv;
-	u16 tag;
 
-	tag = le64_get_bits(tlv64->tl, HAL_TLV_64_HDR_TAG);
-	*desc = tlv64->value;
+	if (tag)
+		*tag = le64_get_bits(tlv64->tl, HAL_TLV_64_HDR_TAG);
+	if (len)
+		*len = le64_get_bits(tlv64->tl, HAL_TLV_64_HDR_LEN);
+	if (usrid)
+		*usrid = le64_get_bits(tlv64->tl, HAL_TLV_64_USR_ID);
 
-	return tag;
+	return tlv64->value;
 }
 EXPORT_SYMBOL(ath12k_hal_decode_tlv64_hdr);
 
-u16 ath12k_hal_decode_tlv32_hdr(void *tlv, void **desc)
+void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid)
 {
 	struct hal_tlv_hdr *tlv32 = tlv;
-	u16 tag;
 
-	tag = le32_get_bits(tlv32->tl, HAL_TLV_HDR_TAG);
-	*desc = tlv32->value;
+	if (tag)
+		*tag = le32_get_bits(tlv32->tl, HAL_TLV_HDR_TAG);
+	if (len)
+		*len = le32_get_bits(tlv32->tl, HAL_TLV_HDR_LEN);
+	if (usrid)
+		*usrid = le32_get_bits(tlv32->tl, HAL_TLV_USR_ID);
 
-	return tag;
+	return tlv32->value;
 }
 EXPORT_SYMBOL(ath12k_hal_decode_tlv32_hdr);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index b3a89ace5a97..3158c1881c76 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1551,6 +1551,6 @@ void ath12k_hal_rx_reo_ent_buf_paddr_get(struct ath12k_hal *hal, void *rx_desc,
 					 u8 *rbm, u32 *msdu_cnt);
 void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
 void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
-u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc);
-u16 ath12k_hal_decode_tlv32_hdr(void *tlv, void **desc);
+void *ath12k_hal_decode_tlv64_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
+void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 1eefb931a853..c0583c3a2191 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -439,7 +439,7 @@ static u16 ath12k_hal_reo_status_dec_tlv_hdr_qcc2072(void *tlv, void **desc)
 	struct hal_reo_get_queue_stats_status_qcc2072 *status_tlv;
 	u16 tag;
 
-	tag = ath12k_hal_decode_tlv32_hdr(tlv, (void **)&status_tlv);
+	status_tlv = ath12k_hal_decode_tlv32_hdr(tlv, &tag, NULL, NULL);
 	/*
 	 * actual desc of REO status entry starts after tlv32_padding,
 	 * see hal_reo_get_queue_stats_status_qcc2072
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index ba9ce1e718e8..8d8d1a9c05d3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -934,6 +934,15 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(rx_desc);
 }
 
+static u16 ath12k_hal_reo_status_dec_tlv_hdr_qcn9274(void *tlv, void **desc)
+{
+	u16 tag;
+
+	*desc = ath12k_hal_decode_tlv64_hdr(tlv, &tag, NULL, NULL);
+
+	return tag;
+}
+
 const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
 	.wbm2sw_cc_enable = HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW0_EN |
@@ -1122,5 +1131,5 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
-	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
+	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcn9274,
 };
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index e64e512cac7d..4bef64ac9150 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -740,6 +740,15 @@ int ath12k_hal_srng_create_config_wcn7850(struct ath12k_hal *hal)
 	return 0;
 }
 
+static u16 ath12k_hal_reo_status_dec_tlv_hdr_wcn7850(void *tlv, void **desc)
+{
+	u16 tag;
+
+	*desc = ath12k_hal_decode_tlv64_hdr(tlv, &tag, NULL, NULL);
+
+	return tag;
+}
+
 const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_wcn7850[DP_TCL_NUM_RING_MAX] = {
 	{
@@ -805,5 +814,5 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
-	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
+	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_wcn7850,
 };
-- 
2.34.1


