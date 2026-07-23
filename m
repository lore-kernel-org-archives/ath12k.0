Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7251C531D2
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4cMbFiKIB8ZkelKo41tKpaulI1Ihv9gr1+2sghJ0kw=; b=qTKcDXo9R8t2YgUwTMBdamxoFz
	AEOASc7zaY5dY3leedwWuWxMyEc6bPSfs046uuKAPrAr3YlcB3wuXJ0vrHUGP6ZfjAxtlOnmkwlVF
	3hGqjl2d4jfUBeihK5gZi9zu3ypdsyMQelhUv/PaTwbwz7eP+JpXHJ0wlrHaBP0W42I4/8pAyu8RN
	/fXTPvu2hc+zka2MH4B5hYNlyENpzExOQuVQtvJlHCpUP8pBQQ5XTXEiYj7KR+VBnMqP+sGkR1I5b
	9g1Eyr68wT4C9igjxcKpIS0u3JO/Veasfm9rWKdQWMDWEJncbIJlCCzdPFYUOBtcDfDj8Dkl9zR2G
	M0SDz3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxU-0000000EHlo-1vro;
	Thu, 23 Jul 2026 12:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxS-0000000EHk1-0hGF
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qe0w3648898
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r4cMbFiKIB8
	ZkelKo41tKpaulI1Ihv9gr1+2sghJ0kw=; b=BA2oeTSfhCjboG7MYMIBJV6bWig
	MujE5tCUIxmCJaKx61nwokH3QDwzYydBwY8DuwGaoDZx6BuvTCI4rtkDIvPuAc+d
	p1s1eTNOFJvOd1HQl+ZEPwhgNWpiSksBBiouV+h1VeBxDATEwo1xKQH15e3cSWJI
	RTJJB6I8Pn5hqhJyYT13C6FoRIcHg7vWhEkYBU/h9ovLQAABTU50QeTFVm43LNty
	iwaO3y4ElWnr2gCkruUAcQjqDyWbYHGtkUIUmXqxJcORkr+S6w/U8nQE1lFIMu9K
	gLSA1q7gaaaabSbcqBN6eX5ZKXH8tQS1ZHeoZTqe0xcFsL+n5TcCA06SUYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k3mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so16120845ad.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811325; x=1785416125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4cMbFiKIB8ZkelKo41tKpaulI1Ihv9gr1+2sghJ0kw=;
        b=BAyYVZDGfS4XT5mMmL35lUM2m4/GC6M70qEcSzHZJ992uN4eVDRYqMH868ig0njtQB
         C0OC8z0Vqt+CVlWuUTIxbjb/loAnGH/79Y9/XZJSqhGAmOutZgOcwMm4FFM9dPryVi6Q
         0kdzon7wCVRtYhwDEYK/R1UB6G+/gQK3SBufck9aZ8pnNoysQKmiUHq0YTTjMtMVhPKI
         aGAoXs3UaiVzy1N7KLs6QbxKYIZa2gPKZCsHgfOYXahqRc8aRX89/1+qPp0ttHZcgHEd
         COt716OyN2GPnEmGMyTVEZCcA7Vryc1xVhbuM1Axv+qRP4P+SnD6Q4+PhEO17SFbipFn
         PEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811325; x=1785416125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4cMbFiKIB8ZkelKo41tKpaulI1Ihv9gr1+2sghJ0kw=;
        b=BzBEJ2dVTqdSoIzgDt/FTgxevyQhx5Azxgg3i+gkLUUFgL3jVD48jQr8WX9q/0yXjR
         8Bz8z/8Dz1bmGAWrfU7BHlSfp3foOQZITjnOiNyJp3ZOjwUZcTAXC/oiKKfVhYkA6HpC
         UqovU2MrVmUBSZdSHIAnPRJawTZ2I8517OdgY2avyZpaFjSaNgRiN4u+fabhx/8oAztR
         IE8ew4bOiHNb63IkgWsaVC3YWjFtDVmuzt9UKZg/xPlHmWtIC9RLMyhYbhx15JTIMssc
         hAObiuFHue/44SLscsTfGgr40/CzR6uxOADX7DQdliBvPab6YA8aiJ7OXvQMaAJ7mxTY
         jbRg==
X-Gm-Message-State: AOJu0Yx9e3NLr39PXkil0EyJMm5xuvdPisQob488lyijaUpzAKweUfzn
	kBp+g78IpfkmwQvAR00Vv4wIt9UZNqgUqCdB3pxbaUGLCJFq6+dGTI8JnslWtJH7dH08O2t5IU2
	b/gp+QIYb3WBKlyOrsF1o+rXbq2sK1iSMJMo4qNNP110InaKglYA967eobhsut7Vz3LKdZqKO
