Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3ADC54FD2
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRW5qOR78uymx55Gxa/cWKNfN13pJyrdbmSmzxnm0Lg=; b=wUeLcbwN3DzPNOgDwvPK/vM5M2
	P0NyJFiKkyHshtsEamqwRP0UdRXR8eMsv2l3kcc+8R/9Nceqdr4oNR+m3/OBCTbmej2PxdIvYP/IY
	QCmFJjDVkDb2s6qkTNKIyvBUIFHdBoH2Sko2XbuK959k6IiICWnRcV/i3jhyR5DN6+ZYQeCWb8W4O
	SExcNB3ASAU1Ngls207bcwmInrqI1RMz24zx3H2rLqJ4KUdyqAHRNEz2mCgtlo8+69uTWa/uHDesd
	+yWNlvbbK/eRkMGLSAHa3DFl8HLImg+SErhRNt417u/TPTFG8W9phqOJsebP9q44ILlTwckSFzr+H
	MBNtaifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5o-00000009aw5-34pc;
	Thu, 30 Jul 2026 06:18:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5l-00000009avH-37uT
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 06:18:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U60ovI4138909
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRW5qOR78uymx55Gxa/cWKNfN13pJyrdbmSmzxnm0Lg=; b=XnyyKKtYAJG2AvCz
	J+wQ2u4jDZGYzNlcrTkt2qR/Xsa5J+D34IQde6c8RYSkgXOqI8HJYYXWNR863vwD
	I8KKKoHtEtdrzGwHH8h/lMjRnK+NemiWtAagzPWjzvaC2XkCUXN351aMeWJQy4mh
	WAYhF3rEtKeW7r7HdsRe7sqwIop+WeWYH0EVMX+SlZ5h8w3OuUxuuDsNk3n6NEGG
	4VncgrZBWWoql2nCkEgBmvuoe95Aa+pb/sbqWT3SE339jPH8hNegBBZtorJb3+Q/
	DERKBP+XWFvR2goKO//d3w2TT8mUl127Ss5fFUPZsMrpPeVudui9PcOGovVe+DLp
	WcEpdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0yjg2ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1847832a91.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392283; x=1785997083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRW5qOR78uymx55Gxa/cWKNfN13pJyrdbmSmzxnm0Lg=;
        b=GCnwSo1F86hOjMkZREsnmsq9N9xyAvnmjaagBOTXX0iwHAQziXDVFvz6Tqc1HqgquF
         ksgQrfQne46cmqtF9rTBJx09rX4Zu85rxOAHxolgBcfVe2zqWu8pHLYrxHFsw5aRMqt2
         6H+nky0M0pGOV5JWYLti+SZeOI+NpxiCSYWl4apyPSP0MyW1E8N3i3Dc8+OWZr7L6bdt
         L+miytF5du1IhFOdREm5cv9eSI0Fyem+t1tfywdI3YhrmOm00P1Ry9Iq7WuOz1uN8w03
         exCN5ENqyZFsIaCvLrjDA40E7nZYaztdnQ7RiMZBLSom5dhYgf3OGnFTIbqp4zOFgiWH
         zaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392283; x=1785997083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRW5qOR78uymx55Gxa/cWKNfN13pJyrdbmSmzxnm0Lg=;
        b=IJEh6f7zT41BR2MeGaM/vK4VvS8q7zoApYaQH4NY5nvL9A8PTwR3bVurWw25GMOopr
         2V4hIlM8B1lMvP7D/byV0d7DAewWzkV4IcLe0XLRGaDXIVET2L8BFy733LP3T51l3/Fe
         ALI2KjegF6EX3sd1L7X3J6vgc9ybpZy3QNxD3ELZXwEfWbHdKoH/kTGCceFbPKI1g5st
         dkIxYjVBse7kGJudJW1wZKpOr9IuPQqLrGpPs5FeCZqM0tc/eVwiXkkW25tEDQRG0m01
         /6J/NnA4+71cpMvEa2qEKU12hxOFmIjBo8nnBb89dBWEnOJiXj9Rczr1gPeK5B7SAbeJ
         Fx7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp8iy5YFmFWSlkJwh8uKkr1PTlt2bRmIDqE2A3eIQmzrioHggYOYbnn5gF7Oo1D0pycWSe9zqs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6FY6K+ZuKrrRx/DU8PlJM/goY+xVU9u6F0G+idaJAhBvb9eyI
	ZnC7q8lsDS8b1TRDGwqmdv6tiUELMNSbKLuQkZTZH9JnmgWNpYCj3oo2ZOLTQVaqhQtufV0kegO
	KhPueMlmmcDa9oC6IPgUH0gdoNTF4HZ4j7fPw8y/FND6HRo+llnTednJlfZdk5gyB
