Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A10C5DF86
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyKJFYkmHLmxJynjjYLpBWykIurLQKwlcGxv2Quzm+w=; b=s/1oFctHBYaEuQaQFSs86Ao79x
	J3OsD39b4mNj3JwhGLo8D9nGfeW6uYrhve4UX7+kz6e0k8qAS3GHKFuim4cEE3nS3xyZoBQWQbDFX
	N1ikCqm2p+kFLUBi6LpIlSuhvKGaKHn557aZl7uauI6H0NOUKJFWTL7SdVYLGfhI50G2GUJDYNJHD
	HnKj1igTuASFk5WOcdcd/Poh1G8hvBYnXAstCHEE6eHlU8maLOYao1yNQUNgY6j8/NKVaDhjvbiHM
	hLVY27NPRl22ugI11uNgjB+XTNzfdGolWmYIvCep7+WCVFwN6e8YtrAU4uORtH1Ta4EfXHnAK3GWn
	F9Hkqdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe3z-00000009bWh-0Bpy;
	Wed, 19 Aug 2026 11:02:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe3w-00000009bVo-2Wha
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 11:02:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7PFP1018947
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vyKJFYkmHLm
	xJynjjYLpBWykIurLQKwlcGxv2Quzm+w=; b=lidIYC0BxmoX6Y863sxMn31n83E
	00j3ycH0zFDq8NhUp5AHAaI2sM6b3G3C5scGLIwsDPxpdHJaH9HqOwuJuJUnwSbt
	NAKPdnw6uozEYiAXkTTPiz+9ZlLLbbRYl1xxWYQrf19VmUgIVyVx27gr0m2fMHtj
	P4AS2uqsI296PUObZ/QoQTTDZJRDr2l4cifmwx+OmZ96IWOVg+YRPBkCXVUz9Mgn
	OmBm4DRdpZaRvThtnjHX+0eyy2JkwGEXgqPcbeqo12Jaf2Qi6abN8CmuuXWE7N27
	OIGDtSccG5z/fwstelpqhLrxHaxjvYbgviBMpsJ7VZzMd5AvK6rTRXS6N6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2u4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1573252a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787137347; x=1787742147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyKJFYkmHLmxJynjjYLpBWykIurLQKwlcGxv2Quzm+w=;
        b=eRBVAOowfbMgRiqT6VpRiZpOUxsyREMdu36gyQ5izEyfM42aCPTdGRR8TuvivDD7Li
         OBjIf12yRlg2nU4Ttukgsc5hBes3VOvnuKxMMucBHozfIdRQZpsDxospYyO4LLGOikuL
         xTav2uMx0Ozy+nPB6YedChfrSBM4udK/duesJEr3Kts//6LuTz/B+eqwjyufihuyN4JP
         wk4FuWMvpffgkOVZqmehqKQ5J9cJbO3RJj9dvx9xUI7+oB6ajVzSZIiyNULHbUR4lDRq
         I928UYX41mzZxeE4E9/jZ2Hni7S/KdUmfpRqs+9jtSrOJlOqC2b3Hupc7NqY3BgU1/I5
         ZzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137347; x=1787742147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyKJFYkmHLmxJynjjYLpBWykIurLQKwlcGxv2Quzm+w=;
        b=MAmNXlqFLKvuhfXNTUbTnFlnl/yZFWhEYaiAZIWnffPvdymsyiRoirB4oZ2kytGlmd
         W5vRgateaaSlQV2Ul6evuxGSboLzTOrxyWOFN1lFfqPb+f/eVrD9HcWims0RltfMpggX
         0HGXaNUI/OdjBwJGSzZJ2Tymg9c07GrlXJB1VNUETsfpfOY1pNauPkir9VHApECuSZXF
         1GoOg1BOC1Sun0dedYaswPa7OUZaljevuR3HM2wXAkTeIL6l4DNXLlra+xJDfRxrD8Jz
         aIkYA1n56F0na9F5qmhSJyrHahC6Crwxb5g0adCJcKkcznv9BVaGbDVwSYaKcDfm7uV6
         XsOQ==
X-Gm-Message-State: AFuF++nci1eNj2HncR1l+IbA5aESjOvWXPKvIZAlmvM8LF6e+zDMdSYk
	dj1oxTATdWFAegCOMiFea9CAg8IVEhZZTBF/oz0Gbr6kLOMTU7z5UyrCEsNj2w/IYoNVL2KnlYe
	XwngrjWSbOSjzBXyV799MHaJzmcPe57D0T23euaPvxa63MckLJIr23berVTDRKzxIYSTasG4Q
