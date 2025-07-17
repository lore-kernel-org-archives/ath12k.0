Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E1CC83F1A
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XlT7nxc6JQ1tKJDhgorEKTuVNVOvowVALDGJZ0r5c0=; b=yPhmgdlwLN8xYiXupA59UzPVyT
	moXmxkhIUj6Y0u4IQ1LGF2RU+MgL/38a9jTpMibB5urgPuqFloGTSKiqQ0V/0LtpxrBaYffUWIPNm
	oe2blZt4rMb9gi3UIa+oWCmSzZwmbIo9qFglcrTl8BzPhmcshZ5dAmwpyL+N7B6ngh3aQtJyk6pmz
	RH2wj0oS/LsvZ9Zr9+ZFjGo9O6gQ4KFAYr0yfcQzafTXP4gOeNVZqI8TRxXFQykGxWsmLnluKYy4/
	u+JTil+KNl+o503O/noctw8URhjN3C8pmHkFeqjNpytVe+EOWlz/JdgkcxPAcgxh//SkTp88cc8bp
	I2pFtyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSG9-0000000Alrp-2dNh;
	Thu, 17 Jul 2025 17:19:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSG7-0000000AlrU-17Xm
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 17:19:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCQEn6032260
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XlT7nxc6JQ1tKJDhgorEKTuVNVOvowVALDGJZ0r5c0=; b=E6xK2PZNUewxYH0G
	v727DbHCadIkAHyo21t6SnotdLNQyAuMWgFjq/6RS2fCG3/s33TL+NpTnH5Z8vTP
	gHbTH/aJBBTM5laNigsbnGWH5ckOqPKF+iM4yvo69+vNDjOtvrvwsNg223aiMLUv
	kvr8MtbUKTCbI5UacDQFWZa0JDNT2Qhw8Tdxx2kaP/4DsV/jhaq9oc4IR9CbOkbt
	tp1FxdYm06cYpoXdmTLszeS4yGKfFoHEX1iQVWxa6jZ8fdOgHrtD3/uWON1tUFPY
	Kw7reJk/uZYxxVlyto5TQ4mOSG84KHLuX9gzA67Ae+pj4DWIGY3/fVZAYV44GJu6
	3WQAZw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug388rc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:19:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74ea7007866so1176980b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772741; x=1753377541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XlT7nxc6JQ1tKJDhgorEKTuVNVOvowVALDGJZ0r5c0=;
        b=iJoDXWlJRP5P5KmhcevceGbAcsPzA/wd2UG20QpwGEpg7f+TubwTzhoZUVkYL7IDO8
         xjURq52CACgmO23PD160JPuGfb5f4euK+DaPzcXOjTuSGMpdDMRvC4/B3rnXwsH3PopQ
         Mq8UIMjW/ANbwWqd71fNk/Z2BAwZqn3ERDYeoBQ8tJx/01vzntgH2EVBhVRy2NJ61FcH
         kGZZ1RuDPm0eLkRWQcGea2TodNYmDIO59eDUy+yCdIjoAi/6McjMG7kDM/ATKTKi7sLE
         2Auma2bGTKyC4HT6m0pIF0qKOAT55iu+RxgEiNsUjlZLGEVajirGg7TzpMrCj7j20r9/
         HT5w==
X-Forwarded-Encrypted: i=1; AJvYcCUubmya+tMF/LsaD8geXiIWaXzexQVGEVnBJmYjdL30IBEaiErc0iyQkQW51mO3tTsvfCXyIDI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSQFpq/hRKxxGRjxq/YAEHrpuQSvNibT25mCUhZI70DAz1qF4
	t2XXqK7QdwEEqPryVaJlyHF25LGdUcijbN9P6PAJKN1L2/MuxJCaLBEjkPmhxWK61c1bIkU3Q2P
	qTsUv2y6mxaz0gn2tEd99RipkTQ5oo27YwawdaaQ2peT6xtIQG/605WGyYPvCF3Oz
