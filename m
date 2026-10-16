Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273E0CCA466
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=gofo7FxD1ttGqorNRd+GkVrTfr
	l8BwKg8KnFOmpFy5eK8W+8qNK9qstkP6j8vY3HDnhIjDlWzyEYSETXZpyuZFlEHumV3y7+NLJpEyv
	/CJE7+PDc7DECsKsEXdwJwBl0XBQgOXGvmykzdjVEfKSaZEn1+CjjzbD6lTLXptpPP+MKEuC65KlI
	WsYGTzY5gQoexsaExYEf25/Ehm/YrPRiPViEWbriTlHoguJRu+29SOBzz0/xM4wcU5aufuclOLjTC
	aFfEmETOP95VkZvPgnETYrKFlihT5zWkmpqQLzGv213M/DZp3uhtSDiEzev7ukzuru25eplcf6H+g
	A02/50+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYX0-00000001puX-3O04;
	Fri, 16 Oct 2026 03:22:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWy-00000001prX-3UBh
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=bkaOFDETQJcj7euK1/KWTxt5WV
	OfaLW75Kns5Q7VfekW2SNymWw+HHorSXIO9TvKuipvgZdqRaBapJK0/LolncOQ4BhrruwVINebL0T
	GVD/1efYHYRse9dNyGr+Slix1NmYJaYUuh2iQefeoRD6GEBoezT8wfH+EkJsMYAM7PDs2iH8Q8+aB
	f5W+k4kP6m4MUQ01o6esUim68iHssenqnvUwpE7cVN48Ds6vmWYcktjIxfX7h1hVq/otb5WoBzPa7
	hfBtrEsfimYD2nyNml9RDrWPrWzB3ULxDzDYwSY7fdsJPz6ZrkLsI648q2+ir1tEvbvIbrtXZ/OSF
	SM7tEzwg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYWt-000000012aV-1aPM
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNg4ih1635423
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=F2bdp+6dnVv/KPmX
	skFLlY3XS0Wwhb/t7fbOS6GVZJ8qlOm6pPKgIBeNMiu0PSLKgYmPiA4Ww54aWeIf
	6NGrlLEYD+cgeolUaP6sNfHJ5oINaU+5ERsOlWKsjbK/D+1JmmSMjh9s2kOYzMp3
	5dtmyyUeGXY8b0OyMDszO097wqraPyelrFyBk9hG3XS8SzneWd5BKRlgh3Na7p7B
	HBTgEENceD3Y3FL/v8BcaVRL4WJW7UT7oSZBEn8YeHrKdjVPQgyNPd1CNDBH+1Sw
	pyVO+IwqPFkFu1UH02U+beY+MTbEJEZhRv/sUqz8Zr8BUUpFNBVx5fdmK4ISyq4w
	UZWGSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r10m39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10585114eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120965; x=1792725765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=QLu7f+pfyDDveBfuy4FpJPfEcgi+6QqT6V5DEwOkn9xrMMdjoX3EbIYuBvuoc6RNK6
         cr89CjEjA15OeknksBpJCQNVG1B633XExbXLm2T2CPAVBCCH/pJ2AqfAHAxkulzdc5jr
         l0J0a1fI4gvyMy+gHAvOX7UYp0N2HRy/KP2SXXQ7LsNp51ZC1K3xoX432j7AThAh7aSs
         5h7KobdiiycQF5MpG5c9M++FplGdX4RxWnqDrTEi5IAGvbxXEBEenesRd1/SnVzBDgxg
         UbLe0p1Rf23EpyNhcSoc8SJofmlHQa2QakUISistmT86evHyKAJxi1sribyQ0cUjQtXw
         Tp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120965; x=1792725765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=FogBozhn+jnM/PcnOOuZttNh2EvFgkii11bqPPVs54Oj2VWOBEzClbhG574NSeb+78
         bhessHFYB0z7oYS6rMKgh7x97WVgDKIG4rxkvsisWm/Tn5kXvDJ+VVExd2DEN6SunY/M
         fkZvkRLBk/7NHnkBuTHaJr5GI08YMO8GoJTtMfL5FY7S2iOfWW1jsLhkbvipYBrDhkGp
         7FaYKbd2H5Ml6YgcJCxMLjs2U81h4MtjHCXgmvXm2rB9BPwupVCQ4lKoFcOVZJoRjCAV
         kx8Utpe5aVtcX6dEroJIeP6tCSoLI4BrvkMTgLxDa9+r/XIoAwvzfisrQdQLpVmk/prX
         16Sw==
X-Forwarded-Encrypted: i=1; AKwUvBw3nyPASwmUWQyrD0FeFyY6hO0W0TOAslhp4Gr9NKjIB7W7pmCsQeCZTNQ7tyb/AMsmWwWtf74=@lists.infradead.org
X-Gm-Message-State: AFq9FYJuTREbxQIRkl7CAZt6w+hNkrx2AD/bHJmY0DhmoKdcGSAf9BU1
	Y1CQ2hTMJklfUj1LdvKQQMqc1rRH4fAKXMC2ZeUdILj5UASKkTgzGjbvyuq60kCajIs5EIN12np
	05TZ+5buYhC5DC2WIvv2TWD2YiOR7VAWcRynHpx51CCkwGQKsaWf3aJLzYI8i2DeX
