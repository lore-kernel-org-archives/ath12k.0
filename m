Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E477C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1hyIU0VPAzTAC7wOt7yHN0zXh9gRTdD0IkZMzab1Wo=; b=w30pX8KQT6p+edBmrX3/LOTUTU
	iJYcOiA7ehv0uSvaxLCc0NNvBO8lXGwg9ba770VwYZFiLHzn+1H1Pc22i8DjSg1zot+yVYqbIqTpV
	/HXUomKqQH2hINbFfSphZDr8/ujeBhZnOdHemHmhKDdrOtEGmsRr7vhGNtgojP7LShPNu9MtGNKzz
	gtrRlkD/mjWqmPBrXGWTQ4qcFRe7DKjYcUsJ/ygAj3NDy5xJYwm++aN5lHGkHHyBn9Go1RiZA3j9C
	PxA39BrD4SRWNGSZor6AcxjF6WO3QZdmCgDfx2aOBzm5/5KKxLE5dHw0DK5+TgBK5u/6V3CJuKB7r
	uCtQLQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCI-000000098P3-0Fgy;
	Wed, 19 Aug 2026 06:54:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCE-000000098OQ-44sb
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 06:54:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z4Nf026729
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J1hyIU0VPAz
	TAC7wOt7yHN0zXh9gRTdD0IkZMzab1Wo=; b=KaNQYbtHHun2jBV5bmoAq6RhP3K
	SAd6KzkNVbbw6wyiAuF4Y4ePDHrCFqgFf+umIb9LIAXBe9x1o/5Un9rSilb6ZSdS
	ekEiGZoRxOEK/tU7/GzkdXQXHXATRNYCSmCkjE2kA2CLf5oKy2rYRC5WxOzBdbPf
	8vUHbHtPVDFw+DFIBMgrfrKPNFf/aEGT+wKvLAhZSqkkfwzvTC4hibayo1yzpLzg
	H06BIauEkXSEGQfAZOsfd+fGH8VdfxH1afWcIUeEwhZoW4x5eoNY2Fk0x1JWUJFA
	WYh0sIZIqnFHLqCgGehhsKyAOECWH3o/Te2sXdTaYe4wSi6OeCF+dx509IA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpss0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3954def0191so1367893a91.3
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787122485; x=1787727285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1hyIU0VPAzTAC7wOt7yHN0zXh9gRTdD0IkZMzab1Wo=;
        b=YIh5jnmek9q2f+cfFV9s88JItUf6SmHzXUx5Bh/mdlCofLazsGuB6xi0jl9BavNTBM
         p2E5UAZ4FXEFEWVHbDVtEcC0XHDBISqgYUGbFLOlHApToqB7lib22UCwJEavWtUIzKDv
         dlTQp2vHC8EB+wpO8ehBawrzJ3lhWIOFOa6xBlo/On1c3O7u8WA+QK77VxWK5MpzIoCC
         xPdo4oIKijXymYPEOnmLSd/6+EjDv8LrncZE87eIurpIsBVcr5kVW8ax0+6aEqbykzBI
         8aNjjnQChm3HBrEfjZHNSyPAusFBW/x6OrIaVug/4lQJdbBD3EUoPI8C5jZQmDZb8wn0
         3XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122485; x=1787727285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1hyIU0VPAzTAC7wOt7yHN0zXh9gRTdD0IkZMzab1Wo=;
        b=R3NldIRitH3PohqjcguchElmHyddkwmf6+8ZstAFrocPqSvLtB1Q+4anB6RcsC4Z2G
         7BBEGb07Yb9ZeEXGAtwY7b4qkKtoM+73x+jkTB4Cm7zSBmO1UdbAYnPnbme1Bit7cCam
         zEcF0FW1Da31g5Ymfu3Hf6tjM5/KIpAqY0t6/k0FPKtr3PjQexzPad5SFqTaGi8ewH33
         bWwXQimTdWaM1dsGbRLns4pnA4UH4oHjKVZmJ3JhB3iGq3jEjSaTMcYob3x6rPhT+744
         uq2MLd2gxo3vEFzm6IejRc+7I/523ZNTzZSip+pSTp5xMpU70PQ8S+7TQpBpv6Ca/sDG
         lkMw==
