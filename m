Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A7CC54795
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDC61yXbFM/Kb2g3L34VancVGNjjcyrYp+7WjIGLddg=; b=X/GgxWuBbmnbaZTyX+aTDJoUtB
	fKSRTyDCo3QWHwa25Qgfe3pmoHl6uVkE2qNW7mwU0BGVK8E+kodTbSeaeB4dvDCs9zRzDKIPxJEGz
	VV3UQZn/v1AhRMXBM0lp1iDFUftRASvuqBjSl3I7niWsEH4wnz5A1HmuEkdPfu74U0NHKS1hzxW6+
	l3w1N5nUmjr1mGNcAZ9hwvWYzzjZBZZXhZzH3ie3xMFrHQ0EaHEA+akUuNcNzD5qEANEiFysMWtDs
	OJcxYPls5zyZf7iLcl3yAKJOV0eHeNmn8AEevnglZBS6YTBC18n2wqp3wYd3i8Xcr8Yz/zQqRu+WD
	By6H6mFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56a-0000000A7in-3lVN;
	Mon, 19 May 2025 18:20:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4au-0000000A0tx-32MI
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iokg005266
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDC61yXbFM/Kb2g3L34VancVGNjjcyrYp+7WjIGLddg=; b=DC9eWWXE9qkNCrRG
	dPaz/20/I2kxs7WkDy+VnDLPGMFjxJdu3Sgc681cND3w5ybLzeQuY7PeRgHguoZI
	hKcMkjRlWzkHZlw3q6Qxyng1bEWJRDueuitGeOTpnJ1QaAXiLW+T/OxUzzdB6VNl
	K64yfADMuBF2F2fOp+Hd/1/SbGd10/REmb01Cz7WzbVucj3whsNvTNO6eY+LuyOE
	UmRLaG2n8SJUR9TZmGsYbHry1b85FICol4rjuarrvbeFTsA+QI1d3j8WGqTItpLt
	mgkU8UvsSJDV4nppMwr+ZklXKl5KmojRXqKV88meXS1/6HPpu+DNgb/k+Ny4yPBd
	rDeVOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4w7rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23228c09e14so25382405ad.1
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676887; x=1748281687;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDC61yXbFM/Kb2g3L34VancVGNjjcyrYp+7WjIGLddg=;
        b=JzhcYKXEbnUWZL9SOQC/D6A2IEYTPDCFSYwDjf3PNvgXNGEIzCvrcHnBqfESg9JQjT
         7p4oRJeblydwviIvpP3LwVt5z4QNt7bi1mHckhUKge99uewaxv4YSIceSx/GBUOZr0a7
         SvKM9WD2w2HP3BkPTxSrHozOcjh/1UkZ+yntHl5qATN1mqfHymx8tGYMOpOsTuTKTVie
         Sk92qi5l7YqSvzeYU++bMIZIHxp7UtU3NggX0wQpQHtqRvY+qjXla1SPhR5Bo9Ee2Vvi
         66e2yR5ozb2A0w/IVSe3Sgg5fQywCuntw8Rv8TXTN1AejjEg05qK7Eo6aWkTwmftr1VP
         pBrQ==
X-Gm-Message-State: AOJu0Yz1fPXXVP6IegVE8Q1HrIzGgPYaywEm7StXodDrgIxVV9AQrFA+
	vaaGqed8eO06w9GuY2AVaHQuo/AqR2VEMhMAqeCbXEffL4Aq6m4MWEj573aUKgV4ngLDCIkYnpO
	icU+HIgdrHELiU1/cfRAxyg4rgEA/xDA1eUzF5/MDMNDBIZLmwdRLMA6QGEp1XKTC
X-Gm-Gg: ASbGnctEUWecehhWfCmLrJ7/bZGHW75QNtn+FPI3beVZTovJ6U2TYkDehFsLFPSvRXs
	p7LUhyLAawS2SAjtMWcfxuK17oTrGX9xRY+p25BUTIZhgRJedTbgsUBS3QabbRTRGFbN7bDIOPa
	kJlSwwLYJIk5U9uAAVfE9B7WQ04mYC/il24wZmh0kH74Flqmnr4Q4LryBT8C1Decgi7By3ZRzhK
	Ezw6Qh4D6ilXBoxBa5ZCulLsoeBXLBz53L3ItK/1YFlajd5f5v4Iy6JXi9+0YYLHPWrq2piHK3P
	fXm4x+S9tZIBeZrpA8KzaJ+wurZh/0dxutywoObO4dhuzJCs
X-Received: by 2002:a17:902:f603:b0:223:f408:c3dc with SMTP id d9443c01a7336-231d43db55emr185691255ad.9.1747676886896;
        Mon, 19 May 2025 10:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmqx5MzabeHoF3LGXt/LugmjXrWNVUiYh2DZ9pB6eQ1UXVutlvjRUGQgbSrOAuL3nugYe88A==
X-Received: by 2002:a17:902:f603:b0:223:f408:c3dc with SMTP id d9443c01a7336-231d43db55emr185691005ad.9.1747676886531;
        Mon, 19 May 2025 10:48:06 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add device dp stats support
Message-Id: <174767688597.2567051.10144712868434385694.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b6ed7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hEC-skTLgEnFcRQdyeEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ZPApot1Jbfm3EbQeHzuKx6YNt_VUhtRd
X-Proofpoint-GUID: ZPApot1Jbfm3EbQeHzuKx6YNt_VUhtRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX+Z2IVzfl6Pb1
 T3BfNEkgRtVmK+PtPIZbSBejqgQQ1jkoFZD3TSzS9ibsMWcvCjh4qetOo44+8rRm+eTd7ABQRZ0
 A5t1Ek2BAC8l5Y2bNVmYBNYQhdve7H3Hfgzih/vZ5lsJ/O+MMrLds3cW9r0W5k5m7Y93x5WRX4G
 75uu7AbLaUGS2/jtEUMd0fs0RZ1Ale8sOPvqdDzyrSkrV/E4H18MqYHt/uxj1T9pDDpgdSjQt5Z
 DihfGyeMdjXsF3IIjwATEbMd7LQeWFNm6XzO8LfL3XCExq4eaAsDmeY06FTFWrmXGLPa1hwp2bd
 oXsdjFTgfw+0CxkVj3aVCSVMrk5TI5g2opT7E9/fzRtfREFeIdf0x8bsWMX1ZyW0A4c5S9kNP51
 x7laKCwrUvankPplSnzS8NniLyKwfzAgV2qsdVb/2YvIIiA8FCAoL2FxRArFCiDWzyaYLPri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104808_773655_D4D24EB7 
X-CRM114-Status: UNSURE (   9.91  )
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


On Fri, 25 Apr 2025 06:57:59 +0530, Nithyanantham Paramasivam wrote:
> Add support for data path related device specific stats. This
> information helps to debug connectivity and performance issues
> in AP, STA, and Mesh modes.
> 
> Depends-on:https://lore.kernel.org/all/20250417065237.2507613-1-maharaja.kennadyrajan@oss.qualcomm.com/
> 
> Vinith Kumar R (3):
>   wifi: ath12k: change soc name to device name
>   wifi: ath12k: Add device dp stats support
>   wifi: ath12k: print device dp stats in debugfs
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: change soc name to device name
      commit: b602f1f2d6d4d4197aec137185875ad8b155747f
[2/3] wifi: ath12k: Add device dp stats support
      commit: c5c62287e6901c1dcac414e8e739bf9fdc72c505
[3/3] wifi: ath12k: print device dp stats in debugfs
      commit: 84873d542e95de3e00ac6e8c95ebeba9f29d6092

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