X-Gm-Gg: AYBFou2rCGdM7h34sjivIXa5opUr+HMpOIKFhyC5/ClZumdo56sRCnKVvogysFv+d3l
	WMkfRcNOdq1NRDeew9EAm7HH31DTO7r9+i3Uoi2Xcuf+mhS0iDu+zYASW7gzwNYWVeexIkGCeuB
	DV0Dk6H+FOlovTkuoIN2c8tFAHPqFQ5tIobXyrpWbWoZMvtsdWSPsEK/lA6I+WtWzsieZRwEjEm
	uSOd2Q9gaDi77FaK3VXYWTg4TrGAfwrTmN9C+GKD2OGAZjIv20oK+yx0xgE63cFm5e/LUB/qJu5
	a9d6UxCMPWbfE+pG/m6LMJ5EVPmRMNHn8gQgGxMnlAuiS3/BYP+yunvfMQt2oEsv5xVLBFnMfkQ
	ONB2BGMi/krHnMMzKhqFG3UTGvn8nb2a0jeSbPaPsr4ye5gyzcNBV8xJSzsV1sgAcvK5DJmmJW/
	Gzp8SFMtLU7JEkKQ5971R3Ug==
X-Received: by 2002:a05:7301:9c91:b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-35f8c5d5bc7mr4168020eec.30.1792120964688;
        Thu, 15 Oct 2026 20:22:44 -0700 (PDT)
X-Received: by 2002:a05:7301:9c91:b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-35f8c5d5bc7mr4167994eec.30.1792120964106;
        Thu, 15 Oct 2026 20:22:44 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:43 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:49 +0530
