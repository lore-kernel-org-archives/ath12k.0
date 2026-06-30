Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613EBC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 06:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Fj6jzLmNOt4IG8VA0VK//9IlB0OZyzcd3P9YxWwLm0=; b=seYKg6tWN8ga+TD7oroFuGGXdM
	YKGwgXSG0UZl1CUFzfpV6JeseUhSRL2D/yfQax6tIdEmJ2009TTFJNO6hn50H7vVYxp1KXdRzXkZJ
	IYpKrHiU2TYium7fz2MAbVH74NM0FrsxksEt/PSe5BgqYHkCfYKcfdJSAdrVsqL4QWQKVGmr7tik8
	Tpsb2TajT8D8NCdBuAG75DZgIbhhIC5HEMnLQol2Ok/qvtKB/XtNfc5u0ZkfqO6delvkl89+pzy1S
	NHI3YaFrWBj4u2chFKeSCt26iYavoWO3YDjmRZXX8EG+6o5Dfm4ShsuCo5ZfZvJ6vxRVl0T/lhWSF
	G1sjl3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRq7-0000000Fuuv-0ULU;
	Tue, 30 Jun 2026 06:20:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRq5-0000000Fuu8-0xmk
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 06:20:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CNZO1087283
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Fj6jzLmNOt4IG8VA0VK//9IlB0OZyzcd3P
	9YxWwLm0=; b=phFuGcRE22mquORdSV2vI8VNYVGlLyryD3cEtSH/8nIsiEtaM4E
	ZOq5cnnMGyTq+DpygjDKzVAqVbn/2VthNsYrexJhjDKu2GyXBUA6vJzdWGJLd4Mi
	B7aQkryPLowCaBmgbiNrqVTqISYif2EiFrNhImFMWoXALSyx67GhZibWgQx1lMZN
	4xrGXkUHv6mU8+BgQAlT+7VOyoVBGBqLJKXuaohsqvPFuJS/lTv496W2NaDBn8bs
	UYAqgFFuoETQ7sYBqWjm5gGNblT1651IF2dmsBxWNWGCGpdXxKf7lX5wgHMjg9rN
	SbMkP1BaZvkQVDRTBJjaKhD1QzHUHr98EAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhac5cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:20:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c354050c34so27349825ad.3
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782800455; x=1783405255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fj6jzLmNOt4IG8VA0VK//9IlB0OZyzcd3P9YxWwLm0=;
        b=Knfg6XK1SVhDRVqzvN+4d+RpROXjGpE86fZyNWg5A5hSnDe1nDrI6XgNPGnRLBUgrv
         CD2TneczPFH0DpaZqf6IG0kFC2W2eiias0yeDGZdAVsn5f9B5pFsXj1IfZotNGoIYLsz
         YyzAPhfkn9wq21TCce3ZukpNKdFj5fXB1FPh1tQiUFPdhOfgHhF8fIDy/xvXtOjgCZin
         yjtekQzl9NUsw6jIoih9OylpePryFdmdLVO5vdQdB5C9WuTNGpWN0T4Gqxfhtbg9aWe7
         IT3X4nUswe/vtWRrPmp7tFXTPGfF5mWgGpgFZ8HrCIkouSwRvaOFclkqbaejWFY3Wxst
         i+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800455; x=1783405255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fj6jzLmNOt4IG8VA0VK//9IlB0OZyzcd3P9YxWwLm0=;
        b=Uh/5CsCK+QU9VXsDxxuSoy/r+mGOZ8krRvgubalRo59cLIno9Ni4YjkptofVR1hZHY
         x6IMfKxTRJQQ9Wej/Tkj6vprb2yfzXMrv/3FlEGcPeniR5qkODHKAAmZm0lRIQtwBw1N
         TQ832QaheWmb99gd+zSluW23lTerK1tuPyN1b1Y7HShioAXDVOEVLfX+ivzOqFe8X2b8
         6H8fJo7aSyUVh6azUt0pVVmII3QhBIj5irHw9nNjhbV7T6uI0smk2dOUfxm8ickAHGZ2
         1E2BnxkmtKeNK7wQJmYWRTGt1hepqpq1iriftID2UboC3u55E0x8h81pmk2tZkSzMvcP
         lE6g==
X-Gm-Message-State: AOJu0Yw91FCmzp/SSHW7QKBPFR/cmJCyhH/Kr28mncDmFudV2ceLNfY/
	jltWRQhjJDyTtubK/fWS1HA8oJwPhQuaWyFWw4t1AqFqrLiRd7e6pUMnGlmeQJw6dpIky0SxHGi
	d4b37FphqA+8uGdJtEo2128G7INu6WD8B2dlsG6UpHxFIw8H/9PdsdBF3icCxfq+gNi2CqR5Y
