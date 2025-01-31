Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E38FC02190
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 03:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUNx4j+0EG7yQiA+IcF9xR8NV8tps8BaZtOLkIpIB+E=; b=CmvHnjjqYw9dnM7aPahdn39i1I
	rW1dJrKM8Lz7PQj2xubDdvN2Cd1dtdfWs0RmK0FnAzZhfIRuxeXj/T2+TIcvlgdyy3h22j/Ngb1wx
	PSG10gPG5KVZW8RgRO3zj4qcjpKfYxa60jsnva5WYV6cu3A6XIlao1o9CuXt9YhZvTKyrUmZOXdsh
	IQ/DPF2KrFkf4LkdnRNb1HkBMw28mMbi9B+D0uiU/uPl4UoXVOQz/U1+uTaRK0UfRzCscIDzuhD54
	uCM1O7ux/nMUSBwUiIBvyhk2GH8sYNFFEdwOeDWSYMnjV6sZVGlfg7O4yKSjpTB3ATL3oDNGDiVG7
	C7+gLgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdi7v-00000009yjH-0KDf
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 03:55:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdi7r-00000009yit-3VwM
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 03:55:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1wJW005338
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 03:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUNx4j+0EG7yQiA+IcF9xR8NV8tps8BaZtOLkIpIB+E=; b=Vo8SnP43rvGJN25w
	kPgi0uYp7KWU0FMjkAvNHM/fLd+lCHiGSqCW0qK8iANA0hd7sEjzyeyISbCOieNA
	usdvtcQBaR/zlr493AgcCS3AkHILY8UatFjWcNHxnXoBDYYMDZlpk14Nu+IX9wzL
	Z18X7pUngw2a2mO6q+TAijycuxzYOQUPFsOEVwPLv8q0BH2Xfv+hzertpyNPMUs+
	NcVX8oautliza+OEowoHdphYshagzDiR8L/w6T0ZoHTMDgFTZnzFzQoP3DGi1W6f
	TQTA+4bRYcnJuFvwz2fLBX6YsNPeFNGfuzlVHGCL9570tQ6MOuUXlRV6lF3ABJ4G
	rVeZfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7nguc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 03:55:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f816a85facso3028117a91.3
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 19:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738295724; x=1738900524;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUNx4j+0EG7yQiA+IcF9xR8NV8tps8BaZtOLkIpIB+E=;
        b=cUOiesfKiACt3faW9zxbL8+EWjNB+h6UJOTKKfTujYQSFmsfuZcSdG8FUcJrZQBQ3Z
         5LaQAHWoPOyzs0SDyUrmTl/eR+dAaD9JFs5oMgIrQgO/32j+FaiJzxfA00fiLA6+O+YG
         upsJi4tMlf8MjZx1yqeNxnJ1X2n7L6A8ve4S0xSnDiNrHmYF2xmbZhlKf3HEZCEeurg/
         GMMiM2GdBjhjTvxDGENE6ZtwAWiQ1zo4dgrr4lUtafJcfetzdBADthzC0n3CBJ3Q290y
         Ssu6tU3Jk7KCqq1hoIcBAX0gbdUpI+SYc7aRAlpgK+NZNChlIkCRahd8WoItWvlANRqs
         xbtA==
X-Gm-Message-State: AOJu0Yw6wfZQQZXtO4WG1VdhzERjQ1QJZicniCJl5RO+vr9lhL5XQExA
	yDv+Zai+ic8OQkn7v34NUdYcYD/Tp5w9Cdibqonp5IUVs2mv7QkIRix3Ov9P+XaW/hoRLOYzqja
	8zMucoYqny68FiyFzedOtaO++Gum6paJL14gTyjNGna8fXtrT/TLMNh4vaffo
