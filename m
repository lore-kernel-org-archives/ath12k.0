Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B01CD98F2
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=; b=RjH9C0F/Y0vrVBhbu4eXtoWDla
	3/6Z22dlovBDFN8tOllZj4ali8fWcKBN1gLtNVIbjQ4Psl3LpKbtfZCRy6MH5Y9YErNielSk+aYSh
	0miCCt8ETT4B+BWMOn7ExXeSTlK61rHYRe7kozdvFrzHp+EyhHT/GclCVGotQdRaH2kC83fKOca7h
	z8cW842CONjFHKRaTMxTnM2MkCSWHBbQ+08Yr9LZpknDLmCU/P68Uf5gX9MTX8iE5sGruUm9okF0L
	BbFZNP1Y9uh2GoOO90nS71maPn5v8APLavWjJr0PhgFlidVbFOf6/XFpJDbL0aHmI46k0cuCFGWAK
	ukklMbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wK-00000006Q3Y-1WFr;
	Tue, 23 Jun 2026 14:17:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wF-00000006Q2K-3Kti
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 14:17:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZLSg4017099
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6
	JwUIS9lw=; b=BlPW4reykkzhCcTaouJHKL40SI3XmaatmqOQiNPkm5HHY4Og/6j
	Coev/dt5js1torALL33PL9p74RoJCak/BC9ldI2D1C/uZgbatHEZBgm1fOW1Zs31
	M1lRi9pbXffMhH65omXEms5Cb2YGnHY4UWPXLKD9oImOrQw97Tu5kb2hg3F/zaNy
	aRDWgDOB+IK6aH0StpaadQLpuu7AX94i+UVbKuoaNb6YhSxSx5rhWkULKVHZ0t/1
	4IzGwh3rc4/ILMV0SJPAvZDNMtsHzbcpsq1e+Jm/67G8KnSX5FzIzreLa6JIahpj
	GCpeUeYtrzBD8xMF9B5lnPMhsrlkJ0xgkeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjqc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so6335030a91.2
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782224238; x=1782829038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=;
        b=CrfA6t35Lgcw1/Mmi15PB7IP17lUZ74eNazRhUGj5z5TjpPc6UqT0o2cCWUK/XStG8
         +B/JR4tanM7qO/E0D36vnKaBB++LOHq2v0M7luO4ViPjrBzXiIq9rTTM/h/SfsZuj93P
         M6WUbq4yTYI+sHsOvkiMIBXV4ZnIQK8JhDe2XMK54YPpnlBdvm+fKqjSlYmze3j81s9R
         SBXIQEVkMnrTAXWFi8RVLjDEk/i4/oVCKop2COd+dBx+g8rESp6t7A79hxhUtPVqO5IM
         UEqeMkdi6LEO5BjWXLJw9wzYWXO5ZwFJJYKHW/4NMuq69BrQ99/aEhZap2l2qglREpK9
         EThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224238; x=1782829038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=;
        b=EWQIZTo+gD2lIcL6xgoyemWDl9d8+IRKd8PXOG++hEYJ/0+rp8jAbuMXgGuQF8MiQX
         2FMULYdpJQfE9swIciqLGfdWnt/e/lS1mq0XuJbJJk7CHsC9FFDkd8gyrTDDa9Wc0o8P
         ql6F8WLYwubev0C7jxfMDAkr9GDHsdpej8aZliA0oDBQ+DfrUfzPRT+UlwgGpZyX17pH
         THYjbRfRGE1G4Utph/zzAVguL/sLO+Pw13Wh9HGU0OeUH0n3wzyd7Tz3+jETyVss03Eo
         44rwgUlE9yUFMu/yHmq7ylCc1q32w98cA6+0B0h/fRlStG4g4F08l1VAvZQOTrpB0w4/
         QaWA==
X-Forwarded-Encrypted: i=1; AHgh+RrGor4Zgpn3MqFJ2MKaoh1EUk//ruZEbxNDfjSCh71gushyHyedX1nddF+6E/BYgnVs7zkpC5I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXZmER/u4rcmWkhFuMqBSQno/iTLozN1yq1E14cLEcKezzo64x
	Eo8NjHS8fPHCepkoL8HWSAy9jdOzR/xIxJaL2NjoEPoYM05L+FBM8YtaKEwBDN1Dgs7b0nAv6PS
	VLVAW8O1/BikF+Qcq7zwd4N68EIcPUnG9HUiJcVlsP0EPO1O6ZWJSbM9Aks6bb8je
