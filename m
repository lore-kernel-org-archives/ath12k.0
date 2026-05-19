Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8A2CD4F57
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeEKpg4+swANGEXGj1FSmAom3Yj6pHYjgmmzTryEFr0=; b=Vu1YjIkxf641XEzgIQeZyQU1Q1
	DlDF1SyQE6cwLw5fcztYO+B1HFU4AqYu3IFI4bhVjs1MYDYbU2W4XtBBCgJjpHbHUE7yF6h3y6On4
	kNwj46XWwLmWqP8iXIvm0H39cp3GD5f09Ff07Kc0Ud7/kbeH+wkK5XLyjtER6PY6Esb3a8gdZH9gZ
	+yB6I0lEjZm7ePsLTHTHFCQxVTWWSsqbUFPYhavNsnFQo/iQ0V4E2+4F0tY8hE9rJfLkR0qvpSYUV
	zyRi3WE2TVds83EPMDZSD9xf8G/uA65ZaK3/C8inFzENvFSEQNq8SI7Q49v/fmePgHfqmMxkI3rJb
	93uo9ZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94Z-0000000HLCG-3Gpw;
	Tue, 19 May 2026 01:16:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94Y-0000000HLB6-15g6
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:16:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ILwEEO2891748
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QeEKpg4+swA
	NGEXGj1FSmAom3Yj6pHYjgmmzTryEFr0=; b=VNKsHQU4zJm5EWQw34EbTAUXOBY
	UHt3VF69O3lhmzEQ0CHVLtIon8QOgeUw9lmTpbH8y5fY9gqSAinepXCB5ARxpXkW
	RofDFOBiV6uzCFSFPz2IfvKbSwlpdBpvgeTPfoqScF/mhvDoLk6Pl9rvEuXU5C/p
	j+TsarAgeb5unkDAL1Dd1clykBJp/hVv6k7p89SWvol8p222m1EWhL0c7aaEVq+S
	dLtnISzIFaBT/DfhUn1Uc2GRa25YRxBflC3+s/9Ft0g66Oxm0cW04zL+/SsbkXVi
	k39hj3Nq5HL+VveprkmNahMqYSS8CNCeosNMeuqE0YSDFCIK1Ny/0sLewiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1brs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so29429345ad.3
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779153397; x=1779758197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeEKpg4+swANGEXGj1FSmAom3Yj6pHYjgmmzTryEFr0=;
        b=GGlSFV69SftAWOUguc8ENQ1yET6OylpYvYHPuzkc3hWL8Ds9EWKsZfId6U8qP9hRF0
         4TQNoInz0cYwJcNzABZioS+m8d56mertHpbrfWnjRRr46RK5PAgRq3Ll3NZaWrk5eCid
         Tg54tPnMvXYmq8uqOhlTcUlPY+uhHQ5WUPEI/B0kPhG89p7XMT4MD0ftG8vNvqI2Idjw
         PsZQvnV1r5HXuP672JApMuLeR+Y0c6Jh0EDmUBapIcIufipGAMxkI6uxLSeeZjAT5B8r
         yEqMTBmWvNGQUPJ06qY3jyoevzwVnHLpm5brd8t/dpuy8Ydvzns6aLCKZY46VtSjZAVu
         QOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153397; x=1779758197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QeEKpg4+swANGEXGj1FSmAom3Yj6pHYjgmmzTryEFr0=;
        b=aDHslv6ejLBCw4EdrRs/AqFaiz7nahwmf4dW/ANaYfQXcUAsSDEDqI9iacaPfWTyBe
         auud8HyfSKnbjqkhAAT0LXdSg0DpuQ2ZuOTM1RGMNHnRvDAdpNztIBHXSAYdd1LW10Qh
         N4datZmdbSnOSQ8jxXUx0CkzHRumAIKeBmEsuJ2r/PhedWtii+otbJZDhdfYMdlLDkIJ
         w6GNCj6m7VNsgjowTC5QZkPCvum93lhNJRHywQ+34PdPbGUTP/HLc9TlWMCVv5LaTvYa
         1ZzkFjKdiAr1UvkyLsU7NIewGuGXNn3sOslhMVMc+JYzxmOLTa7EUuaab6DRbgBP8DBV
         y9yw==
X-Forwarded-Encrypted: i=1; AFNElJ+f0E6e76enGO6ZxOGT4GX9ehYpCEUgo+K/pugZX7hr9fac64T/LHPWaYaUyIB7NQGZW0TT0Kk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4XzO+0FEqRHsp+iiG83RYsUufml/o2yf2FO960jNx6mCR4Tay
	P30J/yPJcShEbaew6zSMvCS4emJu03Q4yI8W9makeKlofgTvYFIGlu379jfSBI4R6EGzGFEczPN
	OkkH4W2wFl3H1bwVNIr858uhHYLAenqoAB59TQ+UI4tRDuo9QSYU4zrAnIUP7E/Xx
