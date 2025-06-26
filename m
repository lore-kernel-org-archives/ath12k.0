Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11973C8300F
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8iy5nJ8Pnes9S9XA4npBQfdAf4WRx02426yZk6TbNM=; b=2qZA/eqsyTE9E5bw9YybvUOzk/
	FRmyfOm8ylsJHPNyuUO37BJecw3zgoUKra5jfIV4qD4eKXCXHXcqp374HuQ0Kn2rOiJOA7xsrwokh
	4WqvGstn6Cz28LQtbYFTx14PXm6NcAE/taYzVYRIo9BH472sDaHheugHbo9Pp8lJik1/hF2yUFMAi
	srlMyMXA5E2Imq+mc8TMAjjxGfsan2n0hG8h4xrynlGNPQ3conKpiQcGSy8oHsQCI+dWSMhw4A4Ou
	LIi+r2HQCFqULbCPTKCAwilSmdeuKLpjaLuRsOVKTecNeNpeBxP25SePYYXPZJW2Yb8jK3pg2c4Ur
	v3bnvVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuV-0000000DCU6-3SRh;
	Fri, 27 Jun 2025 00:25:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoX-0000000D23F-3mPH
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJPi9t016254
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8iy5nJ8Pnes9S9XA4npBQfdAf4WRx02426yZk6TbNM=; b=mkrdwtVaiPknV3+X
	FFiqPwvd8QLZm2M+bLgRTREF2Pnt815jPvjSwuEHzqC84waFThfweavNJUCp/9Fw
	Q57xrZ0f8WzFyJh0HoXDwRwRbl+68Yn0NyodmMRSMtSAWNpXbKBiqY+UVJk1if2h
	QzGGmUp2KlOnF+gJhiCozRT/BPslFLaGcs/G9/ijA4h+vCBMtfXfjeTyFrq2ehoC
	1XF7LxQ7iG097e8Vx52W11j86IfdUTieptQqdnFX2cpFrbnLPAicqEhFzgGvMDCO
	/j1jtqyBED89dQ4pJP/yOof/QnMV4HzUWAFZE5rX8tzzac/2386fJsfxPDfmwGA+
	qiyLRg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fejuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so14331835ad.0
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979716; x=1751584516;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8iy5nJ8Pnes9S9XA4npBQfdAf4WRx02426yZk6TbNM=;
        b=D0oqGibySwocrJk6fnh8rBdenoqmRxBe1KpTkKnEpod1h5BoXR/dQvbVDNkQZoZVnw
         eT38BcaqhGBA7sgZ/g3tiDL/wC1u5zKjCb+O/DtTNlVnsYVceiU1rsGrpkLVcH4izSGA
         xntXaF7VrqTuJc58Ug5K6gR7ss3uieRN4WBIRax1MVq/q+ZTNoZ3Ay61UAFuioK4ouz1
         Twj9vmXwk5dush194ZzpiherkcQ7av30Z6/Klryd8DKUPJjjZTBB+RKUggJ0Fl9Mc6qz
         3IVki8GsJMn4c8R4PXP0by3WFUP7TSRDZgsNKEXf6l0ULD++WEaqjNQpkgQoAkutS+Yn
         dQgQ==
X-Gm-Message-State: AOJu0YwvX3qol5Z/JcNxA4HW/bhybAbOxuSYo/+hpy2POGv4C2Ius6k9
	4UNtAV4x2UpoZkE+2yeFozTLC57Fuuc0mY2uxTVSRJjsprFBu2cN5lqBqRzgYoqJeMEFrklJ05d
	dG/PGQb8mPSa4/3MVK8wyHxOrV8nv3KnOK8imVmCTsuFhTm2GfwL9/6mMBaFbF0IaK4cB1fp9
X-Gm-Gg: ASbGnctSu9oSO935WAeLWWmisp2a6ZW5Qg7ABb1iKn00eqe7LI/geKu9FiiPKCnPYqP
	LrBcFslqF21I4zVcCG5GCRRXIWOeBVzS4B06zO/hOboBS8LA1s35am757m/d62ZRSNqKmx21IG5
	ytGRnEhPoLXEWA/f+PWrnwmKRq6GeWdAklcxVch+FCNq/UugeyQnX2gMJocRIDHDkOTvV80SAAQ
	nANcQtOJhHJHchjjD59l9ad1kHeEJVE5VEAvTv9QbmjAfMbdJ32mXEQ06+7NipX4yfhixabS1gk
	+9/GRS3awrf+Jae04Vq7XgKP1K5AwJJwS4FroybVF0jnZqJ5wj9niegd3e4=
X-Received: by 2002:a17:902:fc8f:b0:234:ed31:fc96 with SMTP id d9443c01a7336-23ac4634852mr15520605ad.26.1750979716091;
        Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlvBXIkNOMO3iFy3WYgD3KgP3YPNJIi5PrYQUcqlYCEBUKPNLcyptk0nUdQ/isj9MUjVbPJQ==
X-Received: by 2002:a17:902:fc8f:b0:234:ed31:fc96 with SMTP id d9443c01a7336-23ac4634852mr15520245ad.26.1750979715701;
        Thu, 26 Jun 2025 16:15:15 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix station association
 with Non-TX BSS
Message-Id: <175097971513.153431.7594369522919447345.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX5X3wxiaYRhmM
 UkL76DIFmE1drjEwgJRJWOxSQ+gyWskfKEUZ3GMZRuFku1JtOwbGbsrHCNhO0caHier/3FVMbXX
 3688QionM0oGZRZEHLDT5fXDdh2ahgijhJvJxpor17fZbcb6f2bXdv9VUioEHHuEAlbO3DsdvfQ
 +C3nOtk8ZV6CpVTU8MiIKmM9oe2pIzByWqdSSR8EEk9Ew3pdtx5H7OOMBXEAKJAxOomIP+++yDn
 wme76yx7KPN4Qw7Uzwxb1qybqcONLHgXD3NPnVN97MU5a8I2QbkbHkCYRNjAd+U9OtRn7/JWmkD
 4H6YRiFc4/4ElUlK/xdDC93QDeWKFcaSjwpxqrp4JS8rc8WNBzCAaofWisAGIPGhQGE8kbBajWe
 pfFYZhgq+jQ41V47nlEtZyh2lCREOAGfW7ENpO+h3K6UIQ8809OkGLwnYC0AqkSslOTGpVI0
X-Proofpoint-ORIG-GUID: NtU8Z2m0PJTYhvvJdw3sM_2ddzAtyl2W
X-Proofpoint-GUID: NtU8Z2m0PJTYhvvJdw3sM_2ddzAtyl2W
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685dd490 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MRXV6a3SOdtvRoyAP8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=810
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161530_059031_DDA1111F 
X-CRM114-Status: GOOD (  10.16  )
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


On Fri, 30 May 2025 09:26:13 +0530, Rameshkumar Sundaram wrote:
> Currently, ath12k Station fails to associate to non-transmitting BSS of a
> Multiple BSS set as the scan results from mac80211 does not have
> information about the non-transmitting BSSes. Fix this by advertising
> driver's MBSSID capability.
> Also once STA associates to a Non-Transmitted BSS, instruct the firmware
> to keep track the Non-Tx Profile's presence in the MBSSID beacon
> transmitted by the Transmitting BSS.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix station association with MBSSID Non-TX BSS
      commit: 70eeacc1a92a444f4b5777ab19e1c378a5edc8dd
[2/2] wifi: ath12k: Fix beacon reception for sta associated to Non-TX AP
      commit: ce7c93d196bfd2190dc4a0b86deee04e82042ed1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


