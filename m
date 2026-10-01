Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0EFCA5FA5
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 04:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4c7jfFqxmhLr9o+XB64iUPxfI/4uYoeDsuw6aJpSHSc=; b=x0TXVYgPmXwaf8e+k4uM34G9jo
	XSeAQt+7wMgvSk51+EbyopaKZbd5imx83Ap9BUlZ8pt+zIlvRB+nAS1p10ke1sZCNik2SjFIFanTS
	mMQLbbufCfUYBQbjYFL4bHH0Bhq6f81Wcij5MGuwrKqBpLKbxzsAvpjS88LBzsHwbZlJBNI6jDYBm
	lzAnHQ0eT/NvoNdTlWUETnZtbI0i/9o7WMo0YLhevrdxYi/ulKEy3bDB+SyFxNeMXcRDYAFJb8lh+
	EEEC5A2d1z5zlKV4NqSwfgFL3Lg1iy4RsKIlX5LcGvaeLxngM2THeBogcapxqPq32SQJjUH0Hjzum
	7n933Pow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8ob-00000007mHm-1slc;
	Thu, 01 Oct 2026 04:54:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8oX-00000007mH7-1OL2
	for ath12k@lists.infradead.org;
	Thu, 01 Oct 2026 04:54:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gcm21754823
	for <ath12k@lists.infradead.org>; Thu, 1 Oct 2026 04:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4c7jfFqxmhLr9o+XB64iUPxfI/4uYoeDsuw
	6aJpSHSc=; b=SYRiPtgr3DOIzNyjk2TNaXDYR2QhlwDtyJmAkgFJSB8wMJtoT4H
	BY5KE7JPpCt1LMg8h68qX8qVYyBtbZhUfomAUzMDlO9u+FG89UXPp1v6BkKWhJ4Z
	HdBlbK4Gzfzb1Qlkevmhcx+913LnBo0lmJ7D4m4PhjjB1Kp9cWokbso5KRfokUOy
	n8irGuJwuAHSN/bphObJSm+7egnZOp7bg87790RpuwNlhvwmd1bzITaY7gkcruDG
	FGeyLszxd/qUfH9BacKSPdErcq/slbrCsS6l0ryqmm6KGgYqOncwOzvP9/AC3t2m
	o/Bx/t7VVoWMsZV4qVqM69K8GDJHBgxJWiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vtt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 01 Oct 2026 04:54:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso2765184a91.0
        for <ath12k@lists.infradead.org>; Wed, 30 Sep 2026 21:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790830475; x=1791435275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c7jfFqxmhLr9o+XB64iUPxfI/4uYoeDsuw6aJpSHSc=;
        b=b/rboOKL91f7kLIQ6wKmj1TsjILUoOhbVINmbhKgeUxPkq+ooJb2CC3O7KEOtD3DHC
         lP8p6zsCs+U1HdxzgmlT5OX5UxmsYV/6yfrfGSlGwJiIaJ60Z7SP13lsO8Qoy7Kt9gYG
         gaNwEKduAQxGPfoQ1nP690hD71rzCZhbi0+F1OOF6aeqBD7b/Qt3WWR+vYITI395TwV6
         5ZQZ6UNEkkh3UJR6y9daxN1wssxab+ouW0UE7JfsZQvxCsmGmpNBvYunfVuK85u5wbVb
         aVoBgp1wOOooudVhe2FGWvM+ED3x/RCwFqO3jBBcLJr91R3tt4s29+BgWpAzX5Hvw2RV
         TeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790830475; x=1791435275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c7jfFqxmhLr9o+XB64iUPxfI/4uYoeDsuw6aJpSHSc=;
        b=j6LmR0PsQOx5gPVYVsjOAPIDq9WwfEkwqrFUbU27VUiDac0lQCdDgdaofro5drqVYE
         dzBJKy7y5UXIOvEAjaYO5JPC0wyicgEcDLlqroD0OMJrua06fVaDX7GWtNatfIKOOF9Q
         BFNOsvat4sY2F/zkqaJ3IxAWT0uLdEYUZFIREMBFaaIRnMz+oxnvKil3qdZW1rPgEKYw
         b5h7NjO2lvCAR5t/rBT+kHLxW7CGm5sowwJm6Vj/MGzfFfnE/IfK0Mv89+lmZzUO0edu
         qF2k86KWUNtYyQWkFzWTtADrUGK2VMIMMvd4WXphC0s0CH5k7tJPL5lXIalNTjez2rV7
         pzMA==
