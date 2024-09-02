Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B58CA0ED3
	for <ath12k@archiver.kernel.org>; Mon,  2 Sep 2024 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t2D83CQaFKJivRGar1z49qtl/HhoAFw6u3EDVryhS0=; b=1qrxcgvYeFutqnkvtpaVCRvJI7
	scW47s4Kg8RSbZSOGLsD+h2fxlafRCbikMy7x8lhe/VRntfNM10I3ocG67Uwug16nlioRTB4jBDU/
	aq3hBzU0NfahajJnpC+HIAmsBYa4RXK1tswwVBFReWkP8LiqOUCI+eixVOCDIVKMooPGJcR4daRz2
	gKLvXN0Mwg/chtjj/w2ppGvsjQmWFqwlY8LOXIXkkzojFR6oeW9DjR29/Kf/MrCk7fI449iDQfTl7
	dBB6LWY2skWFhDiahr/di3P69zndVcGBxgZOEw0u+zkfhhbwmy8W0Hkfvz0A4C0XcG0W/krIrEH7E
	lkbEFK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0RZ-0000000D8X5-2nzL
	for ath12k@archiver.kernel.org;
	Mon, 02 Sep 2024 06:21:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0Qu-0000000D8SG-2gJx
	for ath12k@lists.infradead.org;
	Mon, 02 Sep 2024 06:21:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481N55Wc010842;
	Mon, 2 Sep 2024 06:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9t2D83CQaFKJivRGar1z49qtl/HhoAFw6u3EDVryhS0=; b=WYNGd9J2Xvoe1viz
	LR/TBqVmXp36MO8YwmoVK1qjHt1AFwRT1xxPu2sso0vWFj2nZ3E7jlNInYRmA7+M
	CsrztgUJOQbm7Oe9iY/1V3/raTRgewkMn08IN4ACzRK22j1InffbiA4Bu6AYdvny
	UIGgzZY8FwRhlRtyCP2NjZc89jKrjnbJQ1O/43XX89jgRYo/7qt6YkWopLw2EFjy
	UB36rzUn4LaqmDuuyYWEKgY0UZi97CdwWceRzTj3islWqylc94KeimKC4m77N3eI
	d91V769+s2k6REdtCOu6ROD6OEiL2QTnzvlcug528E2n5xJyBRChqj+Ok4B3VInh
	VbiB+g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bud2kn77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 06:20:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4826KtRU031302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 06:20:55 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Sep 2024
 23:20:54 -0700
Message-ID: <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com>
Date: Mon, 2 Sep 2024 14:20:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
 <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
 <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vzBvEF5I9DTXvcwMCgL04FP-nZDW2NOI
X-Proofpoint-ORIG-GUID: vzBvEF5I9DTXvcwMCgL04FP-nZDW2NOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_232100_791345_45A045B2 
X-CRM114-Status: GOOD (  11.95  )
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



On 9/2/2024 2:03 PM, david Atkins wrote:
>> On 9/1/2024 3:39 PM, david Atkins wrote:
>>>> On 8/30/2024 1:55 PM, david Atkins wrote:
>>>>> Any updates on this? We still cannot register a Hamilton card with
>>>>> ath12k driver with a 4x4 AP
>>>>
>>>> The 'Basic EHT-MCS And Nss Set' indicate the minimal requirement, not
>>>> the max, see spec:
>>>>
>>>> 35.15 EHT BSS operation
>>>> 35.15.1 Basic EHT BSS operation
>>>>
>>>> An EHT STA has dot11EHTOptionImplemented equal to true.
>>>> The basic EHT-MCS and NSS set is the set of <EHT-MCS, NSS> tuples
>>>> that are supported by all EHT STAs that are members of an EHT BSS. ...
>>>>
>>>> An EHT STA shall not attempt to join (MLME-JOIN.request primitive) a
>>>> BSS unless it supports (i.e., is able to both transmit and receive
>>>> using) all of the <EHT-MCS, NSS> tuples in the basic EHT-MCS and NSS set.
>>>
>>> I'm unsure what's missing here, this is the beacon data relating to
>>> EHT MCS/NSS
>>>
>>>             Supported EHT-MCS and NSS Set
>>>                 EHT-MCS Map (BW <= 80MHz): 0x444444
>>>                     .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9:
>> 4
>>>                     .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
>>>                     .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-
>> 11: 4
>>>                     .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-
>> 11: 4
>>>                     .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-
>> 13: 4
>>>                     0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-
>> 13: 4
>>>         Ext Tag: EHT Operation (802.11be D3.0)
>>>             Ext Tag length: 8 (Tag len: 9)
>>>             Ext Tag Number: EHT Operation (802.11be D3.0) (106)
>>>             EHT Operation Parameters: 0x01, EHT Operation Information Present
>>>                 .... ...1 = EHT Operation Information Present: True
>>>                 .... ..0. = Disabled Subchannel Bitmap Present: False
>>>                 .... .0.. = EHT Default PE Duration: False
>>>                 .... 0... = Group Addressed BU Indication Limit: False
>>>                 ..00 .... = Group Addressed BU Indication Exponent: 0
>>>                 00.. .... = Reserved: 0x0
>>>             Basic EHT-MCS And Nss Set: 0x44444444
>>>             Control: 0x02, Channel Width: 80 MHz EHT BSS bandwidth
>>>                 .... .010 = Channel Width: 80 MHz EHT BSS bandwidth (2)
>>>                 0000 0... = Reserved: 0x00
>>>
>>> Are you saying the ath12k driver does not support these features? If not can
>> you clarify the issue so I can raise with the AP team.
>>>
>> ath12k/WCN7850 supports EHT, but with NSS only 2. Here the AP requires NSS
>> to be no less than 4, that is why EHT connection was disabled.
> 
> Which field is requiring NSS of 4, I'm only seeing a maximum of 4, the Qualcomm windows driver will connect to the same AP, we had assumed that that ath12k would do the same.
Basic EHT-MCS And Nss Set: 0x44444444

> 
> 
> 
> 

