Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60DCA5FF1
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ynqDIYHMa1ewQNzuLLg6pWNb0JVIGJCGjVJeZk61aoc=; b=tRJVnNq1s6Tn/m
	0f+rRLY8DNsdHnystkrCv8XyupOeO6dFyELl8j3hvonM7Re4PgQIkPWf5L7aPZ1Ho0po4iE/6bnCZ
	KgbWnYfi2gVZFGrnuZ5ouXygEEZH6wc4R15Pm7tLQklhgLMkzE+gIJBsJmgR1q3/7KOEtqbnG6s1P
	jBDpK4gVUhJDIgqbcCtriIfibSqUGmIcBS34WXdHMSRpwAnUda60A9h7En0LHr0Z+mf30xWF8m+bv
	AgMI2TKpl/y19p85a/4pf1K5m5HwelFBtCq5gU23eTsvQGYQ/KI8R5cVT3F/3F2HqxI0NpVuBUqY8
	ibb817lE6ypQgOwXTTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsT-0000000230V-1wWv;
	Wed, 07 Oct 2026 09:23:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsQ-00000002302-3rX6
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 09:23:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jW7U3810889
	for <ath12k@lists.infradead.org>; Wed, 7 Oct 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ynqDIYHMa1ewQNzuLLg6pW
	Nb0JVIGJCGjVJeZk61aoc=; b=XRDbbty8qiLC+1OwApa1LDFNUQRaF55Kh9b5iS
	ThVcYwBxYB8OyH4UP8PumcCA/89eQaz9MHBL62xxvAs2yw0t2wO8njY99/acEMNN
	ELdQ3Lx2Ph/MyA0/oX+y+2YPxUrkKAE52KwU+LcJ7CwcjTFm8RMqoeyRoUvYL+mp
	Vsurp5lGLIy+FVmUbLS/rAppoueXS/OUJioP5ZUaR7IqAPibXcAxam6KAqLO2MIo
	qG7ftysMe1cIqkPhIHXnvqgC4frpzv6c60shWwQoz6Q3O8dJpHs5xPIV0l343snM
	ySDFPSKPGsNzNakQQeAuIWOUOdvoB6WOoq9vP8o1CZP13irg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrjv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 09:23:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768886a6so3080159b3a.2
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365032; x=1791969832; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ynqDIYHMa1ewQNzuLLg6pWNb0JVIGJCGjVJeZk61aoc=;
        b=DvU13AYxzkX7K92Sq3uD0WPeHagIiqeGFPgBNnBRvLYEiPZMzA67kfWVkBdTlSKpg4
         h1Msnkg7ztbYMMvJL1o+qUxz8b7QepnH/i5SEAgJAGgSkAqPWcVts6Xu8F0miEpzMZE2
         p3+fmDMt7xZWlvb96nFZlt63H6wgVBmF1wXk115WqfUqi6X6Ehrf3VKDLwRueVNdfnUt
         mLXCph24RS0SD/vlI1Zlsgw0Vb7GjygL6BDWdcjSmKEV+TqeGxDboFef1tQgoOTbDR2t
         r3s0Q/prr0dXOwX1wdzzqxLZnlf83VITWnKQSZxT69fq1d6ks8ys17I9wYIWA7Fd+Jy9
         /Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365032; x=1791969832;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynqDIYHMa1ewQNzuLLg6pWNb0JVIGJCGjVJeZk61aoc=;
        b=na31O8dzq8aNeDNmcLC+gkgjHMbbzXimYMm9nSFeY8PiTXRBbnRV71672RV+0A3Elx
         BjldowyGKFx2uQUT9f4DCo2Ko/EPLzIERs8ZMNvdVupIf9urh4mCrmCR3I5xPzhFjDbi
         xrkUCMR8GlRyfwnPPFWDJhr7z9Tejcb9jmXRqf1gTFiWKknBW0rM1fqi2ukZWfzDWxHu
         GLFzYV7OMMKFpsPxov5PKdq15hx/0WGfHELOGnH37uOnK0W+Ds/NDEsb0nI88iCikPk9
         Zf31KWwdo6drSJEcYHmuURd9BzmVL6CxfU+VimBY7AmGGi830wWxogrxKigNtVgD2YWZ
         NvkA==
X-Forwarded-Encrypted: i=1; AKwUvBzfgu7FK/F5KIu9G/CoK4DJfgLmh9CLFl4eJBTwCpoDYifc8PgdLT9M/pkfuYuLCdZd+pOWcLA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIlIVcm19GLI9Jb8V88X6eNO7NLPDPWx8X2LgY0qEA1ZjYV+Bvw
	6ti2t/2AK6dR5qP1SS0u6XVZa370/0pxATaciQ86Jxk7C5xq9DTdD3B+k2f7pqEVCX80pKbRHxS
	WFSW65nY/WhXVvoC+HYxzdQZ7jA1qmVSG6mq0B3QBzZsE/m3TuBzb5MWbmQrcosJisdBi9wdG