X-Gm-Gg: AfdE7cmQRqciUoe5nYr7VjxVPdcC0PKXALNB8v1xCo8XL9XgZ5CNnY7s1aCrDzTPS5k
	psiRMNmI4IVDNhoGbQGi7BT0F6Vg1N4GOydZSQXB3czgjAftRwh2IyXcfmeDS5eb+ASOEz+f/J1
	xYZZHAhhB7w30vlX4DZ5NtSaudXixyAIq9oSa67blCgeMJH11CDzP2V8Ha/OINpLSvd4gRvVm0s
	F6Hg0xIc/BIaRkCG1gJCNO1h4RjbzJ/K7v9LunDndD8wvVqxstpZbz2W6K+dKoFGNP192wS2Oj9
	rXkeF4VuXsqFNtZnVm4bBJ6CzCX6rVP+wAF3F0wsVsLm7Ib+8D9THkhXwnORjjU2Ur5I7sO1djG
	AowxNbWoYej4SqV5mt/M0VmRPYLkGb2L1fbTdffwr7WPWfgoRRhrcZb5qiqfl3M2JKxcAOERIMC
	R912VLTQzZuTjG/fMEhwMogph/OJUTfdPo4w==
X-Received: by 2002:a17:902:dac5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca2d3eb9b1mr17151505ad.0.1782800455008;
        Mon, 29 Jun 2026 23:20:55 -0700 (PDT)
X-Received: by 2002:a17:902:dac5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca2d3eb9b1mr17151355ad.0.1782800454500;
        Mon, 29 Jun 2026 23:20:54 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm6413835ad.80.2026.06.29.23.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:20:54 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/3] wifi: ath12k: Fix memory allocation and improve reserved memory handling
Date: Tue, 30 Jun 2026 11:50:45 +0530
Message-Id: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MnHSyCD2Gm-_G6t5CO5TDVAHGgxPMq-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX67a/pmUhteRZ
 wqtQ3o0WSg8qF8o9WvKelgMkZbA3Tdn0qNyPf7RnTswbZ9JfHhdb9H0vbHa/k6rWdp23zMEhU1E
 gB2ib7PnLlpYBwPiHiV0z8b7Po9GhHDJJMpPVTwmS+BZmlni06d5NqBc8LYoa86bNuRSJqDwTbG
 NcXxiDVD9LZticjWG4g4GjwSMN7+ZowoUCAjON2Gg1lIZIgZvqp6dqn3Nxl76SHtsujWjIhpdLT
 7VmXg8Ml+i59/1qQovutju6Qzsy8c+VF7gboMX2OiYB7wZWUv88PJQBKE1ZpOdDvmSz6YhP8619
 0SZo2rQVzMFe8uTdKsp7SeDge6X9JqnJTbX2hCUuf5c2Pw+xWmUX3IYFm8IlbkjR+DTypZ9ShII
 A7oc+4Asypvxfp8uM7BfbAWuLn7XvuncdgYnT4esuXmVJzKgOLoCwvlAnINLJ7JYDtrz+RqsjQ1
 RibtvoPbJCRt4ndRZwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX+jXcT541q9UI
 I6RX/XSrSMRMX8JmXihyjihKBKmtEacj3xzMcxDozTBoGh5bKRUupuupWpTe7w8IDUZtRi7Nvu9
 rPTBfCuj3GdyX8EYuk7QjUIGlUqyGxA=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a436048 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=l_aBv7j6DcCNCqDfN2oA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MnHSyCD2Gm-_G6t5CO5TDVAHGgxPMq-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232057_567681_24ECBB17 
X-CRM114-Status: GOOD (  10.83  )
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

---
v2:
  -Added bounds check for reserved memory offsets in patch[3/3].
  -Moved system includes before local includes in patch[1/3].
---

Aaradhana Sahu (3):
  wifi: ath12k: switch to name-based reserved memory lookup
  wifi: ath12k: refactor QMI memory assignment
  wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region

 drivers/net/wireless/ath/ath12k/ahb.c  |  18 +--
 drivers/net/wireless/ath/ath12k/core.c |  25 ----
 drivers/net/wireless/ath/ath12k/core.h |   2 -
 drivers/net/wireless/ath/ath12k/qmi.c  | 169 +++++++++++--------------
 4 files changed, 82 insertions(+), 132 deletions(-)


base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
-- 
2.34.1


