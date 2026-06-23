Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84D4CDB46F
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75+N8+hZitS36OKrOB6WJXTvRoUzlca4qnJ2MjmZj4Y=; b=I50HArAlvgBZCbITLejn0IJ5lP
	CWyJrKo2Yz0SB2xR8J5oMre85BJUlNJY0vT0nTy1fFmULIN5qpfAt6JdKCgn4qrYLIo++M/CTXpOC
	vndBO4+k6Dz+sn29VdRVCkHLBMLUsZQrC+A/3TeQtMEO57Q8aF6ZcdEjXra2GShHuQcQukXhVu30b
	Ob+5OC7RwzAMj1XExQH6oCW3YMqdN/XWszWOORkz67sCACDh0F3YEYRZKJDdN6nPfB+z4UkJiH374
	1DBxTiW0oSt8YpGj8fpcHmGUMMNd1VheoutLKt3m6OuIr5G52Re6ib/39pLvZWApQep3l2Ze9jJIg
	tX96fpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wN-00000006Q5B-27Hi;
	Tue, 23 Jun 2026 14:17:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wJ-00000006Q2w-3EbS
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 14:17:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgK9113422
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=75+N8+hZitS
	36OKrOB6WJXTvRoUzlca4qnJ2MjmZj4Y=; b=NI6UlMhYO2vlZa8COION6cWKPYF
	YzND76e8fT9vvlFLvIslzSDTowuc2xyIxxv8UNnjeCVN6/lsmTeoZjzttnHxokip
	9Q/MXddwWAkJTpd0i4IvlaWw327uYyJjIzFB3l5rCVQ9xrj73IpkaWNGOSZxyeno
	v1POtVz8xY4E0cPteWHc6HeDA1t5L8DG1h8FQSHtK5mXyFOHfB6YV5ivP/B3WvD9
	/ceCODHN3ERGJh43ViUIOQrd3cqq3IytJyb+5rG/WzHGvfmoTZL/BVpBKd0pA6fr
	lHszzdelcEgdCJRx26M9/xvHTZODoSBDqV9yEmUP1y04D4oqxGWpxVL2siQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvswg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so3960697a91.2
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782224242; x=1782829042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75+N8+hZitS36OKrOB6WJXTvRoUzlca4qnJ2MjmZj4Y=;
        b=OBS9+QeAPnTNgOkqRJxHW/zyZhXXUMDMIttACDaavlHZd42Vi+ZmvxLw60uRnwZ+3s
         GPRIS1BvavxndC6atLnpnHB/kqGiMy9YTKoTVJqJSSXvsCvn3yPk6A5KzuPH60qN4ej0
         m4PRljIRHKFqesIGnGv8QHsHsxfqSo7HDJedIGxvgd9+1Rlowguk6hKiTrJ9Wf2ge9SI
         SjAsv44UcoWjeFJfX0Hbcjss99J9xIXX8XwxBvcoJZbH5GM79Kjy1XA83NppwniDCx5y
         mW0ot26ue0CeJTtOhi2j5d/8+LDdexBtlyjR7DdKo/5E6C0JT0jJdEwmIKLH7iA3IPM+
         eNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224242; x=1782829042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75+N8+hZitS36OKrOB6WJXTvRoUzlca4qnJ2MjmZj4Y=;
        b=OT6CG0OaF4GJFWzCbvp2AOySOGhPYr4Bl1auVrfNMDP/zDFYH9J++CGRufduaiX1Ro
         UNYIBPBJaqgaf6KTBrtqnU3xs3YnyIujiWrSRO6uCon71LFHTc/1sz0SRRIbtauIFb+C
         KhSH7GK9Uu/NWO8ovf2AjqZ529hvR67SBRUVfJ1Z7+3wkuv/wMwzL+usSb8jCKNpPzgt
         n0O99Cs+pPHTl3EZOWy/f9z3p+NPgpPzsj9SoprryI+MXvHMMjRYgShwlM/iEL1Ihd9j
         ZfBxwN8kGPyS2JJg0WBxTawNF1fvrut9iEV86PWdvNGCHNX9VD2fRi6qcbVAJLoFG99F
         1uKA==
X-Forwarded-Encrypted: i=1; AHgh+RpzklriiYEVJJt+Arm6R/0DLBadOV5Xryggy6bmCgl8PqvbLbJlMcCm98X/McRZGsZkkO38nY4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqu4gqLEGW8WNqvCU/XS66WjGgJnryJUE788fXvLMC2+9s+PSj
	Vh7nkwO4bcEmO/KHGrd1GGuCCC9TD+38B2UHyeho76nbNt08GvkD+up9/00yMvSbLWUVc0xx74p
	QbpcIgObwBpbNlz0GXyYqQDWS5iOH2lKfASL2TnyGonN4eMDZE6jvig1Q9psIuMUb