X-Gm-Gg: AYBFou2Za7cwTSSKTPelt1fqupJ4ne4wg/TyB+pIIojbo1ECMceATZdSRoauYKxjrbU
	gAEmh87mtRqtwwzn0gdm8H3GZPc8ifW0IRtdt8nf81m3PXvwUQczGsBJiC69dOABctXAVAswVXD
	OzY6BfxqPyYX3IMNuebL2Z9ajuuhh7Han5YtKDNwpCYbeLc4D45xgbwALXty54q+YLCXhCRTdIK
	pgBzDdZijf4AhGQPwqC0VQrvxKOImQQt175VDTPG5OlgCJRZfNYaTcxZlW96e+iX4M4Uv2qPrZ4
	U3tjEFWpO5EhHlckb4cLmv73QahOsbNrxNUhSsLtez0xXgpTRz0vkBhvl9AgO+3QbvfvBj3d+jA
	yQ/G9Ius8hABjpNia2WtudxW8kHfUjE3jyY+usntNs+Kar5tjlH+Zzk9C+bsDxJGyOblDZvaRS0
	Ltj0HUiufZjAGz9tLNgqrVmOY=
X-Received: by 2002:a05:6a00:2d23:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-891b4fd5adcmr1424244b3a.48.1791365032494;
        Wed, 07 Oct 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d23:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-891b4fd5adcmr1424232b3a.48.1791365032065;
        Wed, 07 Oct 2026 02:23:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89271257af8sm119128b3a.41.2026.10.07.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:23:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
Date: Wed, 07 Oct 2026 14:53:31 +0530
Message-Id: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMPxmoC/yWMUQrCMBAFr1Let4GkaEu9iohs061dwRiy0RZK7
 26sn8MMs0I5CSvO1YrEH1F5hQLuUMFPFO5sZCiM2taNs7Y1zxhvsxqyRzec/Ei+I5Q4Jh5l2Uc
 XUJ5M4CXj+jf67h/s8++DbfsC56svrXQAAAA=
X-Change-ID: 20261007-mpp_ws-a041d5cfac9a
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60fa9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PwSPXMvPeXUFY5uDVUIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: st8VKrjnABrT8WXV5Th1ma2VwX3r2Y48
X-Proofpoint-GUID: st8VKrjnABrT8WXV5Th1ma2VwX3r2Y48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX6WEnM7klCPIW
 veceX1gqbw4mN9N+B07bjQDYL+042Ub0x2lUc/PFqnqgZTQ+RrkUXoEqG8mGoHF7f52+yFub4yQ
 RoooCn41DoAfiqkJfc89Kbe0RPS2khArU6VAgSTCdDCvqprTwKyIkun+JhRyFRvjuO1BDHQVyb0
 D3w70dKuoU2YGUFPBqZscSUIupPYjjC1yctEaIgopcOcCWYr4febGyijOMZI3athG/ZDGVa+AqK
 gxuPJkdxOr+/YCijOqoJVxdf9SqNyj9GamUSPv34JbltGgqUrH06DiBlBKNu/ZHRSg0YUd+hH15
 QiLwOMlWV0F1K4uwFskq1yO0JzhWQwij7TISjUHVQasOfGmeJA+l+53H1j3kxNIho4+YzeLQVuJ
 hXN85wOJseH0QyMvIfn3V/XpYtZ/MviBL3kgk4B92YdIpN8ZZqvLhnkooO0aunJ3D39n0/07I5+
 +8d6XoglppfSXH3ZbqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXy2YcXrSMCWF7
 i3yR8qxkhvN7oIppJVUtDDKbd1rLJjcDJPgDXQnCJYyoNZv3/TTjcYsLInBK3wqL1gk0RkhtI6i
 Sg5e7C2mttr9uSqVBv2LqL3pYx6OlNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_022355_101871_38B084A8 
X-CRM114-Status: UNSURE (   9.47  )
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

The RXDMA buffer ring size is currently hardcoded and shared across all
memory profiles. This makes it difficult to tune the ring size based on
the requirements of individual profiles.

This series first makes the RXDMA buffer ring size configurable through
the memory profile configuration and then increases the ring size for
the default profile to improve RX traffic handling.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
Aaradhana Sahu (1):
      wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile

Pavankumar Nandeshwar (1):
      wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
 
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: a90ebf2176db07c5d91e0a62e15ded1fd50710a0
change-id: 20261007-mpp_ws-a041d5cfac9a


