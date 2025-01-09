Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7DE7719B
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EAjubr1ulPWNtRIrvPgXGavL6zgnPcu8YCsxHalM+A=; b=tkEOClJYb9rgU/wY2zGINCneht
	vAkzH8hvpg/hwUhDJkR8DN9zPn0NbRcV5AA+pPcUvnO3K59aSTt28Zj+ziWy0OIT67hEFEcoajaed
	AdcG525qaFjCTxlcv4sZKB2V+mwBPc558El+P8PmNSqbwo2of3m2GADSeH21j0TUZqBnjSwQtEigw
	xid6mE7S98i12+HgI56au97BNz7Oig5594GSMvJZpHL96vatgM+H7uFkZHZQJ2JXLB3HX2H8kFIgI
	LC+nFA2xHP5na7mL+BLZIWoVASqB75c6uAZ+sCqm6oLSTqzCZCC0LScYqsm8t8Em13VIVD7zaokij
	eky5jM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsOT-0000000Bz0I-2jdl
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 13:16:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsOG-0000000Byox-3Qu3
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 13:16:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509ChDPU005340;
	Thu, 9 Jan 2025 13:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EAjubr1ulPWNtRIrvPgXGavL6zgnPcu8YCsxHalM+A=; b=F2r+7ZZVei4RpceH
	x4zbvQhVR4AT51MmvHiqmoAMLkdEH1BW0tdLx4/Kc34wI8Q8+7pzdY/m1q4IEue1
	fgWBiQMEcXVvvUTL1qwDFJMzOQToIyhQy7CqEd7hMBYHDZRftIO1aTx+sZPDor7x
	iclyEiYeqFRis6ROGW6dJjqIEh6+zEG6JKLO64qIL2EPqFIjdKqZ45n3X2YfWS0H
	8BpTxeS/2eDtCalFz85U0RuL8/FbYUDYqDwx6aYXgLMW3xmcUEUzsBwvB2gihld2
	zZmstm49v2LFBPNwyJNeODlK2zxY7ZZ2uDyNbX72ySYMnEc4n7Iz2CdyfExC49YY
	dq1fQg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442epxg2h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:15:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509DFuw5031944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 13:15:56 GMT
Received: from [10.50.15.45] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 05:15:53 -0800
Message-ID: <fb0aac6d-ddaf-4f86-a55b-5576c4894b89@quicinc.com>
Date: Thu, 9 Jan 2025 18:45:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
To: Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson
	<jeff.johnson@oss.qualcomm.com>
CC: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
 <b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
 <5f05898c-cc5c-4c31-891e-9d5cb9cf5bfa@oss.qualcomm.com>
 <87tta8du5h.fsf@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <87tta8du5h.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ec4uFZxPnnXKaU3Y4hhaU89fjTq77pau
X-Proofpoint-GUID: Ec4uFZxPnnXKaU3Y4hhaU89fjTq77pau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_051600_990625_8871596F 
X-CRM114-Status: GOOD (  16.33  )
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



On 1/9/2025 6:24 PM, Kalle Valo wrote:
> Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:
> 
>> On 1/8/2025 8:55 PM, Aditya Kumar Singh wrote:
>>
>>> On 1/9/25 10:13, Aaradhana Sahu wrote:
>>>>
>>>>
>>>> On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
>>>>> Device is booted in factory test mode for calibration.
>>>>> The commands are sent from userspace application, which
>>>>> is sent to firmware using wmi commands. Firmware sends
>>>>> the response to driver as wmi events and driver sends
>>>>> these events to the application via netlink message.
>>>>>
>>>>> Also added changes related to correct pdev id access for
>>>>> fw test cmd.
>>>>>
>>>>> Aaradhana Sahu (3):
>>>>>    wifi: ath: create common testmode_i.h file for ath drivers
>>>>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>>>    wifi: ath12k: add factory test mode support
>>>>>
>>>>> Rajat Soni (1):
>>>>>    wifi: ath12k: Fill pdev id for fw test cmd
>>>>>
>>>>> ---
>>>>> v5:
>>>>>    -Updated copyright
>>>>>    -Fixed line length within 90 char
>>>>> v4:
>>>>>    -Rebased on latest ToT
>>>>> v3:
>>>>>    -Rebased on latest ToT
>>>>>    -Updated Tested-on Tag
>>>>>    -Removed second parameter of ath12k_core_start()
>>>>>    -Updated copyright
>>>>> v2:
>>>>>    -Rebased on latest ath ToT
>>>>> ---
>>>>>
>>>>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>>>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>>>>   drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>>>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>>>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>>>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>>>>   drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>>>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>>>>   drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>>>>>   drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>>>>   drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>>>>   drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>>>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>>>>>   13 files changed, 636 insertions(+), 75 deletions(-)
>>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>>>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>>>>
>>>>>
>>>>> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
>>>>
>>>> Hi Kalle,
>>>>
>>>> Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.
>>>
>>> This series does not apply cleanly on latest tip. And base commit is 
>>> around 6 months old. So may be you would want to rebase and send a new 
>>> version?
>>>
>>> Applying: wifi: ath: create common testmode_i.h file for ath drivers
>>> Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>> Applying: wifi: ath12k: add factory test mode support
>>> error: patch failed: drivers/net/wireless/ath/ath12k/Makefile:26
>>> error: drivers/net/wireless/ath/ath12k/Makefile: patch does not apply
>>> error: patch failed: drivers/net/wireless/ath/ath12k/core.c:42
>>> error: drivers/net/wireless/ath/ath12k/core.c: patch does not apply
>>> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:209
>>> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
>>> error: patch failed: drivers/net/wireless/ath/ath12k/debug.h:33
>>> error: drivers/net/wireless/ath/ath12k/debug.h: patch does not apply
>>> error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:13
>>> error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
>>> error: patch failed: drivers/net/wireless/ath/ath12k/wmi.c:7150
>>> error: drivers/net/wireless/ath/ath12k/wmi.c: patch does not apply
>>> Patch failed at 0003 wifi: ath12k: add factory test mode support
>>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>>> When you have resolved this problem, run "git am --continue".
>>> If you prefer to skip this patch, run "git am --skip" instead.
>>> To restore the original branch and stop patching, run "git am --abort".
>>>
>>> And since you'll be submitting in 2025, don't forget to update
>>> copyrights.
>>>
>>>
>>
>> Make sure to review all the changes that Kalle made locally to the pending
>> version and incorporate those.
> 
> BTW my changes are available in tag ath-pending-202407031443 and these
> are the commit ids:
> 
> 194fb8d58727 wifi: ath12k: Fill pdev id for fw test cmd
> 0ca2ecc31b40 wifi: ath12k: add factory test mode support
> df17f461e7c3 wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
> 593b976359bf wifi: ath: create common testmode_i.h file for ath drivers
> 
Thanks, I will pick your changes as well.

