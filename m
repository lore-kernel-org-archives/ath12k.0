Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43230C982EA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7iy5c7wo70pWJHvADDmpObQlXmf7R+v5Ac3T25zyMN8=; b=vC6CWgoYups1D1VITpuarJglrk
	luHnrnKnk5CERWN5a2nW0NAbFOQ3r+8PYY9U/oCf4FAd7UhgCR9pl0PIYZVCKyGSgnaciuub99v8K
	XjHldFc5jCPF2doKitUCJIC0DMPS+TIDUbdqNS7lQNSrBkH6FIF3WMoiaPyg/LShOqeTCK3jlMGYi
	UfIN8wPpAE8QoEQguUluVcgkulbxikeboI7rNXj8pdQ1+wXuWjifm6YXGes0CHx4Xo6rNBLGSUN4x
	3FUu4J9GGWLIIAPcxppNtMYNxr6/OikOnSdk4Y/huRk6oJRn52X6XDg/6C5pmo2FXhffC5TC4JQQN
	aeYp7HTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gtj-00000007Kdr-3sDH;
	Wed, 23 Sep 2026 06:56:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gtg-00000007KdV-44mj
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 06:56:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N6G3EM1919892
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 06:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7iy5c7wo70pWJHvADDmpObQlXmf7R+v5Ac3
	T25zyMN8=; b=Q9zfUy6y9Nhposm+e10U4rTblv1X1nqi5hRyBT3Kd+lX/eOFQs9
	Orl38p6obvh8uMoRkvvSSqCdmUZhYIIDgYuxfW8C2/uRjh6st58SaN7BdGxbi2nZ
	qmG1hIMIeATkISBXG65VDzadJCbSzDSfj39+Er4SJn2dEOygchA96WRnAGPEj0oZ
	vY1AmkGInNOhZ09rj+hHPiKSdcp/srP0PibhYFTroyWatPn5q14fQ0UxmGYOVt/C
	5MflztIf6XfBNUOW7Y3w/kTWtQ7eGcdyEpjuCLtYo1vmK2eeyD7mTfDGeJwgJ786
	Ueoc4kEtJD8kODXt0m+M+lnJFrOV2Nxbi8A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqg5j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 06:56:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bee712354so717568eec.1
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146556; x=1790751356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iy5c7wo70pWJHvADDmpObQlXmf7R+v5Ac3T25zyMN8=;
        b=bJLdllGc99f+ZQi6XTHmkc0xVVGazK5eh9hTaN/ffILGP4Q5xBIdTC/ORt8lP/0+80
         l4tj1nVXd2xg6VPNWWk4cnX9yTeaKHqD4QwArF3S3sS7G/UTe+XkkzsJWWpn+6NttLDx
         Upip4cXCEMpEvTCa0XsJwWNn00gQAHlK1bN9U7XqEXLd0JYKiimP7ITVerIJXaUvy/Aw
         WuysG0AaCu8CYCiTdJQwt52QPr3QeCZzDcdAQhDvq0GzyiQmeVbyFAv9/KluCFhWtJdl
         x1nbMtTSclZ4vS2bifKbR2y+NiPoq3hxWXrK3hp4h1Tf7sOwAq9Akpk6WEDY1GJFMMd8
         PKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146556; x=1790751356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iy5c7wo70pWJHvADDmpObQlXmf7R+v5Ac3T25zyMN8=;
        b=lSJHJpFmjUgnMJvzWoNunP2/119X016WS27wnkRa3Moj6DeyKzhlSPzlJLpDN7sFfW
         0ouL8xh//aymOMCldu0OvVBW0srZRsllUzwlY6zh5eNFoSlWeDtQpSGoYMqZm9l+i0So
         DXRaYu1SGauxpyFefC7Ea68sc6uCUW8E3FiV6HlGnnDjMKhtwpFo+KDLwHcVI6RCPCCa
         7Lepref7GIuxVugGmM6TSQ3UCPIJgB87KB3W+4zqxKPCCzuEXdx/VpvMYNuwf6lzMIi8
         nsD3EpDt7sZ1Z3xG0vmYLjotA04PYr3vHdJ+kReo/oImdhdKOsq/fuGQnC2ZLSVEvDtt
         uOkA==
X-Gm-Message-State: AFuF++mJFzOtM90ue8fOWYPa3GDAlSz1AEH0AE/vDsFHWlgjOCNulLLs
	URX478Akv1ZW5eXoPz8DLq3smZg0klDnz71A9CN1nEo5Zxt4k4pPow8GMX9NogoBtv9KLxALD3U
	jOUGdadQRSSdQbnoxFv4PffcGHL7yYxDeswQvJwnLh32j6U1LkGotyZkCCQt8OVABzLBPT6Ws
