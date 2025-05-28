Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EACC5AD49
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9OaIR/JgCGry6K2mLBsDcRBp3ny/e1tbKsimDqc/P5Q=; b=3qvd52cF7B0xKt
	gn61rkALEhyu/J7tJALYh7Job9pGPlg3tjaYQwt26SP8g1ESrG/+bme8iTvGgnj1cakU2nXG0EyTG
	yCaEXezJ5j1wyL4HE0MUt7hZX+WdLWRbMK9MrXj1dSHSC9+iE6l5HcuWMp/yITL+MM7MrggOAA1r5
	gsgf+JkafZZDsmEJl0ho987+Ru/Fb6AqZwU4lea4MlR2b7tNbu1YSK3iq2KVgoaq+6jL1XFT3X6BL
	tQYFsaj0jVJuOlM3l7z+Zmw6R21AVpDNIJTlV4fr2XfXZ5uOWi6qBNsBgNB6Z33iad/yHr3/NeffT
	+pMvCfbRJqZjmksZvaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEtm-0000000CyHR-11lL;
	Wed, 28 May 2025 11:24:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEtU-0000000CyES-1ZXX
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 11:24:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAKDDk005108
	for <ath12k@lists.infradead.org>; Wed, 28 May 2025 11:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9OaIR/JgCGry6K2mLBsDcR
	Bp3ny/e1tbKsimDqc/P5Q=; b=jPW272rxOWAFGjUDZ6W+I6VCbZTymA/xhJ80Su
	5a8sk3mk4m3KHfbXGqpcalRRpW4pLhgqkK0qa3dCeJj98r1d7Ny57iblbpK4I9tw
	IYPylnUKNd4dEvF+Lcr9fdScRwJf1OiAGhkDdcIg+v/UFwUUzF1X8oC3H3zqqFhi
	Du1Xtq0WDEtWjPmzeSfVXDSCstO/k1EMo+MUtP0JYLybg0q33QPbM+pmqffQhzuP
	ehe4MKZr2o/qRfD0NbOUJDO5RzY/z5UnnEGtFpNRGidMJXR6sMqQ/bYiTs+m0/q+
	B2hdAxyo3XE+4UPARzA0p1A5WBUjTEhr6XYl11SHmVt6PAJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79pa2j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 May 2025 11:24:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-310a0668968so4092321a91.0
        for <ath12k@lists.infradead.org>; Wed, 28 May 2025 04:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431462; x=1749036262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OaIR/JgCGry6K2mLBsDcRBp3ny/e1tbKsimDqc/P5Q=;
        b=LQSHcInRrO3a6MC04JrJjhx/c4TaScnaU4C0LkDAwiEgSD8+apVkBBDrkRwLbVQFKB
         szgC9iTGMu79p0WrM3jTQBg9DnJfWbbEp9NNWFisYeqq/h23LglN0f/VDHf7/PzRzSVe
         5zCiZINr44cjhRJmNWiJh2CAeHJBNETKCD7byHbYlagThh9rcQBSw9PmdfQri+yCGdOC
         qhlkSDs0n90wLFmlP4yFrjQs1Cy03up5izlU8ioVhYrEPbSqBc511EYABFF+Sn2vOYfV
         vA5lxtzhUqA6SjvRxHiibUcSHTKGDkQFL66e+F8qC+q1h6RJ/LwXDQcTlS+otJdodFHm
         k1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCW48Eb+JvDb7FM5vvvOP2Rpz0zBbMtcUtf5pxjK7/ffEWRXq8IKB0Nj6Tb4WJG1wMBbtq1Yhfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaHWzpK33oc/i6e+NWemE6bOdQFBGHSF7QG3dobnGk0YNjTKw/
	q2xql9cXSqfoXbEMRxYU3v9SnWHPaG9PF7CGt3YKgsdz+JbUcig9thiRF9n1XV49oOS8vu0cb9O
	g/PRiqOp6G61LjhXKJuKf7hZvnRjalVfAsLkjEOmt8BZJzwltr+xgMn7OWqQvYgzM
