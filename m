Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316CDEB1067
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2OeWWoBlrn+hE57o5R4HFjP3760nChLdkyVHkv5+C6Y=; b=kOyD4kAnXqA63U
	qWaLSP6bAJ7Y/nVT+/uX4Ou4Y54g0Qd4BP+81FZzSNjlFdClLzisvccnIN1bzrMYNx9MvINjmwRT3
	2yxYCuejx7gERm2frluCKa/VhrLKbTjVASkEGfpU2AzAkuzzw1NkvysX4+bWdY2mK47I1Ep/d8Ncm
	3L20aNL3+D7Wub5f+PxhbuBJ4PuChrfJeFKsFRQoHb5gVsUl5xoYse6IMjNsBQDdTK6P9l5ecmeE4
	ja5R10Wx8y4WluDXPR1LlfStrgbzmKUiFGNghuzgNuBlIgkqW5Or0UdmKrTSRNeV+ecwcnJ0Drf7I
	Jn+0ijiqD3vypA/6ZUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyom-00000009m64-3wJ0;
	Tue, 10 Mar 2026 15:16:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyok-00000009m56-10WG
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 15:16:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACafnU3760222
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2OeWWoBlrn+hE57o5R4HFj
	P3760nChLdkyVHkv5+C6Y=; b=ji5yva3hyKNemHmtCY2/pi6hpnAdLwiB9mPTcr
	Q+7zSxCYLjg5/NyadbW8CX8EbVGbZMACwsB7QZCcy2d2L1gnPZrPg8FCoUZn00Vv
	IbdLbRtUnmbo42HZUyRyxpPMBuI0sj2oOJI5iMmmKRFYWLfklz85mTaFRKqpoNwY
	t8+GbqQbWbY0ygplYUbAUMB3YTyhEOsrW0P6eHkS+/vdGpWBgMHnyCjSv/wTklza
	UpM0PNY97Xbw8h29MJ8/Fet5/4EsNEP8GPpZsFMmuJrGEE5mbqAhjUDX4RmL72Yd
	TWB3RvBEcUR+6N3Zt3LXQpYI5n7yUhfOigV86drz/LWwEPiQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugnmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:17 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4176f39cea6so1486027fac.3
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155776; x=1773760576; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OeWWoBlrn+hE57o5R4HFjP3760nChLdkyVHkv5+C6Y=;
        b=VexXjmdo2cPZNB/vYwQpyh28In8/Vi7fWBKXev5rkgMAXt4GO9s2mPtMCH9Fb4Pz7r
         +wh1xy1qJiyrbqFFKSt9OEHxfL0Sq/rokTtDBcrxJt5pnwUbDXiR6Rfb+i7XcDjKSfAn
         7XBG/HHbAKb5aTXbT6ywEK76u8Ls3oKbcveU8w4SpzszVbXIbJ1NRwL0ud1AGLJMeA/N
         nGhbI7S8oo62fqRz5XLY8Iits/9dvlS87yW9BmUaaz8H6Glyvozzwa6OOVHYn7NTmGId
         Rhiplg2squcJNI3/ISHga03iv8T9m/g48ugJG0IOA60aodXGdeKeuU3AJEitXzFCFjjR
         ZOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155776; x=1773760576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OeWWoBlrn+hE57o5R4HFjP3760nChLdkyVHkv5+C6Y=;
        b=tFPxUD1K5Shl2l/UHeR78OM9u5PmZkgZmvaEz69VlTV0iRAnN9tU94KrEyRO09kiS1
         shsBqfjwqgYK4SsJKKYqWFNfRo/FHBw2hj+lj+HB0tgQXiIA6t9RcO9+J1f22WqPqrdC
         MorFLnz5br5WWK9tdeswx/EAYmxgqAGSP73pWFN0DRD7hLYWUvgDCu65U3wsvllUtjAn
         vuB6LwZBu0QyeL65o2uQGqTXWcLWsIv2vUrYdIF5ZItNC53x6FlvKDNYQcm0ClQA15QA
         x9CkBJIgi1hTYgLYyG42qsT5eyYf/vY+Cc9qLRI7OgJAqyhTLRp4s5wGbTj8gwbeXRJn
         8ZCw==
X-Forwarded-Encrypted: i=1; AJvYcCURdBtP7RL229aQdrqWGGrvq5M8vFONsJW3Jg/p07g0XhAN4alspwx1FLxnrXQc0zAWmFs1urc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZMXsltPvR2eufpSRMv8yR881C6kH/VWajtd7CToSp1Cp/o//a
	uPEzWzx8ODCZ/d9glyFfR1fIkZVbLhLoPJHMUcnrmPgB38BPyizrsnA/vgn7rFOIpXI0qk+rAne
	URuyG/nkpZLwuIbNlKBCz76PUlpg0BsJer+vLDDaAY+zniKf5d5ZJc2M9DtIx/YRX
