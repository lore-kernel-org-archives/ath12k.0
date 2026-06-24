Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4AECDB47F
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ceolx51IMiKi/Xy6TckNFHx2qtCnqPCjlUshAi3WAwI=; b=sR8lbxCzLu1mfwEEU8zyXUbFyO
	9n3DZmD86c1yiYfnmrnm0m4Lv20TVxf3DsGz5SJqEKHpiRJFnQ2lxxMOJPdvCyhUR9ndL2z/LD8Uo
	9WP3DIFONVyfuaIG1FCLQVaYid8SFYyhqy7Nwb6mmMsxnJJ0rAxvrGfMhnvz5lRGBWRPxdbXeNVmS
	QxviEf5FV/H3pZrCR6FfMSbBn5r/ht4J7Gw4V/Xj1w7N9EgBurMyuS1euUHZkCIpNtv1Lro9oWBQh
	iMwZookmX25DNYX5u+vLFEFq3CZVBlsSI87EBBgLWOzDgo82qL6tDQoNHwAXvxCMh9TbAyChJHi69
	NsS/fYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYp-00000007Bea-36zc;
	Wed, 24 Jun 2026 05:54:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYm-00000007BdA-2rGs
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 05:54:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1TBR31398602
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ceolx51IMiKi/Xy6TckNFHx2qtCnqPCjlUs
	hAi3WAwI=; b=Tr9yqa0lYxs0BOVUyLAcyYMXL4Xs01IrvwCxAS1tdSR9YxwsUQl
	VuJDxcLQMvzDeQ1zBibthk2NMI3ZmoiERj+2G3eL9jGDbXdH0ZneRYeR84QH/Tpr
	O0dN4zM7psD0b6nUQ6NP1/vgd49x6qBO0yTlTfPEnq0YIoeNHf+GtwK41QCKbjUE
	BvrN+BzovM0D8mFmIkIo/r9jyqJAQhJLKbVZFimsRlyEfPln7tjo0A9/pK2/fSFm
	orSIbpxRoqE+2/zr3Lik40lDhW1JmRbjU8eQD518VfOnPmHKA7ECOqCUfpiYGKfE
	0w/xSh27zSJ7KLD7+WpnjfgcgCIeBYrv+0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aq8qt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso11023545ad.3
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 22:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782280441; x=1782885241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ceolx51IMiKi/Xy6TckNFHx2qtCnqPCjlUshAi3WAwI=;
        b=hP/2cB4y6Gr2ah6d3sapYxEI1Ep6448SpA7mgiRVRVLUz5mLWhEY2U99KYZxesaAlH
         VfvEjiHJLe4a7m85aDV/Jabtbc8CbDMji6Pz/cJ3kepMwHdWXSwfv5WJgZWkXYzRgtFI
         op/zeqSoWs8/XeRvI3MLMBhF4UhPFHa8tI7pKIdtVmb0yb0Es76AWMVAjhDfksViKgKu
         g9BKaPATs+IXuSB0L/j8uMqzdErZkc/tVADweI/K0nOPO4bMEe4m3fvcFU0lia7y8an8
         GceZJamkUYy1bFDEN82U+JzA1elBBtd+eOAesqnFlRWozRNRb+3FcjKlxsyMK4c91Xhg
         wGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280441; x=1782885241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceolx51IMiKi/Xy6TckNFHx2qtCnqPCjlUshAi3WAwI=;
        b=Ph8VzwK+4MSxHRrE5kwStt6tfXWXB1LX8FeJ7n1SBftBhKI9m2btkENY7qas+q3ihU
         H24UKL+rL2zrqEJ+nIvvWWcI1dhB6F9ILsnzGxtbz6bg19/KwVSXHif2fJr6zL7+THak
         UPZy+bsMnzII+pSLkGKDTN+PpqZjraZiIdNxCxaMjmznBboYDRTYfDpJ7PL1RKPiFHQR
         sKcMbVvzfSUbSNMwdMmCTgjiznYHXFr8escgPQJPSWIc6tRd93S/jQw0ct09KMnRUsRt
         ebhmaT3l8/ihWFw2dRu6dIclgWmUyHyqmFAIDQkhdTey3dpi7PQBbQxDy5P6W6eN5lKM
         6Tzg==
X-Gm-Message-State: AOJu0Ywwu3zjEaqViPP6FPoGwbnO5h/Buv2836jrjlJpqSlhuEYRXZ+K
	c/Y3TE9ZZ3He6ODTxvh3hSzqSPflZkjvTzdGcOPY5hD1nSr36TDmfYA+ECs7Ku+/xkLsm/ZwTIg
	nlrfd5t9z5qs+mCUDTqMaAIEJKSihvZG/r4UJ61cwdOqlBCtXt65FMxXb9rmYois4QnGyfwU=
