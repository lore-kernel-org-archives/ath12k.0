Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E2C5DF86
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sGruxQJPPCCQjxLY2D8dvvaTHG7OpIgDOoQtn310XEA=; b=4BcAOT9IGkxLHHZ2DBHvvzVX1I
	u5d5TZwWUc7T4bQ8LfynOhp/lawMfw3Xh7FGgMI5PyjT+rvZbSrpaGEAOcpmILSr8UoJ4CuToIR/Z
	8QCa1xkUWC8oaiddEoArOzXozYfocN2BGPiQ0QI9njhdPPAnP+bBSa0ZBR+Qzm+c3oNnsR/PebKBY
	lKGyqwrZD7LiyTgWWn47I9w5w5MCNUOYeXnonxI/5KroT0kBwKnur5+lV4OF3ZAvd4xi6vh2kT0oA
	u5rLC9UItDHNQfK2vqbhS1W/d03ZowIIX374IumasPjV5AnnHdS/PmZpEfjkP775/o2Me8RR22jHr
	2MK0Pubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe3u-00000009bVN-3MmU;
	Wed, 19 Aug 2026 11:02:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe3s-00000009bUz-3Te2
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 11:02:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7wSn515991
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sGruxQJPPCCQjxLY2D8dvvaTHG7OpIgDOoQ
	tn310XEA=; b=VK/VUE6RqzEq95fjJKJB7SgbQWRDnxcNexxoADoulhsq78YPMaM
	f5okh0glyV/rdhzFsHktTuAd1xUJVSpMPm+pBi7aBVis9aCEFjecNowDyJWIBvc9
	KkksaGW5QqrlAyJRioZdJiM0lRQYm+6HkWQaRL8EZAz04Nok+IQgzmPDYl+QLAn2
	1KB5SbMFZSA5/AAkTVtt4dbnBvusYdNwWHO+iveaDCHrGwTcxXaSQBn2h9NtAhMg
	fLfo/aX9imtzjunF2yx28KC+Pf4M5+y5AV6w0yNuqUZjwGyU8BVvYKLAGVb4A8Fr
	Q0Odx5I3ROmAz4meeusOJmfYO9yN0lF74QQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfptsq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1836427a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787137343; x=1787742143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGruxQJPPCCQjxLY2D8dvvaTHG7OpIgDOoQtn310XEA=;
        b=ERN+U857Uq6PHApvHU8L+B7uCdQUiL8TFbEMZz+IX+aBf7SZiaySqoPXF6oc3/Nhl1
         xfhrOgTeNGhiGJejyuttIiyC3XzaJ315c9hdDkTVH5JP45AuW1tVlzaTSOcD0Y2Czx5M
         1maRvmZGCcRgo7PlCpYEuAwxeT1WROLqZgNHfR9UaTNTeD9JN7lQ5r/vEJ2eStSmavGf
         P9U0QeemWVHsYyZkJ96eRY3wYmWx4D1b7kevhWuMehk8UFG46bSnPx+A6azS0SHJ+J7P
         vw+JvGhTg8HkPLwfpZyqDesQVGibiZCiB3Pcvo11/fNWccp3m+kAnTg6FzoQBSIe5z1I
         rKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137343; x=1787742143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGruxQJPPCCQjxLY2D8dvvaTHG7OpIgDOoQtn310XEA=;
        b=VUIWjVG1lXqd6uV8ERGNl1ARCyGqs/hxRtY1szsoEPZzbVvz+C7HympOiZHHue9gH+
         qM/HDVh3dLLJP0sxeQyPbW5VdJJDoYRMF4Vdcc1mLOfQsTAFACFz6Wf9wsnXIV8zU+Ny
         jy8EYkJCBLRJqZyA/Ew57aH19jcgamHQqysTfjcxi1znuf9NIPBxGMod0CnI0vwKUWDD
         2JMSZZH1vg8pY4zAaZTQfMqa7sFz2MIiawPMRiupLbsvZXAt2OyQCdWJBNlgvf7a50jv
         3/vbdVu0YR7aY6kbvOIzTGf2VFt1eAJvyq3KZJsntrd/NWuVsFC5qbMsVbdi5MJfyDAM
         MZkg==
