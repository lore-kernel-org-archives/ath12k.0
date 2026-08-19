Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65837C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00vTssWP0t9RJVIz8IG1sSHR8GlvwrSrPqBWNOXoPM4=; b=Ak65AKMpV/BTFFMYyubQIPe+9z
	OholaLBuhyzhDenpwrmKu/NRgCdjd0HsgKf84iktRNh5AnB1WzV6zQ7d5ig+E2z3kGBQDXSE7Tsjm
	K9m70K177KVFLvYzWhrm/vBrPeejZQhXtxSsRcMLACwwDt1od/gpIUzcCAGkKDrgahYlXu/uMirfL
	cIxlQ2iqPLQpFw4qg2gU3JvSm6lieYVHPtQ/3cen5ny0UJHhXlj8O2KiaXCasp6P4jYDs5yrr18Cj
	+CHLP1uTv9V3NXJitiv0esPODWMUmgm7SUihyLshRWyQDNzkFAVgaInN009WNS0LLl/7aeP7KnLEL
	jSqx6r2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCN-000000098QR-3oFU;
	Wed, 19 Aug 2026 06:54:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCI-000000098P2-0M2a
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 06:54:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZAhf2728700
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=00vTssWP0t9
	RJVIz8IG1sSHR8GlvwrSrPqBWNOXoPM4=; b=bCXi+7K/3enqEw4XId+yVdFxkL3
	Aum/cp1nFnyLUJfj4YV1pq0cVlxp/a+WiGXTq5L7+hqGhYfe7y0ohblU16t0otIa
	rsxY5ifL3MQeZ4m5gMFP3LAn/2YHq6bqzjrkTwQUC4By9T2aLR+iGWWyt8z+9leE
	o4mxbKP3mM6oiSjmHX/vCdQlG2X/AF20YDgZsx68mTIhMnAGbCDNZ+mPMiLiu5+7
	L74Jiv7f5pwXSgMxo6VYSRtpwlY3GgMItcMbpV5zp95vOa3+amFof3Ie6mb6e8po
	btJXZ3YMhfilu6WRjehc/Oa26N/Qf2Z0JZWlqUtGn7xw/BXA78XfCeD03eg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1sx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so944342a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787122489; x=1787727289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00vTssWP0t9RJVIz8IG1sSHR8GlvwrSrPqBWNOXoPM4=;
        b=fwc62bnDkiLGtzulY250P8TvZUO3x4/XrWD6YFO1d+6UioujaD6ulzROqX57sBsvqn
         t3vP7zur7r2qjfgzf+hUT79r6dEORtBgIVWDGUOkGzPC4pf01hIdRivyM/D2+yyy9yZv
         62A1NXtXyY2HXBCjGJJVdduDfBygqJZvGyVPhqWO6lFYr+fMeLA/ynZ4Fme9TAejzBOZ
         qZmUAVfEGEBkQHKxE5sK6DGptWSP2GzuMtvIGeD6znt1k4IFuD188RIyUg4+vIoDrD+E
         CzonMKREKoy4MGYWTmJK0ayV8HDEw0ZNUEmWn+109WoY+dEG2R1qoZaiocRTN//7n39w
         lRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122489; x=1787727289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00vTssWP0t9RJVIz8IG1sSHR8GlvwrSrPqBWNOXoPM4=;
        b=pA6AP5F04ZRN3LYp9mHeAxxPh83b1oJFwXsGjOAK7AkJMxcShbR0DonBRa6p9RLtHq
         KnXpnNKgnbwYUC3smJB4zrVJtpCzOK/k6Mtmkedcv8C+n3vxQv9Kjy9lC5Gif8dL1m2j
         xtToP0MBh3HKNmmfug6x5VQVxCI5u3hr1eYfPhyqmDtHixMjObF+u6jMB+bqMmmDVqzl
         E1Um7F08asfrVwH8a5izNUYyPv5uFck/cEGeQyPd3TPcy9XFcu36yoyMyvbXfAMl3RvG
         1Ll51unNqfLZo1VkoDUG/8XRM8qQIp5+nURcHzL5UCE+FssEpfsy/YGaxmfVlrBpJ3ng
         I74Q==
X-Gm-Message-State: AOJu0Yw1H7VzGS7Uwhr4gunbIQqzS5C8hi1/JsLyx8l6VjmCFweWAhN5
	XIXZxd6KcKi3ehgegNXQ0yczeZlqxdQeR7diWOca+AY4K9wcg4wI5L4gKgZlek+eOzqnatVhpHl
	0cqOsDGdwlt+swI1FIcnNoFxIIHeR1jqL8wUKKgS7sO8F4z2i9wqYw0Pmanr/vFkM+gI6at6V