X-Gm-Gg: AfdE7ckJtpMF+sxFZ4w3VyBUZCMheB3mVslXo6AHfOzhkLdk3GJAeNyc2PNPEwmKiqE
	KiaRQTgc5Xnkx5bO8f8K9S2j8HJNzdF3gtAwpM9NMCbDWbGhAdgkZwwk2iw5F0DFTrCvWO5G9F+
	2XvoRAeXnLjFAswYc2/McakjNOfb/k3dkmz3RcQW4wL/zfiobRTQPsOMmnPZ+andDaRYaDKTFhU
	ceeoNmLm0A1Z+WR9p3KAIAN6wMd3qoQX9P7VqmIR9bhZpNkfxVIjbhQsrZ3xTaiqld5L5+Hghfi
	7wzwTh9VXCdbJYCzXlfRlu8nT3CGslTRWOX1+Wb0c/PngZ/x3rq5uihcob599vFTsOqdmG4fbzb
	EyFTwVGTlNoFmu0UwC3WVgDKpPscGHKs8T86XZuv7+ifikT1HTKAKFgd+TzIj
X-Received: by 2002:a17:90b:1f91:b0:37c:83ec:1641 with SMTP id 98e67ed59e1d1-37d4d71d7d0mr14541722a91.5.1782224237759;
        Tue, 23 Jun 2026 07:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:37c:83ec:1641 with SMTP id 98e67ed59e1d1-37d4d71d7d0mr14541655a91.5.1782224237179;
        Tue, 23 Jun 2026 07:17:17 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.199.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f315842sm10094199a91.17.2026.06.23.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:17:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Alex Williamson <alex@shazbot.org>
Subject: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
Date: Tue, 23 Jun 2026 16:16:48 +0200
Message-ID: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfX1KSRGUGAF3wa
 R1RrvPwKUYAnvH7FYZFxNO06Q8Czde4oGldvnMdV9jWejgE8uS0KLLlRVUoyji/kc6i5xcL63/d
 HJotU0DF5qQ1gylSByrmhBnwtoVz8P5rkP84TBf2SFr3lLlPPE6v+1v/AbTRFUo9+yDZSBft4jh
 Y/RrvUpQm9ICmyVO79Ms8Ayu+hIrWTeiaaUVt9EcZL3f/1/AavEGoZ6MpwQtJiZgt2x7Wq1EMK+
 aHp0eMcdwK6181+fCVDpOhJWJEtH/2Zhlz72EZ1XmUEE6DPGN9eucqC2JtmxdkLBD1H5gmV6Me0
 QeM2BbYMiNwby4XwaIHPQXxYfh3hGlXwC4yniJJ9BONaH1uYIcM6sFnR11jxr/KAvjCV6KxLOc0
 ZTbPt7wU5TDhornoEzuh8iH7vprJD2ppw3fxSjy5Lmd1Jt9G5GnC7KS/rnQIUG0NNqnv1Hef+G7
 frnI+yGk8572W3BYQ7g==
X-Proofpoint-GUID: tveqNrk7kCHFGx7iK4irLFncnF2kpRvi
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a956e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Alb0JCXUjTgUeOUvUsHAUA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=b6JBSybIbF9IxaTxWo8A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfXxXqJcd1jyqEz
 R+/N+mmBdhc1ftdwL+NeudhWNT4ncKA44pLqc/ZL/+GSCx7ZRfICAa5mIs+WXZZ4wwCbaY40YEp
 0b0NRnK0dKKQVYk1wh3lEzZKG05VNpQ=
X-Proofpoint-ORIG-GUID: tveqNrk7kCHFGx7iK4irLFncnF2kpRvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_071719_940218_B3F4F56B 
X-CRM114-Status: GOOD (  14.35  )
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

ath11k_pci_soc_global_reset() tries to reset the device by writing to the
PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
that the write gets flushed to the device before the delay.

This may lead to the delay on the host to be insufficient, if the posted
write doesn't reach the device before the delay.

So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
before the delay.

Compile tested only.

Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
Reported-by: Alex Williamson <alex@shazbot.org>
Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 35bb9e7a63a2..a163168f3617 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -199,6 +199,8 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 	val |= PCIE_SOC_GLOBAL_RESET_V;
 
 	ath11k_pcic_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	/* TODO: exact time to sleep is uncertain */
 	delay = 10;
@@ -208,6 +210,8 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 	val &= ~PCIE_SOC_GLOBAL_RESET_V;
 
 	ath11k_pcic_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	mdelay(delay);
 
-- 
2.43.0


