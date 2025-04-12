Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3439C369B4
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spgQavvN18V0dYsI38aehqIq/Bq+44upIzeuFErbrYs=; b=ofCcq07sytzSvNSZqf9V2OHb2f
	HypEfUIlk9y4fvQng1IQqgvmkcY/kfGAwvWoartdajQvd4EOLLSNrw9sBJZt5kfp36hoxuXhWMNsP
	mlGq9D5gu/ribHWIx3uk3+W9Mob+EFgBe6L+cChALDcPInv9ZVss+7dg+9m1isDrYWuUUCjdUnxXo
	kgxOAxDq94SmsrryHNrBTZIRPebkLi/7zCH4SssSce/fQBPHyeeLWwFgYrR378+2HAnGag0Isa1Ay
	z8bmNF9UHa7BQOepm/ycBQA4mOyXtMe3y+brFGW8swVbLw+lWOCI7BtLA+VBUwyDzMBcyJQyx6XlC
	xvENKhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPg-0000000FPNy-1ZdW
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPd-0000000FPLO-017G
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C4C2TG030256
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spgQavvN18V0dYsI38aehqIq/Bq+44upIzeuFErbrYs=; b=on7bo2z6YMbf3s6k
	l5Uiy2UIoOA115bzRo6/qKQ+0eSWtmgWPJBjWTiIw1VyvvgJRhOSktTJGJZBq13d
	p84xLN0JAdBIyRH/NfGoykWGWAr85pVtXpSVSrCmlylR0ggUXa9Jt2+XSJ1j1ntO
	T9DbtKRKkuAevPXOn/RNPX8d5NToHADWALgEMxypwKc7UAjTLZy0Yess2rL0Eb2B
	squMoMvJm314hPZPTSygj1avUXvtWVxajxyzUT8C7XvPplUK6nA+xehv05EOwQHQ
	mdEqXbOYPkzD3GeUuMC5A6KRTFMqHxg0D/hrmFc5fgXEt0kvG9vRZO4B+hkEzVA/
	TWMdCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjr0f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so3924932a91.3
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431852; x=1745036652;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spgQavvN18V0dYsI38aehqIq/Bq+44upIzeuFErbrYs=;
        b=JILnJtYJbK4gRxlJbG3ELFCsZGvXsjfc2HV8FpB2GaJFSNLO/2BA5BSyGrWLnjuAK+
         JMO7DcnPcAAsNbLK9N+Z6Kw3O+BD42CryXVoTS27P1QOKU2Ckb2FDSOFI7hNsIqWF189
         Q0OOd9FUAUIF/F4mDBqJvKKGVXnJR4CYJhxi0r4LxqVJFGs2iCa/KiMDD1kF9+gariBm
         PmdKdRItJYu6eCVzPwR51CTmcdL+dbvPlTG/bvtWq113FnUEkEziGKH62Mf/6oRZID2I
         Xi26oiU6W27swafLHSB9iI7+2AtE+1Ezfcy8c0Y25bP2IlTqDYwSqL/uag8goOB82a88
         ubAQ==
X-Gm-Message-State: AOJu0YzWzltmjAzrr6YXYDGiCeCDVAFtssYXLg3phwj1gTrjW6ihLwQ0
	YtlOwXK/5C5d/3n1bJVuuKiIKFnA3rP75kY2ZgDCSlcxRKY3FHKllpZTuePyhzDrjOMOVyS1hOR
	fsiSIpwS2qH+Xe4iRYTwVYZ+tk9LYiGMnQl3pIeohNW3w0q8ADwnfkaY0Qrt6
X-Gm-Gg: ASbGncvfWBVolMYQkEt/c8FKKLJJhGP1zxpOjDPIvT3+keLNc3hIaSH8g3wdiuzCcKf
	iMFMpUQaVSgj6cZ1O9Pklb1K7MoaxbNnp1SX4aHtvVaPd/Km6LxYD9PgBGMfN+R2yDT4VmruRDT
	lO+2zUAVTQ+KzeAeG3eneOE3H7KaXtRnZ+POXcFx37ioE8crynd+iFHCnjClx7VjKbAPz1VzRYz
	dC+7Pq9JTIIiuWJfQ+Nmz2s8ILK04SL1VCCkGIHY3/xKbqGbEvIxB6U8dCl4t3iBoq2pW6WNSb6
	NCHOApX66SSP4jLxl1WujnUvMNEMOTQr88UHR6n7mWYQIxn2
X-Received: by 2002:a17:90b:5246:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-3082364973fmr9752787a91.18.1744431851557;
        Fri, 11 Apr 2025 21:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+ExO9uJV9mn3ySOMN0Z/YJ1z38Veu0tv7RzvCmngbt+TKVU6ZXe1nGADd4G0S/sz8JqyvHQ==
X-Received: by 2002:a17:90b:5246:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-3082364973fmr9752750a91.18.1744431851042;
        Fri, 11 Apr 2025 21:24:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Thomas Wu <quic_wthomas@quicinc.com>
In-Reply-To: <20250409053830.4039467-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250409053830.4039467-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Disable broadcast TWT
 feature in HE MAC capabilities
Message-Id: <174443185037.2972989.6697785457699340604.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67f9eaec cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=uXoGulTGKWFQ220xZdsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WwaLOFINiMipMfqJ9-TihE9-NagCzefJ
X-Proofpoint-ORIG-GUID: WwaLOFINiMipMfqJ9-TihE9-NagCzefJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=734 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212413_049746_626B7B6F 
X-CRM114-Status: UNSURE (   7.10  )
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


On Wed, 09 Apr 2025 11:08:30 +0530, Aaradhana Sahu wrote:
> Currently, the AP does not support the broadcast target wake time (TWT)
> feature. Therefore, disable the broadcast TWT feature in the HE MAC
> capabilities element field.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Disable broadcast TWT feature in HE MAC capabilities
      commit: cfe8af4b5626354f20794f1d54c9b9069638ccd3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


