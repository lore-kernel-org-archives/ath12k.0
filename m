Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035DCE77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnNXGZR8YPidWZPnB4J0xVHahEH8RcI5bHz01S7I2Xs=; b=yc99N8iVA4VE3m75Suph+BoMQO
	2LitU8VQGBqjd7Ip7V7xeSrhb6e3SKWY6bLDLWUSXOO654oBjVga3IhAz2VmDOmh8CJXV5j0X31qI
	PxB/5tRydgdWRsHLujphJq1bqmJ4SZZbxSgL+jEcdP6lBMu8Giyni/5QRfcAnWdQJV8W15KN+fW5x
	czlpNEfextxsM9KOwv7L0hbWdPq2hQtgNzda+qedwArHU2yZEevGcG7AEiq4P51pSoadraG43N2bM
	F/xEZfADw+qc6zuCpW+c9H/dOIs+hf5yw3aokI0iRvjBhYdxnAJKeqFbrNFdKPN+5Qroz8C80oQyA
	5L5P5uQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzl9-0000000DJqU-3FN2
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 21:08:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzXI-0000000DHwE-2Rn8
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 20:53:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Jqfda009178
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 20:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QnNXGZR8YPidWZPnB4J0xVHahEH8RcI5bHz01S7I2Xs=; b=IWCjcF3yY/yaAFJ5
	15KueRD2cwFYzYtAC5KHEqEOn40QxxzV98nJkEsXfR00fF5493Nb7hLcABeUSLwI
	+W1e2cRcpw1/+Pir6RFKOcKXGXR02PqsxxBfH3rXPliOyJQ0y3cCn6mWeyxe0wCJ
	G71n6Qv9ebCqlD30tcMIwmeQ+Di0GDmRz9jS+1ZvYJ2AmEhqdT1Wm+oJPJtotlQ1
	iw4COkcG10uU6fZI7Oyo+/O/B6of2WnsVaEvFDjUTSwlZdPytj1Xd3bFe14puRl9
	MDQosBULwHo8PmwYcQGgLN5Fb4H25/FlAsL9Bsx167GZdIHoKtv6WTZkVba7dz6y
	Xi53hA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n0gg3rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 20:53:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2162259a5dcso34920565ad.3
        for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 12:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736456026; x=1737060826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnNXGZR8YPidWZPnB4J0xVHahEH8RcI5bHz01S7I2Xs=;
        b=osJJ4cQmRH0ERgtPC12iCHsqvj1VnYs/GQAJP9lYtMek8lK2J+IWv9qQEONltpELNc
         fVay9zfTgidqsWZz10mWKmtdKfSKn2SS/njLLMSdHOAqbFcxEvAujSenMFpy0NThE+e4
         S99g8rx+tdLtpB44fwBmFSFc/pg6eofacx842rYedyrkL6tfS1QAThmXMtvv9Nr0xuTF
         V+BHP7cZYIMoRKsDx4SdskALnd3aog1GcTD4eTMLsLYu3ETSIX+10UW3eAW8/zoqwNn0
         McEOCgjJ6C45xXBza/KLAbcMdh5JRqYgwg8ASEaKir9EisCskBymacC5KQxihKFwyOzC
         BiLw==
X-Forwarded-Encrypted: i=1; AJvYcCXHBY+uAA0BgXfkBD57ODAYgu9gcMUtn0b4nB7NDtHcxDpZPRnXKPixk4I+dpBS//2RONqfu8w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiDFIOrih3R8ENWQkzErx/CJThZa5jFIYABAVU4pezrHm0ZkQS
	QyPYD+ZRSuX37gYTX07qf+/4+HC5gg0LPA1C0+7k8S8KXzoadzOC+vgSjbfd5wTMgyFO3+82XAD
	2vTXX6+DA2wMTj+1NhTh9kxMwgTwbmM4CB0LlBeAhLkeo1rHOZ0KR+IPEh/s4
X-Gm-Gg: ASbGncv9fKesap5RNdFlku17dSkH/EIO59//hLkvaSKW/HNO9ygTmPjnZ1pSozTJyJm
	qzEXUbz9O0BSornMMhPZmXw13Fr7GG9AaiKAIA2qW3tpa3+G3fB2scsqEmG3qzSn7cN82KN9Gvg
	QKEodThdOdhdnjlPeOGVj2nemTdddZhBnfmIy6RqL2YK2ringwLSEcwg65x3ZxgPLlAyVGjeJD2
	ItZDrd3JyHzJGlsItk9pcYp79krZCCih8GYezATRm6Mzl8G/eYaZhhvSHfa2zkpi/YzEu6FQacI
	Dw3Ks8W9+MW72qomF63dLKNkgfj7ir4ggoSi
X-Received: by 2002:a05:6a00:1906:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72d22007a0dmr11571563b3a.22.1736456025916;
        Thu, 09 Jan 2025 12:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMC0RtDE+bv9hpJa0chTgo5Higx5f4zVcR+3kaoP9tDpUUtSWFmJ6Ni14+wdYRMnZwpbeGjg==
