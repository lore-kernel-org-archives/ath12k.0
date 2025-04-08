Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF74C369A1
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/9KKlybY73Cq9H/djgojnh/GJRKoGH3oTbztLqHc2I=; b=bSaDNLBNpcxzKEWG2qJHJTDy1u
	mKS8nidtmgoV5n/S5+W6rzE7PEvtOJAGYim6YmySK9BzYTn6jP1rBqBQUuhrhklPn3zE/BrcfUf1Q
	/7wIKwUPcRYUosVri5N1070l3wPkci7NixqnlAdRnanRCHxItrlVEGI6V/of6xL7csuCretmd6HwV
	3ZB43nz3qAzsHF/r7w+XE0Ro5kW/FIxsMuUCH7nVij++IbdkIT1jfFD2/J2/1epcy5mzO0nglNc/T
	Nl5u84mKrIultahMtfyJZ67cvDWlaUqrxsscsd5LHNrkAgMwEY4jRBq7zFZX4tBLYJdbEqZ1tCvLl
	Q802Xlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Di-00000002sdR-1oBG
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:14:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22De-00000002sav-1eSq
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:14:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GWTJ027738
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8/9KKlybY73Cq9H/djgojnh/GJRKoGH3oTb
	ztLqHc2I=; b=lSiXy1CTkgibVeIGQmcc+nNKs3loq8FXrRl67hQMejkN5O2/B5q
	j3KsqLo7oXkVHEMXnhl3sUrKakIkfZvX5Gs3FA5/9xMyjyGNSQnausn4tSZJuKZV
	0xaDs1KRqJelJ8Pg8VDwgdLb3iX22cwRZqbrreYocLzMfmt17xFew8vj8acr5WSR
	eiDN751mhc5lE5T16OEUHkAAPYfx344dqQW1joYxt+dnswomUKQnBqqin57sP63V
	vMi6lYwBYVzBEtvMvxu7fkmtn39CTLNbaK0Iju0kUTaVfHvJLMASv6y+LEvrmVUN
	2yVMER8RPulj5jT9B+7XqpcLxP3ASM0IG5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyxps0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:13:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso3940098a91.0
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092835; x=1744697635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/9KKlybY73Cq9H/djgojnh/GJRKoGH3oTbztLqHc2I=;
        b=k0AOc7bUpPweoigbroZo00YBmy5AohBwITOdHDahJEUdsiV7ZG3VXwhXhcqvfBv/tV
         tfS5n8VReY3I62xZ+UJD7qU5ZghrljxRisE5jPPaw//uapfvSamSDiGNWfcvNsv/iRyh
         J4/syrV621yo1Jx6jeVa6KvgUnTGNd11N1UG9nHJIdHcfpNzfxWydV8IYTnOF8ez2qd2
         Mu7v1lmoni+61GyykMVOuegEEQxYAX0nszXWfR/x8Pv3M1YFsy0kS+c4yF5MfSWJIfIr
         VdtQQ5q2pH4H6kCk7YiHD6Y5MRnC7ay4l3h4YhD2tEMtljb44fO5ZOSx547xn4xVqHBW
         LJcA==
X-Gm-Message-State: AOJu0Yw8XVZEx5RJKT7bjLDGO8C+XXCR+ymz13uX+Nt0GQmqg5ToDaUf
	iI6WInL2p8IzYv3jKJkKkYmk05nyt43B2lVGByQAnSBmRMr1B0SlwgfjyH8pQ71G4bHKTna7/Vr
	whqOUIhV53WrIhC8mKJjt0+twsr1pn/kZI3pQDu1RZD97TB+rCF7RBN6xIUWsLAdmbW5n
X-Gm-Gg: ASbGncsBJmMZYoE36NWwiHW00tS4+0lLKsWVq9dbl8Xvr+Ss0tkfT1cbtQ3AtZOtl/0
	oDzfSB8oqxYJKppkhOs8iQrKwWEPfg9b9Hhx8TX0I3SXl3fBIPPPeab5tllgUhwJaIkhps06kL1
	DzU1PAyUF6fXCIZOy79IFXYDxpOsp0nDF4njJpRG/8WphaRqZ2ZCCcPkBaWxb1F5pzqObfxU+aK
	O4AvY/oRRhC10Zu38OXTmGMXpnfTy6ZweIHgcC547S7WN23+l+58W317rs89AMJJg7E2qgMEYS2
	Mk95mDQ9vcbP4IDx00bfzIVba/d7U5qTxtG7FZcFB+EcSeXDD0cN8vAVmd3sw14jwuIWuh9+/vv
	zCWmaEmjmbwOeBzBPNe5OmUEBzyHLNx0New==
X-Received: by 2002:a17:90b:51d1:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-306d0d1d6afmr3204627a91.14.1744092835256;
        Mon, 07 Apr 2025 23:13:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHADd2iN49Q/pgPB5M2VZ4/dQ/gJ4REj1JRFF/Ov4z2SUraiFMqs8oUOS2HsGAhV+d59+yhLw==
X-Received: by 2002:a17:90b:51d1:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-306d0d1d6afmr3204597a91.14.1744092834745;
        Mon, 07 Apr 2025 23:13:54 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb94f4esm10258444a91.46.2025.04.07.23.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:13:54 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2 0/4] wifi: ath12k: Fix multicast memory leak in tx path
Date: Tue,  8 Apr 2025 11:43:39 +0530
Message-Id: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YUNb5Evz3QOYDF3jH_zcjb8McQgaA-7D
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f4bea5 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=O8uiHmLsffw2fOifbccA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YUNb5Evz3QOYDF3jH_zcjb8McQgaA-7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=663 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_231358_547096_4C92711E 
X-CRM114-Status: UNSURE (   8.80  )
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

Address the memory leak caused by extended skb allocation observed during
multicast transmission in this series.

---
v2:
	- Rebased on top of TOT.
---

P Praneesh (4):
  wifi: ath12k: Handle error cases during extended skb allocation
  wifi: ath12k: Refactor tx descriptor handling in tx completion handler
  wifi: ath12k: Fix memory leak during extended skb allocation
  wifi: ath12k: Use skb->len for dma_unmap_single() length parameter

 drivers/net/wireless/ath/ath12k/dp.c    | 10 ++-
 drivers/net/wireless/ath/ath12k/dp.h    |  7 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 87 ++++++++++++++-----------
 3 files changed, 64 insertions(+), 40 deletions(-)


base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
-- 
2.34.1


