Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D234C25B75
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkON2huWfqzkVhlpPnFi+GiqvsCmwPiSKh8/TA2iakc=; b=tmWr43wUJNk9aEDl4je+A2rnSR
	B3D17eZTiymrxJPYZ6j68R9Sn7pitbxi/qjthDc7Tvb3BEXsN5yZBC/JliNO5hd4QorNsYCG8SFD7
	I4ZH4Hs+u9zZ+fzF3lOWUI8w4QJNAyi22r+oEmDENbagRYhlP38/fMnPauQHPjBKxHFWa4XD1vzKu
	uN3psP1usokzi7M7B+oNVk4eoPzcY4QiF2Q4xqyzsQ88FGVCCzcPP3ytMXBiUYfMt05cBMtPn6dTu
	EO8oIh4Hw4no5kBbEEf0DIGK69W7TBsxz6k7yFDMeUOcWJYf50EUpPP2QzhZFMFg7D7tq6C8bCJ0O
	hQk3anfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9ny-00000009HrC-3Vbg
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 09:53:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9nu-00000009Hp9-3T6X
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 09:53:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4568mvqV032234;
	Thu, 6 Jun 2024 09:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkON2huWfqzkVhlpPnFi+GiqvsCmwPiSKh8/TA2iakc=; b=SvKCUrtjpgAAym9/
	V5mOxDFTyCpHN3TQ822zYUXIfD9UwZsG71ap/CnI+ZBzIFFZ25fUqJkYXcC7/w6+
	1EEHMXs0UHOcmE/0305N68bz3hc8DSYpSm5rK7S1sizdQ0U+LM8jPElubLarBQW2
	Z5NFGzhVbRCsNMcTIuLGGoiR8wE4ygGGxprzlamM1QBhtbMhZ1BKTCSPfRiuqCOG
	oJ7NqPseK78AoT0VQjhgOI8Kk1kx+yoH+y7sPA3hPHTQK2WPgDwp+5pFA2dgdr2R
	vCOb7SnhnSzxSrshoGIvn63DyviuT+fto41qKAQfCP7oA5he/2Lf8irraTBNaFM6
	SZoenA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk89baf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 09:53:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4569r1k4003248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 09:53:01 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 02:52:58 -0700
Message-ID: <4369fb49-bab7-7ed7-f841-4be537a26f20@quicinc.com>
Date: Thu, 6 Jun 2024 15:22:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC v2 3/7] wifi: cfg80211: extend interface combination check
 for multi-radio
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_adisi@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
 <8fc2f117346fcb4ed11bb20cdf9cb1f88bcf64b4.1717611760.git-series.nbd@nbd.name>
 <8add7134-9929-0288-0770-7778013cc37c@quicinc.com>
 <23a6d1eb-3ce9-400c-aa3d-a7d29c953079@nbd.name>
 <555d6af3-5b47-6d8a-9222-d3949c156cc4@quicinc.com>
 <21208cf1-eaa7-4077-873d-5863019111e7@nbd.name>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <21208cf1-eaa7-4077-873d-5863019111e7@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3DqVcrr3Y454lFWMbraB9MCQlO1j95be
X-Proofpoint-ORIG-GUID: 3DqVcrr3Y454lFWMbraB9MCQlO1j95be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406060072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_025307_010813_AA62DC0E 
X-CRM114-Status: GOOD (  10.02  )
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



On 6/6/2024 2:28 PM, Felix Fietkau wrote:
> On 06.06.24 10:56, Karthikeyan Periyasamy wrote:
>>
>>
>> On 6/6/2024 1:25 PM, Felix Fietkau wrote:
>>> On 06.06.24 09:20, Karthikeyan Periyasamy wrote:
>>>>
>>>>
>>>> On 6/6/2024 12:01 AM, Felix Fietkau wrote:
>>>>>       /*
>>>>>        * This is a bit strange, since the iteration used to rely 
>>>>> only on
>>>>> @@ -2384,8 +2383,10 @@ int cfg80211_iter_combinations(struct wiphy 
>>>>> *wiphy,
>>>>>        * cfg80211 already - the only thing not would appear to be 
>>>>> any new
>>>>>        * interfaces (while being brought up) and channel/radar data.
>>>>>        */
>>>>> -    cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
>>>>> -                   &beacon_int_gcd, &beacon_int_different);
>>>>> +    if (!radio)
>>>>> +            cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
>>>>> +                           &beacon_int_gcd,
>>>>> +                           &beacon_int_different);
>>>>
>>>> Why its avoid for radio specific iface combination ?
>>>
>>> Because it iterates over all wdevs within cfg80211. I didn't think 
>>> this was necessary, given that it already excludes MLO wdevs.
>>>
>>
>> Dont tie the radio specific iface advertisement with MLO.
>>
>> Usually the existing code consider "params->new_beacon_int" the MLO
>> scenario also.
> 
> For your hardware, do beacon intervals need to be matched/aligned per 
> radio or globally?
> 

Our hardware supports radio aligned beacon interval.

Currently, ath12k use use same beacon interval configuration all radio 
iface combination.

Even in radio specific iface combination, we should check the beacon 
interval for the non MLO VAPs.

so dont avoid the beacon interval check.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

