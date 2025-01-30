Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F9CC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiMHQ0z1wbr+JNPD50hh7kKgwucGaVyznKp+iYzAJgg=; b=x3t68+5TpUjdyhr9EcnXBsboiF
	YXW3eP3l15MOWDS5tasfZjG09mrZrRBxI159HrSKm8qGjWTIsOQvgPdbkKpHqNTUFZw+UDA7HSbfT
	1qISsj0nqMiMrgCzXqT5XH577QMtMWCF7n6sxZmHi8ESyUVTZknASoSYV/tFSGZa2vUcvvQm2syNH
	bNow9YtQ+moqXxzAlgEuLbRpU2ROW2B/EPtHYoZZYpS6c4cv6Ted3bmFpbulGcLNTBSN2GJWianUR
	Dz2Yz+LHn4QBe9KaotxfRAYC7FbN5UiDHULCb8zhg3YvB6GLMKBopc6gYOprp0OFRZQxQqThzs8kc
	sa3iBBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZjO-00000009Rmp-2tdt
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 18:57:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZjL-00000009Rl7-34Dr
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 18:57:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9ID3v012871
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 18:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiMHQ0z1wbr+JNPD50hh7kKgwucGaVyznKp+iYzAJgg=; b=U9VipNldWNJDJI8J
	MPZ6NKYfl4iCuugmpyGCTkTTYYgMnfypTigcgfg66658Oli5XMS/Ve7aB6c7CjPX
	l38GUHVEk4kPA0Ubsd3oWeOoXI/F7u0lfg+4ZJ9f8xtBYelC1g65w2MCvA/EdCzW
	SqANtiNzd1KpqG1unPMk6NH3zZpxWzaLsdftDJn3YAhBf9WU9FfJx34+rLvKHcoG
	4xHgHW7/dksEh58Xrpgkmmy+whg+ndILgv692f2OxpBQffjOHQJHuw+NN2QwB1Wc
	h+DThgqzrecBt9hxeKJaST59iVyWmiMU+aCJTgDmd8qyio+qkv65r+hMMY83BoYY
	I89DjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6nthecr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 18:57:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so2194778a91.2
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 10:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263453; x=1738868253;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiMHQ0z1wbr+JNPD50hh7kKgwucGaVyznKp+iYzAJgg=;
        b=JKg/ImKg+vK8og5IZfq/i3MRq3LfBGURekOXeG215YALcFUIklOP8pXv/hB6touqGe
         672sq3MbPNFWgyvytjWKwwyL57jh0gr8QXnzF+JLEtS4r+7sh2dSx9njYzIw+/vJXUfB
         Z88NORbR2UIb0ZyZ3uikVWj6ZB+sNKhAxaKAYnIdqx7kJw7kPF7d2GRlaYfn2CHRiJB2
         AqbDScNX8P7LOq7HfZhrRaSMEM94uju+YnOVeKNByqYUmMXM5oz7Uatpxx51G2dUIc9f
         lafqSPkqqG7iQhIicEWX+ZxseaPsaZM6U4nOfhguG4dQVqgsZXKcYmD+DnNVZymMyi8w
         OHMw==
X-Gm-Message-State: AOJu0Yx4rAHrY5yL1UzCH2MLvxQYgArT2cyDpCogXj2DT/rUs+PTPMTM
	HqM4zP0wopmlr2dDgCWGT+HChnKBjKhQy3gBnKD5+H1kNTO2LVDWHJv1eTcCJzw6quZNVz8RbBA
	b1k0/YexXhkquR+ZFFj2GREuC72iGAeJ/EkkSmQe0VQfOVV9009wgqJIG+QOD
X-Gm-Gg: ASbGncvaNdUj0VLmLYlBfP/zo/N0RhblPTXd6wQE73p3bPg+XFDJnRNOPF3EgPeVwwK
	moeAy199QUEctL1R8sbKFCAFa5WVGw2LTcERZzSQ/Y9+MVjKiQzzoJ0YFcndIX9AaSlYWJCR2wU
	yFekjFY0R1ItMlPoGrKdEpjvHp+kvtWajcUUoGQKpO/GW74NMPG1ZDiVBHO2dgdjEW+l3EjZHR+
	nwzh6EP1MvHY+j5wkV5wQ7rosDSBe0PolY1mCyVz8WuJjxKZjZceLjXkLKIAHrIFdF+VuWEsUs2
	OAUQf6gRj6SxRhqbJgRfQ929yrqMCJ/QoHppc30dl9dA3OxB+P9XUFLa80mvnVRGbFDl/n0wzA=
	=
X-Received: by 2002:a17:90b:53c8:b0:2ee:c04a:4281 with SMTP id 98e67ed59e1d1-2f83abb3525mr11527661a91.6.1738263452805;
        Thu, 30 Jan 2025 10:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG273BYwPCYJOD7Mxuz4ETYiF2JHgiTLRjcgdzwlh75QgkyHtg29AyuhDibvbFwEv67cIBh4w==
X-Received: by 2002:a17:90b:53c8:b0:2ee:c04a:4281 with SMTP id 98e67ed59e1d1-2f83abb3525mr11527636a91.6.1738263452421;
        Thu, 30 Jan 2025 10:57:32 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489d450fsm2036646a91.28.2025.01.30.10.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 10:57:32 -0800 (PST)
Message-ID: <a1a65ff7-bb5c-4c90-98b6-7155b58e89c0@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 10:57:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Remi Pommarel <repk@triplefau.lt>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
 <Z5s9CO_mmazq2Kg1@pilgrim>
 <94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: an07mYH3wNQyAq-9QttoeKcXfh3Y1o9P
X-Proofpoint-GUID: an07mYH3wNQyAq-9QttoeKcXfh3Y1o9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=830
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_105735_906224_6A8728C1 
X-CRM114-Status: GOOD (  16.78  )
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

On 1/30/2025 1:18 AM, Aditya Kumar Singh wrote:
> On 1/30/25 14:19, Remi Pommarel wrote:
>> On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
>>> On 1/29/25 22:25, Remi Pommarel wrote:
>>>> Currently in ath12k_mac_op_sta_statistics() there is the following
>>>> logic:
>>>>
>>>>       if (!arsta->txrate.legacy && !arsta->txrate.nss)
>>>>           return;
>>>>
>>>> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
>>>> if it return for empty legacy and nss of arsta->txrate, then the other
>>>> stats after it will not be set.
>>>>
>>>> To address this issue remove the return and instead invert the logic to set
>>>> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
>>>>
>>>> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
>>>> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
>>>> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
>>>> mac_op_sta_statistics").
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>>
>>> MISSING_BLANK_LINE
>>> 'Tested-on:' tag missing blank line after it.
>>>
>>> You missed v1 comment? :)
>>
>> Yes sorry I think your mail never reached me, did you CC me ? Do you
>> need a respin ?
>>
> 
> No problem. No need of respin just because of this. I think Jeff can fix 
> in pending?
> 
> It's strange that the v1 reply appears to be delivered from my mail box 
> and it is sent to the list. I see even Jeff replying to that. But none 
> of those are captured in patchwork. Not sure.

it was only sent to the ath12k list
perhaps you need to include linux-wireless@vger.kernel.org

> 
> Anyways, v1 comment was regarding this blank line and one suggestion 
> that in future submissions, please use base commit tag.
> 

I've fixed the blank line in pending:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=c7b9df20d6a48a279f4b537920049094701da14b

