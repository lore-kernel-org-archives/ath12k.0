Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2418C87FCB
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=; b=lFy3wpdsFg7J0JgH33ixny5NU0
	I+qEQc9UEYBVGcLrCWMeMqx2kZ8nIdbXrkJlOzkIl+3GJWkuDzda5I0w5/zum0iLrSRxZm8kkbGJ3
	rx+c3uggDnRreKdYHSJq6sour1TE06XNtKzszECzEzqbVmrmElm6TQDLJYa2zk8DTasTxMXEUuIsb
	AQlUXgy7UjOkEBPFPGiwD+FH4TFfiUKnwEBUzWtivXDyMrscsZY4mGZq5GkVGusinM76288C+UA1O
	58cWCWryzreppb5b71oYXd7D0nmyDVMy49nx+oaCqHBJQRc6hqD2dh6w1aGXFUHuRI1FRHvI7fz/o
	ivWTLkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuty-0000000AU0v-33zB;
	Mon, 04 Aug 2025 13:06:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuWU-0000000AOaJ-08l4
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 12:42:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749i2ZQ023642
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=; b=c7exVIPzI2CFB4ls
	Ro2N6hcdmo5XpVL72/kGHGM1JKERmRO4KImd5QS1fA7jOvTTIQ2Brk0otr0TH4Rm
	SDNB2zfApdSXkumuBKqeN1whURkT/4lvJxaFmPX+u/kcfDxe5pkHEb1WP1vQlscG
	W/uO/ySu9aq6UwXZmdLMKik37WxNJqPJRh6qJ9O7+LzJl8d9ydl7O26qTx1+PbNw
	6jZDf/tvqQJkCFIcrHZjNJPv4U5UHz5Pm1XZ6wJ38OxGyW+g0rZLiXuF5g2IXkBM
	wAs8v9UKV9g+ZJdhuhz3qoPet/nEJwQxDUrSxGG3TDQwGum3MXwFZHCi41Z1KSDy
	tk8wSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m4wxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 12:42:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2420cfdafcaso34043155ad.0
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 05:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311356; x=1754916156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=;
        b=GLeeuwEf0x8spyC/jQcfM/28W15la+qIJQkQ9hMiG1z0sXaXdWuFwkgf+II0yoZdJH
         i/kA/6SaYCKqFbOSHm3hwMtKMdDowPjs5KLJFgPpCtrlLic6ysWC8r8ab0BnA80McaFJ
         QFmFi089UJPtnN1tnPiUpAuJA9kbBFCCOE+5YZIpZQUxr3s2wtJQtAyKBiCVfGdSfynx
         JvOnumFUzvcj8v5amCxJB3ZZb4dLUplO22SD6ZcpWMsJmWWrLiL6HTIKaYM9ftHt4TCr
         w2Hyv0HJeYuHbJ34MP2qZZvcntdal0JmlmUUUhlwkJgad+yJv2EOXdVqHG59gq3NNAC1
         1ZQA==
X-Forwarded-Encrypted: i=1; AJvYcCWfg4/mCs+STZ9bH9FhFwaPsaFS5GY0jzTvR1B/Gll7wbq9Nnf4wDllJvDsotKyjdDjz1yug8c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdxdZ6kYS7joGJelNmmqbnioA1bmTaSNbebHyMAyR1SRDs17JN
	WyRgk+I41xzzqmRsm4SYecu8keWIB5dfF9aMhXcnujoerc+MQZbyP0ASdegZfGWKKhESJXxdIsO
	jG1UmRaUwShHOiFvE6887n0LU6ZN6pyiqnqsCRbY2mANwRqNW2BD82bJdQy/rNXJB
X-Gm-Gg: ASbGnctlTSY3tgWavXDGtER/YGorWtuRePnUDht2fQPRIyHMckKuuKcbu/rINWWEpYb
	8azDnmJX8tneu7T5tXWaVPUV8rFsscQn+N+J0t1y3JeaGQ9VUX7IgaRjVwk5UGe6FAz3b5kOqjV
	aP7dxHxHtPPCttoXr5yoEJui4JDo75yCWXZJEAM0RR0vRgLg9xfWWaUxiOgZO903F7ay3pNym7Q
	Or0fgiPXbY5MFKBgJkdPikXstTnTgq95100JaZ79/9PxpwmTZuswBS83pQkaWjh59LByqmz/xBT
	zUgnbzZv9vtrqEIa+VT6XmEQTagDKoC2tzB7ZfP7Xd7tFSHzJgkkpK3TgjvNRkVJ7Qs=
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131957065ad.44.1754311355591;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwWJixm0otAsJ9qW2cKHM5TCYbaZzSEpD0epevLuvlVXQCQHHBcVIx7oFmDiJtStYDErVyGA==
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131956605ad.44.1754311355161;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:49 +0530
Subject: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=1741;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Zji6gWmkzbwh5PxX+NoZLoedb69oac3dHlD8eqjUIwc=;
 b=5CMkHAbsehPVIWOSELTxsgownCEReC5ZwglVfyzW/9eIgQs/XNLDj6ZF1qXsM5VdS+WuGlu9N
 zC2G+4/yH1sBnaZYv/g3O4obeXNlNDL75iSPYKBPO+lObmjTYAqQATn
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=6890aabc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4mQorhOTa8Yjjd-mLDMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: S44v4hj46OmKcuBD0M-8WsP_y0lKR8zM
X-Proofpoint-ORIG-GUID: S44v4hj46OmKcuBD0M-8WsP_y0lKR8zM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfXx2MG6ZMZM9gP
 NRj5DN3yKlYuJNRm9OiMdiARIJreTUUvroBQ8F0TEHstYUjop1ZQoAZ+KG4b+jYNdAY7czYJ6i8
 o2PysnCrjw4aYZ9CnsjPjA61ClBYdQTYkF2s6Etbqez3K5Q8418tTzo2+GHI0Xm33GnbCEJRm2E
 /4IIkzWaXhReUifEhNXCq5fwEUJzlCf9QO32JKDzqZ56TvWXt2ZDJ2upcZnLsM8hVLKK+lmedlp
 aJZUA8cuYFwGsAMI3J2DVrwZJkNS+pGTbXyx4DZupQ0mNCIZ1EtBzw8PmYwH4vrLZy0BhxQcrCS
 vBQ3u9eycvJFabCeNEmTV1hR0ZpB0Y6XFdYly2hY2WU8bm0ese0h5DIh2w8U5SCFSKeh9t0cAIc
 FuOI+8QbBXLM+RGVAfsF52WQMxc4+MiqxCfib7d6ydPxQWmdVJKmCiMWM18Nut5jstu9/J96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054238_192078_EEC5220F 
X-CRM114-Status: GOOD (  12.98  )
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

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 

-- 
2.50.1


