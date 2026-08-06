Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E0CC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=; b=kUeIrt12eqS9CamSa9K3V55i8h
	3bLAg3Y3wJ/dzstJGfqhOjDH1ha1QyjRn5/o5L1YMgECZ5QoR5RomBzwfLp3xtFVlI8bIcHvYQVjs
	A/Zr3pFNENRZw6ELpvDWcbFKgaKiJpkUtIIH9+U6hup3raITkkkiZttnel7+yRfLM2qSePYUuUYvY
	7GHwa+FoFG6nSXthtRuVLowA+6zyJuYchvNFAWirS8XMkRwHceMeem/qJkdLdJRiY6cKDiFRjSvlM
	zZFLD72rVrZMLcbT+tUk3V6Md1aqq3O3dvaxLnxJeBG5OGRZ5EurdCdwWOId26PpxHEMBTdv3r3tV
	8F4rtznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry63-00000005t5G-0MlO;
	Thu, 06 Aug 2026 13:25:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5v-00000005szS-3ehC
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:25:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndSJ1227614
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f+ExpY11XrG
	NkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=; b=Z5MxNv7c0Wku1IAN7MwObvR2Grc
	bxj2nS3kLY6fp3Qyha4xAHb24QPJO/duCk265kYRDB5+n49/Vpg8r/Fi82Qaqu/H
	UIQarglhmFGo1AXKYSvDrwAPclKubxfUkP+ZIhpEDf+s+hjv9mB/G6TWKLe8NZaa
	COOYRarAT4R5iz60wfCQ6Msy2UoctVHUnRY3dxvlanZV06GFt6p4bLxsNqHZc0qP
	rFbCLxJitMBGZQrCvo33lLtX5vBxzytARsx5PKqgY3caL/m0ItSY8f6LU18Q5Xt+
	GyR7/M20sDnnxKRDFzKzwkVQABjkeAqexVNF0YOMV25WPJPXRoCnm6xtO6Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqduh5uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:25:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1829262a12.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022711; x=1786627511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=;
        b=WUStksYr1Z9e52/RKZ/mz7Fo+5zDUhb8PcJ7gG8tepiSwQZfjaxOFdQJyv1+ONkKN0
         JcQu3mXl5AUrWEWy7PrtkJvlRdEK2bSFmsHLTG1IsWiKM5B6+kPkWE7qRMiL3S9a/twV
         gQrWcSQsO2EA0ZSUZelcGy9bjAFFc5apooDvbLLEGavifys7m5/ZGuccpJCPAj80LEPT
         ay1Bchf3rz1MJg1t+etYD9v1p8Y1AjJB57pGCLWGaO89ezyZSxfpPvx6GTpsfu2fFDXD
         mxG6IyjH4gT7Q44qx4N8enviDP92ew596eZ9oLdYa+FQ42YGcveaAdK2gF8lHkTEALWa
         42wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022711; x=1786627511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=;
        b=WFGatte1OiVQYYyw4Qy3b0/e2bsRMptfD5Bnnig2n1n1LKi4UHAU8biv4uPFIOk+pv
         MjmnOke59b0tpru7pRjdUNR50SydIRHsly8SPuYI5LJC5oKcXtVQLKrKRtOWo0kfgCyN
         h/8fX4To49JQDFTo653qc8zbqwYqls7MF5EHEGYA6OjjJAxkUZRpnxS6jlEKQQIU7SDb
         VqWuspPFsbbu2U2+aI8cmL2j0SwxCu6v0oJEuK9HeHeCeN36qLb5/DS1YZ10bHBNqwp3
         zqephP5oeVUy/t5OQ2XFZWZB6jenseJcXLJbP/Jh4YdQmW5GX/xpAv0al9FuCk7O0cdV
         Xa+g==
X-Gm-Message-State: AOJu0YzsFM1dh0W9GrKm7LeYGz6p3vXzQfu/GPbnOM3FT7WoyMyzTYIb
	9BZ0vaF4NHcuoQNyEEGNppj59NIveVVmV29nVlYaKtg68Z5e/2O+KaQokPFxy2Vl2NeUt8YZ+wi
	aEl3m/5MCKwq21YNLixszD7kl1OoPK7mb+G/tWU/DVKnHD4QHkUDWJmAhrv33z/THNCqeUk8l
