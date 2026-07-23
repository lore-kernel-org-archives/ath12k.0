Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C61C531CF
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ9rslL3ElcR7tyBivla530viAQc3QhBebjgDeKhgjI=; b=XpGn0xBkr6hKzWv67Mn0HqX2kq
	dy1phFkh7ZHnMXcAr011jIRqs8n0l2qHUSph1zxYVrVUFZlaKGRHmY8MBnaez4WvWaw4AcwEodm0d
	oyDfG7hgM9R0S3l4vDF4JI2//z9jHeo0xQrMSt6xLReQRqU999Ur5RKKbANKurqToUkagejT0dbpg
	ZWbfdrxXDy+QleuBxdbNievrumMJSmWF2Y0HhwYYx5b8pOuETbocGeVTYoNnNfyQWvmUNiNX7Z1Zx
	m+1CuPSSPSi43PCNEq1XkO9i6s5fEgyqIr7zfKEhpsT9OCs0aJIzYex4jkLr4bFjEKw0A5+99ROyD
	4ii0/Njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxU-0000000EHlX-0tuk;
	Thu, 23 Jul 2026 12:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxP-0000000EHiJ-04tq
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWFc3044716
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vZ9rslL3Elc
	R7tyBivla530viAQc3QhBebjgDeKhgjI=; b=PFzmGpidn7WAb/f0l7NBwl0XC9u
	Szu1qAUzg6fvEFAwQD9eMOxcOT7LFWUZoJQXAmUx80sJ7CdeZhfR78mEbdFOPkkm
	OJj9O+p8M77OBPj7gVI3nU0UcnPpnoMQhfvLgdGNpb6RwTmdwycackvHHkeQLLMl
	tXkz3JbBF4KZNAbsUXGIUasGtLuVsfwZ5Ir9XuBhM0g9rV+2OkieC05SeQyMaBCj
	xfJTm5tz5xeyi7EIO5ds97+YIMOXqFCVHWElztMTKnx59PeYIXPNd7AWQ6U34KsM
	TB0KZYCx+l6cTN/FbmQrcJ9u7xPlw84+iUQGpEPI905sIsUYSYiZyeJcd/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq9714-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so4555795ad.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811322; x=1785416122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZ9rslL3ElcR7tyBivla530viAQc3QhBebjgDeKhgjI=;
        b=aY+RIn2005NAfSXw67jKQOaaylHDTLzGRlujWTYH9Zifdia+jmw7VLiwq0Io/ctwNT
         9sxCBl60ajaQDM51DguBRqRM2CU2Gck53m0Zpb1Q3GLz9iWy2uqTcrOnBPzqZenzardZ
         ZptP9BlpiMCyBtOudcbz6ACKjgjrKtZHeZTSypu8i4fH74NwnCata/I06XO7DShzmx8o
         wbXqFtHYglXugHArrDdXiHUccVodyCpZ3i7WJQIQTI6AAQ6Kx/JDyhNyWv2UWANfqD+x
         jrwJOa37lX9+qr1VSUgcgGtT7Y0N1mfW0yLSO/3nJ0K5JNno/Z00rRazZkAOJ+D6T1yL
         KZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811322; x=1785416122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZ9rslL3ElcR7tyBivla530viAQc3QhBebjgDeKhgjI=;
        b=YbXl9VAWVFT1nU9//MKSbsExE8JCbgpf9YEn18ipqftQ1iJQYc7uLy3aZ7AZePGuTo
         gzWXHQaR0LtlugZNL+BEwMfJbt0g2hCoLgyoR4tO72qI3h5v8eR+fT8Frw1pagNnWDHR
         4SAB452iMRAWwdlKvjCD2F6pzmIFAKdmC7p4/7mm1gJ/cfSmga42+4w44WqgxcXYr+ub
         g40d8rZR+F9J2ETn/wYNa/LedZa7QsLvr2p65FYYWOv2rSLY1GeMmvpb3CFZf+y73kpo
         TFEHeF+WRc5Jgdllb0p7j96cb0PwhXJnhxLkwj9tNR2cG39fkVy42XKQBnS2UZyABjl8
         agiQ==
