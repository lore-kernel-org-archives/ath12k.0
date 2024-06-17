Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B17C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RaIXtC6vsj3sHVRPSWqYl+q9D80xpcpne/9wrlpavI=; b=Am4a0KLt9kEFcq9+n+c7owR/Gt
	U1qBv13oFavPFqvj+LW7/6Z2NBT0AMv0U1XkIR5dm4gM0aE8lTu6XIpuccfqZzUa13DOCvr/nVYGA
	pOwciBoy0BekzbwGwYBH/rPkVDFEEIkqmpX8nSxZNP5oU0+/55DCrBxHMxqLPSplsXVWOdw3Q6uUI
	gvNSTeFLlLQU0lqnar0tKam0CwJBrOUoVJStzX3OHFd7dtm1rOMvOzap95/+vgC/vZ2qhDWBuo38c
	QF9oHIdTJ2zYpUyP2GkQieVL/gl+8Ut5yhWuavGlUFrE38/obDys6ZqhUSPXjSAy61zVfZTvsMJzF
	jAlU2MaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAMS-0000000AR41-1pST
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 11:17:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAMP-0000000AR3V-0JC9
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 11:17:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAiIxo003122;
	Mon, 17 Jun 2024 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RaIXtC6vsj3sHVRPSWqYl+q9D80xpcpne/9wrlpavI=; b=Q+aebDGhY+tUAAEl
	su+w4v53Y7DyzsxpZfWzW6JCQkdcE/d2TD56C9VOFxVeP2ctkNIGy6pEWm6kHiyb
	3zH3AMJD0O3Xu4svLhCI+X7EEfUdPYp+gmkDLj3eitZeIWwDShctTAo8dJZijC++
	btp5QEpoMp3+Jo2E924YDjM0gT6Q2xZyjF9A+k0Dk8D+MK7M8cNat/FOAIq91QRk
	rGop0DLT2UWIRlxQeozdXSi7tHv5y57q8dq90qCivPISUUNKqQGeASOMilhIKOnw
	Zw2hoMbb6oL4/cYlgFj1g0FhugWgErwpR4AxD5Kz2WZASReb29NpyEjhCAI7c/4+
	DGezZQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1y6uhxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 11:17:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HBHCGU015529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 11:17:12 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 04:17:10 -0700
Message-ID: <7e1ab778-83af-4e7e-bc5d-069bb6c83563@quicinc.com>
Date: Mon, 17 Jun 2024 16:47:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] ath12k: Factory test mode support
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240611083427.881443-1-quic_aarasahu@quicinc.com>
 <cd77058f-7165-4342-893b-a59a3a18c3c5@quicinc.com>
 <875xudnf5x.fsf@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <875xudnf5x.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nkyXtN-OlmobDKVUBI6HC53bA8BHMF3c
X-Proofpoint-ORIG-GUID: nkyXtN-OlmobDKVUBI6HC53bA8BHMF3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_09,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_041717_267185_0A393BDE 
X-CRM114-Status: GOOD (  16.72  )
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



On 6/13/2024 7:00 PM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 6/11/2024 1:34 AM, Aaradhana Sahu wrote:
>>
>>> Device is booted in factory test mode for calibration.
>>> The commands are sent from userspace application, which
>>> is sent to firmware using wmi commands. Firmware sends
>>> the response to driver as wmi events and driver sends
>>> these events to the application via netlink message.
>>>
>>> Also added changes related to correct pdev id access for
>>> fw test cmd.
>>>
>>> Aaradhana Sahu (3):
>>>   wifi: ath: create common testmode_i.h file for ath drivers
>>>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>   wifi: ath12k: add factory test mode support
>>>
>>> Rajat Soni (1):
>>>   wifi: ath12k: Fill pdev id for fw test cmd
>>>
>>> ---
>>> v3:
>>>   -Rebased on latest ToT
>>>   -Updated Tested-on Tag
>>>   -Removed second parameter of ath12k_core_start()
>>>   -Updated copyright
>>> v2:
>>>   -Rebased on latest ath ToT
>>> ---
>>>
>>>  drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>>  drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>>  drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>>  drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>>  drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>>  drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>>  drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>>  drivers/net/wireless/ath/ath12k/testmode.c    | 422 ++++++++++++++++++
>>>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>>  drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>>  drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>>  .../wireless/ath/{ath11k => }/testmode_i.h    |  52 +--
>>>  13 files changed, 634 insertions(+), 74 deletions(-)
>>>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)
>>>
>>>
>>> base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
>>
>> FYI this series is not applying cleanly in my tree for validation:
>>
>> Base: using specified base-commit a116bf2be795eb1db75fa6a48aa85c397be001a6
>> Applying: wifi: ath: create common testmode_i.h file for ath drivers
>> Using index info to reconstruct a base tree...
>> Patch failed at 0001 wifi: ath: create common testmode_i.h file for ath drivers
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>> error: patch failed: drivers/net/wireless/ath/ath11k/testmode_i.h:4
>> error: drivers/net/wireless/ath/ath11k/testmode_i.h: patch does not apply
>> error: Did you hand edit your patch?
>> It does not apply to blobs recorded in its index.
>>
>> I initially used b4, but tried again directly with git, and it failed for me 
>> with both mechanisms.
>> Kalle, do you have any issues with this series?
> 
> Also fails for me on top of commit a116bf2be795:
> 
> Applying: wifi: ath: create common testmode_i.h file for ath drivers
> Using index info to reconstruct a base tree...
> error: patch failed: drivers/net/wireless/ath/ath11k/testmode_i.h:4
> error: drivers/net/wireless/ath/ath11k/testmode_i.h: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 wifi: ath: create common testmode_i.h file for ath drivers
> 
> Setting the patchset to Changes Requested.
> 

I have rebased and sent the next version.