Subject: [PATCH ath-next v2 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-12-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: T4b3f3sgy-dM_P3wcCd6AiIheIcNL_AH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX7mqI0Dt+0cEV
 6eBi6Vz4Ko8xsHUe8ZHGtwdrxCXZ834whbfe2740fChTO3f9f2dCHHxzP/t5C1X9sf8AjoO90I3
 FFQMaTrMl6cT9s/dKzjIWD0yuo7e9uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0uE0GK+SRZS0
 vRfaYLQ9cpqhSN5TsPAXKqmyFuWvg5FWalt4L1KHhITXtAN5Zo7jhMcjC7QKNeHb1SvyGPM3Rs0
 mwtU9uJOrucbWVKn2uuZIRXMKp/czoxZLUZADC3NAWMQ8D8sR6jQ21k7myYHSyJIaInqTwbFFD1
 Jry0DVO9mB/kInpxQVqEGdZweJt32x+JvFrqSE6jGNfu3ziRpm0EDGtAxhjt8HB8pdMurSTvqkx
 T9jk3sCm3To+XkFkwXngaktb8hmZEuTvf+Zm6uKiUSEzC+LONHIiVsYOR5fxlPP+cXgDJrOxn8P
 q1x8WYyMQJ8j/LWFH+z/ogdx7nKfv2ed2JIMa4tvMgyaTEQxsJOBZgGHOpIi0l9U3QDMzGm+qBf
 GMdSJhtYa4lT+7bz9c7sKWP8GeWQ1LJUOeULDgApQXrgHuYDHMm+BuML1yLNCTRvTcfJDFMJOqC
 Qm8oKORFM7qtFfGuo1A==
X-Proofpoint-GUID: T4b3f3sgy-dM_P3wcCd6AiIheIcNL_AH
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad19885 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BHcOcFGZyyTdvy3InMAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042248_078645_F00258D1 
X-CRM114-Status: GOOD (  22.36  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Configure and request external MSI interrupts for DP ring groups on the
QCN6432 platform.
Create a NAPI context for each active external interrupt group and
disable the corresponding IRQs while NAPI polling is in progress.
Re-enable the IRQs after completing the NAPI poll.

Handle allocation and cleanup of NAPI contexts and external IRQs during
configuration failure and driver removal. Also disable external DP
interrupts from the AHB IRQ disable path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/pci.c  |   6 +-
 drivers/net/wireless/ath/ath12k/pcic.c | 122 +++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 21332aeb0c22..bbbde9f05ea9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -165,6 +165,7 @@ enum ath12k_hw_rev {
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
 #define ATH12K_MAX_MSI_VECTOR	32
+#define ATH12K_EXT_IRQ_NAME_LEN	32
 
 struct ath12k_ext_irq_grp {
 	struct ath12k_base *ab;
@@ -175,6 +176,7 @@ struct ath12k_ext_irq_grp {
 	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
+	char irq_name[ATH12K_EXT_IRQ_NAME_LEN];
 };
 
 enum ath12k_smbios_cc_type {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index a26fdb3c0ad2..4bb14a95aec9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -348,11 +348,15 @@ void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 	for (i = 0; i < num_ext_irq_grp; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
+		if (!irq_grp->napi_ndev)
+			continue;
+
 		for (j = 0; j < irq_grp->num_irq; j++)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
 		free_netdev(irq_grp->napi_ndev);
+		irq_grp->napi_ndev = NULL;
 	}
 }
 
@@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		if (!irq_grp->napi_enabled) {
+		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index fea284c3707b..13097cdf2794 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -181,6 +181,113 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void ath12k_pcic_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
+{
+	int i;
+
+	for (i = 0; i < irq_grp->num_irq; i++)
+		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
+}
+
+static int ath12k_pcic_ext_grp_napi_poll(struct napi_struct *napi, int budget)
+{
+	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
+						struct ath12k_ext_irq_grp,
+						napi);
+	struct ath12k_base *ab = irq_grp->ab;
+	int work_done;
+
+	work_done = ath12k_dp_service_srng(ab->dp, irq_grp, budget);
+	if (work_done < budget) {
+		if (likely(napi_complete_done(napi, work_done)))
+			ath12k_pcic_ext_grp_enable(irq_grp);
+	}
+
+	if (work_done > budget)
+		work_done = budget;
+
+	return work_done;
+}
+
+static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
+				      struct msi_desc **msi_desc, int num_msi)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ext_irq_grp *irq_grp;
+	int j, i, k, vec_idx = 0, ret = 0;
+	u8 userpd_id = ab_ahb->userpd_id;
+	u32 num_irq, base_idx;
+	struct msi_desc *desc;
+
+	base_idx = ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
+
+	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
+		num_irq = 0;
+		irq_grp = &ab->ext_irq_grp[i];
+		irq_grp->ab = ab;
+		irq_grp->grp_id = i;
+
+		if (ab->hw_params->ring_mask->tx[i] ||
+		    ab->hw_params->ring_mask->rx[i] ||
+		    ab->hw_params->ring_mask->rx_err[i] ||
+		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
+		    ab->hw_params->ring_mask->reo_status[i] ||
+		    ab->hw_params->ring_mask->host2rxdma[i] ||
+		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
+			num_irq = 1;
+		}
+
+		if (!num_irq)
+			continue;
+
+		desc = msi_desc[vec_idx];
+
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto fail_allocate;
+		}
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
+			       ath12k_pcic_ext_grp_napi_poll);
+		irq_grp->num_irq = num_irq;
+		irq_grp->irqs[0] = base_idx + i;
+
+		for (j = 0; j < irq_grp->num_irq; j++) {
+			int irq_idx = irq_grp->irqs[j];
+
+			scnprintf(irq_grp->irq_name, sizeof(irq_grp->irq_name),
+				  "pcic%u_wlan_dp_%u", userpd_id, i);
+			irq_set_status_flags(desc->irq, IRQ_DISABLE_UNLAZY);
+			ret = request_irq(desc->irq, ath12k_pci_ext_interrupt_handler,
+					  IRQF_SHARED, irq_grp->irq_name, irq_grp);
+			if (ret) {
+				ath12k_err(ab, "failed request irq %d, for group %d : %d\n",
+					   desc->irq, irq_grp->grp_id, ret);
+
+				for (k = 0; k < j; k++)
+					free_irq(ab->irq_num[irq_grp->irqs[k]], irq_grp);
+
+				netif_napi_del(&irq_grp->napi);
+				free_netdev(irq_grp->napi_ndev);
+				irq_grp->napi_ndev = NULL;
+				goto fail_allocate;
+			}
+
+			ab->irq_num[irq_idx] = desc->irq;
+			disable_irq_nosync(ab->irq_num[irq_idx]);
+		}
+
+		vec_idx = (vec_idx + 1) % num_msi;
+	}
+
+	return 0;
+
+fail_allocate:
+	ath12k_pci_free_ext_irq(ab, i);
+	return ret;
+}
+
 static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 				     struct msi_desc **msi_desc, int num_msi)
 {
@@ -294,9 +401,23 @@ int ath12k_pcic_config_irq(struct ath12k_base *ab)
 		goto free_msi;
 	}
 
+	ret = ath12k_pci_get_user_msi_assignment(ab, "DP", &num_vectors,
+						 &user_base_data, &base_vector);
+	if (ret)
+		goto free_ce_irq;
+
+	ret = ath12k_pcic_request_msi_irqs(ab, base_vector, num_vectors,
+					   ath12k_pcic_ext_irq_config);
+	if (ret) {
+		ath12k_err(ab, "failed to config DP irq\n");
+		goto free_ce_irq;
+	}
+
 	set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 	return 0;
 
+free_ce_irq:
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
 free_msi:
 	platform_device_msi_free_irqs_all(&pdev->dev);
 	return ret;
@@ -307,5 +428,6 @@ void ath12k_pcic_free_irq(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 	platform_device_msi_free_irqs_all(&pdev->dev);
 }

-- 
2.34.1


