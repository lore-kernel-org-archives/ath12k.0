Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF266606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pagXRKJu;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCPcnwx8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hy7yyLP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=; b=pagXRKJuepccST
	n+Gf330GwyyG6rB3HyFV1KNOEl4fQb7t0erutXmgScmImeXZBeCrT37FQes/1IG7HgNaoh/r8o0oR
	+b0FC4AHn0b9CgiKX54yHFXf3ltqJTyf6OPySz3sSBeBJi17Tk1G4kWjcPmoqYQcPAFi2xURjYO3k
	PdOKjcL8WvsYa6Br9oRLlQ6a113cLa/nXE2xdhqoV2haR7X2dP8ZDGA4sHWrWjkYbMD60fGcXPqy2
	illF9Ec2nrJgiLEZyiRNj400HDUiyKxNuGQAque2kcebwR12eNoylC4QfK2MtUg17v7PcR40PTI49
	MZlyjJpRFN7gysV7z4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTf-00000005gyv-2yGZ;
	Tue, 24 Nov 2026 06:58:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTc-00000005gx4-1t8T
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 06:58:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lARO017001
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=; b=KCPcnwx8i0t/qvr/
	g+3HfGThzXkDYrYNjrF/jZsrGKrvJDBqaYvPGz1tVGGdDoOe2FtyPJPpNI9ZmE7V
	BHlabuOCVWbhBk+h++OyjKFkh3PDSpj8XTYkrtL8o0K3MYv/SRTWY9upGHeDHZLI
	Zv7It13M25luYhVn7b/utrGz9hWGW0a7/sNDBxCEaSHAyRw+Qvq0uoqkzmZg0c9H
	FUBr2uGEvGQdFflidChZu2u+vkdWD0tek3et37sOaaHqA7sZZyJpf6QV4m+zBFdw
	NVia6ayk3eoSHh9s8z+z3p09jDsd01gPNQaiKh5hc4XOSH4f1uDeqTveAbBo8/la
	HVwPow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ntcuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:58:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso1482764a91.0
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 22:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503483; x=1796108283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=;
        b=Hy7yyLP+QBnHIanR0OdGeq6c+x9d0Sp52wlCoqpCaN2BqxmdiqUps6R8aBUXgj51ng
         rmNtpRWot37zJ1b8MZfZYQu2xvjoOxyNMdkZ72eztopu52AASl+VbwF1e65PP01PO8xh
         ItCrcsX53OIzAmv/gABWpYq+LZOE9ExKg5c75asOs12vZgYqqKKB6VLmWCVcSR6CGJW+
         77Doc8S/3s+1POnrAPNpqZIFUfDkPxo+fYeKDg54ybEJiavYzvDRSfGgXB15Lmy1afCb
         3ZNiRpDvgSTAb6ywoEoaaQRfth6Msjem5yumLGcLskXtP3EODXttWtoeafNY3JKj+3Bg
         Q/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503483; x=1796108283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=;
        b=Hp2SEFsFial/0aAPV1jwpRWK5tmosXtW1V8pLWcv3+CVUqh8n6WOGCgC8fAjH6N1Nh
         vP5BdPrIez0BVHtvAms3DAr4Dn/tcKEZ0byOOPhXogcENBwAiMNLFUpK44+NPHWo7T7C
         MU+M8YJfn1d8N9mTvtfAA+lOEab3hJ7TgiPSf/XxuLbmdVYHezrOjI2IjE3PqZ15IGHA
         WPhSNUEjoLagL3RgSmkDX4m9OzltfYF3n0VlrZmCHdg1YoK2kcziFuP6e8EtgN5t7JRQ
         SHv/z0lIWe0+ZJar//IkIoOu/9H6kpwL/02094ccnCcpvnUGjqs/EnPonhm8kkkGiClE
         YLeQ==
X-Forwarded-Encrypted: i=1; AL+hErH0NQUBZ6aLd2/zf10gbXPIn1uc+U0XE8dWBEHMNl+vQjT5p/ApWCFa9yhezGVF4QSjZ1zV+UI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8goTjhGu+sBKXpWrEWuvzEYHmY02lGGsaPfKzCABA6UMaU9iU5
	ZFFSBROAR/DAh6JkDE29mSTcL85E5SKGLGau7Op5h6bVjpkIiSvQAalqF+Hkcey6pqajhcJhmo4
	beQa0DsBDggSGBg+SRbRxtSlpMyzMU8L8kP9xyELmin+p6bs+M/ePAlVN8zgmhh/V
X-Gm-Gg: AZFdTZe1YygpFg9elOi0t1OfoVOm5zzxonc/PFkOWTaABhT7y0wSRI1sptDSdJ9mf6D
	xAK4czPgeTNjirwDReXtruyrGFtW7KyYz0vofe/m7TZwPKsEu0QKHgVl+V+cQcRFQCCCqdyeESY
	tFAPqvXPUpMF2PbAJ3StZCYCZboNC3LY8NxqqLEyjf/CscBaWPxRlfLTkNzkXhJZVmK8m4wuqCj
	4J+k7hLvv357Sk22o2WCplY+vq9jp48pWDlMCxYkL2P3JbonT25nsl78VaWgo38+7kAY4NN+6Kh
	hXGVVja1a3gYGY5OWNbAQ3LIc9+jmYWOMBPdi9EtaU7lPpICX3QkYyHkNqp5ZqLMjq+a3AQycuE
	htomIi7SINCZHsedYuu7pksZPPjhcNPBoMstPWoPGAeVg55GBi6HNyFl4DFeQfXnrMbAl0/ScsM
	QXzZA9Mm87xjbMs7jxVuKiikReWd0fyEyuoxTwwDXMgcWQOjVlbP26y74m1mPjACFa7zygfVGx
