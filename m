Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DAFC7115D
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHHKEzD0T9H274180tE+Ev/54hv7g8GD5RyGX8mAz+s=; b=ACvIIkJ7juNSWO3S56woIsm7fX
	sEHfGMUAcqwO+5ZTPCY/CTpxha0rvKkn1CTX0EsMgCsfbvV1GrE7/sCpd+gG08LntN8Tp1LBKDdXx
	Tr8BqUYTYD8ey0jyEz/FevFtTuy+enYj0r+ZL51dTjY18h1F7v/kCrfAgqrYYH8LzXLGwXaFTG0Zf
	DN0LEVYZ1evVJBkMGE1DgxCN02iI5oeDA2ZR3CpK5QsEkBXMGS/GIWcTguBQa9Ro0K+T0G8cxDrXB
	lZLpk0HJvxO/GV15D04s+QiBaCW7XmK4hx7u7FN4UDgZUC77jPaD+epiLTZZI2KZGLOoIUNdK3ubk
	iRSO2lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZNs-00000001af7-28Rm;
	Mon, 23 Jun 2025 05:06:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZNp-00000001aeo-44Xo
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:06:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNYO9p000857
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHHKEzD0T9H274180tE+Ev/54hv7g8GD5RyGX8mAz+s=; b=C1oaQRNLRMUbuf05
	hZnRYh721SNeWykQgYgy7my6PFBu4+C4lUFbESQjIytk1uSGktpAzK4ziOwR+LM2
	5NNlcTdfrgYpicieYEd1SBXXjjp+TcKa9/lO82ZhGpG9DPFF9CMr7mDQC916HIJC
	+ikpal5oBi2nOjW7zIVB1Yi8dFnwVvfwFwKCFuaK5VOBQ4JzbR6AjbmMxsy4Aa9t
	x52Jbs6rhl9SGKQ9cc9W9m9CYLoIu8cCAvgFBDAef9L9TKuUZMXUk1SIKrxj4APP
	MZ0GDrZ8jK04R5WblSgaYRuv6NO5M0gE4sQnVs8X/KJ2yzkusux0RMJqwS+Zoz4c
	e4FfWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ege0s7ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:06:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so32623475ad.1
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655174; x=1751259974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHHKEzD0T9H274180tE+Ev/54hv7g8GD5RyGX8mAz+s=;
        b=ryR9WaMwD00r/BlkvhAVwI42fJJbtomZS4ABKFeVZnCTMctbkdSWwobWa9F35ahKX0
         Z9TTHObRSMbR+wwBfbJaP13Do+ag4KK/AeZE0SibsrIOkP+uWpo7iH1yTCfkKQF00VyC
         dcn5nrT/ikGaMlFUAKhwhJZMtAhfxVecIslJ044sOX8DG9ezgft+KSes/Xfri6QmOZYd
         NXsTYC0LHIYmd7m7KKekr24t/5go7sHjYJzzPyGG9TDurEeEazQebDfM58DISsAg+Vae
         plJKixcPXA+fwDDmi45OArNSO6HD8XcC65gFw9+rjDYaZsEqyPmatfFHNUYyWqqtMT+o
         L0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV6cKgaqViSaGhKPdPr/XlRSG209XG/4VPP+NJ7Ijo1vcE7sp2ch3MZQj7vubtla31oWthgRRw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfH14wnmscRm8YH0O0/BHmo2i/xeDohWiGAMCzCXrekaVsH9y4
	2Ywk1qjS2PEaIUcDq3qhzyZdx7UDroqoKfF1lKw8ebT+57fYYsFfnLWbSB7+DXuhgRiArLIC3rO
	C2SLuJ6d2CmZ/E7PtaktRxaqI4R55M6QqahvQdVYg8l0SsWvgINEzz5cvnqEp3+8d
