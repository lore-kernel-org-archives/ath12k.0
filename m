Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC31CD343F
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9HmXD8It3zOIVPJa6MlBya8ryspjm9ncZa5MieYLs4=; b=YcZrBhlMN3o/jXfrCjbBYfDAHc
	sGaVdmf3d0bNPxRx/OkCOn3gXjFi/yY4fVSvVlMTm8IxPBOzRA67fD3qoOddHAPGdXf02WIgR6cJT
	p3PmXBDf9wMxFK9TTradZvMrPt4jVlu1KcaPYUqnJoH/+YtAVPMs80eYjhfFnO7DF55IInC8xEwMF
	aCENO+79uwL9WKn+y1vq4+1v2M/sIJk+dtvEgMVptcszwCut1FCpRTdwvo3LUFxEW+0Bit8hAbBpb
	5Mrv9UCGSDK807Lljrqi9iDzWjR+QOJ+xFyhu8lNsijJFd2u+8Js+q1uusA/2EDtPLlnoDQ1aj7pS
	4d228k8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wL-0000000HKHX-2zoq;
	Tue, 19 May 2026 01:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wJ-0000000HKGz-22O7
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:08:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IH1wig2091139
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X9HmXD8It3z
	OIVPJa6MlBya8ryspjm9ncZa5MieYLs4=; b=bAH7mkvwJJk0C3CWufg2av+kqmu
	u2ogO5AhMvgKaWGXHF1gaMnRmsizlhdCDVCuC3dpbVNv/JWZr3XoyJ10/MYcJhLF
	bPD+4lxha9YKcOO7vazKuNkyzfjzxyCZpohpFKidHGsmGfiaMNfVhY9OYpv86lCp
	Mk9ftcxw3T4NnHTMPDpVPC9FbT5ceD6DmTCZM1c5Ouha+rKJiEXYfVsGuGYJ1G3D
	HJ9Vq9JVC291W+S6I31bUZNJbfSrcxnxgwBO6dV5wP1Wz/nelwCdR6aC5XnCpNDL
	523qf9XR3NwKf4b72gmK7sdFHdJyJzjO9oWPNMpWi+11HaX1+XBlWI2YY6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpk1u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f85179263so4600160b3a.3
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779152886; x=1779757686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9HmXD8It3zOIVPJa6MlBya8ryspjm9ncZa5MieYLs4=;
        b=hME6ye0mwigzi0zhQUir27d53QcavzjSYt+tb4rwwRqw1v7m8nyTzGgqnQ6TbBSudd
         HOYzYlDz3dlLctMVEZ9aZ/ZRfnM1wJR1UUzRFJ1d0Z8idwtn4i4CRPbaf/uGEknisucT
         9nZAbbTn7DTwzwORuZrGEnVBeDa/MoyQMB+KhKBNadn81Z6OSy3ApFhqKfmFp/1Df7/o
         xHgI7yNOuvQT4ZWgRbkLvQ09X8TyRprivwr24qLs/x/TU9iEi2InQrdv8iXgBTHpi4tS
         3+iZyfdwnjt/6XgpJMadA7iB024eAKWjPe2kVg/9uuJtTSVf20Uu2USaOD89tM3xxVGG
         lcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152886; x=1779757686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9HmXD8It3zOIVPJa6MlBya8ryspjm9ncZa5MieYLs4=;
        b=DBWyWtnMPvXZLA/q9PAH2FYTAFZXnEu3mDUS2aGlvFp7i7QYcH05BViBn6o5R1t/OW
         cbWrdLQ+TL+CiXnS3Is/KbmD594nu/ZCz6zMgZJ+PYqGzyQYxM6OZ1aZ6xvBZuK5kmA/
         LrzgxAQmsyWyAZnALN7iwWpQ0jTu3ebb9/pZMOg7/jay2ZA549JS+aeyWKiTvwU400nN
         CYz9cVdKwQcx7s9lg6/Yh7SPe/g2LFGsWhHYQiLUh3sOWKHo9QC3ROy0DX2qBwDSPt/T
         7ibRdie1Wlmv+NwclyzZo50rlpRkrhyzY+fEjGla7mU/TJa+PbAzzpvag4xRC4ZVwOz0
         jVfg==
