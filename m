Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864B0CD3447
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwM5k+UWfUTUt59a3ABR2UlFzgDmzYoEve9ZdYQTTxU=; b=5CTEN5Lw13WbKeU1L/K2kAOyDI
	FH3WbBGjky9NQxtz3GjW/vDt3VFYiVNbuu8a0aTkDoCNVMoGaDcw98rcvdbrmptY31GJx6C2v/S/1
	o2B1fZKU1vLPRtkEsOU4bt4+CaCp9LfwztHdYHS/6dzoe4eDAPZKTe/NkgI1N4OKvS/hFAWez9hXr
	vIHkA81kPkp2J81zjYU3/0NLKLTWu5oEJCjMYpURPHUNLdHOz34dHFmONNcDHaD54XtjPU8gOB4V5
	0QPt/COoOBQfkp4xRYTAA+T9ASZm/WpQTEtGCJJA4AqwsVmJp4Lc35KrmZFpSzfCsx70/Tk2tpBTY
	7fJeiogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuW-000000084IC-1Ial;
	Sat, 09 May 2026 02:59:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuT-000000084Gg-1Pc1
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492BiYr656610
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AwM5k+UWfUT
	Ut59a3ABR2UlFzgDmzYoEve9ZdYQTTxU=; b=ZzZkJusr3zRgZqckksdkRkWZK4x
	yHRSOKtSxuREkWNS5Ox3w5y8XxyPZaWb+T5AyXeVXYcUo534BBHMf0GTSlmd6qS3
	fX70zAFLZ/0GxPBu5SaUdRlM9W6Y1YU1yyGMNBZGGsLY96/l0u2PN+9ocw15iyUj
	/ndcZTAit+TmeMO1pFTQqNXMw87+Ta/pNjPZOyLNrh8DhNoBrqjR7zPuUKTUL3e6
	89Utbz7KWhrQPz1OJVG7TGzmv1oF8HCrgjvcJR3CQecN/6YKk2WGrp5o4M20SvnB
	n5bSne9vhUBqDS3rTbFVrK9kDnGGZRclCHMjSF30eqV2U7lGpLbkcRgGG8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6r2t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso3243824a91.1
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295559; x=1778900359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwM5k+UWfUTUt59a3ABR2UlFzgDmzYoEve9ZdYQTTxU=;
        b=JcgNUY4st+lgyrPvx6ARzo/h9ZNMEFvSA5FIIxJoVd9iIDEkPQPDC9HKB0d74UqbFK
         v2ISUiQGc+00WqzC8tqamX3MGwIbXpnUNR2jyyFcIQCNLxiD0QZrqmtAiHFkRx8PF3Cs
         Z6VFdxHW/ubmTZfic5+ZRK2LCI4M7+GY2iQ6Xyj1Xo3FB3IjMIFzgBFNJrKMqiWq5WrE
         QAhEy2jlWHDOD8siqdyE5GOv6TmQOhLjJayUvtFyTsAipauE6Ec1+UihBrbP5L0zjg5P
         30xFTX0hlVnYGpPPM+sqYczI+xeo6jFGkvR3mgspojTBUYxe7ME4pUYJ8wrub19rpRQY
         6i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295559; x=1778900359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AwM5k+UWfUTUt59a3ABR2UlFzgDmzYoEve9ZdYQTTxU=;
        b=DwdzrdWirSCEjDsePHdrOHasF44QtUSXCwF6eM40YG36TsXMSgvZf6+gm9HxDAKSdT
         CjMRIAYrP5V49niVMC37+4ExLrZGGcdCqd+pXpjGy0fCuEEgty+l9ibsjvbwhMyF5LbU
         SBDs8axhXSjHYhZRnLhS2XflORCCubhoPjoYtCDQ9H0YN519SLT6e4E7Bdudwtq9SjLw
         VAwuJprAu/TPXxC/WUzsva1qXuPnLjP5BcAJrv6z2mgPjKjdiAQlGg5Izs2dMxJd75iO
         k4sJHTmEdBzP4k/1xEh41Pw8S0gifGYpPVYNOevO9ypGzWqNGcGP+vi/Xi6s1wZUbcgV
         SF3w==
X-Gm-Message-State: AOJu0Yyl1li1GQa9JK2DQLstVU+q1Axky+uiTYqBXyq/GMQy93g+fyps
	Lm7VDXZWXpJvfGIHSmulDAKovMA6HkoTJJVXQBrGIwq891g30HrnDS6v1mD40/Ib2GL338sa0OB
	VP4R0QRuqfvWEHn4XWUtj4bIfFYHG1kQlolepR7QBakx2RLLwf7a8WtP7pzbVwKLw
X-Gm-Gg: Acq92OFFja4d9GjJOu+yHNdTxCVE7GBDZv44+GnBJsRYIc0rjA4jAGPW3v3QMW85w/1
	cKkOORWBd27JDsbif8vud2QOtt43nKPf996553Y0RL60qth0E36mR8G2/jZqR9pwTutV0aM6gsh
	hVvO/t4b33fu06WeAehi7+YLL0qK19i4/6BoohTkNd8dDM2xsDYZRSQNH3i4r/e1qQNIPoQcyLd
	ZpZm3tF1doZ+EeNbagrQ0q6oXz/vj0zDC/Fu9xOJK/X3TbNu3FOD9Ietzx0mpRX+2X9NP+7O30z
	nh1Xzfoc7KUwSyF66FbKwBocAqixLDieTxp8xYAfSy4sNddnD1ty8mw5xjBYEZ8TJwMAl0xE6C+
	d21GRiRjMkQiKAch1eC21siqHrITfv/cSAfBkwLSH20WPG2wjiIb4vXZJRQ+sF3pQohUH9M4Bcx
	jultKHkh2qbY1aIkI=
