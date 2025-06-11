Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574C4C71134
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bazJFyze+TGybi8MRRXbltHf1ZCTtmuZ6Hi2np3j1s=; b=BeFQ1lzFA295WGNzdr47rLWvms
	maYPFJmwPXJPeOHF26tp4N3c3QST8M26SpoXwGbYHAzooHQTVXZbE8vZMoJvRgU6JcCTwQxiEAFuK
	FR3LusZxcw/YGQeGgMXBdqSqibq9TyBSuHK67nBYqyACHc7A3HgYI+LJnwsaB1d1Y3r+6ncLD/KZf
	4+kgm5ZXFckD104nUkKsrIbXe3pCF1c/lFihUs5assHBvpxIbPmsPVDMGqFP7bQsfFF+ApCWbIFlk
	BnOeRDcZJt3Mpn5EwyAX5i5olQ3j8QBzaxhcg0s8dgZ9Gicca00pz7aTS+e/xZ0vc7ePlJEgE3beI
	a1tFD6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYj-0000000B4kb-3DZU;
	Wed, 11 Jun 2025 19:56:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOJH-0000000Ac5y-15E5
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 16:28:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DE04009053
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bazJFyze+TGybi8MRRXbltHf1ZCTtmuZ6Hi2np3j1s=; b=odYK+5GMUI1oAWId
	aCfEcoysLGXZY6EK4orzFK+V4+JfA4b5sTY/N0pgy7wmmiKAQ8fn7lJUBvzX1pYk
	zkr25KOnxHf9IInWF3dvnsnugTtFnQ5oxBsONaEdfNh8uef+1C1eGHeEoO8aGifz
	X1gC7c1tVSdZrDdFBIC23JHIC6f1D5A55fKuIz/reVMgFl3UFTbBGxENcSrBCtqs
	DVr3fR//+YQkq63PjQSnQ8XiIEerqJayQNx8fIV9jzioC2Ci5QLO1hPIOTvFAPZL
	RpgzGLWDDRGZDO5ywPkPP2IVRrQP6BgioRdJYsm3XFWd8t1iEwuuD1nxsqiUxnQ0
	fTLgWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753bskda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:28:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73bfc657aefso47533b3a.1
        for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 09:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749659297; x=1750264097;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bazJFyze+TGybi8MRRXbltHf1ZCTtmuZ6Hi2np3j1s=;
        b=Y2eKRCneETq0/2rxaXGh/MObsRm4XU2iqDwIhGenoHa9dKbZo51PVVqGHdS/Yvp2AC
         tU4o4PHpSAETOJ1QjXxUxaDLQLsn8sbIlUWJDl5OrUK/Jr7UWDPglkoQ0vBvbFXs5VHb
         AiWhfQNAl+mA1OeGGW//rwLhlumULVRNLLO0j6VB08ayjKHknofbcwKZRkBk8S1Xajxt
         LLNUBfQ16Bq2rbKKdadQPhUNJpWpz6j1KBHqcuRi26gr/ywJ/2LdKooN6EsR/xJjpQuj
         pSvme6qFLhyUf5Rrf29aBvJOhaFY1yW6WxpQJxZcV+6p0JW+V71qnkjXGakwamBJAetA
         cw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhD/S1v+suDkfCoZ23uJo95hB9Cd7tKgemCTXroQZvOdiCNgYQrTQDWvgk/IN7pewePyW2+ng=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+6qc55X8EF5DhQwfQ0ZmnKFeKX5FHvO30KtlegtkBaT65rC8l
	TSw5nUeflARbB5nfrrYOoSOHLK7kAB9j0OzvoNUp2ETdOd+Ob6WyfohGy5YzWLYvxKFfnU/MJMO
	D3yv03IDiLco4ECEJYPTTzoD9nSce5yAzgrBDpjMufb8wGkHRbQzFFXkYz2CYMuEDRSqvkhca
