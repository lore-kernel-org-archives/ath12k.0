Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F53C02192
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=; b=it1Gih7yzCN3WSmesdAoy1S4gI
	+Qyenqcr99Mu8QhfnRxtwdK1yJ9dz8EGr+F321FzgWhxzNpWE2IhkS05ocG/YmGs7Ih6gENyo9ZW3
	X64UQlery4hPQzEvBR1qAz7Tj50QnCkjFzgE60eggzei55qvzkYEfs0H+7dgf2YO5m31VACZHSbqH
	BgjHB8OsarhDfDBbQFMH4chPV0cflBAZaFdeSOAKO3kCxmR9dnsytunZXWuP7smPBCYqMdci8ZUSm
	pYMyd1CT1HBpchmOW81OShe/j6DvZYYpmSTZj+/MOJTayPVKVVfHiAsdsIGtvaT4yHWnxF/EValqF
	8+XkfKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWZ0-00000002GTv-0o6Z
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 03:58:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWYw-00000002GT7-3IPO
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 03:58:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5152Di6G003446
	for <ath12k@lists.infradead.org>; Wed, 5 Feb 2025 03:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=; b=AQTFCsAxPDKVn1v+
	NpEH0eg/s4h23M2096KElbj790ACX3eB8meBb2OCN7s1O4PK0FFEK+Vj95FuKWKD
	yFGHcwvqjjEHFHxIiMWJJtCHDQ+JyZLzm6Z6Abl7fh8/DRKG+Lzs5DCthX2fCdoz
	Af6cGQ23s/LL4yIyJ6XiBll/SWZC7CB/IdK1nGbsLNqSo0xX5Dq7ntYJE0qRmCp6
	A3uTCKh5THpcLEnS2cGu9dwK6PpFG45l/o6JxGbimwG5cRHjlQ/wzvaTlS6aSyrS
	Xtc1dvYRr5jns6gs2BZqa/pyjrgxq0fs+nDVM/53YdG+SNkScdVKwEDZUzqYhQE0
	WVi90g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ky13862c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 03:58:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f0f1af7c7so26476885ad.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 19:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738727931; x=1739332731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S62PUSeqG14RqXzxFfuDYkNfcydTd1TcwBUSQTxQ6JI=;
        b=c/T0Cuiq3c9GnU3259r+MznDGaD+OMRPtTtDbc+vXqO1ll17rFTtIzoDNA4V/ZNPGt
         18hBFjKAA+EFs47z1y1MEqFYkr2gETcjU5u+6LDCqApg3W3nT1fqGINsm2g/2Q9y8x6X
         Vmj82vxrwvCCQ2Ezw72/Q74ArxervlF39Og4B2XXIlXaP5e/YulQb9XbokZeaWPUo3+b
         01qc0hf1xdhzsxdZSYCbrgomr8kLbs59movRPgmtd+JDkYDpQNPZWSAH9pUGb4nfC7Th
         4Hj2saE2Ce2nEz5ju5E6V3d+zzAuh8Bvv4W9CIk3kqEwD9YZ+wJUIX5PMdfARGPQjS2W
         1Apw==
X-Forwarded-Encrypted: i=1; AJvYcCXj2uPabJPFr1HaFcUxec6OIcWEC0ZAEiBC7g8527DgJakIjTXJhCtu1ZsWE29K+ZUeb8E0XYM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmLxRGodI13mqw4fMTojZ4pHvnoQK9Bvx/+icf3Ry8R5GyW2t/
	TsQ76JTDkU+GnAkwxmWU0L6ungRuVFqTUv7LpncpAFpacX3sdmQbDESXkTEFdIygphoqSVv60hn
	/hrazidr2jgxkeLb6HynqapbGwlWgP8q8NMdIJXVo4jSlLIszHgGmLZr3vYGB8GQHbsCQ
X-Gm-Gg: ASbGncsC9q6p2Wh7Rlt+35K+ojs2Z0Ztofi6hktcZ9x655zRmTtNsJtc9faus0QcpAj
	25tFWQKc5HAlg/ko8Jc5MYdZKKKvei1aDt440ybi9ViQ613f3X+FqrvGbULpjkUeLhZrMgD0U34
	Ep5bzhUG75iMFu/xwpk4LciKsm0AFt9Zt8TvEEejcm4J9S9+k/tyBKCx2HcY/F7RP0EOUk7pUsM
	GfbX9Me8CGhEc99uwlADr9onYYPZEcD7VKkU/h9ayYeoP62n6B094n5kxVJW30sBrBZ12xysbum
	S3oHyyByytDSt9g9SuXCpch18uxF3das+fNbehA=
X-Received: by 2002:a17:902:d481:b0:216:3e86:1cb9 with SMTP id d9443c01a7336-21f17f22af9mr21638125ad.50.1738727930962;
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkNezxHQtquirLQM9BhytG3M3yW8pCBTj9PZq6uof5YtSc0sFPJl2awYudDFoNXr7qRfdbmA==
X-Received: by 2002:a17:902:d481:b0:216:3e86:1cb9 with SMTP id d9443c01a7336-21f17f22af9mr21637845ad.50.1738727930607;
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad4fa6b3948sm2448796a12.26.2025.02.04.19.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 19:58:50 -0800 (PST)
Message-ID: <15632e7a-fd47-4940-91d7-1b75d51ae43e@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 09:28:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
 <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
 <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MycndvxDU5SSkfB65QPMxsWxgajUM9AJ
X-Proofpoint-ORIG-GUID: MycndvxDU5SSkfB65QPMxsWxgajUM9AJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=712
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_195854_972741_B072E3CE 
X-CRM114-Status: GOOD (  13.96  )
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

On 2/4/25 23:58, Aloka Dixit wrote:
> On 2/3/2025 8:41 PM, Aditya Kumar Singh wrote:
>> On 2/4/25 03:14, Aloka Dixit wrote:
>>> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
>>> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
>>> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
>>> the same pointer. Instead store the pointer and pass it to the
>>> latter two functions.
>>>
>>
>> Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?
>>
>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> ---
>>
>>
> 
> No, only ath12k patches are tested hence no tag here for ath11k.
> This patch doesn't change handling functionally and I confirmed that all 
> places using 'tx_arvif' first do NULL check because the refactored 
> function can return NULL. Functions ath11k_mac_setup_bcn_tmpl_mbssid() 
> and ath11k_mac_setup_bcn_tmpl_ema() always receive a non-NULL value now 
> because the caller ath11k_mac_setup_bcn_tmpl() sets 'tx_arvif = arvif' 
> whenever applicable.

Okay so in that case "No functionality change. Compile tested only." 
line should be there in commit text?

-- 
Aditya

