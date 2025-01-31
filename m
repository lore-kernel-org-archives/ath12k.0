Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E4DC0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 22:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUB3hp0A/oyJSzN/kCE+SQcJbrJLtU+PWheTVJA603k=; b=QbLbzP+FhOONIhAQ2YhXlgHL1q
	HljIV47A0DQofKKC+qB0wkDaXrpTq/tP4pbQ0LDNGOu5X7WWtPXBbOq0xmr3vQxmj1WNldVo58sCd
	Ikd6OpQi90CfjPUKtk+V9hsM5u1YtZaUZ652cfBYfxZU2yY2+dj3xm059P6YfWF6zxmmwv6aV5oXo
	Cm9lx+sKwMI37+dGJjY1F6q8xYBE43n5p/NHUUC6U4KnjvkmViZz7ywzpeHSZpLihAIVXK1hN6fG3
	7WstXD+KIrtB3zJUcUPxougPF/SywuIMS58/keFRGf+ToUdna+kVN4DBPUMkXX0U4ltpWpVtXLA5g
	RnlP/WiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzOZ-0000000BYFM-36FK
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 22:21:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzOX-0000000BYDA-0daR
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 22:21:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VJJwv6024035
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 22:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUB3hp0A/oyJSzN/kCE+SQcJbrJLtU+PWheTVJA603k=; b=JufgXu05Ime6bmk2
	TZUCUhKh5nugsMRaPyHT3gV4BjCpM7803lYX07ogl4jayuXPkEuOAiinzQ0C1bdY
	YK3wZrMR20j4EqHa2ZLFUOmxaUgMd3QxDhuhNKuBZBdVahjlSkbtBajXEXaT2ZYn
	b68gPJvHM95TweVZlQPW9X3aUZ0y4nwvq/G+jQPun6LIsamU9orU/9FmlGy5XEBj
	Rk52PV7daShTUESHAEZE2NzB5CKtgBfKRwfs1S/gLVFbyzePC1cQynjuFba9/2IJ
	uTg2kvIbCRPh/T8oi+1IAdPHBPg6AUoDlsxzK1PrDC8GvKgciSg8s20hkyvdiIWe
	LlIdzg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44h4k2ravx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 22:21:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216717543b7so64140285ad.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 14:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362107; x=1738966907;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUB3hp0A/oyJSzN/kCE+SQcJbrJLtU+PWheTVJA603k=;
        b=FMuqFYf+fNAmwkHk9A9KKiD5Iv3jO1WARz66eokWNRy+Z4u5WRzEn/6zrExJOhh0ty
         GsOA8yWl2t50PkxxQRCMJ1kdl0gQ64l6jlhzrbgPiM5F2izqmo9ne11lgEMPC8GXJ38k
         VSaVhXt0/vDfPHDa3GH3g5Hf7dPPYCDKVnhmSYm9MXE4RSUV2sE4541PJRO6J2vPuBT3
         Ju+jm3ifXGlP3Tjcsiz0n4ouQ5DXVrymXS5UdA5OvAkdKk4i1o68I6U/3fBWq7mBecxk
         S38tttsSojE9eMrCWAs7SbJmnuSy5QENxev5Mo6mNIrq6jlFlEl5Mz88feIvwsXBiDAz
         CglA==
X-Forwarded-Encrypted: i=1; AJvYcCXsc5k3gZkI0s7UhqshQeDT1CMYLpgEU2r7XMP35K5tQBulnLchvwiwuAvZY1i21NfXQ8h2Yg4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNmF+H5fMsj3KrdB3Nq+Cwwzgil1Ncloy8gq0qFYaP/ZKnakHI
	CKmP7v32gtaSowvhuUKvkitHlvAmTL33qRHGlWwIlzXHXYaRkGupL6sZ27QJkpSxMjLv6N0cIYl
	wq4YyNlxdgAE7tNIF5nc/JZNudr2Shenz+b3KHEKOQv+ZW6yJ2+7KqfKGhShR
X-Gm-Gg: ASbGnct08/wUNCKMNJ5GcbFN8rlHuNCrfm6HS3DP74jI8EGBPKUc3KQDgg9tdUxli+p
	VJTpNly2H5equsEM5FKzLkl+Su3YFstdO0FeDskc2q3eRa4oDE1wEooh3Zz9Va5B+Y/wnMuD7FM
	W/R8SSDXKn8N7IwydJOs5Oyus0GI73lZXM2GhMX6ZA+YZSAkZ9VDPwL1o8ela0xkcw/sqjEzanI
	X572x9LTG0uuM/jnlfvGdOcpcX1TjAuPptTiZHYuraemMh/aCNpstwmUq/jJvlm8kSLVqbugPRz
	yhgvUfvkpp9G2YlPSPOT8SzxrFuWGZYDWYuMJMc081di8/BWYJmK0JWxbux4SkcqyAi0Auleug=
	=
X-Received: by 2002:a05:6300:6385:b0:1ed:a812:c3b with SMTP id adf61e73a8af0-1eda8120d25mr1156917637.2.1738362107195;
        Fri, 31 Jan 2025 14:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvl97v+gvKvCqFmCOTlaqsxyHfMPlUjGPpurC9VbXfstnDJM7M0Vc2/Ub1uoY8F5xiGAZZ2Q==
X-Received: by 2002:a05:6300:6385:b0:1ed:a812:c3b with SMTP id adf61e73a8af0-1eda8120d25mr1156894637.2.1738362106829;
        Fri, 31 Jan 2025 14:21:46 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe56daeasm3054666a12.32.2025.01.31.14.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 14:21:46 -0800 (PST)
Message-ID: <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 14:21:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] wifi: ath11k/ath12k: Set IRQ affinity hint after
 requesting all shared IRQs
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kvalo@kernel.org,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ccy7bwdRxOfjK3u-iSqDhMjC0e6kpzvZ
X-Proofpoint-GUID: Ccy7bwdRxOfjK3u-iSqDhMjC0e6kpzvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_142149_210714_C9E30E69 
X-CRM114-Status: GOOD (  15.94  )
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

On 8/23/2024 8:54 AM, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series fixes a warning from kernel IRQ core that gets triggered in the
> error path of QCA6390 probe. While fixing that I also noticed the same issue in
> the ath12k driver, so added an untested patch for the same.
> 
> Finally, I updated the irq_set_affinity_hint() API in both drivers as it was
> depercated.
> 
> - Mani
> 
> Manivannan Sadhasivam (3):
>   wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
>   wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
>   wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
>     irq_set_affinity_and_hint()
> 
>  drivers/net/wireless/ath/ath11k/pci.c | 26 +++++++++++++-------------
>  drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 

What is the status of this series. I inherited it in Patchwork from Kalle.

It looks like there was a question if the 1/3 patch was actually applicable.

If we think this series is needed, can you rebase & repost?

/jeff