X-Gm-Message-State: AFq9FYI1HPYiQDuu/luwlBA9tqk1m5TC0x23tB5wjFxjYanSnWxL+ohl
	jyNiKZDfzN80vDOU3VJHgo1YeZV6tE0YL9cShEUZHMMqda7iTa1iFYUIv4FddoMqEIx1lSBmtcS
	YLgyReBY7Waep9rb4s8OzkvOzCWDD1bR8+8jwr10WYrP3y1343Sv/3rEbcXT51MLwldSofX73
X-Gm-Gg: AYBFou09NdNZN6/egTa6/tgfmzT2jDTp0ihFb8iRhFHbmjxyaam1/y+P4OcyA7rX3xx
	DUDFLxNYO5AbfSh/OPEJywWZrmj8yGX0kPQ9osNusITnXjo5s5kOb58OcZySs/Uwku2Kfj1rWxL
	6ASkZob2W6q70WdRYsxYK2fJrMpID074GaeTbAsZM3X6ymZyr5WNnryCrZXLyNuSF0AmhsSzvH0
	wHXZQFU6HNro7sWHQUZW8EQc/wuaMC9yMhVdwTAaa/l5xcqI1eatRFEnH7rFwb83qW6wRleC0K5
	oA30ai0wN5pJWWfIWpOQjN9MoZHCexAvJkDPc3HW8MPvM4xISFVGmzgE0e7kewmqorumbdwgBxu
	Fo042bTPQTFWuT4kAMkxBPi4o6Dce8Ce2o1DZOtCCJQ7hRfGZ4aE1d6ng6WCKdBSGrVSufRVjw/
	as++t50E6Us2RIuh+8eQFpLg==
X-Received: by 2002:a17:90b:4fc1:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a4d18eeb70mr2887116a91.42.1790830474797;
        Wed, 30 Sep 2026 21:54:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a4d18eeb70mr2887103a91.42.1790830474298;
        Wed, 30 Sep 2026 21:54:34 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44f5299sm2332772a91.17.2026.09.30.21.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:54:32 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB external IRQ paths
Date: Thu,  1 Oct 2026 10:24:23 +0530
Message-Id: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxOSBTYWx0ZWRfX03fgDCqmNf/P
 t7crNLdZ8z2io2mrGDwoj4rEca+zj0zaT9odEAgEf2jqGWls3ol3lpCNQvR3GzQOECbEi3Jly3B
 RoEtbSScK5HZYnLtNaHSWFsGb9/6/k8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxOSBTYWx0ZWRfXxRcqTCuXpQRH
 jviqs/6/Uc+VtJPjXe6cVaFgui5QWu4TLWNSSLHyHrZvOuZF+xqHs6BPm4q18jzieoz+MAQlmGG
 UDI8h//SVgp2s9K1EZyAxFu6kJQAxvjd9oD9YUbBlvP7/HecResyJiMPBVoKO4HwooEvu3+e3hh
 iMVT2oiqezdVXkxGjjykvuOkEC3Uveq0las+zRcr1mAiHJMfWBCbmHWWeZCEQlU7znig2aVQ7/L
 PNQey5I1FkcKnRJLDX/OvbKY4DmG4fUAglremRX8hUpH6Zno36JFaVWLm0PR3/QhWWQ9bJQd6j1
 E2Kn9WRoCGST+tvC8peBVD5HtnlUHtwjjdzHfckXUDKH3ucC7VILebXl593BHZ+CVGV/bkljwts
 vC9FTlkzMVgN/qE5irkPYyRJ6/LQHi0ePScHEIJD4x8oIGHcTDB62pgdfg8kpRZu2GT6U7jLvmv
 CbLRA1ev6aM5iOepqNw==