X-Received: by 2002:a17:90b:240f:b0:3b4:a7b8:7d97 with SMTP id 98e67ed59e1d1-3b4a7b88040mr2852903a91.9.1795503482544;
        Mon, 23 Nov 2026 22:58:02 -0800 (PST)
X-Received: by 2002:a17:90b:240f:b0:3b4:a7b8:7d97 with SMTP id 98e67ed59e1d1-3b4a7b88040mr2852884a91.9.1795503481809;
        Mon, 23 Nov 2026 22:58:01 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:58:01 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:27:38 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: ahb: Fix IRQ status flag
 cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-handle-irq-retrieval-v1-2-e2403fac4e9f@oss.qualcomm.com>
References: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
In-Reply-To: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX+lBwbS77l1p8
 meB8tb2A/IQd1QrrXKfg74AeS5pt5z0Qr7HBBFFx7uET2+7Df6LpNuB9evNt9fb5zHsUtuWfl62
 6jPCiwFU/muZ4M2+yoGsGGDZLh2XbFZmyFMmYBRG031+Db7EBRCEgQtKE7t3jhZ02sdXLrtPQyO
 G5IxXGgRpwkYAzi/zojEiroqukcv+1TBsdC1eSbp7haCwegyeE9NKj12hltFUe9tXTou8rRyRcO
 4MWl1x8aAuAz/0eUJEepZoNd55utohjubwn5djNTM8fjSgIlSe5NEXmELHMYVRw3RgVFAJhtnVo
 oRyCkMlJdHKc2XQnLuvaA8EeLiMBgtPIaOEcneUPTxNLApaZPAlP0eqEdU3Z6OKQURBD3D8Cy9R
 2D2nbPcPp913OZ6v71YtmeT6bi88I1VNEX2A8/qK/8iVewA3O0ApA3htDeEeP6tryrB6Y4V6CJE
 DFpa7Egskeajv28qsKw==
X-Proofpoint-GUID: 6Lwxp0oeruKqT68-LD28C3h7HordEzqt
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b05357b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yw8OSCRprngcOe9xP3oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6Lwxp0oeruKqT68-LD28C3h7HordEzqt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX2vAlMSwSNF2w
 VDmxwp+GW1QcXs8i1HnAYlAm7u34pq/3vUtCiBjotwDiCnZaN5fAruvf0jI2LXyiG7eyzOQj7in
 73uD/L9rHqtojJ8ty+d9XoMAo7ai9pA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225804_633668_2FC63089 
X-CRM114-Status: GOOD (  16.96  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Clear IRQ_NOAUTOEN and IRQ_DISABLE_UNLAZY status flags for all
configured external IRQs during cleanup to avoid leaving stale
flags on IRQs requested successfully before a subsequent IRQ
configuration failure.

Update ab->irq_num[] only after devm_request_irq() succeeds to
avoid storing an IRQ number for which the driver failed to
register the interrupt handler.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 64e4a6c5affb..030b1ec68b53 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -200,12 +200,27 @@ static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
 	irq_grp->napi_ndev = NULL;
 }
 
-static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
+static void ath12k_ahb_clear_irq_flags(struct ath12k_base *ab,
+				       struct ath12k_ext_irq_grp *irq_grp,
+				       int count)
 {
 	int i;
 
-	for (i = 0; i < num_ext_irq_grp; i++)
-		ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
+	for (i = 0; i < count; i++)
+		irq_clear_status_flags(ab->irq_num[irq_grp->irqs[i]],
+				       IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
+}
+
+static void ath12k_ahb_cleanup_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
+{
+	int i;
+
+	for (i = 0; i < num_ext_irq_grp; i++) {
+		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+
+		ath12k_ahb_clear_irq_flags(ab, irq_grp, irq_grp->num_irq);
+		ath12k_ahb_free_napi_for_group(irq_grp);
+	}
 }
 
 static void ath12k_ahb_free_config_irq(struct ath12k_base *ab)
@@ -215,7 +230,7 @@ static void ath12k_ahb_free_config_irq(struct ath12k_base *ab)
 		return;
 	}
 
-	ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
+	ath12k_ahb_cleanup_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 }
 
 static void ath12k_ahb_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
@@ -705,11 +720,11 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 				ath12k_warn(ab, "failed to get irq %s: %d\n",
 					    irq_name[irq_idx], irq);
 				ret = irq;
+				ath12k_ahb_clear_irq_flags(ab, irq_grp, j);
 				ath12k_ahb_free_napi_for_group(irq_grp);
 				goto free_napi_ndev;
 			}
 
-			ab->irq_num[irq_idx] = irq;
 			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
 			ret = devm_request_irq(ab->dev, irq,
 					       ath12k_ahb_ext_interrupt_handler,
@@ -717,16 +732,21 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 					       irq_name[irq_idx], irq_grp);
 			if (ret) {
 				ath12k_warn(ab, "failed request_irq for %d\n", irq);
+				irq_clear_status_flags(irq, IRQ_NOAUTOEN |
+						       IRQ_DISABLE_UNLAZY);
+				ath12k_ahb_clear_irq_flags(ab, irq_grp, j);
 				ath12k_ahb_free_napi_for_group(irq_grp);
 				goto free_napi_ndev;
 			}
+
+			ab->irq_num[irq_idx] = irq;
 		}
 	}
 
 	return 0;
 
 free_napi_ndev:
-	ath12k_ahb_free_napi(ab, i);
+	ath12k_ahb_cleanup_ext_irq(ab, i);
 	return ret;
 }
 

-- 
2.34.1