X-Gm-Gg: ASbGncvh+fu2XG/IMQKFGId9nT5uD7Qj62UCBBFUlSJx/E3D8Km87FzAUd0r6P/FcSA
	+lC+nnNoMaDbdQW0PSnJlAkNZY+T2Jredfmu62DIXz2WXKDG9jkg9zUbbEVqboZOVTRHFgyjfVI
	BsHFiT2USMlLW5apa/jnZtu7NslYFwK7wBV7CJRPTeqSHZUu9HZreg5Y81leKTnH0tE89U5MdNn
	8gfVBygae9vZp5MtK3cQ+bYnXV0FLW8GyTTdnv1VvRzB7kspvr6zsJz6LCUw0k24KLPy8q74LSO
	MOBbBLm2DlFkcescOZ0Fz1E59VZcWCM9cQBdGwU=
X-Received: by 2002:a17:90b:548c:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f83abda260mr14524120a91.13.1738295723939;
        Thu, 30 Jan 2025 19:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4RzkwFNDfu+ymr6WG1Kw2o1UU3U6Wsau4bq8pGsiE5KhJ7gVeX1dgGybRWsRMzBq7gWZy5g==
X-Received: by 2002:a17:90b:548c:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f83abda260mr14524095a91.13.1738295723525;
        Thu, 30 Jan 2025 19:55:23 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f84897a290sm2775396a91.1.2025.01.30.19.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 19:55:23 -0800 (PST)
Message-ID: <bc3873ab-d2ca-4121-830a-bee76426dac8@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 09:25:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Remi Pommarel <repk@triplefau.lt>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
 <Z5s9CO_mmazq2Kg1@pilgrim>
 <94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
 <a1a65ff7-bb5c-4c90-98b6-7155b58e89c0@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a1a65ff7-bb5c-4c90-98b6-7155b58e89c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 18tB7SdcQtqV0BpHqxYxMVTcLj-Qw3gH
X-Proofpoint-GUID: 18tB7SdcQtqV0BpHqxYxMVTcLj-Qw3gH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=824
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_195528_011824_CC6DB3CC 
X-CRM114-Status: GOOD (  16.88  )
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

On 1/31/25 00:27, Jeff Johnson wrote:
> On 1/30/2025 1:18 AM, Aditya Kumar Singh wrote:
>> On 1/30/25 14:19, Remi Pommarel wrote:
>>> On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
>>>> On 1/29/25 22:25, Remi Pommarel wrote:
>>>>> Currently in ath12k_mac_op_sta_statistics() there is the following
>>>>> logic:
>>>>>
>>>>>        if (!arsta->txrate.legacy && !arsta->txrate.nss)
>>>>>            return;
>>>>>
>>>>> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
>>>>> if it return for empty legacy and nss of arsta->txrate, then the other
>>>>> stats after it will not be set.
>>>>>
>>>>> To address this issue remove the return and instead invert the logic to set
>>>>> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
>>>>>
>>>>> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
>>>>> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
>>>>> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
>>>>> mac_op_sta_statistics").
>>>>>
>>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>>>
>>>> MISSING_BLANK_LINE
>>>> 'Tested-on:' tag missing blank line after it.
>>>>
>>>> You missed v1 comment? :)
>>>
>>> Yes sorry I think your mail never reached me, did you CC me ? Do you
>>> need a respin ?
>>>
>>
>> No problem. No need of respin just because of this. I think Jeff can fix
>> in pending?
>>
>> It's strange that the v1 reply appears to be delivered from my mail box
>> and it is sent to the list. I see even Jeff replying to that. But none
>> of those are captured in patchwork. Not sure.
> 
> it was only sent to the ath12k list
> perhaps you need to include linux-wireless@vger.kernel.org
> 
>>
>> Anyways, v1 comment was regarding this blank line and one suggestion
>> that in future submissions, please use base commit tag.
>>
> 
> I've fixed the blank line in pending:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=c7b9df20d6a48a279f4b537920049094701da14b

Looks good, thanks.

-- 
Aditya

