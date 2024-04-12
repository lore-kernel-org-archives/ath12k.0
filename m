Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D0C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V28+JOadOYjwfGsVqtPSP0u596xNzPVUwVpRdbH3x3g=; b=xzhkv95m/uMUeQ/8whFkXoutkc
	KEnw5uU/a62SeTpNg6C3PkUeMO7UmInIrwwnGGfLlJB5vIWxyNFev4TQH/6wIDax6utkWY40CwR4D
	62rCs2thB4ljH2FNmf3xBKL2C3y82bJ4C9Vn/QFFu2hEG/RlwUXpdtltAw9uQFbBy6bYN+bW9kn2l
	rAIypNtd+YjXHFXjyofHEHmL+9M4sjXRQ5sJqtX/p28Lty7X8jX23OwpiUF2zfH3Inup59ML8pSaN
	dBis2W+OHcfhmDvYT614fPpb9kFUSr2ZBtcLZJ08ZGVzD0d3EtEHihLMHEx1M79sspsi/UmiJisle
	hf1PgFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9JE-0000000FNF8-39a6
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 05:18:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gd-0000000FAP7-1kyR
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 04:12:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C3HWp7018755;
	Fri, 12 Apr 2024 04:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=V28+JOadOYjwfGsVqtPSP0u596xNzPVUwVpRdbH3x3g=; b=fl
	tbi8H8NofVUc33v5DKW1dSx+EKz4tzr2UNt6qrpt779C/pKMsSONwj3yrtjw99xW
	LCgXYbfY+7Qftv11wnJWtQjCOnwpmkWVBGdThu8jnT2WegVuupC082wLNh7cGGqj
	+lrLWayp+eohqyzkoWjd93PTu3morXWlStqk3S8EN6lnMDjws8CoN4f7RgIrpgEM
	4MxpaRZ1yqaKYS/rIPq7aXWsCyEtH6jrEsFIuOF2PU8r6PfmMjgUPU/mFixkAICr
	R/w83tR3W7A7Kt24NjzrW149zPT0GclXkFhmnAZpEZXLqdjsDiiQu1yKtlVXQ6zG
	XphzohosiHI4JcP+MeAw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xep6fgrb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 04:11:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C4Bs6o024156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 04:11:54 GMT
Received: from [10.216.26.110] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 21:11:51 -0700
Message-ID: <cb991a00-fce2-5a3d-c03f-579b44f922f5@quicinc.com>
Date: Fri, 12 Apr 2024 09:41:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-US
To: Ben Greear <greearb@candelatech.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
 <72f491f8-dd3a-0c9e-7490-4d51c86f2102@candelatech.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <72f491f8-dd3a-0c9e-7490-4d51c86f2102@candelatech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y0A4HPy7R4UUzPI68klmUXQhwRXh8DEo
X-Proofpoint-ORIG-GUID: y0A4HPy7R4UUzPI68klmUXQhwRXh8DEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_14,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404120028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211159_811446_F46F0439 
X-CRM114-Status: GOOD (  23.21  )
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



On 4/11/2024 2:33 AM, Ben Greear wrote:
> On 4/10/24 08:42, Johannes Berg wrote:
>> On Wed, 2024-04-10 at 07:37 -0700, Ben Greear wrote:
>>> On 4/10/24 00:56, Johannes Berg wrote:
>>>> On Fri, 2024-03-29 at 07:47 -0700, Ben Greear wrote:
>>>>> On 3/29/24 07:30, Johannes Berg wrote:
>>>>>> On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
>>>>>>>>
>>>>>>>>> + * @hw_chans: list of the channels supported by every constituent underlying
>>>>>>>>> + *    hardware. Drivers abstracting multiple discrete hardware (radio) under
>>>>>>>>> + *    one wiphy can advertise the list of channels supported by each physical
>>>>>>>>> + *    hardware in this list. Underlying hardware specific channel list can be
>>>>>>>>> + *    used while describing interface combination for each of them.
>>>>>>>>
>>>>>>>> I'd expect there to be a limit on channels being within a single band on
>>>>>>>> a single "hardware"?
>>>>>>>>
>>>>>>>
>>>>>>> There are ath12k hardware supporting multiple band which need to be
>>>>>>> registered under one mac80211_hw/wiphy. This design is to support such
>>>>>>> hardware.
>>>>>>
>>>>>> Oh OK, that was something that I didn't have in mind any more, or never
>>>>>> knew or paid attention to.
>>>>>
>>>>> Would it work to leave the phy reporting pretty much as it is now, but add
>>>>> a 'associated_peer_radios' list section, so that each phy could report the phys
>>>>> associated with it?  Then user-space, driver, mac80211 etc could look up the
>>>>> other phys as needed to get a full picture?
>>>>>
>>>>
>>>> There's not really a good way to _do_ that short of creating multiple
>>>> wiphys, but that causes _massive_ complexity in the stack (both cfg80211
>>>> and mac80211) so we rejected it years ago.
>>>
>>> I thought the problem ath12k is trying to fix is that there are currently multiple phys 
>>> (radios) that needed to be made to
>>> look like a single phy?
>>
>> Correct.
>>
>>> For dual and tri-concurrent radios, I think we will need them to look like 3 individual 
>>> radios for non-MLO use
>>> cases
>>
>> No, I don't see why, and if you want that we wouldn't support it anyway,
>> you'd have to have a module option or something to decide which way to
>> go.
>>
>> But it really ought to not be needed - the point of these patches is to
>> give userspace enough information to know how to (and where) to create
>> separate BSSes, with or without MLO between them.
>>
>>> For instance, mt7996 currently reports 3 single-band wiphys, and each can be used 
>>> independently.
>>> But assuming it starts supporting MLO, then those 3 single band wiphys will need to 
>>> start acting
>>> at least somewhat like a single entity
>>
>> Yes.
>>
>>> (while also concurrently being able to act as individual
>>> wiphys so that one can do a mix of MLO and non MLO sta/AP.)
>>
>> No.
> 
> Hello Johannes,
> 
> Is there any design document for the combined phy approach somewhere publicly available?
> 
> It is hard to understand the over all goals by just reading patches as they show up on
> the public mailing lists...
> 

Hi Ben,

I dont think there is a document for this composite phy approach. But we try to clarify
as much as possible in the commit log and kernel-doc. Pls let us know the area which
is more appropriate to be clarified in the path.

Vasanth

