Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F2EC54E67
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 02:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7Wfvl+5XxEU/ZPjmEvfvFRUiBz+YPqzqp0iI+1f/VY=; b=g63xnaGXKGPy4sQFhBFjC6pwtc
	7VnR3OEC6nxgmpdhTUQ9/7AD+T7YTGOMyFymhukqUL2VoWcadW6GNjja00krD8wET7ZSiYqXPDWeV
	UZyHgJgfTB3Dz2tDG0M9EL/c2wz+HHF25CRKgBw2s+t0TW4nT6iAks24kMUalFvOPc99wOBa9DnSs
	Wlz5xl9GZ+f6gpHOqSPTgsBhHC8Ze/1nU0WaIQGpTHG4VbnabVC4xzu3FWap8IQ8vhmL1SLUBkTYs
	zO2fuHYvZC3hZMbYo0Bk+C2byhJUoGt96z9FjGmdk7ziqLpo8MeSxku6xXVXDrYnmbs+fgL1pSKQQ
	gRXlCZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8EI-00000001and-08Ua
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 02:32:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8EF-00000001al5-2I8Y
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 02:32:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L2VMrU012609;
	Thu, 21 Mar 2024 02:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=G7Wfvl+5XxEU/ZPjmEvfvFRUiBz+YPqzqp0iI+1f/VY=; b=oH
	0asT695yrFylQTR0G9oSm7OFoMuqE73LoSsZwaAsKqlLU2VE2GdJyx1VbeK/BnqX
	6SWoMMJb5me+qRT9uKeNX/pewQjWvpfrDeMuLx19jmYo1lVfnRohQ5V3pcinbew+
	QVEzmO79IEb0F6hppmt5eWuDthmFXj5UeaQ0z6/CU7D5AjIEZ7zs+5S29A6M+f7S
	m443vdB98uTYvvmKef3D685Z9DtYhd8gGy6eFB22q72l0pPz28bclT8+PilSatoU
	qfc8zVCWAQ5gZ1wdz9+SMXrzLmle6q5FWn1bHnFsylQZ+qFBXHWuDZR4t2nCNxPb
	mI+7UB6SnZFNvjEosBxQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0c3g00aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 02:32:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42L2WGa7024341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 02:32:16 GMT
Received: from [10.110.69.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 19:32:14 -0700
Message-ID: <158ebe88-2394-4b1c-8d32-9d8509c11a90@quicinc.com>
Date: Thu, 21 Mar 2024 10:32:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: driver does not show tx bitrate
To: Owen Mesh. <owen.mesh@gmail.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
        Kalle Valo <kvalo@kernel.org>
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org>
 <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
 <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
 <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1_-J81Y6KwOiF58vFSCQfYOYRLYP-lsL
X-Proofpoint-ORIG-GUID: 1_-J81Y6KwOiF58vFSCQfYOYRLYP-lsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_14,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403210017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_193227_738427_D49F828A 
X-CRM114-Status: GOOD (  15.86  )
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


The patch of tx bitrate of 11be, we're working on add it:

https://patchwork.kernel.org/project/linux-wireless/patch/20240104032202.19472-1-quic_lingbok@quicinc.com/

Best regards
Lingbo Kong

On 2024/3/21 1:43, Owen Mesh. wrote:
> Dear Sirs,
> FYI
> Just tried this patch
> https://patchwork.kernel.org/project/linux-wireless/patch/20240219095802.1147-1-quic_lingbok@quicinc.com/
> iw now shows "tx bitrate: (unknown) 80MHz":
> iw dev wlp6s0 link
> Connected to d4:da:21:a8:06:7e (on wlp6s0)
>      SSID: NETGEAR65
>      freq: 5805.0
>      RX: 398485 bytes (1661 packets)
>      TX: 20994 bytes (192 packets)
>      signal: -25 dBm
>      rx bitrate: 6.0 MBit/s
>      tx bitrate: (unknown) 80MHz
>      bss flags: short-slot-time
>      dtim period: 1
>      beacon int: 100
> 
> I believe this is due to a missing 11BE part in the patch.
> Something like this:
> +    } else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11BE) {
> I have a router with a QCN9274 chip and, I believe, I have an 802.11be
> connection with it.
> 
> ср, 20 мар. 2024 г. в 20:08, Owen Mesh. <owen.mesh@gmail.com>:
>>
>> Dear Sirs,
>> I was wondering if it would be possible to add thermal sensor support
>> for the arh12k as it's in the ath11k.
>>
>> Thank you and best regards
>>
>> ср, 20 мар. 2024 г. в 19:36, Owen Mesh. <owen.mesh@gmail.com>:
>>>
>>> Thanks, great
>>> I also noticed that a fix for missing "signal strength" is planned!
>>>
>>> Regards
>>>
>>> ср, 20 мар. 2024 г. в 19:21, Kalle Valo <kvalo@kernel.org>:
>>>>
>>>> "Owen Mesh." <owen.mesh@gmail.com> writes:
>>>>
>>>>> I found a small bug in ath12k driver with wcn7850 adapter.
>>>>> ath12k driver does not show tx bitrate.
>>>>
>>>> We are working on adding it:
>>>>
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240219095802.1147-1-quic_lingbok@quicinc.com/
>>>>
>>>> --
>>>> https://patchwork.kernel.org/project/linux-wireless/list/
>>>>
>>>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 

