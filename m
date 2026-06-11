Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98022CD98C6
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 03:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZBP2bJj3MzkP6d85wYve0QKBVeG+83ASUbpCuF2T5U=; b=rx7XTTlNukpyag9bIelIaSiRFI
	rfD6WAhqfeT0biX87vMRm9QwhTUBm6vx1h8mdA6QMtl2akYJGe5eUM2Bgaqz+WtrWN4gxMhtSa+HZ
	R1C+FICafO1FCobW7sNDuvwxkg+KmNjA4uC3gQ64iJXDTQACaKDY6cSxB9KP6Uuwwe+0q/JB2SR1k
	pLX8+NlRgoIsEgQ7CRsifd3Y5CjbiEbGBbt5ZnflwbYXiNrVIgTnmEoGM9+S+8prhdwAhqLCQAxnW
	fZWDC4QlyvgUT57HxuV5laPbr5wt3vcAE/p3cY6IAqOZTXrpGZaXdYMAYXRpg8vgQM4EKXTQ0hLSJ
	dUOL7ZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAV-00000008cFW-3KMO;
	Thu, 11 Jun 2026 03:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAT-00000008cEw-2wJ8
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 03:33:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NZZm3183756
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SZBP2bJj3MzkP6d85wYve0QKBVeG+83ASUb
	pCuF2T5U=; b=QgL2yBS/JyhjRUXBFfxjWFtTI9QDbKha7+Es8zn/NFGQiOe8Czr
	d4c6cO49E/Q6vIQQURuhABSbX6OQYKY8cjPbraUZDyI1Cyh6j0p99QxGR/Y8Wt4N
	/kOf7TXfAI9SvxwB6QyAZHbCZszlkVd4YDETWl8wQstSExC+11f/PC5pXaDFNOV3
	jmy3pMUwaz7+eksMJ67J3tHbmVqPPL47rPj7nt/63PGYjoOYdaJPz5xnsNhbj4jb
	XO2Z+LJq9C1HBUzF3qt40ECCZ4l/uhlTjRcK83g7NlqacETyNGe+Sl2fxp8nLUKT
	jcG0qkidJcVh502NsPlzweQvLI4+MPaWjjw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1dtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso6959197a91.0
        for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781148799; x=1781753599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZBP2bJj3MzkP6d85wYve0QKBVeG+83ASUbpCuF2T5U=;
        b=iNSR5/JzTe31EF0xmKQPxVR2PBV36GSQ82H6YZRhe3QQjUktdAyBbQAP3qQ+4tBZTW
         mVYPNLN7GES4WRmQoq8rdXUZuimjgWCiDmFeQEjfeE5K3t0h6bZTCBONNlJXi6p/R4h3
         8FE6MRqIrxdCVa4xMXGJMIxSQrRh2+VinqnLMrQtcowBADP7uBj+Kr+x3Tm3n05AjMlF
         mQNt33rr1k55RA/L+j6biutFBssOzT0Obc+Wyn78fQahWW3JSpvzhlUs2nfFYELyqdJ8
         SZQjF8bu9cPFasl6fOL6shloK+Mub5amT1FnuhGPgwiTySeQOVfw7YhAvbO+nxu42NS+
         /lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781148799; x=1781753599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZBP2bJj3MzkP6d85wYve0QKBVeG+83ASUbpCuF2T5U=;
        b=o8fX56qfg/0yhfOLW/CTHheoteZ9BiXK7tDHxNW8ku7NJx3dHX7mKC/PNfCWYqizDE
         fcSzpOZFti8j6V8Hx+3tC2qaIxfYNi0BFkwaZQXN4uuVE8V9M2h2eB/xMLvtiGktkGpn
         hcU2YU7LWxSZUo8dFTiSOzIAgvl/C6PURVnnA8yopbXdpBk19rdRMG8Zlm2ToPRr/grN
         mFOGFjov5wDdXA4tdt9UGODCOz5IDKz2AM9PZvT//Reg3l3kcBrRLaTI8BUd2o/Cy1xk
         jF3FxMHHDGmsCR1hsvN3ktEskpX5YPIKhQ7f1V29pUlTYd9meyNlIlODUF17HrrwQdza
         1Pdw==
X-Gm-Message-State: AOJu0YxD08ni78WGvs9EsekmvFTP21sGejP3eQD4sJfqT56HYVb2YdyU
	TE4exWVcOJhpicWZODPLvZoDv3ab45a8Lp+5Da6E5F/Xw3lzOwXe05qqEVTeAEBPVLoTk8DZxeS
	KU+XH/ur80iV9WXp8mhzyG1q5XzF25TCFELYeshttAd2+cLUBcocBRDUzuqFdQkBfNesc3jS4
