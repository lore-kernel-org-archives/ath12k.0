Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E0CD37AC
	for <ath12k@archiver.kernel.org>; Mon, 11 May 2026 04:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+VIpKzdOH/gc9Iwpm5muVNuFBdw1lCxrFtlQ3zbJTI=; b=PumupBfiGFb9H9TnsPx/lw+mcm
	435S1GnbmUGsKE43mN1ssVtPyIzLyYCeNLM7v9BsECiKQB03RoiruEz5qQXIwOgLutWrRbG1/tvwk
	cbRlQry2qDCXjmpUE69qYqT5ypO/YIgdSlZwLGyw5I1VymQe9r55oaZqfHNk9IL9hm+ULD/E5BnmO
	TJgHgT7JTlOilxd+kgkS4zI8b3Yt/g6zPcRKHyfU5UriI8IIc18bVBhj41/8o+tsVc92JYKYJt40Z
	Bdv9hKmN01Il1+ryNcBH6MlZV51HIZF8ubs+tJBlG19MUdjmgsbupuXAV1FF3Ipg+SghpSU8NkpbG
	GmcBCBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHr2-0000000CDxg-0LDK;
	Mon, 11 May 2026 04:02:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHqz-0000000CDx3-2SVy
	for ath12k@lists.infradead.org;
	Mon, 11 May 2026 04:02:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B1h9WK3600519
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 04:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v+VIpKzdOH/gc9Iwpm5muVNuFBdw1lCxrFt
	lQ3zbJTI=; b=M8q2cPBCmu36dVmHCfLskkSUoy7RwbUpT11EGo4HTUx3ZUZqQsS
	fNgaKqBPc+RqqZUXHO5c+mK/2MMu9EEAXbmk/UiQrgQoQJIJZ92nUbw8u1uXgfYZ
	V8blXM2u/q57fWfsZ2YXm+pMeB/1GqrFiv3OpDhoUE7aC+1K2i6BnAumXj5KeJE5
	CFES2ZaX4aZ05CPNCCNj563EDqNctGkqieK4/qmAiFpYKH6vQDb+miR6CUkh636+
	2rU49Rtd51MvcvG2kCAoIdY5uroOJ1FuQotIfFroHOJ+gKEezO2LVDpl0zGgG3IK
	nH3LBn00oJavIc+hO2nCbAaEQ4tX6oIAMyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsmfsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 04:02:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so4691531b3a.2
        for <ath12k@lists.infradead.org>; Sun, 10 May 2026 21:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778472167; x=1779076967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+VIpKzdOH/gc9Iwpm5muVNuFBdw1lCxrFtlQ3zbJTI=;
        b=abEVnr88hQOyFjNo//QZ8y5IAHGqSIGTG8dGeTirnmvSxt6aBepR4rv04xpU4YaEjf
         2HFaE5zFKA/qFGfjPzZjpLUCqAOJKG/U4DgDq8Z7rSlCGvDeY2E1piYDFa8RtdWeU0NY
         Mu03QfFMW20n3xyimaPtkprjYTXMKRptJgKYlpJYNJU9+FlcUvNNpDmKssa04lNjXfLx
         9HNEcJ8HeBKVdyTU+oTuYxaMxDvLFCsrSnDBECSAchgLn+vehRx0gHuiPgpg4jYdI9mY
         zypMDjN9JSgLqF2Uq8vITBJgOYkVWh3vO7q59phs0hDlIC9nN9XLRk5r0PBdW3nmA04a
         EnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778472167; x=1779076967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+VIpKzdOH/gc9Iwpm5muVNuFBdw1lCxrFtlQ3zbJTI=;
        b=b9JV/S2irwedBJTFYQ/ViddIEgXMIoICcrU/uO3o5ry3kQngKaMH9aXUw9rsSfG/uL
         DrG8Z4HMIzgUc3ThgcCLunSigNx1Tx0QdlXQxdRU69On3tshje1lrVHIZyDYFvmni/H8
         MBaYeqMASN8FlEFBg7N/XwywMKPcJC6lkEbhE/WEYGmC9M0CZjarDZSXk9JCFgcCYcfg
         t8SrxekezKjphq631rmSR/IZGa9JBs0TOfI5C7cJvFH3pLJob4kOCOonWHtPLpgk2wN5
         +Yp0BDerKDwCsHbBjzNJiS6rDnIMZh//tOUEDT+8JcVc9S8t355B97cdhKw75ZPeeQ5b
         npHg==
X-Gm-Message-State: AOJu0Yxdgnjk4bzN9j5+RCJv/6NnATD7qM+1p5QLV7iL3MV4/H6ijBNa
	AXi84UjvSS0zPkq/kI8aIdA9CeGL1B3d+P8+s3tjQD2f9mos6RCSe50WCFppt0ArNrNRsxaRmvl
	LRhZsikEH4vmMdBJvc6zpViqUNZ1S197Rx+gswCXkCs13AgG9IsYNsrPZ3fRlVbRshwRECv0H
