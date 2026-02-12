Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66457EE36AF
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sAEB+xpA/m7DLe8vYLgtlF8UQMruQWOmggFhyyqifcc=; b=PM0V93mnPFYT131/fU6j1VjsQV
	Z0BSR53Fp09blGIOJj9FS+rxjN0BQJgI5Qs1PQI+AMcK2jmZHIIMwvHe6fIzZ2x1awRjScJhwfs5U
	U2ikcKvcMTCI2tlVvWD2OUpRMTn1B+1VoOIi2M8MK0n+rM5fMkeVDQa1jgRwgi4FNmk2bs9Ixxu12
	Ys9OzBc5q2Mur2PImJHa0mM2bCvh1NWaVsbfcCI/NfU8L3K338gXbhO1U1uL69hIABEn/N9DclQpW
	ynzdWaZySaNB7izW4N2fymfoX+NVQ8Qln3OntKSq4h00oWwehS/qF7iapTsiwX6kuF7ldqBm/igSk
	BNzJCGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaQP-00000002R7D-0WZh;
	Thu, 12 Feb 2026 17:24:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaQM-00000002R6J-1RH4
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:24:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHM9BP2093750
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sAEB+xpA/m7DLe8vYLgtlF8UQMruQWOmggF
	hyyqifcc=; b=NyMahovSHXTT0XGvczh8gbPDHICquL0bVZ00YgTVa1SkNULoDPU
	oD3X49bUbFoIyK4s/pSp+cronlILavNp1x6a9CfsagG7W0XSkWaQzSe8l1dsmg9i
	j5/TNs2cQUubkGcRPS8WF021Ta6p/KRiNPBIEU0iWISI/LFlclKHnd1b1P8vsyyU
	8rLlOFhf5KqizaeZbP6vdzu1B/+HAdF26or3saU4uHRJIKFG9M5nVD2UXPPJM1+3
	iU+ghZri4KvTNME/PkMKy3lZ3bk0Oor/U9+RnTRTMlZoXUIPS160G3zNaZ/COgMf
	3lsvKPzgCLIe+R5ZNK99oG38dF8L90HU7QA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y007u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:24:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad3380076so12990475ad.1
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 09:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770917055; x=1771521855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAEB+xpA/m7DLe8vYLgtlF8UQMruQWOmggFhyyqifcc=;
        b=IcFBNBy1WLWLwsg916xNjcOJkE9A9mqWmu2mlwgmkXbkURujYrKTI5XWHzzHRKQDWO
         JOjTCQRFiQ0/MOg4zZTM/1hOaZbH6ifWYalhpZSY3XeeR9H8PyhsCFLXYNKNxRJo28+V
         fWdn2sDLAB+ETawh6Pyv2Dw0uaA9oxrFqgLc98Kh2yvxQsSvRjzw507dQlrPumbkpQt3
         DFKgZQtVNQ4kuf4KEzjoG9jJJMLazTqpWAFNMFKRwFOmq/lr/Tc8ZXs75DRO3JVdw81J
         kf2dOPOffsIRDSKnCHZXEpQQSWGdQk1LU185Y+Be5WtHytE0pZSeVzcRYOJQZfAlhL4j
         NB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770917055; x=1771521855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAEB+xpA/m7DLe8vYLgtlF8UQMruQWOmggFhyyqifcc=;
        b=dLWGcqLPlIVC/gYJZztEl8f+0K6nS3iISfLHRweiVLTiHAwGtHRpY/jDm5WJmltGy5
         7JQoKv5Pf9bh/SAfz0GXAwQopiP1PA+Zp7/h1UVoUWr4DyfnyI5GUMicbMXF263WoQJJ
         PtGsXXC3f0Ka64bSq9Q41Jm2uexcSGLf1iii4227Uha8Fna5+aRBhG/U7rnCYgWhAifn
         uSLGu5tMrKHGRCFjnjYJDTHPJOa0rDZJwVZNLdyRkEgbWf3vPRHBdmOdMDk+n6/xuLCB
         L7P4o05YxEcHGSgxr9qR3WksgtENeUdG6ZMBz2I1RGJ0GkoFNZmxwGs6FHiya4u6ZGZP
         U1jw==