X-Gm-Gg: AR+sD12SDUogXaG1Oer5wQgGl3wuwkcinc4XsKXy/qwEw3p5eugRsRqE3Yannghat2Q
	DvijLyR9xiIxnvc7BF3v2rKAo9NnvWvZIP32Tebif7mlflG0EAvX+SRtVeLEnFGIrBhX7e4XMVd
	ChW7oByEeVUBFYN8KBnPvWuCH86wgwzl28c9e6MCZQQZb4FWWb7ojDYVnng8LMAqXcMf9ZHCutN
	gVdUhZL7F25+dORFfmr7Bxer24nhbvuGGYYUhm5SoTjF/72JIc+ibVh+J3bxKEMVB8rphs1aWC4
	54Hwx+Uw1HdKdtndTT9qfsdK2Cw++xJtrx7wZi1OOy4st6k5gowvmKVRUzuFwZDZ68I+JNu6BCu
	ZcM0h/MBpgmZvEnNhhTo353ljhkUWXUHOUo2nnMJp3z2LAUg62/uSeA==
X-Received: by 2002:a17:90b:278d:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38f9c0329bemr1179879a91.33.1785392283079;
        Wed, 29 Jul 2026 23:18:03 -0700 (PDT)
X-Received: by 2002:a17:90b:278d:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38f9c0329bemr1179839a91.33.1785392282571;
        Wed, 29 Jul 2026 23:18:02 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b928f09sm457254a91.2.2026.07.29.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:18:02 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:17:40 +0800
Subject: [PATCH ath-next 1/3] wifi: ath12k: use per-device max QMI chunk
 size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ath12k-align-qmi-memory-v1-1-0fef98dda614@oss.qualcomm.com>
References: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
In-Reply-To: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: U-tHGiMnuJ4xinTxLTwaHfvXFXLhBpMx
X-Authority-Analysis: v=2.4 cv=QrRuG1yd c=1 sm=1 tr=0 ts=6a6aec9c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FELcvhUeWYCIvslz9-4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX168r9Jo0emNU
 u4AXEqKVa6D6ozRYYa+ocjsK64ZMHv4uJzI6NYGb1X9HghPMXemILdtS502fWbwZdEsj8QuGRyw
 mTlkzpfnWMyU6Ss4EV3sLp08caWYUPY=
X-Proofpoint-GUID: U-tHGiMnuJ4xinTxLTwaHfvXFXLhBpMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX3AX2lYkpvk3n
 I1D9nEuCR3cDskb8dRIJwsrDGg/NrymVi7yDKUmP40MlRlUqwaSjUHpLUKTjn/vlb5pI5GHkMJm
 7Z+OURfJ3tLJmLtr9uOq44hYIxTdZcEOdNTMVIQer76b3sbdp3RbJBkGDt7hbuvPatgKAvuSCKd
 8g7t1aTaNiLjr7jOh4qy0nanEGDkHORVk1sDT6pibatuRoaiYqX7dKq4pxyeWNJBwqbeE1sbW1t
 oJ7IIVHaob/5GcjRHZ+/LiIKC80B+WJcniCjrEWRigF46tSghGhP6rDV5oLK+jUZ8HekiFHucZJ
 YiLbxzy1XFIRTJJVOCQpYU7tT1UZ9MF2rZ/RZaE2j5WCfYhL8czSRbK9T+m0t+65PFxeMguvAf8
 qMwibT1YCwTJyj7cBcHGxxhjkmFtorrpVCjumy4nOSjsJRBy/Ma52+x/rRzIU94IzFbCIFDXW3t
 P5TRTTeSUjW9Pgj4tSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231805_907438_30444BE5 