X-Gm-Gg: AR+sD11vueV0oaLUzQa3t1AgztmTwhpsbJzsOiQI02lyt4AqGqRfpGvxkLUvHnbKKtc
	wFQdQ1MNB8rh1rmzVE0YH8ecwCdbEMPL0HjVC+flsD1F0+JD3AUQEfVUelrSH72DjNPEp2y/cON
	Rl3OdVUWTIFCF3YZAq+SkcCxLatMUgjXzz9Hof4QyVPoX35BzU4Oc2/zT75yvvD9iN9rzVlSfJp
	dFSzzUWY3gpmPHL/bPl2cyIRJs5PSbbI50fjKRsSXU+gZtjaIR/LgzUOfksajicNaB5Awty2IZF
	7rNf4F36T/JOhUCpR4c9NyPX+1OaKq0RXEyHqEvMUj+NzZNT8mdpsovR2QP0OgzxWF9+qY8b6WC
	wvl99WcqUGRf73Kx7s4rzW7ixL/6JxvZk/vsXYYakc6A7nIVLEpTP
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr36608985ad.34.1784811325042;
        Thu, 23 Jul 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr36608425ad.34.1784811324202;
        Thu, 23 Jul 2026 05:55:24 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:23 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 8/8] wifi: ath12k: add WBM SW desc fallback counter
Date: Thu, 23 Jul 2026 18:24:48 +0530
Message-Id: <20260723125448.922361-9-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UZUS7MXapd5PYL1AtDgxk7NeKRJ9QVRC
X-Proofpoint-ORIG-GUID: UZUS7MXapd5PYL1AtDgxk7NeKRJ9QVRC
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620f3d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7LnAo4KMM85IVg6JStIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXz11zCr5AkNTU
 yLnFq8KnOpWQc4jKIs0dzdNZS4Xj6LFGJnjeUAzsI2HuucvH+5vk40Qgy86VjSLw3OdfiTvdSfY
 7Jx74XumTdC9SfXz8kjxHnsAd80TfvE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXz07qY1M/PkHA
 y0/9Tk8Mek9HuNfz37Nrr6o/Gz7m2b5vQEb6onKp1x8TfpYXEL0xlBjWor9CGnogFLEOBYHJYfc
 BPd1y2NXvwEDF8jQ3BRTmv1ivBJ9KhW5v0iKSpoataUThP23zwMwZyYbdd4fufmiEA0IsLpcm6K
 nHHFwhHvdtKb2ic5aIuYBVB064Kn6PQU505a9H+uvknEyva+QKROxsiIA4JzTVmixX86aPSz7pr
 GdnLb1qZbQvmRDqHz3OxUpcxf7Nhhf3huWYep+aBAz9O2gL8k16VTplx3C3WQJTlXjDJ/xMfYmq
 M6IhPCYQ97kgziDH9u/zeOsaWI6NxPJaIPWurCVnFNbaNgdo33Q5mmIQigT2fw0QTWImIz/Cbit
 TEE+yB/3gq4KYQwXnHkl3LOy4XW8N+WvM7p01NoJ/dNIgFFcM/1Lr1EvSSbGtQrmKn9whlLdxeu
 yjxPH9VkF5EBoMLS6tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055526_216485_82800084 
X-CRM114-Status: GOOD (  16.25  )
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

From: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>

When HW CC is not done, the WBM RX error path falls back to
cookie-based descriptor retrieval via ath12k_dp_get_rx_desc(). This
fallback path is taken before knowing whether the retrieval will
succeed, so it is not a drop event and should not be counted in the
drop[] array.

Add a dedicated sw_desc_fallback counter in
ath12k_device_dp_rx_wbm_err_stats to track how often the HW CC
fallback path is taken, distinct from actual packet drops. Expose
the counter in the device_dp_stats debugfs file as a separate line.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 4 ++++
 drivers/net/wireless/ath/ath12k/dp.h          | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 4176c837a6ef..534e7d13e66b 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,10 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len,
+			 "\nWBM SW desc fallback (HW CC not done): %u\n",
+			 device_stats->wbm_err.sw_desc_fallback);
+
 	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 298b65142a0e..af176ee7d89f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -441,6 +441,7 @@ struct ath12k_device_dp_rx_wbm_err_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 drop[WBM_ERR_DROP_MAX];
+	u32 sw_desc_fallback;
 };
 
 struct ath12k_device_dp_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 33c4c89eefb5..9b6d04783c6b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1968,6 +1968,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 		/* retry manual desc retrieval if hw cc is not done */
 		if (!desc_info) {
+			dp->device_stats.wbm_err.sw_desc_fallback++;
 			desc_info = ath12k_dp_get_rx_desc(dp, err_info.cookie);
 			if (!desc_info) {
 				dp->device_stats.wbm_err.drop[WBM_ERR_GET_SW_DESC]++;
-- 
2.34.1


