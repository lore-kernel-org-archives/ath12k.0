Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2018C02192
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSZmRSPq40wFKBTzPltndzDZzfXVxqkJjIcUZvnIGeU=; b=ffwn3GioFvG2cVGJBjdQ4HYRgA
	c9cY7FtkfVQw5C0/0vJSraAxMpAZDq0tm1g2u6P1oBy7rjHL8yvDfupfZWdebIzPXILy+JYXfq9yy
	9XNx0RqgovMeWXz5ICm1FQPsjF9D5St1HcpBmlqmsNS7o9HNCfQEmEWuZ3rvBQGVD7pIeTiKjjz7q
	gP/4BtvZFJgKQlyGsq8Afd+i6pog2q1uzj21176GgwbSqI6QI4a3Tf9YR7JOcehsW69Z38/hn8GaE
	Os+aoZ8ftbKVVjLgtvBo+4Me5ZJpY0eAqEa8IyFQ+/bt0XI8HZPSxHQm2WKtIagUNSJfjWFmj64+b
	TEz611eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg3X-00000003UXl-2Zyk
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 14:07:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg3U-00000003UWx-3uaS
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 14:07:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5158NXK3024343
	for <ath12k@lists.infradead.org>; Wed, 5 Feb 2025 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSZmRSPq40wFKBTzPltndzDZzfXVxqkJjIcUZvnIGeU=; b=iKHjt8doW5PN5Qk0
	GhEnk924AFkRroo31lhxQfOi+Onc3ecTb9XnxwqdGtTwbU31d32o/zeNbK0fhBMw
	BmLJYbOSEXtKKxPwCsiT4PJpqUnN4zS04UPee5oqXzd5+/8u6rQQ6oJAFUVWSVNw
	d5hKzDkXpvCOdb6/jAyEPssDkRP8oKc5/bp4fwEtEG8zEbZrCpBLSAUpJDfv5k2g
	bpqheYTanP8MFpaSG0ZGJ+8ChfV8y9EaIpoJP3/rjTJJ41J58GGKsNGw42uL4+FS
	RNjlMNNDcD7l/MdJ1t9v7j6iJCiHGQZpjoN5QpxZahmcfE9i5Fmfiw7JnVK1dd2a
	x5IeQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m4eggume-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 14:07:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so13119151a91.1
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 06:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764422; x=1739369222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSZmRSPq40wFKBTzPltndzDZzfXVxqkJjIcUZvnIGeU=;
        b=LEU9A55H3/3iqrJSD1T4TJx8+SuYG7l3/NXVgVm4e7EagCERX5Nb0bijcJAr9yV4qs
         itmfiqVD7hKcpGrfLT16zZiYEBylJTg7/XNXxqdKIRrJlPtAAF5LmlpowPkh82p/ziRb
         eEFGe9tQZX69vSpqUpCfnJ2D+5+yc5TXC2sbiICnUTJG1HBbA25ionQuV9zFYjR3Oabc
         jw1o5EFHKIOw1KRt3ulI4EpIyvGeIWTfbJ2INz5HIO3XJ6hjp7zIpQpM3siVTX5yztkF
         jCApJ/siEwhr69yFs6VXKkIj/sHQqrmeN/J8KsMVHwgSi2BWM7GfBAN9ebR2BUxZ+42R
         QyKw==
X-Forwarded-Encrypted: i=1; AJvYcCUmX+lwYMaFQTZMXVgOB+cTOlv/ZFd9x59gU2Hxyl+6/E2odpzV1UAoECG2sBu+2kvvSk/hUT0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUYlSq7LV7Z9qxb2mr95r8Yfs7zowkytElYNak9Lyu0nrvWkeo
	/d3ngVWLpU3/TwCwT1P4ND5hX0D7sLHG2xXA6vr4CCV0zuQv4zJ+4GIF1cxXQKtNE/IwgtRnjql
	wOCJ2G7IQnTPAA8YCQWhAZ1IJgfGwZTZ+twQUxsmSKJZQYBjGYlkNF7FsO14W
X-Gm-Gg: ASbGncvUSGAmuuaUiltHZvBsmGmk4thMBvw9tzkh2UyvXIcVj8yPj34Sm6keQhNklYa
	Kig2JuleeYvs2vRfig0emGEmrCKK383vcVkYGsfjJxgu9AGsYGxFWvz7nMUzqpnkzQrONwl28X3
	WZOEH8eaN8xrqnEur6ZdyQBD6ySt1uDqp++dw5dBdBT740peMMuL2XTXeiWJGNKMZDPwVPH6pQw
	TzwN1hvf9SdCxB+pc7NSrkOajjyGEHwWRNCl4gazNTMf3XtXFmwXGl1JeIqW7iZ4GTSFsaZqkhO
	oqPu4Vs/mpmI+p3n0cm0w8lmu2nYpPf47NrogWwHLEuuKScuP4Mr
X-Received: by 2002:a05:6a00:ac85:b0:725:cfa3:bc6b with SMTP id d2e1a72fcca58-730350de70cmr5794922b3a.3.1738764422137;
        Wed, 05 Feb 2025 06:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLUgOwY0dbNhdxWAhIQrId0UT+5/qpdzoqz2LMH1BjebYEqi4T5j1dk4vDYiR5r8wzmbNTkQ==
X-Received: by 2002:a05:6a00:ac85:b0:725:cfa3:bc6b with SMTP id d2e1a72fcca58-730350de70cmr5794875b3a.3.1738764421697;
        Wed, 05 Feb 2025 06:07:01 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424f5dsm12459515b3a.42.2025.02.05.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:07:01 -0800 (PST)
Message-ID: <7dec5968-87b8-67d5-0b7c-69f869f61bf6@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 19:36:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/7] wifi: ath12k: Replace band define G with GHZ where
 appropriate
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250204093656.3682278-1-quic_periyasa@quicinc.com>
 <20250204093656.3682278-5-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204093656.3682278-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6o1G3pTY1HlgbInuTuNcEBxdffKRX7M4
X-Proofpoint-ORIG-GUID: 6o1G3pTY1HlgbInuTuNcEBxdffKRX7M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 mlxlogscore=687 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_060705_096588_315D0D0B 
X-CRM114-Status: UNSURE (   7.26  )
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



On 2/4/2025 3:06 PM, Karthikeyan Periyasamy wrote:
> Currently, band define and enum are with the word 'G'. Replace it with
> more appropriate 'GHZ' for clarity and correctness.
> 
> No functional changes. Only compile tested.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