X-Received: by 2002:a17:90b:2707:b0:35c:1d65:7867 with SMTP id 98e67ed59e1d1-36605a524admr9707140a91.15.1778295559122;
        Fri, 08 May 2026 19:59:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2707:b0:35c:1d65:7867 with SMTP id 98e67ed59e1d1-36605a524admr9707110a91.15.1778295558548;
        Fri, 08 May 2026 19:59:18 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:18 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 3/5] wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
Date: Sat,  9 May 2026 10:58:17 +0800
Message-Id: <20260509025819.1641630-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfX4YQKYH8R8Mq3
 kx79nvE/yEQCPJ2hR3sfDk0MSePBq7K8el6pVyZqpQHo57joLSimepWBiCJ5s+C3WtBYov7bDEV
 K+n7d1HCCxmYpqMM+kbtsk2MP02yYw8/cFRMCvoQasCFqSg2fp4tV4NfKOPzV/6KLUByZtYVy/v
 Xbefp+h3IeodGxALsh7b3T9U9dh8AfE1tPVzm7nk6w9xuP1u99T1oPh1kE/zJvR7SdU1ZaU3mFl
 S9XTs5Z6wYMCmv9bJbk79eC89ahqNfzh5UX5dK4RK91w1oKZKPRBUJN4o1B/IfifEgOxqUcthLL
 mwR6N4bC+E2w2OsqjMjKi7wwdz4XAytH6unsZw0yeIenQixmWWoC13e1IQONLUN2zneXmPsm6Ev
 YxDMrRJmH9ZvPmaHAE9GiISqio23qiNHzaS1k3utE35+9SmP61QTgVlOzDy1MMygFvuyQnFpUs9
 WVP7nC0MoKZTyRSIgyw==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=69fea308 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cBALExdzTAL-QLrJbW0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yHf0mQuRAruk12U63GlEYSvfbypAKcvJ
X-Proofpoint-GUID: yHf0mQuRAruk12U63GlEYSvfbypAKcvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195921_497045_E8B18874 
X-CRM114-Status: GOOD (  12.42  )
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

Wi-Fi 7 monitor RX status TLV parsing needs to decode TLV headers and
advance the pointer with the correct header alignment. Different targets
use different TLV header layouts (32-bit vs 64-bit), but the HAL ops for
dp_mon RX status header decode and header alignment were not populated
for all wifi7 targets.

Add dp_mon RX status TLV header decode callbacks and TLV header alignment
helpers to the wifi7 HAL ops for QCC2072, QCN9274 and WCN7850. Export
helpers to query the required TLV header alignment for 32-bit and 64-bit
TLV headers so the caller can align the TLV walk correctly across targets.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c               | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/hal.h               |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c |  2 ++
 5 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index d940f83cd92f..c0c3d2f047ef 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -875,3 +875,15 @@ void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid)
 	return tlv32->value;
 }
 EXPORT_SYMBOL(ath12k_hal_decode_tlv32_hdr);
+
+u32 ath12k_hal_get_tlv64_hdr_align(void)
+{
+	return HAL_TLV_64_ALIGN;
+}
+EXPORT_SYMBOL(ath12k_hal_get_tlv64_hdr_align);
+
+u32 ath12k_hal_get_tlv32_hdr_align(void)
+{
+	return HAL_TLV_ALIGN;
+}
+EXPORT_SYMBOL(ath12k_hal_get_tlv32_hdr_align);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 3158c1881c76..312993d3d5d4 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1439,6 +1439,8 @@ struct hal_ops {
 					 u8 *rbm, u32 *msdu_cnt);
 	void *(*reo_cmd_enc_tlv_hdr)(void *tlv, u64 tag, u64 len);
 	u16 (*reo_status_dec_tlv_hdr)(void *tlv, void **desc);
+	void *(*mon_rx_status_dec_tlv_hdr)(void *tlv, u16 *tag, u16 *len, u16 *usrid);
+	u32 (*get_tlv_hdr_align)(void);
 };
 
 #define HAL_TLV_HDR_TAG		GENMASK(9, 1)
@@ -1553,4 +1555,6 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
 void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
 void *ath12k_hal_decode_tlv64_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
 void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
+u32 ath12k_hal_get_tlv64_hdr_align(void);
+u32 ath12k_hal_get_tlv32_hdr_align(void);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index c0583c3a2191..80ffadc47d48 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -490,6 +490,8 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv32_hdr,
 	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcc2072,
+	.mon_rx_status_dec_tlv_hdr = ath12k_hal_decode_tlv32_hdr,
+	.get_tlv_hdr_align = ath12k_hal_get_tlv32_hdr_align,
 };
 
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcc2072(void)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 8d8d1a9c05d3..129f6b1919e3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -1132,4 +1132,6 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
 	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcn9274,
+	.mon_rx_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
+	.get_tlv_hdr_align = ath12k_hal_get_tlv64_hdr_align,
 };
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 4bef64ac9150..881986075548 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -815,4 +815,6 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
 	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_wcn7850,
+	.mon_rx_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
+	.get_tlv_hdr_align = ath12k_hal_get_tlv64_hdr_align,
 };
-- 
2.34.1