X-Received: by 2002:a05:6a00:1906:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72d22007a0dmr11571533b3a.22.1736456025534;
        Thu, 09 Jan 2025 12:53:45 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a94e2sm220464b3a.172.2025.01.09.12.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 12:53:45 -0800 (PST)
Message-ID: <03378c82-49a1-4271-b90f-3e2959b09e5c@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 12:53:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Aditya Kumar Singh <quic_adisi@quicinc.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
 <b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
 <5f05898c-cc5c-4c31-891e-9d5cb9cf5bfa@oss.qualcomm.com>
 <87tta8du5h.fsf@kernel.org>
 <fb0aac6d-ddaf-4f86-a55b-5576c4894b89@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fb0aac6d-ddaf-4f86-a55b-5576c4894b89@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4i9P-CV_dK__uek2UnEBeCHxEgNmMZeH
X-Proofpoint-GUID: 4i9P-CV_dK__uek2UnEBeCHxEgNmMZeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125348_753353_4C486217 
X-CRM114-Status: GOOD (  17.23  )
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

On 1/9/2025 5:15 AM, Aaradhana Sahu wrote:
> 
> 
> On 1/9/2025 6:24 PM, Kalle Valo wrote:
>> Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:
>>
>>> On 1/8/2025 8:55 PM, Aditya Kumar Singh wrote:
>>>
>>>> On 1/9/25 10:13, Aaradhana Sahu wrote:
>>>>>
>>>>>
>>>>> On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
>>>>>> Device is booted in factory test mode for calibration.
>>>>>> The commands are sent from userspace application, which
>>>>>> is sent to firmware using wmi commands. Firmware sends
>>>>>> the response to driver as wmi events and driver sends
>>>>>> these events to the application via netlink message.
>>>>>>
>>>>>> Also added changes related to correct pdev id access for
>>>>>> fw test cmd.
>>>>>>
>>>>>> Aaradhana Sahu (3):
>>>>>>    wifi: ath: create common testmode_i.h file for ath drivers
>>>>>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>>>>    wifi: ath12k: add factory test mode support
>>>>>>
>>>>>> Rajat Soni (1):
>>>>>>    wifi: ath12k: Fill pdev id for fw test cmd
>>>>>>
>>>>>> ---
>>>>>> v5:
>>>>>>    -Updated copyright
>>>>>>    -Fixed line length within 90 char
>>>>>> v4:
>>>>>>    -Rebased on latest ToT
>>>>>> v3:
>>>>>>    -Rebased on latest ToT
>>>>>>    -Updated Tested-on Tag
>>>>>>    -Removed second parameter of ath12k_core_start()
>>>>>>    -Updated copyright
>>>>>> v2:
>>>>>>    -Rebased on latest ath ToT
>>>>>> ---
>>>>>>
>>>>>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>>>>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>>>>>   drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>>>>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>>>>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>>>>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>>>>>   drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>>>>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>>>>>   drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>>>>>>   drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>>>>>   drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>>>>>   drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>>>>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>>>>>>   13 files changed, 636 insertions(+), 75 deletions(-)
>>>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>>>>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>>>>>
>>>>>>
>>>>>> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
>>>>>
>>>>> Hi Kalle,
>>>>>
>>>>> Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.
>>>>
>>>> This series does not apply cleanly on latest tip. And base commit is 
>>>> around 6 months old. So may be you would want to rebase and send a new 
>>>> version?
>>>>
>>>> Applying: wifi: ath: create common testmode_i.h file for ath drivers
>>>> Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>> Applying: wifi: ath12k: add factory test mode support
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/Makefile:26
>>>> error: drivers/net/wireless/ath/ath12k/Makefile: patch does not apply
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/core.c:42
>>>> error: drivers/net/wireless/ath/ath12k/core.c: patch does not apply
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:209
>>>> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/debug.h:33
>>>> error: drivers/net/wireless/ath/ath12k/debug.h: patch does not apply
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:13
>>>> error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
>>>> error: patch failed: drivers/net/wireless/ath/ath12k/wmi.c:7150
>>>> error: drivers/net/wireless/ath/ath12k/wmi.c: patch does not apply
>>>> Patch failed at 0003 wifi: ath12k: add factory test mode support
>>>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>>>> When you have resolved this problem, run "git am --continue".
>>>> If you prefer to skip this patch, run "git am --skip" instead.
>>>> To restore the original branch and stop patching, run "git am --abort".
>>>>
>>>> And since you'll be submitting in 2025, don't forget to update
>>>> copyrights.
>>>>
>>>>
>>>
>>> Make sure to review all the changes that Kalle made locally to the pending
>>> version and incorporate those.
>>
>> BTW my changes are available in tag ath-pending-202407031443 and these
>> are the commit ids:
>>
>> 194fb8d58727 wifi: ath12k: Fill pdev id for fw test cmd
>> 0ca2ecc31b40 wifi: ath12k: add factory test mode support
>> df17f461e7c3 wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>> 593b976359bf wifi: ath: create common testmode_i.h file for ath drivers
>>
> Thanks, I will pick your changes as well.

I've verified that v6 picks up Kalle's local changes

/jeff