X-Gm-Gg: AR+sD10/jA8aX4xtSibnzm5zqmv04ZJXCmnwvNzkPjtwelvDOX9EYvi0a/GoEML9Dsi
	Xak4ei5MijbwRl5eBCJ7G9+uSTj/XdVxLcREbg/WhiVRW3kzdYuE6RAyyKe5t6H8OUYxy1bEtUa
	+egfXWZp/JXVdRsdl73N/zxH/ixjHH9PeQRRtsLXor96RdwvfPss2aY12v+skctjtMSRAjrLrVe
	mdnAhTOBKmIefr7HwQMHbCb4G2AE8cn5j1N6oXBwI/Xthz9Ubz9V3BZkhEmjRnWZG9cm6FQyQ7v
	K6fPWw/4l+Mzi2IEA2nn/h4ujZBFS/EpTScL26MYgmvaa7zun978OPCq6oz48ZF9wpDiDF8WOFc
	GBW3Pz/gcJjguHB0/j6cY9fywnEd6YFSVjgZJS6cfKTf844uJNlJs
X-Received: by 2002:a05:6a00:2410:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-84f2e075d64mr15835001b3a.26.1786022710669;
        Thu, 06 Aug 2026 06:25:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2410:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-84f2e075d64mr15834947b3a.26.1786022710138;
        Thu, 06 Aug 2026 06:25:10 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:25:09 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 8/8] wifi: ath12k: add WBM SW desc fallback counter
Date: Thu,  6 Aug 2026 18:54:27 +0530
Message-Id: <20260806132427.3704828-9-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rkn3ryJTwguOmBmQU46oRh9s7k6rKj4h
X-Proofpoint-ORIG-GUID: Rkn3ryJTwguOmBmQU46oRh9s7k6rKj4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX53Vl7fok9ylt
 qbpxGtLI6oBfqaCBSm54ToqLwRBDih1hw2KcKwqdw6OlimfzXnr10470oJgmCFPM/qPQuWWuBas
 vxLiEMFWh0KeDnEpNHuLxeamu7Ts97QCmmt2W0dEMRzbAiyy2lVMAP48nfK41HJEenRo/G/HxJP
 YQxMSRvCIApt6CHjMzjA3T50a2MUMYmPea38zuoCTjrsGc68nuxwZaC24EXyIc7if2beko9aMUG
 tSLna0HdHlUxoUIMKcmNXPwfFAFkLWMoKy5Qx0QuHumVGZ65r0bVgKYjs3UrskIIxnAfu1y68RL
 yPAwc6mQ+YW4ZDV4eC0YliOpjtFVfwV9bEQBT9Ei8gz1ztCY/nHZVNqMkj60lEb9P7Tyx4OdJfl
 OteRmNqfDM6nj1+gJs9b9Rjju8mq2itGKrzj58a2EqLiY07k4hJuMMT5iVIg05cFN8hN2fVlMM6
 Oh5z175YCffTzCCEWLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX1+xpLMd/pTos
 tNHXS+0SDMkEd6VWJmE9I7dkk356fL74GiCE69Y5wPuCQEDzZDUqGnVzJnCfEf4jpaQ2FWfJmia
 garPExEyF4UzGVttX/s03if1M2cDhL0=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a748b37 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7LnAo4KMM85IVg6JStIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062511_919765_8ECEA50D 
X-CRM114-Status: GOOD (  15.70  )
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
index d4ea21aac21e..ed7045a2a380 100644
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
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
 		len += scnprintf(buf + len, size - len, "ring%d:", i);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5cfe2096c633..289aede6dabb 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -442,6 +442,7 @@ struct ath12k_device_dp_rx_wbm_err_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 drop[WBM_ERR_DROP_MAX];
+	u32 sw_desc_fallback;
 };
 
 struct ath12k_device_dp_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 60489cfd4e54..d96d8301565c 100644
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