X-Gm-Gg: AfdE7clkILmi/2hypzDW4vLsWVF4RfRe/z5pHqr2yfhGqHPiXon/Y+AcczRVIeqcOS+
	j4v9zDPR27JOTZI5mc08C3y5s8AFd42CXVC7GXBRjsn2yLXi9bS7EVNqHpKGNnA4PU0I6spMdy/
	DYxuw/33SK5Nc6UzkG6B41a72D/xZT4odZ5XafI82/dxW7r4tEmtKcfbojieSwsz75iBQkFO0JC
	2XyG90PBUOKwazhc+E1ph1spWFWetK6sKPhgVoXexWo8kl3gdX64yvsJTehEMdsLiZNXPc1+HL2
	fEkk5ZIWkEmFYpLeCTTFzp8KqjO1r1XvbHlz5dPYO5561hwZ4CFutD0CuyayDHaq+IseNt/U79K
	GB70hMXaOYFYXRh9a/e5TqWHsSbwIK5Pv6AkEbCwxykGFE8+PqBcOp2Fwzr31CMRB7dH3et1aWg
	Ck4iE4cLIM+yVit5KPfL39UdD3a3EiU+nONrDL
X-Received: by 2002:a17:902:da2d:b0:2c7:d603:116e with SMTP id d9443c01a7336-2c7e15960c1mr20534125ad.36.1782280441342;
        Tue, 23 Jun 2026 22:54:01 -0700 (PDT)
X-Received: by 2002:a17:902:da2d:b0:2c7:d603:116e with SMTP id d9443c01a7336-2c7e15960c1mr20533655ad.36.1782280440979;
        Tue, 23 Jun 2026 22:54:00 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm122593895ad.49.2026.06.23.22.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:54:00 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next 0/3] wifi: ath12k: Improve dp stats
Date: Wed, 24 Jun 2026 11:23:54 +0530
Message-Id: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX6u630eZUVWP1
 OV4epaBvZkMpVLjVt20Ng47dXXQ/rh31mHP57gi4qh+Mg51LzZjSjvzyUVYVmIOS9EIoDn75zNL
 1//nTFWGpTWU/OiE79JqvKCKhnjVLr4=
X-Proofpoint-GUID: CLyRg3Inf0XXoBBzVKhR71hfBz0mRTu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX0NiR74McTt1c
 8uRFY5xNclLiqdRyX5ZxfO5HVEzqSwwqnXqkEmPGjRxCDj2+fkYtMeHUdgOcmzogu1f80eFKgL8
 8Ae/49uCkKdwBDMCkjkh3MGNO+VGZM0ssNS0I3m4AjwJLJbS/HHJH5NSeZPKp30cWWp7ouxTlot
 /OorqCx/2wGaBpnrrmGJw+o7o/4bMS7z+FcH+TQ7otq0m2Cb4hefOd2W/kCO+u8kRJRq8kNiv0M
 ojCLSBJS0vLAB60vhWOz/vvo0NC9yUwwc4Lfqu+9NJg/RC+iAsXgI9ajlDWVDGU7IqgdjAlaisT
 M56Ws6cWBjmekvTZ34NhRq62orDV8AwwgB439PmyCYNmvvS+h4cr0gxAfh54xLR2PA+Kqiwd+fq
 my9tGDOAi630Wo9gSq5gF06v8wwhSA==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3b70f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Y7FTOXQ5Sh0Y5_iOd24A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CLyRg3Inf0XXoBBzVKhR71hfBz0mRTu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225404_742968_25F640E9 
X-CRM114-Status: GOOD (  10.75  )
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

This short series improves the device_dp_stats debugfs interface in
ath12k to produce more useful and accurate diagnostic output in MLO
configurations.

Patch 1 fixes a latent correctness issue where the REO Rx and WBM
release error tables were unconditionally printed for
ATH12K_MAX_DEVICES columns showing zero-filled entries for device
slots that have no hardware. Replacing the compile-time constant
with the runtime device count keeps the output compact and correct.

Patch 2 prepends a ktime-based millisecond timestamp to the top of
the dump. In MLO setups the per-device file is to be read
independently for each ath12k instance, so without a common timestamp
it is difficult to verify whether two snapshots are contemporaneous,
making cross-device counter comparisons unreliable.

Patch 3 extends the existing per-radio section to report the center
frequency on which each radio is currently operating.  This allows
the reader to correlate throughput and error counters with the channel
without having to cross-reference iw/nl80211 output separately.

Sreeramya Soratkal (3):
  wifi: ath12k: Use runtime device count in dp stats display
  wifi: ath12k: Add timestamp to dp stats display
  wifi: ath12k: Show per-radio center freq in dp stats

 drivers/net/wireless/ath/ath12k/debugfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)


base-commit: 63abe299b12b317dfee5bcd09037da4668a4431a
-- 
2.34.1


