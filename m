Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC00DC021B8
	for <ath12k@archiver.kernel.org>; Tue,  4 Mar 2025 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/8RDQh8wr7UznX1BTQUyabFw//PS1kuHsKPG8oE3Go=; b=EuXjL33HKBbiWkLGEI9b99hUli
	ZlCihT39ytPsDDge48DsTu5mpUidvMsOV6OSEtr/QvjU8E6nkTN8iDkHS1NIsz4nQFYnsnSDGsCY+
	ERwHh4M4dubLCudpzAEM8DL9eFA46uUhneZbG5V2t1yCne0rch4dKc62RoFBP6a2cCzAqErZqJ/9M
	eThJd1/er3ZYi4/pFzi32RUTKrg56MwUBVkQUSR1dteGeNcUxAlaBvDRTSsxKepXG6A4n4yrB5Osu
	XB0bYW0J9YNZCiIio9uc2/5j8TajEQTYjDneSRl4USoh4eJK58ytcxU6LYrvcFxJ47HMWAfhQoVII
	qmo3JyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXUQ-00000005w11-1w13
	for ath12k@archiver.kernel.org;
	Tue, 04 Mar 2025 18:59:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVpI-00000005ZeU-1tJF
	for ath12k@lists.infradead.org;
	Tue, 04 Mar 2025 17:13:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249U7x8021653
	for <ath12k@lists.infradead.org>; Tue, 4 Mar 2025 17:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/8RDQh8wr7UznX1BTQUyabFw//PS1kuHsKPG8oE3Go=; b=kFlSjho77LQOVHzs
	I7CnQa5yfXzfgDOPc3ohM81aY4epBKMRdy2MWad2LaiGDufhUZaB9HDHkWxhMSkU
	2VqK3QWs+um9BuNZbGeZYzUY/WQenSMAM5nO+Dbr3nOqgIR4cVYrFkWC8r3tRWqQ
	3lJi4B+1zNvZ/uBpghBN0uTKWt/XkPGX/BcXuwZzZnXHRHT4FWYSTu8DMpAMXEZZ
	fp8TYfaVMZwsENZg+2SqMyyQZyArBWyWRY9irEUejh95PhKbsdWYy5t20oOzxqQx
	EuVo1kCO5Y1EY/x7YPL+sqMfMdbjXBMybbYT0L14o3ekV/kJhItyrh7SD1vGzAQK
	cWIRoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t2kj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 17:13:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fed20dd70cso6523666a91.1
        for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 09:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108381; x=1741713181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/8RDQh8wr7UznX1BTQUyabFw//PS1kuHsKPG8oE3Go=;
        b=hYIYLwiyqYN+nlZ7f6gDjRMn1DE4MTdN8DEPN5xBY3bfZ7slc2Ve7H6Q37lRUY9pXv
         ptws/T+F3e7B19s7aR86Yp1NCXXNJmGqGEfFAsTWg/ibKBRpN/l35gEvIKCYRJnXrKJU
         otUdodsn1aF8gQgZTbxfe7+Xs0A8K0zoOdgDcjhYVPCraMN8TMHMIEhxBfcjZUsKHp4w
         c3JCu2QKTA/55FFr9TkY8pIwS/mcNsPOjLGa5v6Ry4SWMmYwrHS0WVhbhjg7XgR3jJ4O
         2DCzOxm4Oczz5fBkIyrZg1OlzyH33pn4un5GZ6QS6AMfZWu9Ukuj8GM/ttuZhPBJZVLn
         Y5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWzVTQ3dElQeJu3QjBjVyi9Dz7Km57H4L4LnwnA80dT0tYbPRdhV+6JEGTWTUAxyBFgi3murVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YypTIAHRmyuyRiWdnuY0o+hYdrg3VV8sZwdQazfZ/kTJY/9Jii/
	cPlw1JRCPdM8Uu4wkFmwFVXJGgZqJkC92NZb26a8Sf0/r+LGhcUXkwLOiuApzekcnCDGclz/T92
	VPkEtr7EkaoiGpkmimes02FiVJ85BDwARpUJWOBIbqWKUWZkN9cuZL5VuVVh3
X-Gm-Gg: ASbGncuHIJrEYH4L1gcADyek1G188a0W2HhDNnvmDmlH0kvtRB/VoTcGRA3EEC9oVH7
	CBILHiJyXSXFjAENxco2tAceHxlN+rbMCyTEatYjx7fLLZbfQ0eZMTN0X/hCbCZW8V72NG3EVHb
	Km9fy++02eP8vjxqoNu1Letp3ZiNwsLzgYg2Y+c5xWE7nYQCufp3SzIho3dIKv2MaGb+HjhSSpq
	nk2GzRgWUODu5Ow+QCzBqN9/fa5r6CkSAIzZ7ZmIXhXcT9v1jSQ6cOwbquBWdgjOTM4swnwWgNP
	c+TIihovsqs6MfIO+nt84DUBwYX8XLfW+f21PG5io4CBsMewtP4eb55ovkKf7DMHGSgtWqY=
X-Received: by 2002:a17:90b:2e06:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-2ff49774308mr74705a91.3.1741108381187;
        Tue, 04 Mar 2025 09:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjMG39Rd4ec3cS18rTFLoQUEXepbg95yZLvsgbxRn4IzQCdTKnRiWMMWlOJ4rOlWZv7gLnYg==
X-Received: by 2002:a17:90b:2e06:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-2ff49774308mr74677a91.3.1741108380773;
        Tue, 04 Mar 2025 09:13:00 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050f210sm97883245ad.205.2025.03.04.09.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:13:00 -0800 (PST)
Message-ID: <d6b45785-22f9-490b-96dc-8b448b700bb9@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 09:12:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath12k: Pass correct channel frequency
 parameters
To: Suraj P Kizhakkethil <quic_surapk@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250304095315.3050325-1-quic_surapk@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250304095315.3050325-1-quic_surapk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c7349e cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pXsx2e1gGNpEw_TLi-QA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fxXcDeVpA8gWXKwsuPG5atNNF69OcRHg
X-Proofpoint-ORIG-GUID: fxXcDeVpA8gWXKwsuPG5atNNF69OcRHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_091304_634227_4DF5E912 
X-CRM114-Status: GOOD (  13.77  )
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

On 3/4/2025 1:53 AM, Suraj P Kizhakkethil wrote:
> For higher bandwidths, the channel frequency parameters passed to
> the firmware are incorrect. Pass correct values of channel
> frequency parameters.
> 
> v2:
>  - Replaced arg->band_center_freq1 to local variable center_freq1,
>    which is initialized to arg->band_center_freq1
>  - Rebased on ToT
> 
> Sriram R (1):
>   wifi: ath12k: Pass correct values of center freq1 and center freq2 for
>     320 MHz
> 
> Suraj P Kizhakkethil (1):
>   wifi: ath12k: Pass correct values of center freq1 and center freq2 for
>     160 MHz
> 
>  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604

Some reminders:
1) per new guidance you should have added the destination tree name (ath-next)
as a patch tag, i.e.: [PATCH ath-next v2 0/2]
2) since these were trivial changes you should have propagated the
Reviewed-by: tags that were given for the v1 patches.

No need to resend for this, but please keep in mind for future reference.

/jeff