X-Gm-Gg: ASbGncsqaNFC5LGTssCUIH0kDNvukgg+vHfHIPcmjTWB0DDaIy6cB8+kSpZsWFjbbav
	+FOJfEWuWRic23ebQKtH93S+yqo03mySek5kx36/0ZgknkjMeJLKAboQc0vQns3PO7Y+GJ7azt9
	Pjhc/l2bFHjTzE95G59lImJ97LkD+bd/+BoXjmqSaJn92gWJ1Cb1y5Lqn69hVSGvz+BkjJUVEIF
	ixIHfVbLR3UpRxVhYuUh6BCEUjcyF8y/GOrGaJriHwCV0tqs+AcRdDEAuQrjPa6jnWmp5wgBHAf
	Clk2GyEdLoCJ4cdUpN5z3txcfXvSglMbBjVjg9vnuRblugL04LMLo2j4ZYO8VR6Z
X-Received: by 2002:a17:903:2352:b0:234:8a4a:adac with SMTP id d9443c01a7336-237d9917e65mr175914715ad.20.1750655174381;
        Sun, 22 Jun 2025 22:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzfCzPkULBvTu5UVkzfKO8ULI2opQNw6M9UtFT2I6KagHFiNF6gmspvSk4m3deWwoomCzOWw==
X-Received: by 2002:a17:903:2352:b0:234:8a4a:adac with SMTP id d9443c01a7336-237d9917e65mr175914445ad.20.1750655173942;
        Sun, 22 Jun 2025 22:06:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8610ac2sm74285735ad.135.2025.06.22.22.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:06:13 -0700 (PDT)
Message-ID: <ae7eaaf5-cde4-4676-b28f-61e43cd3e757@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:36:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: remove monitor handling from
 ath12k_dp_rx_deliver_msdu()
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250605054438.1855365-1-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250605054438.1855365-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gSTWJ2YRfvbBVbfQD-oc595bpTymzNeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOCBTYWx0ZWRfX7VV5vYPU7Czv
 ANA9bui+tsftyyx9RSFaA+kqeJ2b+4/Iaq9VKCop4xw23Igj1SPCwGBoJalH01HZHjcadmdj9WC
 ZQT2f6QBCGbN//X59HZZssd09VkcUMMGb5WD1GwHxlZZa6reJEc9pvBxGtt9TJ4yAebrNPb+Uk4
 rxkqD4rgRWeIq+4dDuebHlgpGl005jrOSiv2KX556xkWfajikKidIV67ORrczEY3hTnayTo4BFN
 yL9+PC0cqIv9TaiMTx9OsDfQ6Sgzu96yB6lbs/a6Um5lT5Ozli9h2wNtmr3rBwBOUU7MrIWN8qd
 N5oh24hhARpB6wNzYIVV5w1W6/xnHUhYadhqDfeFDweguVDcswKn2hWp29kX6iYtWJge76p5WRE
 ZkxVwoC2Ghr9NlVimkJDVShlh5cQlioyiaovEFeECMW1iUzJingl1prvTfzA2sfwD7Dz1Scd
X-Authority-Analysis: v=2.4 cv=CesI5Krl c=1 sm=1 tr=0 ts=6858e0c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NwdkJL6YhdxGdXyF1vkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gSTWJ2YRfvbBVbfQD-oc595bpTymzNeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxlogscore=809 suspectscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_220618_142619_15CC93B6 
X-CRM114-Status: UNSURE (   8.57  )
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



On 6/5/2025 11:14 AM, P Praneesh wrote:
> ath12k_dp_rx_deliver_msdu() currently includes logic related to
> monitor mode handling. This code was inherited from the ath11k driver,
> where a single rx handler was used for both regular and monitor mode
> packets. In ath12k, however, monitor mode packets are handled separately
> via ath12k_dp_mon_rx_deliver_msdu(), which contains all the necessary
> monitor-specific logic. Therefore, monitor-related checks and operations
> in ath12k_dp_rx_deliver_msdu() are no longer needed. Remove this dead code
> to simplify the rx path and avoid unnecessary per-packet checks.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