X-Gm-Gg: AR+sD10CV2Q4YFFlrbxGbDHoQiuUGm4Xy66iHnWT/H987ySRLcq2HDbJmsd3yT1ygT3
	sphMLrVNVMMEixm14JISY+1/ebCesvKvzEupi8ClSyzeafTihaFahQr+vNrvUBBOWEgcDQLwYfL
	VOJRMMRNUFuhgZcNDfU+aznOU7dIfxBCBLLAtSzH6G3nebsKTNU81aI7U6UMU8vriSndutVnXGZ
	FqVLraSTsNWIVUckdl+wNv3eQ18E2ZfYG9pNo2QEMtR2f5Q3U2KUjj1ztTQGlpDlL1i0AKlWh/G
	2uYmPbXw6kFlWh3ETbmMWLTWNaWxpqfw+AwRbu/4Ib2QI2+sGXjg3Q/POtPx9h1VKsyZHGnzm8+
	ZbRKD+HzhVIGZQj+Tip+RH1snw2Ye//QXxDEEd5eeBo6vwmtgFzCrCNZantD8vEaEJqvL1zYezf
	v7AUxHd39oTBF5S5bLOCRPuRQ=
X-Received: by 2002:a17:90b:4e8f:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-395810844a8mr6468168a91.10.1787137346977;
        Wed, 19 Aug 2026 04:02:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-395810844a8mr6468024a91.10.1787137346411;
        Wed, 19 Aug 2026 04:02:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb30541sm2223640a91.13.2026.08.19.04.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:02:25 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: Free allocated CE IRQs on request_irq() failure
Date: Wed, 19 Aug 2026 16:32:14 +0530
Message-Id: <20260819110215.2485514-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfX6uq19knwD+id
 C+t6BcqMoxJ5JMzxa1i8krFLhrrbUtozvbXNooPDVYvxeRgR97oRj/qwf+TFDchHt2gNWkUHTHJ
 ufm80UN3sGWUOLFwEm2o6MoSq1knxqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfX2LCcUCKxWuZV
 busnIoGieS9prxvOfgIyPk7is6ONBnc/a0CZTB5tLg+I1j0Y2sJkYSmM3jToDk99wGMSfEprRuh
 ZBZ5N4TKVtDMUu91CY5RN4wQJOqxgW35yJMZ4bm5kM+uq8sPEecT19HQVAUVwwsvXtul7EilFDN
 rqjq58diaDYye+biHMNPWYSDTX0YYmXs8HwWPGxzuv8bUeYGfC+dv6fyFKx165IF4FcAmnkD7Ms
 4fZJOuYvI0BoNO4NC1EBLJL4DVpOIb7HM4GDCPT1icsU+zjS8sk6x7/7/1KY4gZLfh73hAEMKkY
 gYDwsc1vylCXlX7ggEMuEPa5jXx1tV/Dy/3y3Ztr0GORFb+WJI3k88P1EKaIonLNUeaBYZ/RK5O
 wAL03ZajYPcO8akRj/AZgacXmeOTFRQBvukR8UVwpoDgrXGE9rT2mL1/VNqmooL0/LOIf4T9Txz
 DkdsDX0WtY+3ZNRcnOg==
X-Proofpoint-ORIG-GUID: A1hKvLHy-Manlmk2yzf7wOgjqNhkB2Mi
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a858d44 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1B4byUU5Bt7BwlcAXWAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: A1hKvLHy-Manlmk2yzf7wOgjqNhkB2Mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040228_662968_AC594E4B 
X-CRM114-Status: GOOD (  15.33  )
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

When CE IRQ configuration fails, the driver does not release all IRQs
that were successfully requested before the failure. This can leak IRQ
resources during probe failure.

Free the previously requested CE IRQs before returning from the error
path to ensure that partially initialized IRQ resources are properly
cleaned up during probe failure.

Factor out the CE IRQ cleanup into a helper to reuse the cleanup logic
during both error handling and driver teardown.

Also free CE IRQs when external IRQ configuration fails, before
returning from the error path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 29 ++++++++++++++++++---------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6441927b5382..1525e6866cf4 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -313,6 +313,19 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
 	ath12k_mhi_set_mhictrl_reset(ab);
 }
 
+static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
+{
+	int i, irq_idx;
+
+	for (i = 0; i < num_ce; i++) {
+		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
+		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
+	}
+}
+
 static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 {
 	int i, j;
@@ -330,15 +343,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 
 static void ath12k_pci_free_irq(struct ath12k_base *ab)
 {
-	int i, irq_idx;
-
-	for (i = 0; i < ab->hw_params->ce_count; i++) {
-		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
-			continue;
-		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
-		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
-	}
-
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
 	ath12k_pci_free_ext_irq(ab);
 }
 
@@ -671,6 +676,8 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
 		if (ret) {
 			ath12k_err(ab, "failed to request irq %d: %d\n",
 				   irq_idx, ret);
+
+			ath12k_pci_free_ce_irq(ab, i);
 			return ret;
 		}
 
@@ -681,8 +688,10 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
 	}
 
 	ret = ath12k_pci_ext_irq_config(ab);
-	if (ret)
+	if (ret) {
+		ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


