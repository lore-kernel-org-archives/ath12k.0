Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ADCCD3447
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7PQ7mMFj09RBEC6R19QFDNhjCRnQR0cfi6POVI/210=; b=YNzoTD2yjZghss7iIRn1D4T4Ak
	1FbvXKGJA2t5rYwX6CO1kQ9ig330NpYOb5T4jxPRX3Wl9rngfiDJHEUz/NEPBxYf0wQR1EVN36K3D
	1aJ1k8k6RtsCYfRb9tIsOLy5bw3iTWCepBNE9nYyaKxKN7DO0KDeUih+Pc0yycGdaTzDLfy+MBgE9
	zWNpfK7jZEkPf1wuIfpcTuj2U+oQ8ZL/HWYJfiD+lYkyrJgI4mgGmgLWbkj1TCjT5FdSoR1mdx1VE
	K5D7X5LHo4pPYLKO732k0S8Xul91NaNJqXOxHC8ZOx0T4QRqaaDodi/jHZUlXSMqo3ppWc+FhgMYe
	zAdV7PjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuQ-000000084FX-0GYn;
	Sat, 09 May 2026 02:59:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuN-000000084Et-2m4h
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648KDmO4853161
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y7PQ7mMFj09
	RBEC6R19QFDNhjCRnQR0cfi6POVI/210=; b=pGb1IPo6bfOm0gu+mHpxhaTKbi9
	UjKoBXxQdtVgUN9kISSTTOtU+w3bOpxuQjyXAaEqz+r6X5ms+GMg436bjjvC7VpL
	xviUwWERJx1TAyEVTaLLr5+TIFpE7zWhOwgfXWiUWMc3GhrkwvhlwrMHHPO8Se2t
	ILg3mEkFq5GNL7ogx9PRDO3uuKB1jX5xxRdlkTsWqsVRirG4RLOoiGXznnSWyezw
	cMhFFoC0wzBUXsqZiJCUYIBY0MiRLjmDHnh/x7lBQh/urZ8gP/wD9d3+dZWVuAbl
	XGlrxEsBSEkJiYbRuwy2APe0bGJbZfN933qH2SsB4LH45aGKkMzrkKa3h8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fptjp77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso788452a91.1
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295554; x=1778900354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7PQ7mMFj09RBEC6R19QFDNhjCRnQR0cfi6POVI/210=;
        b=W3GTTGYF2FnUcTjnDudestn5CQrAstJYv6GUK9Du2/xmZAiUtYsY7nsdDCoPb+UIzJ
         PAMt1QiRxUftPgaHA91Y/Qako6MrB1X0aYbzDB5g25UCvQgNqO/o7W8DTwfmSSjMnneG
         pa+lnyYaKtCt5G4n4g1qSa0DlRHckb9SAgG/J9kV4G+QCeUugvbO8R2Z3AVHNxK/k1IQ
         cjr2BagWtKMMzw5ftH4Yo6gUiK04e3S6tueKzLV12luj7WtfZb9e3OuzLw5JXhuu5uee
         bu7RpuA+I/sjo48P8zQxVsOS6LidLT+MjEZ3iyFY0U/jpX1S+KD8DWSAupOZhiBNLGee
         OZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295554; x=1778900354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7PQ7mMFj09RBEC6R19QFDNhjCRnQR0cfi6POVI/210=;
        b=ptgRaY+21G9OEvgA8pgT0bUrrf/6+t1fVOBNw8rqcsBrWqBcviArOSA7UrN1b5zTdD
         ygwQ/i9ZgaCqSpTNMh26sgPHnLMHj0btCR2fP19qGp4BhTS51QQQjAC4Up1ZZk9OY44R
         6CVu6WX8qgBJn7RSnQxpRzQjrHdRfxHfiRHpYGMuZZF6725wjLvvL/3a3w0yaP9Ma0Wo
         kOBHv3nD5rusMxyrkhrL3srw5C6SfzDcbRRfIhWQdsOToszaRFVrQeA2gzWiH39IwBLj
         LnprNsfUkZjv8OfBFqvnyKdexRrBMs/IvQ6c0a5H/a93GQfilfSb631JpeGdkaYlUeWm
         Q9WQ==
X-Gm-Message-State: AOJu0YwqWrScLLLCKH8Suo+nqV9JqEMCMeNA9ShfX/pI5MNwZmnbAJSe
	FW8+rAKgsGkQv6XBLJdwazriZc38ivNpg4FRMoSJA+GQW1IR93NIdv7DmeaP0Sgcz80MRxHHFzt
	AzIVYm7Pz0v5WSlWWCMadIWKbVKWCj0s7m2JGhIVzB3RiAq0Za5SVe1ixUfDt3QlJ
X-Gm-Gg: Acq92OGPh6XxTh3ZtPVw1TP0WApEb55u+pMPnGnDn75AaNsp18JrDopP7xGZ2oFCpT2
	O4zEE6tMtW73RX4QbWD1kLmR2M5BcW2S8HQ1FsAkLEHMvWbexpxt9AKV8sgOUpF+ZDPjMwA3GHT
	cRtgql8Dz/rAiq2m8aPA04J7dbfPrKk1hvTlDxJim7lyDPhw8fmIsnBTwL/wznDMQ8/u26/+wpo
	jSnSaMHrEM/H/Y7Cj/LMi//nDMyfc8Kt3VYAY4pPn8gdd9D4pGK9/Ydq7JVG0jInQwiYS90+1ed
	Vpc/d+i5f0RpfvNbdL7n47J9lDEBdogjx1+Uk7eN+ISFZBO+hn/xnWJw0K2b93YcT13XAwb99d9
	/tcg3vu3iY/XDrjhiKS2m77CsHOD11SqsaTFGo/TFTG06NYSB2pLAtpECizkYvPa1XDy6qJffT0
	rnD0hc