X-Gm-Message-State: AFuF++nBxsEEYhJVqP0m2d2kd2qSiRE3izB6J08bT4/MbBdkCJrAHCnG
	IFBeAp9+XGHJUCgFTI/G83tLT0eb+HgGhBl0FHX9hbiaia5HTmZxbDWMhkV8qLRBzhnUH/YnzZY
	wBvwovq0ioqD2zMUET+JttfzLzWoiqapbc0VNfZJEeyp31wyLdEFThlxMAEQ4MEhh+Yu6FECl
X-Gm-Gg: AR+sD101yZFmfJrfIhqWGTipp0yxd86K2n29wMFnOUon+0vXTfVnjU3b9EWfpg85OyA
	FbS6KGf+ukJ5NPwVxLAMubLP41rVk9ruPot7g8oXBst84GdwVCoF1Tg4rhZzspH1ZnFaGPBUw7n
	nBlqzmU2CIvSPg2cU5BqMLNp1dYBnNOToFM2J20XTlgP8aQgzay8syYv2ZeIggmbZmNgCiU+j9Z
	eMOOcGp6yhecVVNwaEqXlwNwo0srTEho6uC5KqsZczlldWAUQdTa5rw8PxBPim7qEL4XqvGO0Q1
	Bm5nPCvGqiNrCwMmFN1DDuSb0wjWSgjLuz/dz/TSknn9vhKrI+TNvz2v91qdIgJKJiw6GjulVJp
	Z+71kcuuw9wDoduRT05Ec7U7PJQjjdzNfargYFCG/1p4nDh8ja1DADPZQcKm/V99IvNYrVhsUco
	Do5/WMMex89OlwkHNGgF/3F8g=
X-Received: by 2002:a17:90b:510b:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395810e84bamr7388836a91.13.1787137343223;
        Wed, 19 Aug 2026 04:02:23 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395810e84bamr7388664a91.13.1787137342611;
        Wed, 19 Aug 2026 04:02:22 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb30541sm2223640a91.13.2026.08.19.04.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:02:21 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: Fix IRQ cleanup on PCI IRQ configuration failure
Date: Wed, 19 Aug 2026 16:32:13 +0530
Message-Id: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BgCk4mYYvyb5AsLw5DND37zEYoyLtmDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfXzRK4HSWBel8t
 GcXNHyUfp+XyRJeLCbl3aK6lnM0rax4KRiuL94E3gPcUxVU4GvxThrwcAEKD8Ot6olJmXZtWyih
 Z0eXJy5H6to8rnqKElbVQuPnx1R3vsCaveJuqylkSI8bLQJVgq+4+KarYWvhsZSWy7egFZw3uPs
 QArimcFK/RfGqn2X9jbg8D1an67fkpstIEtbeM5X5LcctuIqWdaBvMN6ZKZ79o/yb1QZZaSCUq1
 rvoG4RqLFX9xap2hvkGQpXQn6i6xecIwSQAKp1m3ZBqCl6eO1u/hMNeHUs/xP8Ap1GASkupyuaF
 LQMoi+/HwiC5JoHqgEOP5C3Qa3sS43i8LZm2y9fhCxGJjlC4RHX1vPeBEjWIjOkaF6ZxeXIAR62
 QBlH+Z0Uyh6fR16TY75S1obIvk/3+a2UJ6F6wkXUWSUnj4vd88TkFdYEdX5SpYcMQWFdmC/0U2Q
 uY1yf2HUK/xtnlzJjyw==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a858d40 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bw38Geq8loADsqHK4B4A:9
 a=ZXulRonScM0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: BgCk4mYYvyb5AsLw5DND37zEYoyLtmDT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfX3xZ5VeJp9rl4
 bPSMKbNednzWVqqIQez9WNpxwZSxaNhF2V88PRKEumQlxyObffcQ3j04Luxxj+Yyq6XQr8RiUek
 Y9Nnn9lN2eqK7+scOU8x0UkOra9DG0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040224_928048_15E09AF1 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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

Free partially allocated IRQ resources when PCI IRQ configuration fails.

The first patch frees previously requested CE IRQs if CE IRQ configuration
fails.

The second patch frees previously requested external IRQs, stores the IRQ
number only after request_irq() succeeds, and cleans up allocated
resources on failure.

---
v2:
  -Used ath12k_pci_free_ce_irq() in the external IRQ config failure path.
---

Aaradhana Sahu (2):
  wifi: ath12k: Free allocated CE IRQs on request_irq() failure
  wifi: ath12k: Free allocated external IRQs on request_irq() failure

 drivers/net/wireless/ath/ath12k/pci.c | 55 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 23 deletions(-)


base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


