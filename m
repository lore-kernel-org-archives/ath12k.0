Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A3CC3601E
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfPoX/kxo2nQm9hEorj+Uzv9NtujZvxu2BRrTUCBL80=; b=q2gSr7t0kGePPFLLl39+qnnYw/
	jSzKe1gCvcx/E38hzy8IDw2pYFGNYBqmJ4oXmdaZTxkHrj+G2mwE94TFCO32TzXqqmTBQU7dGu8v8
	4DfgFYYksRmVrIMAmHi8dz5o+/ZrlWM530jRL6McoO56meozQf6wfeklTP61ZfSxfyx5GcVD5iLun
	EsDO+amSWXBoBpOvGWLjUIjJGAiauVRU8mmpr2bpkrVKLgTtXmI3jdv8RaN212QYL01mY7lbU5osp
	w5tvInowtx+1u8Kc9SlP6vEAIAMpv1MV8E0KZ3XtP6IExN8GsIJyYR5bXX9ji8QMGylcdlgTDIUCA
	UMJX6T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34so-0000000CNTP-2KkJ
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:16:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34sl-0000000CNSu-3pQ4
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:16:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFwlOv018319
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfPoX/kxo2nQm9hEorj+Uzv9NtujZvxu2BRrTUCBL80=; b=gdcA4tjCdQYomEl5
	7X6aZbCdPVOpZ6kL3WqKipRj7BRDT3i9AJ+a39RJV/krONThCS8uEEcRipD6ICu1
	rzjWNKRXwwvBzEiyOv/yRjA9+hO/ON12Pv1yMOT+VoRbSwjWrl+pf33SCf2cabwE
	GCUalEB4RE1RrHBp7P5QvEOP4wOwHuqVARrIcgoWeqfJIPmAwy9EW0unv8X1G6ES
	kCi8OhYLXuKUEr8K8CpzLDflBPR/5ZFeBUfHym8Qi5ukgfvQZ5RgjIADxBfWb2A1
	yMirRCWpMiBHqqCSKe6uo8TnQKzO3GUb7WDGXmy1uOmyAxg2VWRyapct2IZavniS
	ljUT6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb94a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:16:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e500a73so11676565ad.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341402; x=1744946202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfPoX/kxo2nQm9hEorj+Uzv9NtujZvxu2BRrTUCBL80=;
        b=ZZBjv8WrIDJDJw9LTgl1TnUPbb5BhyQ55arpIqWKC35lgeiU7n6gKasqzLVhXi6ftV
         jLemC0x7YeUCPNFH7XZ4SG0UQYIIC+ByGTz3gV4DMkpgEYeUU6gl12za8rMuRWDzAK3x
         jOkbc1pIigUbGbt1L3KkqVG09sB9werMObgNpDO7HtTQUqLWM/D2Tp0RTrlfySMtdnKs
         zVJFIEgE0kI91r7kLQJpO2Eq72fxhIQcb6JAat4ZuF9OGDDLIQMts7ozc5HlBazkDzuQ
         eUwHuS1ZnHy1ND2P6LTpZs2Q0fG4rTl/UUrx59NKHOc7hSficSiH+BWAmRRUOyGCAXpG
         nR2A==
X-Gm-Message-State: AOJu0YyktP7GeKgYih3H6XMGozX+IBVDfQlvYYCwwsnJimLfsNz9pP3R
	CDjiEtDycV2gw/2Z2puccj3JyV9zSAz81lsof3s0tH8BP2jH9iD61AI4Lk2HUJpr83YGi51JRXW
	IFfSJsfDuzwhh3gx4zEEErrftuhjL0o+gndgroNdt4gkJh+mLH4hWfBMWCSTi
X-Gm-Gg: ASbGncuz9JPk7A+dvEeHwz/2l4+uM6bc5kszHeSq2Om/mvPLcTcNyBxQrpRdrC5cH+G
	xRWmv5TV2Gq/J9GsAUkNvd9iFq2wUn3Vig1Id+Kuci30Rcnbgnjis3UobU3LjUtZnO6uSeK24gK
	vGJhQptVe6GDe+ibk8jktzM1bHcrrv2qFdHhMqyfNbYQx7IldKaPsI9+IBtmzck15JRg8Oed466
	JkbpNSvkCfzF5hi8hQxvecvgomqrSuu52E3NYcg9McPhQ8mbw4qp8v1ND0aC2oa0pKx4tLyQRmG
	yhaNaBSAealDzOjH5gL3hxHuTDvOQQE4x233wN0iOFlpWBT4Ow==
X-Received: by 2002:a17:902:cccd:b0:224:910:23f6 with SMTP id d9443c01a7336-22bea4fcc8dmr19562105ad.45.1744341402278;
        Thu, 10 Apr 2025 20:16:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgsmv7ffD0Y3g1ZhudIgNEOfDzZl64JTVEmAr+V0XzueISHA+3ZzevJJ64w+uAsDERig8oAw==
X-Received: by 2002:a17:902:cccd:b0:224:910:23f6 with SMTP id d9443c01a7336-22bea4fcc8dmr19561775ad.45.1744341401880;
        Thu, 10 Apr 2025 20:16:41 -0700 (PDT)
Received: from [192.168.29.88] ([49.43.250.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b70sm38537125ad.39.2025.04.10.20.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 20:16:41 -0700 (PDT)
Message-ID: <d4fc1ee2-bba0-4a85-bd66-b46be5f6e34b@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: handle scan vdev consistently
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: quBPpN2zKLBQAG-VWg7nxnb2J1sGB7fa
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8899b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=cXzaif0YSwZ7kBs4STVCvg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=7GAvi05Al6q7sVWQShMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: quBPpN2zKLBQAG-VWg7nxnb2J1sGB7fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=910 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_201643_962761_BEC48619 
X-CRM114-Status: GOOD (  14.37  )
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

On 4/11/2025 8:34 AM, Aditya Kumar Singh wrote:
> This series of patches addresses the handling of scan links in the ath12k
> driver to improve consistency and functionality. The changes ensure that
> link ID 15 is correctly used for scan operations across both ML and non-ML
> interfaces. Additionally, the patches prevent scan failures by fetching
> link_conf only when the link ID is valid and setting appropriate default
> values for scan vdevs.
> 
> Currently, no issues have been observed; these changes are intended as a
> cleanup and to ensure proper handling. For split-mac these changes are
> pre-req change.
> 
> ---
> Aditya Kumar Singh (2):
>        wifi: ath12k: handle scan link during vdev create
>        wifi: ath12k: Use scan link ID 15 for all scan operations
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 30 deletions(-)
> ---
> base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
> change-id: 20250402-fix_scan_vdev_handling-ef5be452b949
> 


For some reason, b4 (or get_maintainer.pl script) did not include the 
linux-wireless list. I will send v2 manually CCing that list as well.


./scripts/get_maintainer.pl -f drivers/net/wireless/ath/ath12k/
Jeff Johnson <jjohnson@kernel.org> (maintainer:QUALCOMM ATH12K WIRELESS 
DRIVER)
ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER)
linux-kernel@vger.kernel.org (open list)
QUALCOMM ATH12K WIRELESS DRIVER status: Supported


Please drop this series.

-- 
Aditya