X-Proofpoint-ORIG-GUID: 4MPj4X21ri3MZcTL-PV4g3H5hAG4SSP0
X-Proofpoint-GUID: 4MPj4X21ri3MZcTL-PV4g3H5hAG4SSP0
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abde78c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2RwGnRjxY74BYPqWGSQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_215437_484124_92580C07 
X-CRM114-Status: GOOD (  17.65  )
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

Currently, NAPI instances and their associated netdevs allocated for AHB
external IRQ groups are not released when external IRQ configuration
fails. They are also not freed when arch_init() fails after
ath12k_ahb_config_irq() succeeds during probe, or when the driver is
unloaded.

Fix this by adding a common cleanup helper to release the NAPI instances
and associated netdevs. Call it from the external IRQ configuration error
path, probe error path, and driver cleanup path.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v2:
  -Remove unnecessary irq_grp->napi_ndev NULL check.
---
 drivers/net/wireless/ath/ath12k/ahb.c | 41 ++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365aa4b..9b77632bd1bf 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -191,6 +191,26 @@ static void __ath12k_ahb_ext_irq_disable(struct ath12k_base *ab)
 	}
 }
 
+static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
+{
+	netif_napi_del(&irq_grp->napi);
+	free_netdev(irq_grp->napi_ndev);
+	irq_grp->napi_ndev = NULL;
+}
+
+static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
+{
+	int i;
+
+	for (i = 0; i < num_ext_irq_grp; i++)
+		ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
+}
+
+static void ath12k_ahb_free_ext_napi(struct ath12k_base *ab)
+{
+	ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
+}
+
 static void ath12k_ahb_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
 {
 	int i;
@@ -622,8 +642,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 		irq_grp->grp_id = i;
 
 		irq_grp->napi_ndev = alloc_netdev_dummy(0);
-		if (!irq_grp->napi_ndev)
-			return -ENOMEM;
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto free_napi_ndev;
+		}
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_ahb_ext_grp_napi_poll);
@@ -675,12 +697,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 					       ath12k_ahb_ext_interrupt_handler,
 					       IRQF_TRIGGER_RISING,
 					       irq_name[irq_idx], irq_grp);
-			if (ret)
+			if (ret) {
 				ath12k_warn(ab, "failed request_irq for %d\n", irq);
+				ath12k_ahb_free_napi_for_group(irq_grp);
+				goto free_napi_ndev;
+			}
 		}
 	}
 
 	return 0;
+
+free_napi_ndev:
+	ath12k_ahb_free_napi(ab, i);
+	return ret;
 }
 
 static int ath12k_ahb_config_irq(struct ath12k_base *ab)
@@ -1353,7 +1382,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ret = ab_ahb->device_family_ops->arch_init(ab);
 	if (ret) {
 		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
-		goto err_rproc_deconfigure;
+		goto err_free_irq;
 	}
 
 	ret = ath12k_core_init(ab);
@@ -1367,6 +1396,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 err_deinit_arch:
 	ab_ahb->device_family_ops->arch_deinit(ab);
 
+err_free_irq:
+	ath12k_ahb_free_ext_napi(ab);
+
 err_rproc_deconfigure:
 	mutex_lock(&ath12k_rproc_info_lock);
 	ath12k_ahb_deconfigure_rproc(ab);
@@ -1409,6 +1441,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
+	ath12k_ahb_free_ext_napi(ab);
 	ath12k_hal_srng_deinit(ab);
 	ath12k_ce_free_pipes(ab);
 	ath12k_ahb_resource_deinit(ab);

base-commit: b64812cb6cec118f6c59a4ec2bd4848db17f6bb2
-- 
2.34.1