X-Received: by 2002:a17:90b:2691:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-365ac46dc62mr16763809a91.21.1778295553636;
        Fri, 08 May 2026 19:59:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2691:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-365ac46dc62mr16763787a91.21.1778295553087;
        Fri, 08 May 2026 19:59:13 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:12 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/5] wifi: ath12k: fix TLV32 length mask
Date: Sat,  9 May 2026 10:58:15 +0800
Message-Id: <20260509025819.1641630-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aoZLPv56fSTPFHzpG0TGXhVg4qID8u2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfX4LqtwhxELisd
 g530qFMKUW2ATXmbJoDQSPMUoFvf/GrMTTglgnd+4nGqaa1/qTClILtkWxUC2T91dfbtVbdm5AH
 I8p2yD/T42CWbFdCKd69dFuiaa+S/GzkbFzhEPbRFqVsW4SnIAcfN7r1qmJ3Q1t0DOHX/5gk75b
 8qO663S/9Dqsf6U/x4UOb0rFTXYzO+uIeoBwgJwBvXWzqbK6tWt8Ob0odQ2gs1p+eVuLTgUjuau
 fcLE35QuF8Ee19EFxTTFRJJAL9lPIYpfZpAN3dBPgL06NsfA7F3/pS/58CgxQJU5CuxHqTkfSwj
 3PIELGHLc5ikWv45MHls7B8B8hhdmkuL5l3no0lyCe2wNRa3r7L8vChmR3Q/LxJ9XgkXRfk5t1r
 SjgmyLTphmPCCXeGaj9slD5v1laHDiye47+w/UVJX0aDPg0C/s6AiVxNf5HMxWKR6JcTjtc8m7K
 0+4scPyWiF+6iUyrcUg==
X-Proofpoint-GUID: aoZLPv56fSTPFHzpG0TGXhVg4qID8u2r
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fea302 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oTESD8Iu_DoklxnQOhcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195915_821658_3E2E1FC3 
X-CRM114-Status: GOOD (  12.35  )
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

HAL_TLV_HDR_LEN was using the wrong bitmask; fix it to cover
bits [21:10]. Also drop HAL_SRNG_TLV_HDR_{TAG,LEN} and use the
generic TLV header bit definitions for TLV32/TLV64 encode/decode
to avoid redundant macros.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 8 ++++----
 drivers/net/wireless/ath/ath12k/hal.h | 5 +----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index a164563fff28..f03817b2fbc5 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -828,8 +828,8 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len)
 {
 	struct hal_tlv_64_hdr *tlv64 = tlv;
 
-	tlv64->tl = le64_encode_bits(tag, HAL_TLV_HDR_TAG) |
-		    le64_encode_bits(len, HAL_TLV_HDR_LEN);
+	tlv64->tl = le64_encode_bits(tag, HAL_TLV_64_HDR_TAG) |
+		    le64_encode_bits(len, HAL_TLV_64_HDR_LEN);
 
 	return tlv64->value;
 }
@@ -851,7 +851,7 @@ u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc)
 	struct hal_tlv_64_hdr *tlv64 = tlv;
 	u16 tag;
 
-	tag = le64_get_bits(tlv64->tl, HAL_SRNG_TLV_HDR_TAG);
+	tag = le64_get_bits(tlv64->tl, HAL_TLV_64_HDR_TAG);
 	*desc = tlv64->value;
 
 	return tag;
@@ -863,7 +863,7 @@ u16 ath12k_hal_decode_tlv32_hdr(void *tlv, void **desc)
 	struct hal_tlv_hdr *tlv32 = tlv;
 	u16 tag;
 
-	tag = le32_get_bits(tlv32->tl, HAL_SRNG_TLV_HDR_TAG);
+	tag = le32_get_bits(tlv32->tl, HAL_TLV_HDR_TAG);
 	*desc = tlv32->value;
 
 	return tag;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index bf4f7dbae866..b3a89ace5a97 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1442,7 +1442,7 @@ struct hal_ops {
 };
 
 #define HAL_TLV_HDR_TAG		GENMASK(9, 1)
-#define HAL_TLV_HDR_LEN		GENMASK(25, 10)
+#define HAL_TLV_HDR_LEN		GENMASK(21, 10)
 #define HAL_TLV_USR_ID		GENMASK(31, 26)
 
 #define HAL_TLV_ALIGN	4
@@ -1462,9 +1462,6 @@ struct hal_tlv_64_hdr {
 	u8 value[];
 } __packed;
 
-#define HAL_SRNG_TLV_HDR_TAG		GENMASK(9, 1)
-#define HAL_SRNG_TLV_HDR_LEN		GENMASK(25, 10)
-
 dma_addr_t ath12k_hal_srng_get_tp_addr(struct ath12k_base *ab,
 				       struct hal_srng *srng);
 dma_addr_t ath12k_hal_srng_get_hp_addr(struct ath12k_base *ab,
-- 
2.34.1