X-Forwarded-Encrypted: i=1; AJvYcCWl9M7HhxhI5ZKppg4BlDxk/nQylouMt8pIxoRDyCciUmDFXy5rxSCoVr24bEgZ/VBVQ61E7YI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZH6bzWxmCdLONQ95puswvvMm1PYH2A5XXgc2szF1ZII446uDG
	BFDy10eQd3PBdS00bFWdwwzxcRwFiHxz7uF7/WZGk2kneBU/3EWaTKHP9Tg703zW/77bxvd18Hk
	eR/Tf8FtgkGiHBP5B0tEPrVOtAz7fEQLrpd9vD1P2KQYgRkgbLYJQ5xWrfGrOtNTk
X-Gm-Gg: AZuq6aK6selmJjLiIBqAj32sA1wdi9vd/1rTM5Hnvfv3nQTQQufFtjSxxIy4+EJQNdX
	S4gJMd5xJVbXrtahasvt+PErGiwnBjqIAiPJ5odgv6hLSg9nliDFm8QtTJvBsnU6BxibO6CVuKa
	YjSLwZ5BGB4KXvE4hv9wXys3RnE8+M07P71S5PmBkmRisU6Iu9kd/jbLEJIjZpK4rNMyAlQIill
	DaTMDa6XvH4EnNj0hLgivNFLE6HctUf5M/w2zfk+Of0bOutjkrwSCp2NBcolQE+3WtdpWNCFv5P
	965jG50Es2Bq5ZFzEC+31cxoIVM20F8dhYNIJwVrN6YhA1WcWeVjdpi28pqlW3fleEgUkgdkQ2o
	2dpdY3kXNW/Y4+7C07cM10cWTJsNvM3jQLnCN+vbzvEPAmbs4t1tjVPT3jgBxLUE/Bg==
X-Received: by 2002:a17:902:ec84:b0:2a7:bd50:27fb with SMTP id d9443c01a7336-2ab3abc3fdfmr37582805ad.16.1770917054851;
        Thu, 12 Feb 2026 09:24:14 -0800 (PST)
X-Received: by 2002:a17:902:ec84:b0:2a7:bd50:27fb with SMTP id d9443c01a7336-2ab3abc3fdfmr37582565ad.16.1770917054330;
        Thu, 12 Feb 2026 09:24:14 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2999879dsm57697675ad.80.2026.02.12.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:24:13 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v2 00/02] wifi: ieee80211/mac80211: Add UHR (802.11bn) Capability and Operation parsing helpers
Date: Thu, 12 Feb 2026 22:53:59 +0530
Message-Id: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698e0cbf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=9AfIhKOTUZz-8RWr15wA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzMyBTYWx0ZWRfXy2pFgrqill+4
 4UWe8foOSR8Bpwf3uwVuTKWzfZlbasCZ+75l0fHXUvd8Bx1I1g3t7zpxz8tBXxJNtt9nW2FN7u0
 zmx5v8ntptYZVE9Gw2SlLOyj8QHG9dzAMFw28TyuDtShLgAiPtR+0t2h+np/CH+4kLhvsZO7OYk
 aLv546rS19n5asU/730EjUR+sR9ug6+g5dGKEplqSv1aEcwl6NqCux7CxY7lPwekNFI4EcC5qa1
 7PDMAqvPMNsPNCmBF41aiOVwOToiB8a1rQYr7mgi3I7NZpNu1TkBaoFfym9E5tJkLCVLytmngP0
 kKd9kp/i4FcMMHMC/F+/rePEqB9+w9v4mw7MJcVFGBpDMh8NGGIeLTAFtRsR7Als98TIsac41AP
 Z561iS44zh6BNYFr/AYXtd1728qf0rlSuF0zRwdYKJQP/O7oUOD4TL5ZnRIYyjrScmG29kjpMJa
 poTRWF944JqWAlfy6TA==
X-Proofpoint-GUID: mVJfrRIrAna8xyCLISwCSRa5vH1ZVTFi
X-Proofpoint-ORIG-GUID: mVJfrRIrAna8xyCLISwCSRa5vH1ZVTFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092418_510927_46B4D017 
X-CRM114-Status: UNSURE (   8.83  )
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

This series covers support for UHR capability and operation (11bn)
parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.

The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
There may be changes in the code to adopt upcoming 11bn spec changes.

---
v2:
	- Rebased the changes on top of Johannes's initial UHR commits
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 288 ++++++++++++++++++
 include/linux/ieee80211-uhr.h                 | 239 ++++++++++++++-
 2 files changed, 520 insertions(+), 7 deletions(-)

base-commit: 333225e1e9ead7b06e5363389403bdac72ba3046
-- 
2.34.1