X-Gm-Gg: Acq92OG2i9/D0mM538mWF6b4quM1Owm+4kPIIhuqA9XLaqVNcYJuplI3GVeUDvVLI7q
	dnXd5Zudkv5aVThnnFGZaBD6iKs+Tq3/TS6fOZW5BdmrkyqCq5Bu5epHSwha2mgzJQ99MXqpibc
	sca8BtgzPWeBxZk9iddBEqLPdjtHXQCg9+ZD6MD3vOkN7RaV6wjAxNlcSZTV7ewh/9Pafgr5WRs
	srm5xibPNzI0MocE1ws88aW9GFNs2kkUY3KHyvd6clfq+CAJT1ckkwVFgUdugVuk3AWE4M6NAhm
	0SbfeNFisw6t2TS5IZ0q82Qe1UwYebrnvn1+W4f8m1X54INLo5hklWSUEi1pgFhVKiXwphC2g9M
	LxqlQrt5LP4fUpkYGWt3e9D6Jnr3DsTIr6jSyqvH1MAWh46d2LRjJTpW9Eqp23hdCgWldyAbcBv
	BkeeFVwVUYsa6WuZQAAFtc7zDLiwRjFEvzQ/k+S+LBg5tBN4IMgh1fx7U=
X-Received: by 2002:a17:90b:4984:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-3779c569455mr1173535a91.4.1781148799302;
        Wed, 10 Jun 2026 20:33:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-3779c569455mr1173511a91.4.1781148798864;
        Wed, 10 Jun 2026 20:33:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775287186dsm896041a91.6.2026.06.10.20.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:33:18 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Fix memory allocation and improve reserved memory handling
Date: Thu, 11 Jun 2026 09:03:11 +0530
Message-Id: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TTY0tt0RIixUNn8yimSfMicDjwEhCwRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX4cxht3pXiXUI
 v3qUPsw9q4XFXVwtL3lBBYOXLW9oWiXjW+kRaQkzIFQ+NtDFIDbj5ha1b2MP3QyajM2vpSUEHDC
 D2zN0SBkpQ9C5XaSwq4tva3NWQN54xY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX0OSy+yAq5lP5
 dz6qToYktcCFPfGmpDkGRoU6WXUnMa246ON0Sp2K8sji7vpdRcAQMT2WXsxsWmuKsuX93YaxL0A
 TK0Hvr1ihA80P0fQe37FycGDV2jl4LOfCjJO/+zPqmCOuXQbXOdVrBfwEvG/C+DtHlrU3mCkNA8
 zfQ3HOfl1R2H+jmVSGEoifrebA4NhRqPSA69StcQivgJaAcT6D186dZBAnoKUw0yyKwkSHx7bLS
 qaZK97E3mR8JGFl9i4H0niT5hPeaJxk/gCj3To9bE5KBdIyU6etBTSPzTwrDAxJcRRj3FZon80B
 kNmxu/q9m8U0NExqVJqB575ZuPRZDC1dP2hRwjipKLc3Krdf6SJaX/wizyeKIoDAM2yG2rel+le
 WLUY/n/wGLBP7RiJ6oHvfkWq9AOsgegYxlRvxKqGLc2diUt57h1nMHB5KfrF3/EFs4g/guKmU6X
 OXNBxtVb5bZVTBM4+Rg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a2c7f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=tue8EDAknadLuvyRn9wA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TTY0tt0RIixUNn8yimSfMicDjwEhCwRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203321_744435_B14671C4 
X-CRM114-Status: GOOD (  10.65  )
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

The current implementation relies on index-based device tree reserved
memory lookup. Different platform variants define reserved memory
regions in different orders and combinations, making the index-based
lookup fragile across platforms.

Currently, the driver allocates the HOST_DDR_REGION_TYPE
starting from the base of the Q6 region, which overlaps the Q6 read-only
firmware section. This causes firmware assertions during QMI memory
allocation, as the firmware expects writable regions to be placed after the
read-only section.

Address these issues by:
- switching to name-based reserved memory lookup to remove dependency on
  device tree node ordering,
- refactoring QMI memory assignment logic to reduce code duplication and
  improve maintainability,
- placing HOST_DDR and BDF regions after the Q6 read-only firmware section
  using the bdf_addr_offset parameter.

This series ensure correct reserved memory handling across different
platform variants, prevent overlapping memory allocations, and maintain
backward compatibility by reusing existing reserved memory region names
defined in device tree bindings.

Overview:
  - Patch [1/3] switches to name-based reserved memory lookup for platform
    compatibility.
  - Patch [2/3] refactors QMI memory assignment to eliminate code
    duplication.
  - Patch [3/3] fixes memory allocation to place HOST_DDR and BDF regions
    after Q6 read-only section.

Aaradhana Sahu (3):
  wifi: ath12k: switch to name-based reserved memory lookup
  wifi: ath12k: refactor QMI memory assignment
  wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region

 drivers/net/wireless/ath/ath12k/ahb.c  |  18 +--
 drivers/net/wireless/ath/ath12k/core.c |  25 ----
 drivers/net/wireless/ath/ath12k/core.h |   2 -
 drivers/net/wireless/ath/ath12k/qmi.c  | 168 ++++++++++---------------
 4 files changed, 78 insertions(+), 135 deletions(-)


base-commit: 83f028be15fe071efbee8e27837538d6cca77e87
-- 
2.34.1


