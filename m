Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101FDCD4F57
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opKCdYGQQeXEl44WzwqwkN/2YDFGtLqnDNeag6cAjQk=; b=c1KaV+DUzWgaO8dIJjsiZKjyce
	oW49cpNkrUpfZrMoDjCEBCut9GCB+ln9IWvIAFoVmUG0xZRfvNIo8+wCe7NXmC1SGJ4cywge3CmaP
	UFl86oHxy2gXLLReDX7LKgINPtHyNosePzbntBAr/y6psc0qtzWncFX5KHHzltL/eFHx/zcfap0Fz
	A7CB90LbCtQ3E6hl4IIza5g3TT9J7qZKEAit4TK4k7eVJ1Lg6KYcjVqRhsdTeU1EjxjotZnuIXakW
	6dE0PCu2Fyj4RoABbVFNPXsBORiR/MpUGzrUSBPjKbSrrb/sMp2q9bawjV3VahdVybijVLq5UScfn
	NWwT2OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wL-0000000HKHQ-2gMl;
	Tue, 19 May 2026 01:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wI-0000000HKGf-1Huv
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:08:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGSMoY2091041
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=opKCdYGQQeXEl44WzwqwkN/2YDFGtLqnDNe
	ag6cAjQk=; b=mze0kJSRRk95yz+FiA1wMKRg8GeHFqaySr7XiaVdzfbVscIhsdF
	Io/5ltl16dTPdm73xq6oyXMNRPowVB6STSmDfzNJ+3cnsXc+bChgtZYTr6s1qxnr
	akoOk+BZBD5H71dWHkkOz9UM/D/XdIdKkI271r/QWC6bbI0LLb7+80dk56E7dG5E
	QjnCRc0WPXsvaiiMsGKAzYEELbv+FfItQ6z58zZO1VVDKJFgou77/3A5ub90Gyl4
	vcgD5cjgHfz07jad/iLbtMcd40diFpUFtzcZopQTrIFNSnZvPYkdkz1WE4Jp08DX
	/GLQ08BNd3ng/3/ezNhdtnHc71fclibjuIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpk1u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso1467334b3a.0
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779152883; x=1779757683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opKCdYGQQeXEl44WzwqwkN/2YDFGtLqnDNeag6cAjQk=;
        b=GOvbbunYbxc+x2K670PF9FP8fUXL/66l+kZh85565SvcAdANODXFYX9T/51ZZx+hvA
         2TRfkupok4/mDTi0JEFn81yc9tIQycnTfZc7SVpgZFBy1xxZeBwNStsHV9Xx/Zo+HLUu
         +aCX6i2RCTtJeaFtzexAdTomgQCJemq/ZjOOaHHEaj2xt9eu6W3l53gRQg14B83BBpbX
         9A6gWBgIWeruNoYJlbrSYigqXghWN/oHbm7YsVSt77vYVm6K1msFX5o3E8dykC9NBKtJ
         Er0al+udDbYCgpLA5UltMrSjgo8hV+VLXU072wm1RRYyUKTRZSATaEp+3V8aKiCcALoD
         tqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152883; x=1779757683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opKCdYGQQeXEl44WzwqwkN/2YDFGtLqnDNeag6cAjQk=;
        b=bOFzZcFji77tLLCyHv7x/OVRQQNPr0j45qfQmeXXxn89dKu9ZOz7ZJHPAbX1Pc/jqm
         RKmfZ6nyaoyuznZuZJMhIQtMgsyCVMBhIIkLetCTyzLfK8GqV2/fQYNnwl5j3Hfkt9f6
         6jm/lP07gkP1yxtV/uUaH46A8vCF103i4RIJRV5SV/Li62Pe/VycPE6BMIFtTMgZyxIp
         DM335iUoFemKS0roBcDh5cBSaia3n7eKVq4BEZ3P2sG/aRZHd7TKcVT7S5W1yZ0h95p7
         Qaj3Xuk+sZu5MgqYLpqoXj72yula9Ejj8vu9wBB913qlNY7NvibRkJ3zHw24ZSIjEzdE
         5muw==
X-Forwarded-Encrypted: i=1; AFNElJ+FgMcLztW5ZjnqyFG9+u4CI4v5rjAxW+Jb7LVTSNQjU9S1HF9Cq+jdC9SlgFZnpoJRagk+/RM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPLU23oHg/vpHlCn+2ocKHs+/gwTPr9LGNfvKe7S2N/CajuDBF
	ddV/YhOh85/ZtAaXD1hoEpYTmbUXbrohO8h5aD2mXgD+Lx2lXUDFMUwYWRMLjxgbjHZDi8rLyES
	fItGiLK43bGf6JtwPrXOi9QzSRHmKf9qtc2tF0WrAH/pU93Zx8haTDhZOEOmGjVtd