X-Gm-Gg: AR+sD12nzsi/4pbl0LUB2oC1wuxwVPjzNOcSixoy7X83+apdV5e9DxO1snUXG8QQaVV
	pXsmyWiaw3YM73nNqMeGRYKI5UokGC/mmkkhES084mGdHSqJ8G9b8i7EiqtD8bC4iGefJKgLD9j
	3m0/uBrlzSqPsZssx15RlBSCumXFh9dYMWk9jRrIIkqgGQVaslluaUJPGnNbcMVx9RoPsl0wDUY
	uYNO7T0ambPKywsytC8UAPdJI50CM24poJYFrdXWHE0QkNMZl4WKyqs5hShczCUrlzKi8y1ljQW
	YJ3cWL5WQCiutN0txqBJjbl00hOdk0PqV0yQ7/5tw4DNqpqWvISRE29MGHtMav7AthS2FY3ksea
	AaA6q34gixVIrMd8XzJixfGNjaeQDYXeGPE4YP32t/P7aMJ+eu2mlP5joYRAYj3c+z5dQAT77He
	zd3OQkHHfxTwaJdTEno+bGI5k=
X-Received: by 2002:a17:90b:5748:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3958125b7d2mr4589366a91.3.1787122488649;
        Tue, 18 Aug 2026 23:54:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5748:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3958125b7d2mr4589309a91.3.1787122488128;
        Tue, 18 Aug 2026 23:54:48 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb4ffcasm1526626a91.6.2026.08.18.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:54:47 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Free allocated external IRQs on request_irq() failure
Date: Wed, 19 Aug 2026 12:24:25 +0530
Message-Id: <20260819065425.2044186-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wSn-1pHeI31Pt4TqnNRLQ3QE70c5xGD3
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a855339 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tecUyYAXEqPB-KyWC5QA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wSn-1pHeI31Pt4TqnNRLQ3QE70c5xGD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX20pM4h2d8plh
 EGU5fhV6c5zl26kXs4tszb9JDl2qd3YfGg4eiBSRtjmHwday/uemiHhrpRo/tsfTO0x5sshoUk0
 IU4ukQT+FkA7xX/jQoDMo9y2T3KLwUSN6tc6hU9e9LZRZQRV7VOe704DUOXWmbkMnwP4CGCmJO/
 SIuw9tuXiD0E8j/caKuR9bkrVkbUZIGcStzY7b8INiFHkfo2OYDJAtH3EfenHsamrrYefXwc5z4
 qB0N42LEs3FmE6Q0Qoh89LrUmHKJ+njB9daStW4ze7AzfjTv0o3m579/6ZReLBgWqflOsyl8RAG
 YQGvQ4jJQ1mWjdYp1uaFTFqyM3WO7KFls7Kn1gk8VGKQSpwLvm1xQ7J5eg7Uz/TqNeMDh82znTs
 aQ2V3757itt0nOdHrLirBGufzHpCgbHcUIFzU3CBv4iBA2mkelnPJE80pL2wBfoQjvD/nEfmms5
 eifXralRqA9ZtvZHpOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX64u4G5OckppC
 ULK3dSqimD5LogJy92eAMClLDOR7nrEx8WDqy7bBBSlkP4u4R4/VwPIfpe0B5kkzIN25NR3fo45
 qHd0idKVnqnknH6i/XeAsAfbnLLUrrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235450_130642_342DB757 
X-CRM114-Status: GOOD (  15.45  )
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

When external IRQ configuration fails, the driver does not release all
IRQs that were successfully requested before the failure. This can leak
IRQ resources during probe failure.

Free previously requested external IRQs when external IRQ configuration
fails.

Also remove the NAPI instance with netif_napi_del() before freeing the
associated netdev to properly clean up the NAPI resources.

Store the IRQ number only after request_irq() succeeds to avoid recording
an IRQ that was not successfully requested.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 9a78d2f69f94..9bb4a6191331 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -326,11 +326,11 @@ static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
 	}
 }
 
-static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
+static void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 {
 	int i, j;
 
-	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
+	for (i = 0; i < num_ext_irq_grp; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		for (j = 0; j < irq_grp->num_irq; j++)
@@ -344,7 +344,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 static void ath12k_pci_free_irq(struct ath12k_base *ab)
 {
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
-	ath12k_pci_free_ext_irq(ab);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 }
 
 static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
@@ -600,8 +600,6 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 
 			irq = ath12k_pci_get_msi_irq(ab->dev, vector);
 
-			ab->irq_num[irq_idx] = irq;
-
 			ath12k_dbg(ab, ATH12K_DBG_PCI,
 				   "irq:%d group:%d\n", irq, i);
 
@@ -612,22 +610,24 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 			if (ret) {
 				ath12k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
-				goto fail_request;
+
+				for (n = 0; n < j; n++)
+					free_irq(ab->irq_num[irq_grp->irqs[n]], irq_grp);
+
+				netif_napi_del(&ab->ext_irq_grp[i].napi);
+				free_netdev(ab->ext_irq_grp[i].napi_ndev);
+				goto fail_allocate;
 			}
+
+			ab->irq_num[irq_idx] = irq;
 		}
 		ath12k_pci_ext_grp_disable(irq_grp);
 	}
 
 	return 0;
 
-fail_request:
-	/* i ->napi_ndev was properly allocated. Free it also */
-	i += 1;
 fail_allocate:
-	for (n = 0; n < i; n++) {
-		irq_grp = &ab->ext_irq_grp[n];
-		free_netdev(irq_grp->napi_ndev);
-	}
+	ath12k_pci_free_ext_irq(ab, i);
 	return ret;
 }
 
-- 
2.34.1