X-Gm-Gg: ASbGncuVzu6fmD0xnJBp1ITTrFnkfJQmH6iszM1ucZZruGf74IJ53KgOScM4i4uPk2M
	EF31nOjhYQ3UXZfVIPXfYAU3iG7LHDs9Bz53H6d1xWHDFbAlc7HTz75MIzpCtyd7okf4tvjM1Pm
	bnY/O5is9GL0rF0waaO6+Yu48T066i7SlQWkMb0q4qheeD8CtGK5eIypgMfFJcNcNm/LvisepOZ
	I8Bpq5eiUjpyZOF2IbntiX+Mmf+X1dmrhNXlnsGd/vlAXOQ0SCXgkRf0tzgrWawh/yQ/8vyAR1o
	mnDbL32S9crQfEebRiUZZflADGPDOKlxm5Sd4F+8vgGdNtMiUJcexLY9Ev/FDYXo+wShSixpE8u
	r77pnv4Wwo5TV5gOGdPWQQxvc0bPKWlKViTPa
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919585a91.4.1748431462437;
        Wed, 28 May 2025 04:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT2k6BW8Nw88MJooxw2RTEDAtCcWs25yiA/HlrYnpjr7dK3nH9uZma9yPDliobnauzqCuwkQ==
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919559a91.4.1748431462029;
        Wed, 28 May 2025 04:24:22 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b668ffsm954665a91.20.2025.05.28.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:24:21 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: use real noise floor value
Date: Wed, 28 May 2025 16:53:59 +0530
Message-Id: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/yNmgC/x2NUQrDIBAFrxL2u4JRDE2vUopIsqkLwZXVlpTg3
 Wv7OTzmzQkFhbDAbThB8E2FOHUYLwMsMaQnKlo7g9HGaTdaVV45s1QvGHafmAr6bWcWZbSbr9N
 sp2W10PUsuNHxv75DqFElPCo8+hKpVJbPr9la+wLFfiAkgwAAAA==
X-Change-ID: 20250513-support_real_noise_floor-205986936cd3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: G_0weywpArtCKFL2SKgpVHZjdL5EDog9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwMCBTYWx0ZWRfX0tSvMKNG0QLC
 IfHo2VeMsbwWjVxJm9cbX9cWEjvLInkqzwzgAPMMeZTGcHgg6+KwbeV9UrxDuAv7KFu099Kf6vk
 r00jzFmccFW8feoQ3pu5125Wsfbe+GMstxriR3vbb7T9Adv1vREVucfa/9mfneTAHisBxtZktEU
 +RyBrVANuBh6CFGTHuDPIKXDiYciQZU6eym6bEssxb0ZmBUUTqWwPpRUNFsvBgYHWERKGlkz/Io
 k8v6tK7J77iY6uKQ8K/7wi4m1ydlNKfhspEyr5kr47U0PY1OOTi/DegWdvWTcixZmi0kDUOAcMK
 XsUEAH8MjFNCDqDCKZ/q09ctKJOPF71Z7WvbcTfxgxZYhP0W4iQqWYbzti77J71SNAt6MfAMwE2
 96hQBk5ka9cIfe78tdIrRpdsTtBaldMl/FOsXSCn/4+jm2lweEe8EaYMRMzrx22qWE8oPZ/B
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6836f267 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=oo-PE9G31wNHbytkz5MA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: G_0weywpArtCKFL2SKgpVHZjdL5EDog9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_042424_430165_E2CD42A4 
X-CRM114-Status: GOOD (  10.55  )
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

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value and use at the required places.

---
Raj Kumar Bhagat (2):
      wifi: ath12k: handle WMI event for real noise floor calculation
      wifi: ath12k: use real noise floor instead of default value

 drivers/net/wireless/ath/ath12k/core.h   |  17 +++
 drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
 drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
 drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
 6 files changed, 324 insertions(+), 9 deletions(-)
---
base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
change-id: 20250513-support_real_noise_floor-205986936cd3


