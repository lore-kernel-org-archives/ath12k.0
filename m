Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF48C5475B
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDCgEUAAUG+BJEiBMUHxjJYf9BD9fQ4xHSOClod/mCs=; b=fBryMStTN0S79B2Vv7+CKrU7H8
	WqzkjTBoXoYS81Yqm3hrdt3HW9pwZNzkjL+LXEOkwpGA5bbPr87OUtgmEgKd94MnAQLh18xJiBJu2
	/nM+YYkmFKLHvC43Z4YMzzomMHrhTDW+AGSE9z8+7cNLkr4M2U/MTOxjK4seN6RS/U9l05f8wWtK0
	c8fenVqOCXpsJXohtYJ5W/8iubK1P6LshxXHZSkASSoQMYatSJB8NMuXHctw0cDB0nxyILI0G3GCq
	0S1yRAQPrCqVoUGbHKw07LEzeadSNgPvbHVdcTjsTWN+b4HBnvo00MpeTIFWWLp4sQr/xYxGtlVM9
	qVbVBfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhN9-0000000Ditk-00Jl
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 09:27:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhN5-0000000Disc-1Hzy
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 09:27:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E6co6d023793;
	Thu, 14 Mar 2024 09:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NDCgEUAAUG+BJEiBMUHxjJYf9BD9fQ4xHSOClod/mCs=; b=U6
	JVC39ShGYEFVa9/yadsyi4VFhBtdBOOgdHiu5NTTTK1GPJBNABKHNEG2pDlSM9GA
	3W4+dna70Q9flP88ITbV43BI1oC/01A1TBNjO6ewu71ErTVx6XoPLo7cOYJhQJzm
	rpoQgY4k9Mx9TV7/eEhuoEQC5oWT4WhLTiZ5zY2B4ERp3hR7FbA/pY/LU2lbKy9y
	XzWzslzxIcFE2z4buuC2bm/9mgkel8nvTs+chvVpKkZDFLxWKA+hM9XtR7g3aMNh
	LPknu7quf/gf2rmsc187HR39lFFX2eXSCCr60azUBBjIQFwDXiPkWA87Uq1KO5xS
	n4aZIrULm9iyFuFER61Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wupch12vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 09:27:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42E9RQHq010245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 09:27:26 GMT
Received: from [10.110.125.139] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 02:27:24 -0700
Message-ID: <fd8384dc-b35f-477e-aac3-b7a5f49ce712@quicinc.com>
Date: Thu, 14 Mar 2024 17:27:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
 <87y1b7jkxu.fsf@kernel.org>
 <6f39eb1c-97f7-4029-a5f2-5ab36ff0f0a6@quicinc.com>
 <877ciq9h3e.fsf@kernel.org>
 <4e67118d-80e4-422e-aa39-73b891ee6042@quicinc.com>
 <87a5nkkfs1.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87a5nkkfs1.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U1r8I_g-PpgggMJv87MeaAnSjIFBIsP7
X-Proofpoint-GUID: U1r8I_g-PpgggMJv87MeaAnSjIFBIsP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_07,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=950 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_022731_577113_446BD2A3 
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



On 2024/2/28 19:08, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> writes:
> 
>> On 2024/2/27 21:23, Kalle Valo wrote:
>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>
>>>> On 2024/2/26 23:37, Kalle Valo wrote:
>>>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>>>
>>>>>> The tx bitrate of "iw dev xxx station dump" always show an invalid value
>>>>>> "tx bitrate: 6.0MBit/s".
>>>>>>
>>>>>> To address this issue, parse the tx complete report from firmware and
>>>>>> indicate the tx rate to mac80211.
>>>>>>
>>>>>> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
>>>>>> tx bitrate: 104.0 MBit/s MCS 13
>>>>>> tx bitrate: 144.4 MBit/s MCS 15 short GI
>>>>>> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>>>>>> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>>>>>>
>>>>>> Tested-on: WCN7850 hw2.0 PCI
>>>>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>> Tested-on: QCN9274 hw2.0 PCI QCN9274 hw2.0 PCI
>>>>>> WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>>>
>>>>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>>>>> Please use full englist words like transmit instead of tx. Also the
>>>>> title could be simplified to:
>>>>> wifi: ath12k: report station mode transmit rate to user space
>>>>> Here I assumed this only works in station mode. Or does this also
>>>>> support AP and P2P mode? The commit message should explain that.
>>>>>
>>>>
>>>> Ok, i will apply it in next version. Thanks for pointing out.
>>> After rereading my comments maybe keep the title simple like:
>>>     wifi: ath12k: report station mode transmit rate
>>> But it would be good to clarify in the commit message what modes
>>> this is
>>> supported. And what hardware families support this.
>>
>> Hi kalle, Could you please offer your opinion on this commit message?
>>
>> wifi: ath12k: report station mode transmit rate
>>
>> Currently, the transmit rate of "iw dev xxx station dump" command
>> always show an invalid value.
>>
>> To address this issue, ath12k parse the info of transmit complete
>> report from firmware and indicate the transmit rate to mac80211.
>>
>> This patch only applies to the WCN7850's station mode.
>>
>> After that, "iw dev xxx station dump" show the correct transmit rate.
>> Such as:
>> tx bitrate: 104.0 MBit/s MCS 13
>> tx bitrate: 144.4 MBit/s MCS 15 short GI tx bitrate: 626.9 MBit/s
>> 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0 tx bitrate: 1921.5 MBit/s
>> 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
> 
> Looks good, except for readability I would add an empty line after "Such
> as:".
> 
> I noticed that the signal patch depends on this patchset:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20240219111417.1185-1-quic_lingbok@quicinc.com/
> 
> In that you should submit both patchses in same patchset. But please
> wait until I have reviewed the signal strength patch.

Hi, kalle,

Would you mind if I kindly inquire whether you might have forgotten to 
review "wifi: ath12k: report signal for iw dev xxx station dump" patch?
After you review, I can put the two patches into the same patchset:)

Best regards
Lingbo Kong

