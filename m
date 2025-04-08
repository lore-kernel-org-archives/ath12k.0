Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF62C369A4
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+93NX7hMLFSwrHGefljN7u3jVdkUJtzM3/NQSF70tM=; b=GDUlNNWG9cchJi1klaqZDWxZBb
	EBLvfWZKMoJHwFWKqDzQUYdbs23jjWTpIjE3WoBhAtafwLJRY1U+xwcQbaYDvMdB/var457G5Hm0E
	kSx4+5UYAiZZtamwF1Sg6V6HZV3D8Pt6TOWh9f4oMy93Ih2L3gXJEgLxYvkSm3Zh/Z8Z9syEKvayD
	kw1lwO6Vuty6nsWkEoYIW2lXtOkFDskmhCZZTksUn9a4zK0NgM+7Szx0GFnBgMAo2APEuSWMtzOp/
	eqTakj0xvzCR5w4Dy6SEgEYDHmtnY2L2uLzFj5/sVUFNYjJRNMM/YeH5OPnBUnkc5YukiHWxN1yne
	6l7/iKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Bz-00000002ruX-47TH
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u227U-00000002qvQ-2W5J
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GPrD010540
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+93NX7hMLFSwrHGefljN7u3jVdkUJtzM3/NQSF70tM=; b=FH9eK1PlLeR81dJ5
	o1nKATUVNjm0+ggtb6nAazqwLYI3M6psFnt8QnYtSaqZJHFN+Gm6OBC/WnASZnAo
	cEgk5nNNYclYor2RZCwmiqbkr7iaSFov1ICHaCicl+AbRMaWrJSCDmwO0WYxpapa
	hwJQCnq0FgVSk/SFAREJLswUwK9NmhIIoZEKG35HJQHm59xDQK5INma5qMoHg25r
	Gg0sXqfVd30VKFbf3nE99HJpN0jHL4uUYajffTJcLSyF6BvnzvhULXeK2mAN/+wb
	T42v5/QCks7TX5eHplvIl6CmMluiuepXo7QtGXwW2432FVcwgKsA/MEeRQajvo+/
	c+SEQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1ejvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:07:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225974c6272so38852115ad.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092453; x=1744697253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+93NX7hMLFSwrHGefljN7u3jVdkUJtzM3/NQSF70tM=;
        b=NDgIyGneqWE7ehK53zfss5SI9JiRB6zXDI2q1At4pI+RxrsIxBAdOSZrP2cg67SZ78
         UNVHDsnIefNsL9wVTZPgK1H7WOs3bjfNHNp0GdHYbT+GS5FDtSmpMmiGNXQVlXBKrXaD
         Tto1j1rQ3RQc+DAKkKnNA6r60q4APPBP8bWL++HPKV8SB9EhsUpS5lzBKxG8Lm2nYE+b
         zxtJkE14yAKeCWUccaTirzyLQtgrFj9gFGmD7hkaM0AHKrNvD1VfdtxgSc/00+eK53hx
         iFo+WkE/A37zAg4V5mGl5UFljEE0P4Khxp5rlJEMYDJ19DqzZbucG6vHKQRsEX4BZBJ6
         lfkw==
X-Forwarded-Encrypted: i=1; AJvYcCW4BauKIdd29qmHa61vQKyRQ3DH5p6cqqLkcQFyPT8h4QXqa+SRoKyasrH2JMMXOmUmLzCfaN0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3SIBSMamKzwjBM17Fej5VzrC/bmvcJM/zUnU7N435sgWu3H3E
	NCkeXL/Sy78uTqk1Z4GRMX243k6SAvRpz2a+74VMCVLzGVw6BFgfRVE2rVxFf4Bt5t0Z+rUO0pM
	buM9vaB9nRjWdYNa/XMgEIQhEX+jsazEG6LJsRa4FPtKBumoyr2tJniFCdvUb