X-Gm-Gg: ATEYQzxx9VAXB0HWXZxNiEcz6/aGVHtW2ikm3fkc/pqLqC5rVrIoZIAKOd66Qngee8h
	h0YE4NytoyFK28WCU0CUsUflz8kIX+E58Lh8VEbRRBLCCpe24U1xC5VHC8Ra9Djz+cxP2mVHcFx
	C/rjGspWv2R6U6b5NgPAJJf/Lgc2LuKlWr1va2dfQXx7iqkRt/YY2MVDB4y8jypfohMAQtriXD7
	rh7T6FiXWnsXY/tvDCNir9+vR4RWJAGIWVELHifQaIuywleYQGPdDHFHXHIjepy+AgM9Uj2GbPX
	1j54LBXCw908TOQZz0WeK0sPBjs4lVOtFOCYjLOyxVaVZl/nlXp3yt8DbksKu6q/mftUWIH8SJV
	EC3AQXUohb0h6H/wRiGC7Pn5BuXX1piXAUrCxWEcml83GQ0DBAzjMpfuvVVnOcrhWvKgECqfspX
	Kp
X-Received: by 2002:a05:6870:e090:b0:417:23f2:6d6b with SMTP id 586e51a60fabf-41723f26f05mr5018719fac.52.1773155776336;
        Tue, 10 Mar 2026 08:16:16 -0700 (PDT)
X-Received: by 2002:a05:6870:e090:b0:417:23f2:6d6b with SMTP id 586e51a60fabf-41723f26f05mr5018704fac.52.1773155775807;
        Tue, 10 Mar 2026 08:16:15 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756dbc7afsm2714603fac.14.2026.03.10.08.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:16:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Clean up the WMI Unit Test
 functionality
Date: Tue, 10 Mar 2026 08:16:11 -0700
Message-Id: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALw1sGkC/3WNQQ6CMBREr0L+2k/aSquw8h6GRVO+0ggttoVgC
 He3IW7dTDKZvDcbRAqWIjTFBoEWG613ufBTAabX7klou9xBMKHYmUnUqefihbOzCRPFhGYg7eY
 J2UUJoeqrqesKMj4Fetj1UN8hU+hoTdDmpbcx+fA5Phd+7D+9+q9fODLMB6yS0lSSdTcfY/me9
 WD8OJY5oN33/Qv/OR5z0QAAAA==
X-Change-ID: 20260305-ath12k-unit-test-cleanup-07622698c994
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qf_qNovJeKcBoWh1xx-0EPW5AFxOBOQj
X-Proofpoint-GUID: qf_qNovJeKcBoWh1xx-0EPW5AFxOBOQj
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b035c1 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=RTxW1uq26efjKX52IksA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMiBTYWx0ZWRfX1Vg5JZIfc84C
 b8KPMyVW9+yEn2x9GEcP9cGWIqYT4t9OOLGsecszfyKD1ueA0w5UQtULegbasYLoy8MXfXOH+iy
 8U5OguyCqS56KDdqJ3x+v0m40XFvfdDQuRXYAMAMb/fxPW43gQABX2iXdSVEceEjWedHNoXaXnX
 RzV9LQPJQv2AAPOU7LokxO2rsKcBkNEnyFD8EUsB3K+vLsTmg3rJDmRHvA1nupiwyGRurscXKGv
 U41O4whglbHnrJix8bx3dCv3ylINNwvP4kqH2YlmvHaRZzLImuT3P4+6/C1mDyhkL1cNdDAhqED
 c1DklCysAheIroq8M+K0DNe3f9S/VplyMdAl4C1p23o65BGRiwWjcuKifT1GSqWYiDqRREnQ+5O
 lUF6rOUOZmtMJRBh0TPABJf+ee1EQqGVBZ/17remUiGUJUkECCfMh6dGIQyQ+KWOBQkZci/1vtX
 dh8NfIvKL7RdDTBOnWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_081618_318453_C51D4472 
X-CRM114-Status: UNSURE (   8.35  )
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

Patch 1 updates the core Unit Test functionality to address multiple
existing issues, and patch 2 removes unused DFS Unit Test definitions.

---
Jeff Johnson (2):
      wifi: ath12k: Clean up the WMI Unit Test command interface
      wifi: ath12k: Remove unused DFS Unit Test definitions

 drivers/net/wireless/ath/ath12k/wmi.c | 58 ++++++++++++++++-------------------
 drivers/net/wireless/ath/ath12k/wmi.h | 14 ++++++---
 2 files changed, 36 insertions(+), 36 deletions(-)
---
base-commit: 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da
change-id: 20260305-ath12k-unit-test-cleanup-07622698c994


