Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6759C36010
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4+It+c8FiaIPB2pViRPzT1GXbmj+h6GvvLombB8HdQ=; b=G44e4ZT8SyCZaXg0fxIFPIAHIf
	dgvoigVoqwVFF4/FMLAGr7S0Nc2hUQWEXBIpV07TYfUtB5MPGRUOVc8hK2mwnCsQIMc4BrtzN+Jtd
	gjDc7q6LO0a3cGuhcW5/h1UDYsvP1bgHOyYoYmkrtXynAwuT4iyC/V58yPZzaOvtWbQhHFdYMpuyv
	/9/QQSgWIC5Sv/89/aYSrsw4xRh7Jp5yrj8tt1c8St9+vp6k14fMIkJ/TSiDfxRKSw8peFIzUkZz7
	344xIedurmrtlft9hgVLR26tLv4DGtMb+WhkeAjA0mtHUQ0+7ZUSP/HzDBF+oBf+VYj0usp+4pWYH
	MHg4oUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZ8-00000001eHw-03Uw
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 18:51:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1q4s-00000001LLq-459v
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 17:16:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dv4u010542
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 17:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4+It+c8FiaIPB2pViRPzT1GXbmj+h6GvvLombB8HdQ=; b=XthXQaJnsMmgzIYY
	TZ2HDBFzxq7a4L/EQh94sGaff1ZDI/cv4Lzazh8hOsorpk5h3LrUFzf7ItMbwx3S
	8Jyj6xErEpHvJ2pIY/uzFzXj2XzhQNFtQ8OyIhBYIOtgDWJq1F0gOkH2vTizOx15
	IL4whbP0yNS1lzqzw+c91zuVt+4xFG0o/Hzi+MbG1jUK00K+6UqtcqcWXK8otHVf
	wfevdPpg7jllSBf1qNpI0uY16nN5A9X9nEnrc/evqzx34wEv6TRQ4DyRun7b2Iy7
	RUvtnD4nrx9Zwnobvi0SoUDkO1MMmPcEJvwmeTMKcAHy5CTGTcAZ+7E4nTopHap4
	6Eehkg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm4wsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 17:16:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af91804dd0bso2797066a12.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 10:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046165; x=1744650965;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4+It+c8FiaIPB2pViRPzT1GXbmj+h6GvvLombB8HdQ=;
        b=X3JnIejYbCweJMpRa/pY37LnQDtDQyMD63mZ3z+9XW9xTFIoYiBGWUtKaNTv+HnRpf
         KL0d6NuC0Y7iG+Gt2fFO+/WP9u9rdZUTCMrHWbMIIM19nwGg8GT0cQbkN/mQpFManO5s
         tn7dUSo7cORjDj2C3JULZGXhoHwfxdCFR384Ah7Gwc03SCBsK2UDavDXHnHFWfArQUIQ
         8iJvH+iIND7+7ZL0mC8Tr2NcdGoVLs+Hk9bj+Kn5IJ0F1orzhCCzc4w2GJl/DoL0eYXA
         kP/2t/fnh8E9A+pjYqBZgaZ7P1iPV/R5zX3OdADXPDIF+wQqA4QXrz4fvfaTBsPuszDG
         So/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnacvSCobksve5e5AZhOT6NNWidBFrNw6cVSSIqp0KVywdn7AHhsjwG1+fbhq3AVdluD3sApY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5gl+9kXdgIB/Vg39lR/ePGs5XSixChtq8d8SP4tflduoPoPH4
	xWwrZCP50Cn1vSW1FYh48DcxzbH5KNs8i+h8pN1IlXUmzod118IIN7Nz8FKv4ClRMFI1kwLPRVL
	M2UNVE8kHioq3Ls6GESot/0XVGe7kYK/yqvBbYEpfPaD/4P66lvK0nisLChpC
X-Gm-Gg: ASbGncuirSbtNOkFAUT9KN6cHcoOhdpBQO/5KkvMpj05Tk39wtySk4O5V0+hwQK0BJH
	7VZVE4dpcUa+G/31BW7+FPpKq/d6O4ij92jj3dzpQcvv2VRwyZ5s/sclzfu6fFAptVV2JxcuJLO
	PW4yeJnR7Sx8Rqx8O6PJjPmqd6MyeZsff3xHixqmrlE+x5+Z3RZborxXcCeaoJf5Oy/NcMCReVg
	cURJtdnVJeGKplQiCLxou9HJ6YyjMUkPkNZmDVoMn5uWc4CO9tSGJO2P8/XqjbA+CW5pC+7s7s3
	+UPh7XKYB6WxU5UwP6tsdMxdncaQSTp349kCRtYi4LJKJ56tXv+61Da52JJWvkcqBYxICiEZWhs
	t2RfuRX7x
X-Received: by 2002:a17:90b:2f46:b0:303:75a7:26a4 with SMTP id 98e67ed59e1d1-306af6e91b5mr15013993a91.7.1744046165473;
        Mon, 07 Apr 2025 10:16:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqRokzLd76m2Y82cCCvCYijyAExnWKd3PeIXztfoKGqbcLATqDh2s/RnOU1w4jQ0njHRmM+Q==
X-Received: by 2002:a17:90b:2f46:b0:303:75a7:26a4 with SMTP id 98e67ed59e1d1-306af6e91b5mr15013940a91.7.1744046164796;
        Mon, 07 Apr 2025 10:16:04 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058466dc0bsm9058682a91.15.2025.04.07.10.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 10:16:04 -0700 (PDT)
Message-ID: <406a43b8-10ad-4bb2-b27b-e97bb1c992b0@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:16:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: Fix multicast memory leak in
 tx path
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UWHfYgULk2WaKSxZQJ6A5c_smhWRSbHl
X-Proofpoint-ORIG-GUID: UWHfYgULk2WaKSxZQJ6A5c_smhWRSbHl
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f40856 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qj2aD7nG-88JOw6nMIUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=835 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_101607_033634_68C6696E 
X-CRM114-Status: GOOD (  10.09  )
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

On 4/2/2025 11:14 AM, P Praneesh wrote:
> Address the memory leak caused by extended skb allocation observed during
> multicast transmission in this series.
> 
> P Praneesh (4):
>   wifi: ath12k: Handle error cases during extended skb allocation
>   wifi: ath12k: Refactor tx descriptor handling in tx completion handler
>   wifi: ath12k: Fix memory leak during extended skb allocation
>   wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
> 
>  drivers/net/wireless/ath/ath12k/dp.c    | 10 ++-
>  drivers/net/wireless/ath/ath12k/dp.h    |  7 ++
>  drivers/net/wireless/ath/ath12k/dp_tx.c | 87 ++++++++++++++-----------
>  3 files changed, 64 insertions(+), 40 deletions(-)
> 
> 
> base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7

Please rebase to current ath/main

Applying: wifi: ath12k: Handle error cases during extended skb allocation
Applying: wifi: ath12k: Refactor tx descriptor handling in tx completion handler
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/dp.h
M       drivers/net/wireless/ath/ath12k/dp_tx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/dp_tx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/dp_tx.c
Auto-merging drivers/net/wireless/ath/ath12k/dp.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/dp_tx.c'
error: Failed to merge in the changes.
Patch failed at 0002 wifi: ath12k: Refactor tx descriptor handling in tx completion handler

/jeff

