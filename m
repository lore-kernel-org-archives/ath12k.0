Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BD0C55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=H91tsB0EJaLhggEgEflDcSaEfG
	N516Rfjrd1icpvbOYvcIC6llZ3/aGqLEY40/AHP0sqW21iBG0KND6CVMzIie0tGck89IkWOtjQUD4
	ufoDKA4oejKrSudjRpccu+cI86rqR3/FpVCdKxnkPEFp/aPzbFPGBlivYyT5lhbDf00CCKAwe44ff
	Xl744BmVw81rZb7gu1M68lKfZJ5AxVfMYmyJ2v7Ti3lkdnoQoFd1hM7CnQxzAYcACbuCDAHsj5iWT
	j849fzypoF1p7SRiirt+pj72FVHHoFEcfTvlHcrfGC4jWImAfrctygGc/ct+JncFPPPh3nltmF6eU
	cjTPP1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0U-00000005VA9-3bLz;
	Thu, 06 Aug 2026 10:07:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0S-00000005V9G-11rp
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nht51309003
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YwGMP9ynsxK
	lI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=P/OJqEJRFIm9QMNzVviDe5tjBPn
	EpPO104l8k30KRclWdOqVy397bmsDUQ36qsV6K/rfuaKrE3KvBlOkt+ih26PDN6/
	4H6BV0q9I2L6bTcaIIOKTLnbnkl5Sl2kOS2wfcbEf6Fxeoy9a4HY8yxOzDv/EvDX
	aQ5nUL5Q5800PXv5OSu/R5Kkl0IBDkEgNOSTGDuWMr4J9kBAFWo1cSnJUX/AaXtC
	c1qZ5jQ8TaS6VEgq6ONAHBT9ANkk0963lMFbvqi8HG/XygD9+mR2+vhmLbrnsmM2
	NxSxSqXaWzL5pbU2p3Y7QpjcEopRl6lUcNPrK2mC62eSmFv8i+U2tA69r/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728jx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso34735545ad.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010838; x=1786615638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=Q8KbN++lpXm3fSmfEUt7KLRRXpMDWywni1ZMqax6Ws3d4kcuFvQKEYr+BvNsZZIvoP
         WpMZLTTOgOSdDQbRmA9PDFV90qnT4Kj+qQvBvT6JeEDpXSkD9RkAgfXEif9DFx+HrHbf
         8FZe3SGyE3vidWzoWA3FXLuCDe751eJM7kUK/aJHpVWoO0XJuCBPM/amZZjI/r/Al8EA
         HNqYCpKsaVEyf1K3AH0T3bzAZvbf0HujFXeobULbEf5hHeUNbKr3aCv0TWt9Z8Yb52EJ
         uXrE2ZTEVTd6hyvMF1wWWZM3O9ZzoBlpHTbLDBY5AMjXgbyiXXGhVY6Jc7h2olRjyOLr
         /hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010838; x=1786615638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=ZSjo+nGvNZJPF9Yeors29htqhpOWBXp11ZLBJ56MGnuViSogYORQUIgA6QcbyANHQi
         wUq/PI2FtXKg6nY9xZHYCW3hxsk+Mrb4tIRcM2o4eOrTM0DhLwrFQ8sqwA/gnrjgchd1
         91ZGkDjeBJL6CP1CkMyUDGgCC9QYbbdObqaHMfL5VmlCFBtTNWTh0JvS8+gMF2vaQ12N
         BTjtBNXlZPy63Kg6ZiiUcZIbdFYF5KvSBG6xr5ICoAT/iyBuM7jZNBKit8Moeb/7oYz1
         QZiG6ZqgHlXE+3y0Ni5mtYblR2dZbIocxjbre01jzNhJO9/4vrAxJy6cSWu2Egz7Vzd9
         z/qQ==