X-Gm-Message-State: AOJu0Yz6Nn06b9uMVD3nlMC1A6epV4MIDMx0zp0Dk+39gUdUqd3CXcLu
	xFEDl1rrl/bBpC1p4KVWSQq17TqB49/njEBtRp3w0pP5fxiJc6NvFuIgE3iiOa49R9Ww40WT3/j
	ZvK0KRmIb9Aba8ycdokdD0MFOg3nJcON4S1kWQIAddykIpWBQO98JMb7dKgpZOUKhm/9wx5/Q
X-Gm-Gg: AR+sD10pZWCfBVmIWZU8FKUdQlOsBqy/zzWu+vOwNOW/4i7vfh5uY+ELz688ybR3W3S
	kQvZf0hRNA/VrjRKHINBpxzJui+Iy1RYzknHwXalNKqKENWexlwhZsCurYd2evbK0N5FYYFVAe+
	iUgxOk3hFs2jLC2YmVfILs5/1OF9MYL4M4k1DTNdZHOInUALBaM2TjALK3c0qu9HNKwoEnD9fXe
	qShYKdMWvDaH7gTLur9BUpAzf2VuQwnN6F3jo1sfDA8EnqVx7V/i9Aqbbj3/8ZsOt8j1kYfREeb
	Tz4UAITF9Lm3xCkiZwN0+MC5C7dhPus6F7VwLxMfymVQTi1MVRYfLUI9QdvtSRkwyc8fqKKRm+i
	VqB5vm5fWhJxS4WbkLMNyK0BBTOZedI6NVdCP/y7SQhsJdCDOwSvIaAOZAoLQAAIts0G5EvR9AG
	aPUVPIY3z09jilet9unKyz+80=
X-Received: by 2002:a17:90b:544f:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3958108a4b0mr4652389a91.11.1787122485557;
        Tue, 18 Aug 2026 23:54:45 -0700 (PDT)
X-Received: by 2002:a17:90b:544f:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3958108a4b0mr4652327a91.11.1787122485115;
        Tue, 18 Aug 2026 23:54:45 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb4ffcasm1526626a91.6.2026.08.18.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:54:44 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Free allocated CE IRQs on request_irq() failure
Date: Wed, 19 Aug 2026 12:24:24 +0530
Message-Id: <20260819065425.2044186-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gySToFXWqpgHWidpWVJWMmOtnovpshqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX8Hx9hEUBQ8KJ
 6VPIFy7+srA8SPwS+Rk2U1UGfV2AJGB5agtt4FmqfXxYW8bpdbk/Xf3kLGkgjUTj3CLVhEVj98X
 Bc2ewOYBlLrceuQq9kHc4Ow2j25UM8LU5eRoHEXOlpPHGhAHzAdUbnEAzi2EON27e8Hsp3cjDz+
 rn4zNecZyTXgkwVxKxE2OS6WnW3rs7M6V+F8u2Ls6LustqIvvOmozUwQQRCs5NO7MybdH0w59ck
 1Kl4wbLF1wtg5EN4CGQfeL7ESddL6plgFak6mwZ19H/nMWw+eHOLWRGhx0TjE634H8xPk2U0dTD
 5W11wcMTInBvu49p8hT+AEyHOBiRHt/TPhKg28sSmD9JF8L9frXoSZ8iNt0Zu3mzOuPA8PcsHmS
 hE+GO9AdNLt06dQZnV9cUzev2M5QTuf+8kAZs80fqFpsT8GZVl8w/gqrOX7oH5Q7BX8QkGf8fi8
 YyCzXzFJdTa5/bpC4jQ==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a855336 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1B4byUU5Bt7BwlcAXWAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: gySToFXWqpgHWidpWVJWMmOtnovpshqt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX9dT6LonD5Rzv
 kgOOe3ZioqLKWhHFrTJyQRzp+aWPJby3T6eLHJmkORwTog5VebskP2X3Ku6oVt+XYoixfO/+yC+
 aKmUTXLChKIcFJzDWpcIe5vxykchtTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235447_404823_5866FECA 
X-CRM114-Status: GOOD (  15.19  )
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
index 6441927b5382..9a78d2f69f94 100644
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
+		ath12k_pci_ce_irq_disable(ab, ab->hw_params->ce_count);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