X-Gm-Gg: ASbGncsfuexf7IIw96AONWMv6EisvxpB7p59rKxYKtCn9VVg8h3KFOtWO7ZDGGCAFBk
	U7pKAgHoJBDmK3WyL0qXHI1N2QXanK9XNpWi4uHten16TOl0q0q/6Q1NuqVRHxO1vE4R3a9f/NJ
	EH5v/4QCiSzxRJkTZ38YCBDST4+qLWKJ3Y/05nn7Heg3DAWAyA7s2kPTAsfXLwSP5b3cz9dOZL4
	dX66yjpmkXXLr4lstTCaHC9QivFdwFpHBGhikxjMUQvPD4ZgxCrvRbDSASV2GZ14NwDjJP6K5pt
	pOYjfQrcez0sw822oOpl0zlhRTamK7YX5QK8/jIntdfaZjVzNTj8Gmg6kNv2Pj32xsarb2tWMFm
	S2A==
X-Received: by 2002:a05:6a00:181b:b0:747:cffb:bb37 with SMTP id d2e1a72fcca58-7486cbb5796mr5138547b3a.10.1749659296780;
        Wed, 11 Jun 2025 09:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE060S3E0lQ0RL4MxQ4A0gJVFm8R+zBlDRnqx0DEJpiWnLUvlDL1NaKOIc1z3QEZ+PUdQX0MA==
X-Received: by 2002:a05:6a00:181b:b0:747:cffb:bb37 with SMTP id d2e1a72fcca58-7486cbb5796mr5138531b3a.10.1749659296369;
        Wed, 11 Jun 2025 09:28:16 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0836bdsm9729053b3a.93.2025.06.11.09.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 09:28:16 -0700 (PDT)
Message-ID: <87c2388b-67c3-450f-8257-38855aba0da5@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:28:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: High CPU usage from NetworkManager with QCNCM865 (WCN7850)
To: g <gregoire.s93@live.fr>, ath12k@lists.infradead.org
References: <AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzOCBTYWx0ZWRfX7Zg9tiwonsaq
 RQJcKNfdDhxBKyJdDZ2lb1pe/mSs3UIeW8Ou83ZVzlT80cvluSc8LRdj3cM8Lk9PIAf9HTAiliY
 Z07XKG1awsHGofDoBPA3LUlyE60DKEz/g/wL/hIWfuw0w3/0fF2pdKsmqk1bxctR2s6nYwpbWqx
 PqtureT7RFlcEda34J1maDqh7oI+2dU/bfkdG+uBFaS5dOI5STxySBbE4925cHJ81S/ht4sdNXi
 FAOo47Nps3sSB+G0ziElI0zkObd8fKjn23gT4IfuIW7jcm411ZAyJvaVG3PGZlUEfW+xbrwImJ9
 XsHKjZXZwFw80fsFsiD514tq9qQemXoUXFw/u50rYhC21uRP+hv6UPh4j+59yNZjmFp4mwyjNSE
 S/4prznX+XfI+YGbR3VOw+bvD+DBvaBqeQDJL40UKrWSFRD7aMIBzQcL50UQWttf3wYQ43SL
X-Proofpoint-GUID: mYQuZ8Oxb7nhFYFKitqPyVRQPJStV5fw
X-Proofpoint-ORIG-GUID: mYQuZ8Oxb7nhFYFKitqPyVRQPJStV5fw
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=6849aea2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=BYvKuwRZtxU-e7sUs6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=614 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092819_411704_F87F611F 
X-CRM114-Status: GOOD (  10.41  )
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

On 6/1/2025 1:53 AM, g wrote:
> Hi, I'm experiencing a reproducible issue with the ath12k driver when 
> using a QCNCM865 Wi-Fi card based on the WCN7850 chipset.
> 
> After boot, everything works normally, NetworkManager shows 0-3% CPU 
> usage. However, if I toggle Wi-Fi off and on (using rfkill block/unblock 
> wlan), NetworkManager begins consuming 100% of a CPU core and stays at 
> full usage indefinitely, until Wi-Fi is turned off again. This is fully 
> reproducible on my system.

Can you check if this fixes your issue:
https://msgid.link/20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com

If so, can you reply to that patch with a Tested-by: tag?
And I'll take the contents of that tag to also add a reported-by: tag and link
to this thread with a Closes: tag

/jeff