X-Gm-Gg: AfdE7ckMDpNps3TDbtV488MNURGdfSdXzBWDE/yGF+KdIXqhIaXbD9An/0C7S2yndKu
	fRmKvOtRd7yjzH2J0aZ+QwQTp0gYfd4nUUsRTbxQ38a4OVMXmcp2TMnGM2gy0aALHl1qIj3cvkX
	imuipkdSA7/3E3U51C4jqfFiQcvVekkO5zgBQsd4exbiBnMEPmxcyAPJmgeB+AwKkWcMCDzajCD
	7jiV4FYuT0ej2sHl12WRsHEIn/YPTYadbx01vfSPHPBvmxsrSSa74q2ucFa1yjxmGu7Wn8y1hmL
	ESUA89CM6FWNk/1GrLDyzKm2ua+4lB7T9zx2/OOL3D5OJX1Ds4Dk59svbzK7AKUSiQbi5fLJNQV
	e+KPAwBEDFlXyggKG58BwbFApOSiNaBWWzzCFNE4TjH6XpPdfjlCkIFn8y+Ca
X-Received: by 2002:a17:90b:4a42:b0:36d:f28a:c5ee with SMTP id 98e67ed59e1d1-37dd0e341abmr3292690a91.25.1782224241725;
        Tue, 23 Jun 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:36d:f28a:c5ee with SMTP id 98e67ed59e1d1-37dd0e341abmr3292649a91.25.1782224241257;
        Tue, 23 Jun 2026 07:17:21 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.199.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f315842sm10094199a91.17.2026.06.23.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:17:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Alex Williamson <alex@shazbot.org>
Subject: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
Date: Tue, 23 Jun 2026 16:16:49 +0200
Message-ID: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9572 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Alb0JCXUjTgUeOUvUsHAUA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=b6JBSybIbF9IxaTxWo8A:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfX6DwP089JuJl4
 R8OzRcJtBYJPAC12BnfGppesvVaHOfYTbvHo77zgH/BVvy25OF83vWV/jDtCXvnFAp3s6NOhqsI
 QE7Jza/uBw6miTJKW5AaTRv4TLJjj18=
X-Proofpoint-ORIG-GUID: LK0QtMeOa7CgHz6cSzGknuXYk1QgrJPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfX9rrtEgcKMWQQ
 rj6RNgm4MCYFstbgaVJujDrjMrCOIzr/VaFYW3yHMwzFZMsTxcIBfL1PLkWJBFBKv/WwLs3v2r9
 PooEzaq1AuPTm2ewJBePW6quLezuov4q39D6DB9awV9h1KMNnx2lYLlhMyHN8wqsl6BkzCZVM3P
 V8fWCMbqJabWyX3htOUV/+D7xavT8OUn4UpHsUOBEriq11+vNou8LsJbDaiGGrxfAlcIQzhZK9O
 mAnaDJEpduQrkpO5U4OVNNYLe17S1RkpL5UkApmHO3Bmmwgyu1qTevnFsRZQ/WvRgS/qtFlWdKL
 GThHZ2xZQRAAecjN5rJDUUeNn3PNNPPs+qTEXc0wKmkQOoQFcDNLGk9OI5mSzoSqp4gf7HpOHEm
 Z7PGrKK2DrZDuDiPbKkvsKm4aO9yBvvdP5QY7y22Yr2xAjSsCTAmhXhJzTdv1zCmzjYmnTzNPGE
 mXwVwbFkVDXeVBT5SRA==
X-Proofpoint-GUID: LK0QtMeOa7CgHz6cSzGknuXYk1QgrJPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_071723_938282_C64872C5 
X-CRM114-Status: GOOD (  14.68  )
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

ath12k_pci_soc_global_reset() tries to reset the device by writing to the
PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
that the write gets flushed to the device before the delay.

This may lead to the delay on the host to be insufficient, if the posted
write doesn't reach the device before the delay.

So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
before the delay.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Reported-by: Alex Williamson <alex@shazbot.org>
Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index d9a22d6afbb0..fee4129ea405 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -188,6 +188,8 @@ static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 	val |= PCIE_SOC_GLOBAL_RESET_V;
 
 	ath12k_pci_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	/* TODO: exact time to sleep is uncertain */
 	delay = 10;
@@ -197,6 +199,8 @@ static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 	val &= ~PCIE_SOC_GLOBAL_RESET_V;
 
 	ath12k_pci_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	mdelay(delay);
 
-- 
2.43.0


