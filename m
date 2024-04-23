Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE0C4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjfZQ+j1LmSBlFJ3VFT7nHwKfB3EHWUMJJqY8bMYWEQ=; b=l2WSJvW79FBiqPqdmj4X/aan82
	nkW7m/S/yStDpKH+/6pBP95r8QPGf14QCj1KYlD2aAJP4z2P3iTiSlApV/vTMPxpt0Q+RHR9yDtEf
	t9FuAkR+fqtfatiTf422HAjTwypyybhEuhiM0Ca5bFgqQTbqh5VCgFkU6WlMxMY+5idkUD5aDwUv1
	aK8JCNoWteO0fYB2rHaPcD6HR9f6J2ond3FAEGVArUMxqcjZsKs5NPZ9sH0/eZmMV8F9Y7qoi+K3H
	pwdPzwAtO/TK9U1+T1jnuD2Rpw+CXH6XjWC8g9oxnmpu3feGZPT7f76fiZX4e43ocEUZPnLwsybMZ
	+zf9hqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz8PX-0000000G0SP-0q8w
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 05:09:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz8PT-0000000G0Rp-3hIK
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 05:09:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N59RpL016427;
	Tue, 23 Apr 2024 05:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fjfZQ+j1LmSBlFJ3VFT7nHwKfB3EHWUMJJqY8bMYWEQ=; b=Y6
	X/RtlGuDrKwBdskmDqM8COEx+m5GybdV0mYE+4GPknde8ZWYvoAmyfbV6Dj7IhhD
	wfHg1rDYAmzRC2D8rHelY63Mp2H3tJ1JPbBLcrVfbSE42q8g2sp4+2WZkOsdK/zv
	zhEZhb7uFXxNHUKomUOEem47i6WgyDjw6v/tD0w3Kk2StpNf5d+x8e+74Xu3MLcx
	baSvWrcaWTJkiJM8t1Z0ehQqyw394EH9/mAJhlOD4vk+yDSI7X9ElaqPoKfAxUFN
	8tg+DjEW3hpZN6OP0ZDUEJYECgvRxH4YXiEK5YrC/CID9A5sfMJtUK7HKtB9zjaG
	y+rKarmyeOwok+M+Jh+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnvtn92je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 05:09:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43N59Pqo007453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 05:09:25 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 22:09:24 -0700
Message-ID: <c87b00a7-4890-4a96-8242-95d52c16f4d2@quicinc.com>
Date: Tue, 23 Apr 2024 13:09:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix kernel crash during resume
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240419034034.2842-1-quic_bqiang@quicinc.com>
 <87cyqmhtoi.fsf@kernel.org> <87frvivufg.fsf@kernel.org>
 <87h6ftv8w6.fsf@kernel.org>
 <5f63982a-eba9-4c5d-8ac0-52970316f940@quicinc.com>
 <88a1ab50-3dea-406e-adcb-b02786ce7f30@quicinc.com>
 <e409e282-3f6d-42e2-ac6d-7602e3ef1b87@quicinc.com>
 <87cyqgvhv7.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87cyqgvhv7.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a9BCVn8ZQTBM9_M7pvC7anPhl_u6hSjB
X-Proofpoint-ORIG-GUID: a9BCVn8ZQTBM9_M7pvC7anPhl_u6hSjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_02,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=969 phishscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_220940_159182_34987AAF 
X-CRM114-Status: GOOD (  10.26  )
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



On 4/23/2024 12:10 PM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 4/22/2024 11:41 AM, Jeff Johnson wrote:
>>> On 4/22/2024 8:41 AM, Jeff Johnson wrote:
>>>> On 4/22/2024 6:12 AM, Kalle Valo wrote:
>>>>> To avoid breaking git bisect I now reshuffled the pending branch so that
>>>>> 'wifi: ath12k: fix kernel crash during resume' is before the suspend
>>>>> patchset and my plan is to commit the patches in same order. Does this
>>>>> make sense for everyone?
>>>>>
>>>>> I had a simple conflict in ath12k_core_reset() in these commits:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=052a6a7c74ae4f20a31a632184f4439edcb0f40c
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6bc740619993535cb64c4dcebb83c66acd506763
>>>>>
>>>>> Please check my changes.
Looks good to me.

>>>>>
>>>> These look OK to me.
>>>> I'll test the pending branch on my laptop
>>>
>>> pending branch crashes on my laptop
>>> let me bisect
>>
>> ok, that was user error.
>>
>> I had updated my workspace on my VM but not on my actual laptop, and the old
>> pending branch on my laptop contained the follow patch which I've already
>> flagged as bad (and is not present in the current pending branch):
>>
>> wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup Failure
>>
>> I updated my laptop to:
>> 5085843538af (origin/pending, pending) wifi: ath12k: report station mode
>> signal strength
>>
>> And everything in that pending branch works fine, including hotspot.
> 
> Thanks for testing. Unless no objections from Baochen I'll then apply
> this fix and the suspend patches.
No objection from me, kalle.
> 

