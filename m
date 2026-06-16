Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD172CD98D2
	for <ath12k@archiver.kernel.org>; Tue, 16 Jun 2026 04:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fiRe7kfcXarbpaCK1YAHjPNf+dPFJ1apozadLg+YPHU=; b=gbKzqfH0K9v1+d7M5SxRGMr2Ek
	GxBln2jLGjwq3GHoNqVZKDuS1bKqzVhtd2NpuAHLL5osGsX9AP0rf9aN9V1xEEKl7GoU2kBLNiZHu
	QZRra2v194JxP8VEDMH8d5hL8gdsqAukRe3Q2X+uI3jknYQuO56EbQ0G5g3JDdUbRjAUww+cV4LuX
	yueNYGQCiaWUfRFnv5nyZJzjDtHMJdBCgkwNsSVzeZNGyQuUJPcobfKAal8+lv7HHdmKSyY9Q80oV
	xCnWfj7Uc0q3qensWqR8wH3XFrMfUMnrXcyL0R51YxXDxZB0Ziq6tywoe3btbh2CV3xf7RZs23jn2
	qv9bMjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZL4s-0000000FBN8-1UC5;
	Tue, 16 Jun 2026 04:07:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZL4p-0000000FBMX-3pn1
	for ath12k@lists.infradead.org;
	Tue, 16 Jun 2026 04:07:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G20Isu1801199
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 04:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fiRe7kfcXarbpaCK1YAHjPNf+dPFJ1apoza
	dLg+YPHU=; b=o8uMOSfUVKFJzrURJRANv58cusXzAxTH9FmVZNVPF8kZw2AGxH7
	s1vkj2ytie4pZV+XflRFDbVb/R7U2p2SCayE8ucL/TAem3bsZvrsdVVAW2mVwyfI
	iODyY3JeQATt53pbhsP3vU/JbQL5SNa2HKyTt1qqenAwmeUWPadjKoA7aAUDC/ee
	tXxYu7NAOZmcxRIYLJbXC2/WlDueSjP81YsLdyx1kMYnEOpW7J6fUBHgK3qsPPxg
	1CECTCNR1/DuqRqqYBRe23siunaS28DGoS8heCGZECRWKQe9LqVij5AqS2l60ZrM
	wLQKCcfdLXzMyYm3OAisUArvO4if3LvuGuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa74ktj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 04:07:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso42243145ad.1
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 21:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781582822; x=1782187622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiRe7kfcXarbpaCK1YAHjPNf+dPFJ1apozadLg+YPHU=;
        b=kR3F2/T6EyDbPykf+W6yP3BP5+sB7Z/3Aw4npphQkL7KSbDAkTjBKNocQhbw2EhQYB
         q+THBdjhNw85wMsg4jSGkR9z6FarHfoUH/hkuVyUWsZlqpuAB7z46Rg5QU3YeIfGS8fH
         HGlXGOYVj3v0sejeM2kYBQ3W6YOI6Vqt8YNBgZwhPHlClYYqeirugtmiLR2rUcSHkGKH
         Rt7kQXM/mt9AcqD6TAeuO3zcQ9niT0xoXbhPp/+X0g39iaLmqSNkO9FqLM4LGxpcj83n
         n/2w/PEdwbHPWlcf8sVm445DbAA8ofknGiroCexfGXjtmXwhBWvYLltCMTwhXtGnI46i
         VpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781582822; x=1782187622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiRe7kfcXarbpaCK1YAHjPNf+dPFJ1apozadLg+YPHU=;
        b=nwUo+KKE/GV35s878pQe6i/fj99CWmGO1M3IU/RID+oH/0XN4HggSlqQIMLAQCn7/j
         L9yIDrkP9lMfg2YxfRdvWEEnc60lYh8RZB5beNKtswQY62CNSFSBzYxuW92jVxr6LyIO
         9KEKlSCg66AuEsmfjUr/pc1XaLv4ozPZkVjz/GvtGV5TvdVkz12vu3bPWNnYxHxhzYqD
         SQJehCGXPhlydRw8cUMnmvmCXdbmv6gWjHytPdr+o/V+kKVQsC/bb30i4KC0Hxqulhr5
         028dIQctsh9uX/4ZFz4NUB006rnQHFnV5m82zA64HJfQmD8FokCnAnoFw2+BoyQ7SbIh
         PjPQ==