X-Gm-Gg: Acq92OF8qZ8ppmfakeL830cBMyds5rHVfIjcISK3ALwWE4xVQkB8BP91tfYzeQB6JP7
	naXMYy9jxhTwgfKv1aGuCJ4nPA/NxpZL8D9dp4YotPb7+yMtdKX/9sKsvX9DRqwSckKqC3RSHn+
	f7BQphTw4YCBhTkQSKSC8J/DL6zA2WaZyIKLZmDdHoJDSchBnCs5cOclTnDquclzEQJFULDpD61
	ZGyTa9UyMnfkce6jgzkRdIEY35b817mHukm8N2ajJ3Mm+trsu6lUEwDboxWVH1xHdywQPPGiT1i
	7ACmAx3Gm+NQUo/soGRT5D9x9xp4hUq31cFVnNCg6NDYcKfMNIdZdADVhkn71e16bsvdBOsrlpi
	SJHlVm+b+VBDCayfRIZgNy16wTifRbZfB2FD2s5S30qLhu46t5ckrlOyuVCI/M38FcRNtL21/bF
	Nlfyhi
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr17008262b3a.38.1779152883330;
        Mon, 18 May 2026 18:08:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr17008227b3a.38.1779152882831;
        Mon, 18 May 2026 18:08:02 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1942a83fsm16196793b3a.0.2026.05.18.18.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:08:02 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
X-Google-Original-From: Hangtian Zhu <hangtian@qti.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] genirq/ath12k: fallback to threaded NAPI when IRQ affinity is unavailable
Date: Tue, 19 May 2026 09:07:56 +0800
Message-Id: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7TL16bBjaurYNssRPXi6OWGdyTGzD2T0
X-Proofpoint-ORIG-GUID: 7TL16bBjaurYNssRPXi6OWGdyTGzD2T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOCBTYWx0ZWRfX5VL2nWn8haC2
 39eQDnOFAf2KQZYutmG6obpD8d4bfbgubKOMnwmzpted32cutqngPm8a45nvY5hqd6l3IWJHsZX
 WzJkAb8Ql9NCAhTCQMNWhYVCj85NVvH71VdsCXmQVk8u71H1IQ3voYkQ5Bu6tpF10yIDfBPpcsA
 6sHWaAD8I8cs5FbuQGTsb9ccFvhgqO9zHt8K+TM5vj4G38NxbhC/y/Rg8bfPRnOf7jfUC/R/V0E
 y9lM+taH4n7RnON+oYmO3k22p0iyiw64L10uFMxaU3qSQY8NC7jQ1Pmkx22YCDubVAXp0/Zg9uE
 /zrwB/GTIfv5jqG9pTz0dDlfravGru+wHztaG2V/fRHE5kdnAqYWjtIy62wF666tj+Ts/brjoYF
 g8egrdSQjVC78hB1lOdYwfWiYOjjseDTtfjh0XIWgZ9H2JBMNdtn8Y2bWb0CMWAN9x4uP2D8r0+
 uti/G9CNSsE8t+38M5g==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bb7f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wq-1lD5fFhYcRPXe29MA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180806_475840_E0206650 
X-CRM114-Status: GOOD (  11.00  )
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

From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>

This series improves ath12k datapath behavior on platforms where the
effective IRQ path for WLAN MSI interrupts does not support affinity
setting.

In such setups, DP processing cannot be distributed as intended and can
become CPU-constrained. The ath12k change switches to threaded NAPI when
runtime IRQ capability indicates affinity is unavailable.

Patch 1 exports irq_can_set_affinity() for module drivers so they can
reuse the IRQ core helper instead of open-coding equivalent checks.

Patch 2 uses irq_can_set_affinity() in ath12k PCI to enable threaded NAPI
for DP interrupt groups only when affinity cannot be set.

On RB3Gen2 with QCC2072, EHT160 UDP downlink throughput improved from
802 Mbps to 2.58 Gbps after enabling threaded NAPI.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Thanks,
Hangtian Zhu
---
v2: sanity check irq >=0 before irq_can_set_affinity in patch 2
v1: initial post

Hangtian Zhu (2):
  genirq: export irq_can_set_affinity() for module drivers
  wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable

 drivers/net/wireless/ath/ath12k/pci.c | 11 ++++++++++-
 kernel/irq/manage.c                   |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df
-- 
2.25.1