X-Gm-Gg: Acq92OF49udGvCcpv5zZa9NOvkjweVUrhpl3C3bND4EJEAk0Qk4zA2BvWlo38PN9y73
	lVZDyyoe00yTI2/UPCRaoLSg4+emsAvgi89guifJ6HmlR3DItbaE+9EHj/AqaxlxW8R2uq9zJM2
	Esq81JwBLGt6R5rj496UTGWQoRy3YTgve+C0cjZclnV1DSUHuQTx6XKPcfYKUIKUKUvBPWbULXG
	bFO/fyTpjoeuOxkBy3I6oAfkkFmGb+QzQMUBk5Eleyg46BOJtmTnzo1VHOkMHpOyKJiqjMgRb4y
	OEU0aP4BXVpqntpVHPK4NOesuT1NtyBRzJPYFtOd8LGl+mJKmGpRnLPAtV4LORaG6yJFK5Ghpdx
	8r11gEWylfJGbKmQTaW41iBxdUlSMTAeyV+5mpotJKaPNY9s9KIJn5LG8Gmtcff1wW0poc7i4dC
	RF4perYLh5MQ==
X-Received: by 2002:a17:903:3d52:b0:2b9:f55e:1c1b with SMTP id d9443c01a7336-2bd7e85fcacmr132809645ad.5.1779153397104;
        Mon, 18 May 2026 18:16:37 -0700 (PDT)
X-Received: by 2002:a17:903:3d52:b0:2b9:f55e:1c1b with SMTP id d9443c01a7336-2bd7e85fcacmr132809395ad.5.1779153396637;
        Mon, 18 May 2026 18:16:36 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm151727265ad.38.2026.05.18.18.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:16:36 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable
Date: Tue, 19 May 2026 09:16:27 +0800
Message-Id: <20260519011627.713068-3-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AWaWGMRlP4P2hjJlgvDjIk9muDoYGo36
X-Proofpoint-ORIG-GUID: AWaWGMRlP4P2hjJlgvDjIk9muDoYGo36
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bb9f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=--8x25ClVUTr5G9MgJQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOSBTYWx0ZWRfXxSLrdWih4FIc
 e6az5E7dQC2QMI5HKj2rcqb1lrHpmn8SDaWdYgBjRDO3MvmBIyANZLLEt8HMQU0J7Ow0y01Li8V
 lKjBUPQXIRdQzP59/IoopLV3bkoejFVSuEpsZ7T9cQ7eaJ8AApqKD8zQh6t3At2/t/hkLpKmrpv
 h67iKOec4f7HYmmuaTMIT+d1+sfQq0moA0obMy9azPLm31dBm+9nURWqp+UVPTd531dhNLDpnza
 2ty+G+ojXuOe8uxd2WFUGNzt3uLvDblmQUv21fGHqwnhR0HH/ooibf29Vkvaq++b9x+nqxV/0lO
 PtoSNQYIaQZBxda5FhINxhLCHxvIuK5P3KEVsVIP5VBIqc4zVmzFLvczMvynOkqTuw+EQVrrYpX
 qSXYHX8neUQq30Cgm9I82IMhKm71NS/MojFrILrCtpTgMOtsmY16zYZXBnAmfqm1A1cIStSmK/D
 VSHLvGhUlES4PY0k0Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_181638_295056_BB64F80B 
X-CRM114-Status: GOOD (  15.64  )
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

Determine threaded NAPI policy from runtime IRQ capability of the DP MSI
IRQ.

If irq_can_set_affinity() reports that affinity cannot be set, enable
threaded NAPI for DP interrupt groups so datapath processing is not
constrained by a single-CPU softirq context.

On RB3Gen2, where IRQ affinity is unavailable in the effective IRQ path,
EHT160 UDP downlink throughput improved from 802 Mbps to 2.58 Gbps after
enabling threaded NAPI.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 375277ca2b89..065449806ea9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/interrupt.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
 #include <linux/time.h>
@@ -537,6 +538,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0, base_idx;
 	struct ath12k_ext_irq_grp *irq_grp;
+	bool threaded_napi = false;
+	int irq;
 
 	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
 	ret = ath12k_pci_get_user_msi_assignment(ab, "DP",
@@ -546,6 +549,10 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	if (ret < 0)
 		return ret;
 
+	irq = ath12k_pci_get_msi_irq(ab->dev, base_vector);
+	if (irq >= 0)
+		threaded_napi = !irq_can_set_affinity(irq);
+
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
@@ -560,6 +567,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_pci_ext_grp_napi_poll);
+		if (threaded_napi)
+			netif_threaded_enable(irq_grp->napi_ndev);
 
 		if (ab->hw_params->ring_mask->tx[i] ||
 		    ab->hw_params->ring_mask->rx[i] ||
@@ -578,7 +587,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 		for (j = 0; j < irq_grp->num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
 			int vector = (i % num_vectors) + base_vector;
-			int irq = ath12k_pci_get_msi_irq(ab->dev, vector);
+			irq = ath12k_pci_get_msi_irq(ab->dev, vector);
 
 			ab->irq_num[irq_idx] = irq;
 
-- 
2.25.1


