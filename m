Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07AC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+4dC9ic1NqLbtu8u4j5hpEPGFN8j5hgiRxsVCkLaMw=; b=18JekcDM8UtxATUQMqXz+7TTUE
	tV05mQc4sa1TltwNz5p+1e/n4BZ2m9B4z2CZDX0cVt82FTVoekkhKlH2TQaT3zULFQSMtNXDUzjnB
	8zpR33C0noW9otMJKTOmJddB8vVFTtRIr1nIILVHfJiBPAlAXL/bkrPM3LdGI9DaL8k6nciCdFuy5
	xCSmNPYXDdTGqp1833jdMP7jL1REzJDGPnY02aJqfABwTkBXTeUaZ0bqgeO8htzN6nFUKG4M9rO8y
	nDJysI0lTB1ayHKFRGW0mvNiIp8oee0UuYno1SMKtQjE3GP8uRr6F7A0/jSj7iKvi18Hcbw9h3rma
	tXz8nPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZp2-00000009SMo-0Hf0
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 19:03:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZp0-00000009SM9-1ItP
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 19:03:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1l9a011071
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+4dC9ic1NqLbtu8u4j5hpEPGFN8j5hgiRxsVCkLaMw=; b=jWEKebLwZHpKxBV2
	RBapcT5V4s5pAMsgxvOHAJAh43QHgaLKnmvl+vu444OgUaG2QmeD/YuCkkFVUHW4
	JgJti1SGN7hyQ1x7bz6dgC7wLWjYB4xCkZkABBYkVd1p6L3aklXpfNmiQSa7qLOn
	pJVTFj3+2XyMWhZS/w5XJdaIiX6aogbOqzNfLxpOGi6mYYiaxjQVmhtNZ6fDEMid
	aJZgYagfw9R3YtaeuNNeamRHLevAaduG2RxlK92dAVQJVAsPyhXa9ScOkzhTaOif
	aP6GpfeZKV3+etr/xIdGCh4muR2bUXxX+VTHFfr2S4md6yOqySYDf/lR1cr55elr
	5DBLLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m806u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 19:03:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216311faa51so20838225ad.0
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 11:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263804; x=1738868604;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+4dC9ic1NqLbtu8u4j5hpEPGFN8j5hgiRxsVCkLaMw=;
        b=cP7U+1zAALNp2HO5hVgE2crjupRkkUup8diu4Wu8wDL5PW31bzKut28lXBk7JAurd9
         uqXCMLFlSHvRv4V6GWM0OJ8X+FlC4xRubQbjK3C8JzKLz4OdyK7RO8OfKC+zCa1Ng8/H
         HB9DE+T7pwgox8gHxFuC3iLgdvaTwK21i1uGq0ln1U4OlTqQbkICtQe0qlhmVccesTOR
         v63W2oH1GApzuyyTLA9miIASPWrDPmzm66BhaMfYvym4ZcmzsHeY0h5qRz0OfnSuJSEx
         Uq6fvnDdEvstyRFyw9p2Tu6574PEdl4aB118oV8tfflD7qoMbZPj7MchHtE2r2IG8wpI
         jjEQ==
X-Gm-Message-State: AOJu0Yyy/6hJOZyNv5u0YeUUAwGByi1KAzV5DHOVwgr2l6ndoWpgqFWz
	K25rqfWTko1+Le8Ra6MGfqvm/5Hio6PGwfjYu2q35k6cXahq2zdO9brRP4AfFu44PzIqX8S9qJg
	zOsF8mmwVcqE/ZhrxSmn5d7AtOk6BrFLiHn4pewyhOVT9rwdhJs3wkwZQD26v
X-Gm-Gg: ASbGncuE2/m5N7At98OfBBB+Y4oMhnRMs9nsm2Byitgh4mqKpvtxjTyGQQ8QZPDxH3Y
	mT/xyvj13ZnlXcLDCVvvsUfLFOVw4KZ0RltqfyEvT01F2wxrPOAUsyg8HMSAUNVVhZlx5W03XZI
	JhC9Xor1d2hMytzBJ2D6Nt7/rdD2hgQ0bfCGFUjfjEawjCelPn9OmWCf+FFQeKS8SSNJQPNX3El
	hmh9WMBcR6qZQpl0jXjJapsfbDlifmbCnAPmupyWKCC8JSnbD0xBubz1shFx2G6Wee5FU6B4QsI
	3+rAeSEaJ/TEX5+aX/FAR7hIxpFRusMQwKaZzqsHsWkb+8RMnvBYvnW8hrn2H7joQbWTzRURww=
	=
X-Received: by 2002:a17:903:1c6:b0:215:9eac:1857 with SMTP id d9443c01a7336-21edd7d88c0mr9634025ad.5.1738263804005;
        Thu, 30 Jan 2025 11:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5lOZnffNUyJ7KCfKAJLEwNSxmca+bnJfKkR1FK09cdyV4G4K0NyYO2pFGbFiPeZPx9BBARQ==
X-Received: by 2002:a17:903:1c6:b0:215:9eac:1857 with SMTP id d9443c01a7336-21edd7d88c0mr9633645ad.5.1738263803605;
        Thu, 30 Jan 2025 11:03:23 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eba59sm17295815ad.147.2025.01.30.11.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:03:23 -0800 (PST)
Message-ID: <b70445c0-ec0d-4a7a-b23e-3939cae87bcf@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 11:03:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] wifi: ath12k: add ath12k_hw_regs for IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
 <20250130051838.1924079-4-quic_rajkbhag@quicinc.com>
 <20250130-groovy-competent-mastiff-19cc9e@krzk-bin>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250130-groovy-competent-mastiff-19cc9e@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B_6Q3PKK68UMXVS0_kJtyz57lIGEO9pt
X-Proofpoint-ORIG-GUID: B_6Q3PKK68UMXVS0_kJtyz57lIGEO9pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=763 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_110326_479359_13F543EA 
X-CRM114-Status: GOOD (  14.05  )
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

On 1/30/2025 12:38 AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 30, 2025 at 10:48:36AM +0530, Raj Kumar Bhagat wrote:
>> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
>>
>> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
>> WiFi device IPQ5424.
>>
>> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.5-01053-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/hal.h |  3 +
>>  drivers/net/wireless/ath/ath12k/hw.c  | 87 ++++++++++++++++++++++++++-
>>  2 files changed, 89 insertions(+), 1 deletion(-)
>>
> 
> That's not a separate patch. Regs do not make any sense on their own,
> so this commit makes no sense on its own.

This approach was suggested during internal review so that each addition can
be reviewed without distraction from the other pieces. None of this is
actually enabled until the final patch, so "trickling in" the pieces seems
preferable to me.

/jeff