X-CRM114-Status: GOOD (  19.00  )
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

When a target memory chunk fails to allocate, ath12k_qmi_alloc_chunk()
compares the requested chunk size against ATH12K_QMI_MAX_CHUNK_SIZE to
decide whether to ask the firmware to retry with smaller chunks
(-EAGAIN) or to give up (-ENOMEM). This threshold is the boundary that
tells a first (big) request apart from a retry (small) request, so it
has to match the size the firmware actually falls back to on retry.

That fallback size is not the same across all firmware, though. On
WCN7850 and QCC2072 the firmware splits the request into 512 KB chunks
on retry, whereas on QCN9274, IPQ5332 and IPQ5424 the firmware retries
with larger 2 MB segments instead of 512 KB. A single hardcoded 2 MB
threshold is therefore wrong for the former, and a hardcoded 512 KB
threshold would be wrong for the latter.

Replace the hardcoded ATH12K_QMI_MAX_CHUNK_SIZE with a per-device
qmi_max_chunk_size parameter: SZ_512K for WCN7850 and QCC2072, SZ_2M for
QCN9274, IPQ5332 and IPQ5424. No functional change for the latter (the
value stays 2 MB); the former now use the correct 512 KB boundary.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 1 +
 drivers/net/wireless/ath/ath12k/qmi.c      | 3 +--
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index bb1c104e1a65..78a13b169e99 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -167,6 +167,7 @@ struct ath12k_hw_params {
 	u8 max_radios;
 	bool single_pdev_only:1;
 	u32 qmi_service_ins_id;
+	u32 qmi_max_chunk_size;
 	bool internal_sleep_clock:1;
 
 	const struct ath12k_hw_ops *hw_ops;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index bb61c78e5c29..f96d847ac92f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -18,7 +18,6 @@
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
 #define PLATFORM_CAP_PCIE_GLOBAL_RESET	0x08
-#define ATH12K_QMI_MAX_CHUNK_SIZE	2097152
 
 static const struct qmi_elem_info wlfw_host_mlo_chip_info_s_v01_ei[] = {
 	{
@@ -2655,7 +2654,7 @@ static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 					   &chunk->paddr,
 					   GFP_KERNEL | __GFP_NOWARN);
 	if (!chunk->v.addr) {
-		if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
+		if (chunk->size > ab->hw_params->qmi_max_chunk_size) {
 			ab->qmi.target_mem_delayed = true;
 			ath12k_warn(ab,
 				    "qmi dma allocation failed (%u B type %u), will try later with small size\n",
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 296180fbdc21..23a855018bc4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
+#include <linux/sizes.h>
 
 #include "../debug.h"
 #include "../core.h"
@@ -369,6 +370,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 1,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
+		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
@@ -461,6 +463,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 1,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
+		.qmi_max_chunk_size = SZ_512K,
 		.internal_sleep_clock = true,
 
 		.hw_ops = &wcn7850_ops,
@@ -553,6 +556,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 2,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
+		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
@@ -643,6 +647,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 1,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
+		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
@@ -728,6 +733,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 1,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
+		.qmi_max_chunk_size = SZ_512K,
 		.internal_sleep_clock = true,
 
 		.hw_ops = &qcc2072_ops,
@@ -821,6 +827,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.max_radios = 1,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
+		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,

-- 
2.25.1