X-Gm-Gg: ASbGnctva87rMRH+nWp4aMX+UUgUeaTxyruE2JSGJLzQInZYUIKLgN6+R8cm6E6t3vc
	mJ2kZUfxPqvmCwumCJA3BRhpaXqy8Vqykw0tsgH6vxBlYt0PBl78Z6rjAUx+Nlzh3C1UI1OkVAz
	96gnd7e3cyBsUSJKSrm7G40MA/nmTUk1eyEUSxYZxgJ2Yq8xgLnGvNMnigQRW1keincO9SdEfOF
	OgKIzlUi+dbopE2+Qzh6ccaz9wnyBd+O+JXH8vAgjHZhDA0sM8EJUW4U3rVP75f7rO2fjMH+uM/
	qhVDo27PUaSl4NvpYg0CfkpqIsIxGTJp3sFgoz8=
X-Received: by 2002:a17:903:2acc:b0:223:fb95:b019 with SMTP id d9443c01a7336-22ab5eaa5a3mr34537475ad.24.1744092453086;
        Mon, 07 Apr 2025 23:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWKEZ4KRDBQDRBa0q5215GWlCqu+MFm9EVeC8sjd5ksd8QKaPKRbsG34GB3NFoOzk58Qx1tA==
X-Received: by 2002:a17:903:2acc:b0:223:fb95:b019 with SMTP id d9443c01a7336-22ab5eaa5a3mr34537075ad.24.1744092452644;
        Mon, 07 Apr 2025 23:07:32 -0700 (PDT)
Received: from [10.152.200.95] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e1bfsm92058025ad.168.2025.04.07.23.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 23:07:32 -0700 (PDT)
Message-ID: <d97d8fa3-36d9-435f-9efd-e71f8f1fbab4@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 11:37:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: Fix multicast memory leak in
 tx path
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
 <406a43b8-10ad-4bb2-b27b-e97bb1c992b0@oss.qualcomm.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <406a43b8-10ad-4bb2-b27b-e97bb1c992b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CVx30rZ-eyjSJgBjPCyKZbSVIz9CE16S
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4bd26 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=O_1ZbGT33wkLeJ7M5ggA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CVx30rZ-eyjSJgBjPCyKZbSVIz9CE16S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=785 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230736_761658_2C492453 
X-CRM114-Status: GOOD (  12.95  )
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



On 4/7/2025 10:46 PM, Jeff Johnson wrote:
> On 4/2/2025 11:14 AM, P Praneesh wrote:
>> Address the memory leak caused by extended skb allocation observed during
>> multicast transmission in this series.
>>
>> P Praneesh (4):
>>    wifi: ath12k: Handle error cases during extended skb allocation
>>    wifi: ath12k: Refactor tx descriptor handling in tx completion handler
>>    wifi: ath12k: Fix memory leak during extended skb allocation
>>    wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
>>
>>   drivers/net/wireless/ath/ath12k/dp.c    | 10 ++-
>>   drivers/net/wireless/ath/ath12k/dp.h    |  7 ++
>>   drivers/net/wireless/ath/ath12k/dp_tx.c | 87 ++++++++++++++-----------
>>   3 files changed, 64 insertions(+), 40 deletions(-)
>>
>>
>> base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
> 
> Please rebase to current ath/main
> 
> Applying: wifi: ath12k: Handle error cases during extended skb allocation
> Applying: wifi: ath12k: Refactor tx descriptor handling in tx completion handler
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/dp.h
> M       drivers/net/wireless/ath/ath12k/dp_tx.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/dp_tx.c
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/dp_tx.c
> Auto-merging drivers/net/wireless/ath/ath12k/dp.h
> Recorded preimage for 'drivers/net/wireless/ath/ath12k/dp_tx.c'
> error: Failed to merge in the changes.
> Patch failed at 0002 wifi: ath12k: Refactor tx descriptor handling in tx completion handler
> 
> /jeff
> 
Sure, I'll rebase to the TOT and send the next version.


