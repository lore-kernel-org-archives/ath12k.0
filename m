Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59983E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGotP1F1mfnNv0MRad98ZmC/4dTNFl0GLXKFHyaRTIo=; b=y9/uhNo+FEy055mqIujW6ouWl3
	/hrRD/j+8Z/GbWbeYxZKe5sDPYbkvwaDJWVn+QnQzQ4rIEe6I/5ZTsHCG0fufSssT5QW4beSRWZ1S
	XntMewOQyj36ZAf/NZDCpDdsDk95aSR/CoFvG+2F/PtIbX/gBU3kTVEk9jlwOp3H66yExxVg0Vf/m
	JGtzApsn/j/2JqbYuFW5ZC3Mq8bf/QZdbmKY6a77ofWmLFcrDETir+MPIN8+M7pCwYAZbMeVufneT
	U9+zH9gLQpt8mSd69OXi8GrqRhHqEu7TyIy7068uFNiTFKP5HvRg9wQABGPlhvGi5B0wr5l9tt+Cn
	i/BoSRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkaf-0000000Al09-0PbV
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkac-0000000Akzh-28wC
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:56:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5091GmYI018515;
	Thu, 9 Jan 2025 04:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGotP1F1mfnNv0MRad98ZmC/4dTNFl0GLXKFHyaRTIo=; b=CNcl7ccOstRhEFcO
	UyHGnqlg+HXVX2JLidKvwxgWXhPAj0a3FxL9EG0NMZHgefIcyHhc5KfucXtG8YAH
	fJrHf9cbB1VlKrNZA9Odz7afEifXYMes/kQSViBNIgo9iAesXKbWOFXfxZtPph32
	n2Wd8NhYMF0vRBu6OK6izJiHGai2j9xk/HDVvlD/pfnz6S6naYZLhDGuFtQyioJL
	RNuZhTYVtxhyQlcO2GTTPHH9O/FwpjE+x/IdxEoLQ4D+nh6eU/qiexe5EiU5bBfn
	DP4YB/EZcKYvhGihSrtKAC5cKqXl4UpDvvk6o5gLY3tPoqhG/wD9+soAtgiKbr6f
	AYQ85Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxbs1q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:56:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094u3As029208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:56:03 GMT
Received: from [10.216.19.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 20:56:01 -0800
Message-ID: <b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
Date: Thu, 9 Jan 2025 10:25:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>,
        Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c9fToB_bMbFAUV8AovwNtkJTVOWr_877
X-Proofpoint-ORIG-GUID: c9fToB_bMbFAUV8AovwNtkJTVOWr_877
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_205614_654850_342C9680 
X-CRM114-Status: GOOD (  14.79  )
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

On 1/9/25 10:13, Aaradhana Sahu wrote:
> 
> 
> On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
>> Device is booted in factory test mode for calibration.
>> The commands are sent from userspace application, which
>> is sent to firmware using wmi commands. Firmware sends
>> the response to driver as wmi events and driver sends
>> these events to the application via netlink message.
>>
>> Also added changes related to correct pdev id access for
>> fw test cmd.
>>
>> Aaradhana Sahu (3):
>>    wifi: ath: create common testmode_i.h file for ath drivers
>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>    wifi: ath12k: add factory test mode support
>>
>> Rajat Soni (1):
>>    wifi: ath12k: Fill pdev id for fw test cmd
>>
>> ---
>> v5:
>>    -Updated copyright
>>    -Fixed line length within 90 char
>> v4:
>>    -Rebased on latest ToT
>> v3:
>>    -Rebased on latest ToT
>>    -Updated Tested-on Tag
>>    -Removed second parameter of ath12k_core_start()
>>    -Updated copyright
>> v2:
>>    -Rebased on latest ath ToT
>> ---
>>
>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>   drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>   drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>   drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>   drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>   drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>>   13 files changed, 636 insertions(+), 75 deletions(-)
>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>
>>
>> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
> 
> Hi Kalle,
> 
> Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.

This series does not apply cleanly on latest tip. And base commit is 
around 6 months old. So may be you would want to rebase and send a new 
version?

Applying: wifi: ath: create common testmode_i.h file for ath drivers
Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
Applying: wifi: ath12k: add factory test mode support
error: patch failed: drivers/net/wireless/ath/ath12k/Makefile:26
error: drivers/net/wireless/ath/ath12k/Makefile: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/core.c:42
error: drivers/net/wireless/ath/ath12k/core.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/core.h:209
error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/debug.h:33
error: drivers/net/wireless/ath/ath12k/debug.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:13
error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/wmi.c:7150
error: drivers/net/wireless/ath/ath12k/wmi.c: patch does not apply
Patch failed at 0003 wifi: ath12k: add factory test mode support
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

And since you'll be submitting in 2025, don't forget to update
copyrights.


-- 
Aditya