X-Forwarded-Encrypted: i=1; AFNElJ+Szdrpfg2KxAkxT4DbVnFOyjP7zK3VcoXx8tuXwpyQ7CwRSBmnUU7GnNnRuGZopuW/sdcUjdw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj9899KTu5juQ+mdK4M2keEreHwB4aJEqiiwkffcD8bO7wB3XB
	gS/lNsk25RwAMFFGGCzUhB7MRi9Ew9MIi+YKyVVT3ZE7Bg1YJgXJGKe2VI9FwdTabOxHE7ROFe2
	ddJyXvyFWYRBTwQ8+s8d8So6xDcZz47bjjsZwJj3eDjb7Fe3ehgBJ1tEvjJTwEowLWk4l7a6M
X-Gm-Gg: Acq92OGEGE0g6W6YEFiuUu/p1uX3OkAhca0GgW+xFAa+zQRkqMoQFs/m44gBBJPB28r
	QE2kF40bU8Aw4Lub3bIYO8BuO3iw9HbD6f9/2UrG8n/VNehfAOMHJDioIR6+rYq9ib7RnaavLcL
	LUFmQKcGMfpNOoMsdycXwd3VwPL/E272Xwd1GSZvKKjWZNEB/rdmpxN+cm3shVJ6qSs32p37Mgk
	pyPUqsPRWFRm/jhHGsmnxB4YDRU068cOKZpcmRuoYVrfRZHJwN9OLyQnpdVpDFITTUKmxrfkUfF
	CLTAoj+snmFATIArR1B7d0UH+kT9KjiZHt9nfH0aXT4pJpPe98hXJ5giJUWmLpN9vj3kt3TMHlT
	wt3kH/mska1q/OZkHh03FucXacBFuPlNe/v1hql1VpjtXXfnoxdOJs4yUSwRZGp3hVol3VPS3QX
	4LpSMh
X-Received: by 2002:a05:6a00:4193:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-83f33d0d040mr17751391b3a.49.1779152885747;
        Mon, 18 May 2026 18:08:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4193:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-83f33d0d040mr17751368b3a.49.1779152885236;
        Mon, 18 May 2026 18:08:05 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1942a83fsm16196793b3a.0.2026.05.18.18.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:08:04 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
X-Google-Original-From: Hangtian Zhu <hangtian@qti.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] genirq: export irq_can_set_affinity() for module drivers
Date: Tue, 19 May 2026 09:07:57 +0800
Message-Id: <20260519010758.712297-2-hangtian@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
References: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _3SuQa4MywKOgFCX7Fbl-EuyCFgovpKL
X-Proofpoint-ORIG-GUID: _3SuQa4MywKOgFCX7Fbl-EuyCFgovpKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOCBTYWx0ZWRfXyeM7s863zzwG
 P+GuVg8Tr0Ez7dEbTAbH5w46mffUK/1cw6EYDz/DnzpEho6PFfHIGNnSrS+BDY6UdSNeApvTfhd
 8YIfSx6SmlV++pIfp//sdKgITGW/M11GZ5jTUPW1S6g9Ukuzvcnl/0f6etZhI4ch/2WDBtactsH
 tvPOI+MMQk0z9ltS2LjKz6IwFu6mRslWM0ZDWgvlupTmKvRJtmougeiFtKf4T60ElTtiN2BE8DJ
 XklStlF7dzSWsQozQJCpURakPB8xojUTruDzVO5gCgSCu9eQzwCBI7USHuwV3w0+v+rRmTz3N4d
 XRHmmTD9BjKNWlFSoWWHKOSk6SEkXbLrB+UCIdkRpF2YEHlfiv0cANXsWckHfH+wgun8tm/OqsW
 PFG8Tk+vA0R6hsDyGh012QwxCDUzhsdjKYIPEp/6s5psqeRUZX2L+4puGaPV+/YSLvAQIyOHdyQ
 o71hjowgb8Hri9rg9Bg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bb7f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ncsClcd2Rt7TSDcZb1cA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180807_640299_B14B886F 
X-CRM114-Status: GOOD (  12.02  )
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

Export irq_can_set_affinity() for loadable drivers that need a runtime
check for IRQ affinity capability.

In hierarchical IRQ setups where the effective irqchip path lacks
.irq_set_affinity(), drivers may need to switch to a fallback policy.
Without this export, module drivers cannot use the core helper and have
to open-code equivalent checks.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 kernel/irq/manage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2e8072437826..c3aa33ef4be9 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -171,6 +171,7 @@ int irq_can_set_affinity(unsigned int irq)
 {
 	return __irq_can_set_affinity(irq_to_desc(irq));
 }
+EXPORT_SYMBOL_GPL(irq_can_set_affinity);
 
 /**
  * irq_can_set_affinity_usr - Check if affinity of a irq can be set from user space
-- 
2.25.1