X-Gm-Message-State: AOJu0YyUtCyArxEx8tYB/mrHchBlzFc23ZfmBzT3JlNJGmhUL8pQP9XE
	sqDGvxqN+OFR7Jem4/Qjj8nT+gBt5xvMDdYi53mN8JxWAUgieUrGsKaskYu6LSoWrdL2Gtyahf4
	yS553L6UQaxf4gQS2N3aXG6Pd0m2L9TEGf+6JuTJ7vnwAY4R8lbmppvuDKHLhLP0vVmZSXHpo
X-Gm-Gg: AR+sD11P94mYjeSCG7Qppuem87/ojtJvzZuszk8zX0epreVxEbFOjtFGulcD+U/+vJI
	zxN+5LRse1c9e1iphNT+hfRUiUK/C36pydnAldRlOipguzQmfB5qfgaxvcjAmabYw3mpcLanh+T
	Tb13+OHuKUOlE5R4tdPJEC7B2q6plMFs5IIGprrF+EZAtAzCLUK+146Ab1aan7EoxuAFcu3oIRb
	/kD0TDBwBPkF258ej+JL1TvSdVcpSqgSTlKgzjdWhtdWJbcChh0vzM13SzBHg26YzNcRnyPa5Ix
	M8IOFqccZ3J8MoYjeeah/1PcTDE/K6RB+FfKrvYR7uB+xZSe1Y7vRMoHZOnn8FfiFfRFmwYAt6q
	TjtAeiXTmdLX1Pf+Z/tkXkVNZsYH6YueE0rMYsrXcxFrtrJkSdLDO
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr30978775ad.30.1784811321879;
        Thu, 23 Jul 2026 05:55:21 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr30978475ad.30.1784811321413;
        Thu, 23 Jul 2026 05:55:21 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:21 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 7/8] wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
Date: Thu, 23 Jul 2026 18:24:47 +0530
Message-Id: <20260723125448.922361-8-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXz3nrOeET2999
 WlViaKBoURcnvXhQnyFgmGcLwFItV4I2rKFYLqQ6VFoxOR900QI7wUUGtLccwi9bYQxjRQbOu34
 90QEc9fdhHFO1H4prPwLcJJJD6a9rck=
X-Proofpoint-ORIG-GUID: iXX5224lK-Cj7ydgrLYpBVFgWOUT9Iu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX4ImlR6rih2gv
 xepwbiSOIQqrp9eLSomkwVOTtOJxOal28k91uV4SGaYrUX1rG3BAqbt8dmq3XNkMS+U1hx4rfj9
 U1wXgTiZP2y+hOSz3MFNVb4Qx6t48OiOv7TWyGDgtf2O79RPGjaY/RYU6NemLgfequ/oVwBu0Qs
 m7yBzeVNyeHKoiXQ7+uZX1/QQ4Agei4AHq+S+yZJxzeSRm9vETH3tL0E739kzphyiTX0cTMW37l
 OKvT+X42n7WCXbzWbhCZP68f9HcXp6v3sJ+x9bi3MOopqY2awjn0p2Z/vMAlgZAA2YZKDNq0fVK
 TAyLsxagyegKzWDL7U3wmuxsu35G+Z2byXzHETIqfZ+FE6es8WkXKX7ixoFLbf+YBZeeXSI3Wtk
 HsEo3gp2KpMuDvH3BNN0P43amGH9ey6RFToUhyifZbjOJmKPcaGwyJAeTXF7r+KrFIgZ6Jz8GGO
 dREjIixMvnfKBs/T6Vw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a620f3a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qz0A3ntWxt9h8-tH59wA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iXX5224lK-Cj7ydgrLYpBVFgWOUT9Iu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055523_117798_360FBE31 
X-CRM114-Status: GOOD (  14.22  )
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

The REO Rx Received section in device_dp_stats debugfs uses a 1-based
ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
and lowercase "ring%d:" to match the style used by all other ring counters
in the same function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: 84873d542e95 ("wifi: ath12k: print device dp stats in debugfs")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 9a8d07bfb848..4176c837a6ef 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1210,7 +1210,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
-		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
+		len += scnprintf(buf + len, size - len, "ring%d:", i);
 
 		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len, size - len,
-- 
2.34.1