X-Gm-Message-State: AOJu0YwHVP5zRV2YYM4D4/h3Vs5uR51UzQiWSYURMqCpGZmkPyZxJjYU
	ZhCcy15sQkiuOzLJmDfrwrsSHwDJa7dubEMAf2oj7kPrrMwmgtCJ9366oKyR2Zo4GSYmab/c9M6
	8WTabuNrb3RmYsZA3uFwMJny0yhYY0eSFtlO7ywoQr8X6nKWSgqMV+dvNZky8q4mtIY7PF3s/
X-Gm-Gg: Acq92OHXYFerfS9HA/BG3aJSlerv+zL7UXkfyc/gXG1Ex6nSjAYly7Enqg4I5FcgZLe
	y+ffvx4Cfa03l67n9Xk+porvlKdJdQVsnz08ZW1j5DIU0bxISBfwY/hIe8UVdup98ZUciLEKH7u
	QSZKFqBpBor1iW7Bs6/seSk56vsJTwQP34fn0LmignmtcBmsKCDiiJ6VwCVJwofsMHaS5sFXuvd
	X+X1CNpqpfyzG8xdFXOKVixxNZRrJN1zxWMiEOciJyadk992f0nDVfW1RBhVFQ5cuGxoVuyaG7X
	lAnNB7k5a0+Qw07UI6W1Asnf4X0Uf/6aUnVMI7KlxAGtDtNCch0sDyLvhiglvcUmGhfIvoaT4lk
	UnW1eDHzoK7a83ooQTN1LM0usRBAJIuJDmz4+7pusTqOcNww8AxjiFAQ9Vb9VbZA4UevPjxpU/t
	Mxj+jl0TjbWwgEysiiZuumPUQIDRifHt2sIUOvDddfzfO1
X-Received: by 2002:a17:902:ce07:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c69a1f4063mr18929545ad.25.1781582820983;
        Mon, 15 Jun 2026 21:07:00 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c69a1f4063mr18928445ad.25.1781582819234;
        Mon, 15 Jun 2026 21:06:59 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432f77479sm118045415ad.63.2026.06.15.21.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 21:06:58 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: correct monitor destination ring size
Date: Tue, 16 Jun 2026 09:36:53 +0530
Message-Id: <20260616040653.3985702-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uM_dn0HSWyLjxUBrYLgFu0FDoa8tZpkD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAzNiBTYWx0ZWRfXx9XDi06VXEVo
 8gAWPD8T2cCDellsQhFBIsvl7fqQ4tyZKfz7BOGenQhEUvXOXDu0tNXPQRQGVGt6kP2vQ37AVr5
 GaW7t3XfQcZhi20pSpXvaQYpuVpy+lY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAzNiBTYWx0ZWRfX6T0ym4SDT3Jr
 7AcCC6EvuwjF2biq1NTqWEm7ah9rlzL+uQUCWOibKi4yoTf0QGS586SGLdmwea8BfCIcIS6TUsl
 LzGMGIrGCTKd3AXHpvMHI8lcZqPv7PRcluqy2LyUDSGBVvsqRS74wsly2kdyhQzMsDpNyqofByd
 rx+muWJgLMmPo+1ndV8iCWJRtD1+3Gu2Aza4doTA+fcxRmgCvBI4otIR05BdRiQuNHL2dwOLlBk
 V33e4XR8Yo3euYOupnrw0NR6vgslgtnTUr2W+Gmfb8M9srXohrVpuwg1VysAT+I7KtdtN0zuYUt
 JK/7pR1jWKzquySYxxoozyR/hqgLd1b4/7YTKpKrPayUmyKll14vJp3uVsMUwl6CRuSY3NZD7a7
 4crzTpZUdH7QO5cNneGMXNxV/EQiKAIbCAvcmrKQiRBS++SnJfMliESEmCqYsbsBpGJ0bMqzD9B
 BUrn7Zk1DcI3cpStjBw==
X-Proofpoint-GUID: uM_dn0HSWyLjxUBrYLgFu0FDoa8tZpkD
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a30cbe7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b5TSSxGLzCK9vQyPxlUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_210703_970034_97FBB3F8 
X-CRM114-Status: GOOD (  11.53  )
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

The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
which is a typo. The intended value is 8192, consistent with all other ring
sizes in the table being powers of two.

Correct the monitor destination ring size to 8192.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..b488bd8fea9a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -49,7 +49,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 		.dp_params = {
 			.tx_comp_ring_size = 32768,
 			.rxdma_monitor_buf_ring_size = 4096,
-			.rxdma_monitor_dst_ring_size = 8092,
+			.rxdma_monitor_dst_ring_size = 8192,
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 		},

base-commit: 83f028be15fe071efbee8e27837538d6cca77e87
-- 
2.34.1