X-Gm-Gg: AYBFou03+wC+y5s3iXTXkjuj87f9o6BUuPP5QVWYWrNolz5eOTKpmBg9qamB/IYSBih
	b0xtuucsZX3Z0tFIT1KlgGAw2eXWTJBgCJCH5FDc6PY/3N1fdZ7kMt9YvoCQc38MOVLwAYXLGee
	8kZ8fgga8On2YpOcENGtnUO+5zJz0uPusLkcFNHpVtXp3P9eqKnTlO1KEy3GfthUsB/rMLvz76p
	6fsPkEi+2idFVssFJfyCpawS6UPvVR0WDACU2SlGAAUxvZzEVDQCn6BlkaM9aNYOlGOjsWqhEc9
	6Dzfju990Iynouh70gU6BPsrFFpScegyZmDZ8qwQXJ7fNkKATv+DZd41mueohP3ivaeFFVX9yx1
	CiliVj5P8dBdgDt1pKASQH3FDlY76jMIXOK6kFwSJNUhe9Al2eOgsTAkK/EJQEdmkhuEvZKJ/G0
	hb6exnipOzCZPKnB+zmrWI6Q==
X-Received: by 2002:a05:693c:8948:20b0:33e:66bf:230 with SMTP id 5a478bee46e88-33e8d9c8499mr1710989eec.31.1790146555894;
        Tue, 22 Sep 2026 23:55:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8948:20b0:33e:66bf:230 with SMTP id 5a478bee46e88-33e8d9c8499mr1710973eec.31.1790146555245;
        Tue, 22 Sep 2026 23:55:55 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm4335179eec.1.2026.09.22.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:55:54 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix NAPI resource leaks in AHB external IRQ paths
Date: Wed, 23 Sep 2026 12:25:46 +0530
Message-Id: <20260923065546.2747009-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: p6d-TaN_zMPHGGc9ovN44M3OaRSIeZhR
X-Proofpoint-ORIG-GUID: p6d-TaN_zMPHGGc9ovN44M3OaRSIeZhR
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab37801 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2RwGnRjxY74BYPqWGSQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX1Piq3k3LsGbW
 cM3Ekh+qRV7K0bKd1c6Fj4K215GM+LkZGlv9mVdEJIy2U5x5K+DmO+ropSnDNNTEX9XGRiKWbXS
 0v3kAWYqOGgL2YkKV9a5XblajDBdAYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX/KuYNDtKci8Z
 hFifUCBQLTZ5Yf0Z81EHGPmbg3W4t3dN8pBaGWi/axAhbqvlmfwS0/zLOuUrT9YzLHxXA6Xn8Vv
 A2IiDFx3l4KjzbpDyPIU8znSOUll4c5h0hCYFy0qsKrW/xbLI3x7Y+0HhReyiyg7NOZbNOQHzDe
 wceRqQDRFnWMomMVzKgNXJpKAMAsyey/9kk3cn70QdXhzApgj2j6tmsISld0ydQeiZgLgFPxuhz
 T5NfflbanmsvgbPH9Nr9jDRcHrySOP7ZPtFtDvkpBBBRQ0y7BeXWnN/PJvcr9Whb/VhDyNeZAwd
 u5/F1CYJT1ZgKhitYW7f/AM81f8dAbzxmfrP5rgutQj4rF+S1cxfG/RK4Q07606+JeV5R/5hk0f
 /m5uYmN+TrGmsCuJrd12DW+KvDpr9dQC4Qzk9d/VGHWsWMJ/gHRgToPrAVVGUadYpNu/7NTbQ3K
 MDHdfaEgRl19apRuzZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_235605_020918_EBA23A50 
X-CRM114-Status: GOOD (  18.55  )
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
 drivers/net/wireless/ath/ath12k/ahb.c | 44 ++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365aa4b..386d467f0710 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -191,6 +191,29 @@ static void __ath12k_ahb_ext_irq_disable(struct ath12k_base *ab)
 	}
 }
 
+static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
+{
+	if (!irq_grp->napi_ndev)
+		return;
+
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
@@ -622,8 +645,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
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
@@ -675,12 +700,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
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
@@ -1353,7 +1385,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ret = ab_ahb->device_family_ops->arch_init(ab);
 	if (ret) {
 		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
-		goto err_rproc_deconfigure;
+		goto err_free_ext_napi;
 	}
 
 	ret = ath12k_core_init(ab);
@@ -1367,6 +1399,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 err_deinit_arch:
 	ab_ahb->device_family_ops->arch_deinit(ab);
 
+err_free_ext_napi:
+	ath12k_ahb_free_ext_napi(ab);
+
 err_rproc_deconfigure:
 	mutex_lock(&ath12k_rproc_info_lock);
 	ath12k_ahb_deconfigure_rproc(ab);
@@ -1409,6 +1444,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
+	ath12k_ahb_free_ext_napi(ab);
 	ath12k_hal_srng_deinit(ab);
 	ath12k_ce_free_pipes(ab);
 	ath12k_ahb_resource_deinit(ab);

base-commit: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33
-- 
2.34.1