X-Gm-Message-State: AOJu0YznYg4y1kEbxa4euqAeQVrTKBqKvPgXFxpmad8BzFDVijAAiur3
	K1ozZPaGrJmz8ZAlcwqF4o+SeIQyB6KwI2XImOcHHj2PXjigwwaLVDS8y9snC4XkJgdB2SkaFoB
	T2M+4+0ahB/bhMTnXyDAgjlfnDxfA44IL8dYQ0btAuuBCM2Z6u06Sq5Hh4hTfWe/M04y3Gzak
X-Gm-Gg: AR+sD10b3A04zGi6lNWhPRuYOIRkYfbaeDsv8rQXb7WWUFpz6jstIv76Nilqv26/1HF
	Ic62SM/CFED949pqgWr5w5im55oH7EBZMsDA98foh/XyRNnnfimAhawIGYFiJoy1ol7IT/bmRS1
	FtQPWkvs5w+XcjNsJ+jkcAIZzz/MYi3e8ELsRK3uSLCMZ2589h2Teuj96SebrjtektdVTEcInL8
	3Jl16RA9KWK7xMPflDmdTch8g+m5wo+/8uRBCYKoHWCGChLIjUlIkrvKfFDfyvcw0wzLLOHUI/F
	5yxTWsoPRGdU694MvckuSKDS41Lk5j6wFNx3a/7aGQhW2iEo/Ro11LB6i8PKXlE+xzWiGh647Cz
	hrDamJm995UtDVYR/YYIfBm/g5on3SKZ/11gM8zca4vIrQck2TglL
X-Received: by 2002:a17:903:32cc:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d0ca712e40mr147464305ad.3.1786010838122;
        Thu, 06 Aug 2026 03:07:18 -0700 (PDT)
X-Received: by 2002:a17:903:32cc:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d0ca712e40mr147463765ad.3.1786010837623;
        Thu, 06 Aug 2026 03:07:17 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:17 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Thu,  6 Aug 2026 15:36:55 +0530
Message-Id: <20260806100702.3479326-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cQOAwbIojXzpnlyb2tkM5sOuVlnEDmS1
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a745cd7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QbJcohpuGl3nbjs-xDYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXxwY0HLD07OCQ
 UuQ4ognQ8Pj/6s39XzBNPxXO8qHfL5H4d4dP1Oupq7O/gcI55iPAD6o4j9ZzNSZmKdrVdnxSJzV
 SPwwb9nytx+Ndvsxn5eWhA4MA9UKvXp2ZzztiaGn0DJ6aMJo0DGEniwdQf7eyw84NaFNA2CeGzU
 8E9M73PXCNOxrm8Rq48B6f52RQW2qVlhbmrVIvc5M5su3n/oyPZ794dBBG3VzwPwz2rr/eFLBcZ
 GCK3lWsk6wMjsNxP4A2glmE0GWlgMtt6c6hkaoPnyqsMxoKqg5BgdDKhEjAJBjCG5pN7472PAkJ
 oGQ0vYR07eHGO87CZ6zBVXtOCB7/pt0JxNof0E9uXNmumwT6cSnuIdJx32EAN954edy5JRISIWN
 xv5TkovmbaWuleFe0prSkLBBcSIR6+ypJ09pMqABdOYMiXX27WflKHvir6LXSwL6oicQZQh6s3X
 zYJAkGm5f8TN76WryfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXx9kRiDRpnC7l
 8TcAlKEqayF+MeUCeZu0nOh6Y9J0tzHUbjrBt/4f/sVEEYep9Gud5mzK7HVm9a7NoJvjVh7UIG6
 +e0Q+rj8qXKxkzrJP9kQxuI2srr8CnM=
X-Proofpoint-GUID: cQOAwbIojXzpnlyb2tkM5sOuVlnEDmS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030720_400340_0A32FA29 
X-CRM114-Status: GOOD (  11.70  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
each counter, consistent with the existing pattern used elsewhere in
the ath12k codebase.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..632230e77802 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -582,7 +582,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -984,11 +987,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: 691e5e43b2aa
--
2.34.1