X-Gm-Gg: Acq92OH3j+My/n9QgX4+IhNEzMwzdRWks8Ew36r1rl8WrW7fF4jn2EkA/jH6tRYNoSs
	Ors/fWgnUDem2udLVhrH5qv4c5/Ph1maFT/ZlUcyp0zFYgMZ4O7g0098+M4h/EnMXl+df0lY7rJ
	b9kBrMie/ZKYGHtGbguK721El/ZHfWFWWe5ah5PVECcaZVWXhv1ygv/EoN8rVzxKqWB6FM7TZKw
	QZSNcTVEsFxv78EusnBUAd4I4mAkk1DIuCSzjpH8R9v0r+QrD4aS575p0PfmZZBkSdyfEjAYT3T
	VaaT8XndKFuTxg+emHAUDL2GVAGRAfS1SXu4MuzHM3QKrnod0RCcEy7DyMs6CBOIf5x4w2mWfNx
	PcSM97qY2mTAQUww+bA6cNs1Cr2fYSzyakb0YsG2zapwOcfzb7mhtIztPeakURh9vAZcawAWThw
	BqibZcK5GPSul81ahcVxyPLoB0nGWS93QRolw=
X-Received: by 2002:a05:6a00:1a02:b0:83e:adf1:bf34 with SMTP id d2e1a72fcca58-83eadf1ce1cmr4685346b3a.28.1778472167318;
        Sun, 10 May 2026 21:02:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a02:b0:83e:adf1:bf34 with SMTP id d2e1a72fcca58-83eadf1ce1cmr4685311b3a.28.1778472166750;
        Sun, 10 May 2026 21:02:46 -0700 (PDT)
Received: from hu-amitajit-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm22792259b3a.46.2026.05.10.21.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:02:46 -0700 (PDT)
From: Amith A <amith.a@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, amith.a@oss.qualcomm.com
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz
Date: Mon, 11 May 2026 09:32:40 +0530
Message-Id: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA0MSBTYWx0ZWRfX7YlFhtBbasIg
 y+wVmidsJfXMV2xwKfD42ajrgZL5kEAYOwo9sO+yqZa0D2u83tTgmYZ2155ysnyuS7keWB8+oW2
 0dy7p5i7j4oQfncthKE3eVcelN+KTsz7JYgnQjDwXWskcIF/TyuX9ZGiHtjLYDaucJYWrNqx+9N
 dCg8zCPWzkwJYnQTJizdqmWdC/Zo/qVB/Z+mtzq6dQNojN41AZF4z5VD4GqGOoFBd4YWfzkKUoi
 eenyjEOdqpUqeVjweX9iZKObdZ8sKbb2g/naLotHRVdiok5JhAmOn/hXLooxDobB8C0cv3buv8u
 368k2z4y9zeymrk2lKMZYt5hO4/cI4eFQ2DQ07lWe8ZcLKkQnsV6/gOYv/al1Noby38X7kEG/sj
 r1roGGNmc6PCGlAjWpwRRUSQWpj8lNWkkoW/5xkOUxIgOnFlMBH6qm9G+7sxvVRF+cU/fohJi6k
 LNzlW9Ro1GYFHBhGnwg==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=6a0154e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Qv-E1znO2Y0tXsqnBgEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9-t9I26j3C4uzI3At7a68peJCSybxkW1
X-Proofpoint-GUID: 9-t9I26j3C4uzI3At7a68peJCSybxkW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_210249_707510_E2478122 
X-CRM114-Status: GOOD (  11.97  )
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

This patch series adds the implementation of handling of interferences
due to incumbent signals in 6 GHz channels. When an interference is
detected, the firmware indicates it to the host using the
WMI_DCS_INTERFERENCE_EVENT.

The driver is expected to parse the new WMI event to retrieve the
interference information, validate the interference detected channel and
bitmap, and indicate the interference to mac80211, which then notifies
this interference to the userspace.
---
Changes in v2:
    - Added an explicit len check in sub-TLV parser before accessing info.
---
Aishwarya R (2):
  wifi: ath12k: Add support for handling incumbent signal interference
    in 6 GHz
  wifi: ath12k: Add debugfs support to simulate incumbent signal
    interference

 drivers/net/wireless/ath/ath12k/core.h    |   8 +
 drivers/net/wireless/ath/ath12k/debugfs.c |  46 +++
 drivers/net/wireless/ath/ath12k/mac.c     |  46 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 425 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  72 +++-
 5 files changed, 596 insertions(+), 1 deletion(-)


base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df
-- 
2.34.1