X-Gm-Gg: ASbGncvImBCmtN9yN0w1gMqylaJJ/rzXplhjKjZtKyQUJFM4c0Ut3DJ5ny0ZDHgMDJ1
	xpqvGGjEt/J10mLs1BoD01scbQGyjQdPw4Db9CR3WL+Y+XLKeMVscrtS+nhw48Bie3q2YiM4cP7
	hVujLBHb8312GBJEKg7DTrZRNh28RYsktg9oSWeNWDT9wlT+HCkUmYKm/sXrcGK84nlk4GSR894
	yHLUZET58KZlkcJowG0Z3ZtTV9VHOa4q4a3wY61gibcc6uO+rO7GxcnFSRMIOW2TzLKeo887awh
	GH8XJ3raPqxGKp6TAl5v5HqwWjPD70a9yb7+/pJ8eUuRmjyh7dFSLnu9V8BwFr0nS2tUqxu7cc9
	PCniYNlx4+yao
X-Received: by 2002:a05:6a21:62c1:b0:216:1476:f5c with SMTP id adf61e73a8af0-23812b50d6cmr12243288637.25.1752772741038;
        Thu, 17 Jul 2025 10:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFifq7ZiJ4JF28/fehRceTkt0DWHZ74e8ph/w7Zsmkbk3PecjoZV3AUGicftUL61drIM2CuHQ==
X-Received: by 2002:a05:6a21:62c1:b0:216:1476:f5c with SMTP id adf61e73a8af0-23812b50d6cmr12243245637.25.1752772740567;
        Thu, 17 Jul 2025 10:19:00 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.215.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe57c03fsm16067771a12.20.2025.07.17.10.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 10:19:00 -0700 (PDT)
Message-ID: <d84a36c5-f8ce-9d4d-0dda-71997eb9a65e@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:48:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: Add support to parse max ext2
 wmi service bit
Content-Language: en-US
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250717064527.1829660-1-tamizh.raja@oss.qualcomm.com>
 <20250717064527.1829660-3-tamizh.raja@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250717064527.1829660-3-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1MyBTYWx0ZWRfX1c3WmlmY5pFK
 e3cQbsAZnmbllYjpqFTf202h6PWo1fTd29Vc+Iy9+D+yRAqGKpnZBq5sZUHpQIlodHWNIl2ehTw
 K2M9DkJ73y9rD5K46eI+9UtoN655XZ6gzae4w4XxVg4A7qVRf37rlCRkNfCBuNi8FLCIcDP+Sf8
 7N5CRn4yhGCaArwe1wgNhrTbd7HOPgvI5tjEAtilTUQgqcgy6JUva5Ls9+d0C23oS/FcSE3c9/v
 VmdVycT9LnaSvbqqewATNia1UPNUrdP8KAQ6+SsUbnGEk/KD4RAc1ui3GWQaVNVyh4u8Xh+ywyu
 QzvHvnR0Vd3hsesbKiVSGuOJU+f1q/iOlTpuzln97uN7tUqwPrE8GoI16F7H8Gre/C13lUIjUVf
 SDmYhtobKjzYUy//HRsYe4JKVEijkCk0R7VYUfELhLiOoXBYWzhEicRwCjWvJRO1aYZNA5pM
X-Proofpoint-GUID: wdbWOZFvTpFCX_ezEqSTbAcCNHK15ZBg
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68793086 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=yGYHVi08oRoRdJ9zovgz5A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7_BzqQrifIiNfE8oCEQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: wdbWOZFvTpFCX_ezEqSTbAcCNHK15ZBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_101903_430042_96234814 
X-CRM114-Status: GOOD (  13.41  )
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



On 7/17/2025 12:15 PM, Tamizh Chelvam Raja wrote:
> Update the host logic to dynamically parse WMI extended service
> bits beyond the current fixed size of 4 * 32 (i.e., 384 bits)
> after WMI_MAX_EXT_SERVICE (256).
> The current implementation misses service bits advertised beyond this
> range, leading to not enabling some of the features supported by firmware.
> 
> Implement dynamic length parsing to iterate up to the maximum
> service bit index advertised by the firmware.
> This ensures all supported features are correctly recognized and enabled.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Depends-On:
> [PATCH ath-next v5] wifi: ath12k: Fix using __le32_to_cpu() conversion while parsing wmi service bit

Anything which does not need to be part of the commit message should be added below
where diff stats is there. More over this depends on patch does not look correct
as it may try to refer a patch which is already part of this patch series :)

Vasanth

