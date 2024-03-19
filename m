Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC0BCD11BF
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6d6H0z7a7h7dNchC7i8wBTSeA/+CrBxX3TfFQMbnh8=; b=NnCewup1fJwkSCxriJEVOSenBe
	LwG+c9uVuQhVa31mp1+z26oG3r6IBrVglW6NioXmLy/WFp3Jzie4s6WzDUwL+SxBYapN2twjq2K1P
	Vy5+dao9I5bEm9cN6JGzORczzWA8WerY7rTY3BYhtzk33nT5eO519ZMLqHn2PMgYsBM3w6+Dqj48B
	WFP4DTbfLcQ878vGxvPcUEKYRY00VWClt2ZBKzEljKqtgQZuQWLEwYyUIl5PyXPLs+Dx+W4QvrEuH
	VT/49IJKXTzGXnY3SYl5oO2gIlLJgUBE58vk4fdrAX3I62+Cd+s3JoABc+7iwSl6GFspB8UABGvnq
	CIGMtfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmblD-0000000DEVu-3R5c
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 15:52:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmblA-0000000DETu-10Fc
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 15:52:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J5QB3f031196;
	Tue, 19 Mar 2024 15:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=T6d6H0z7a7h7dNchC7i8wBTSeA/+CrBxX3TfFQMbnh8=; b=Kf
	TWOuOwV5/HsaJGU9oAc7tn/yq1jQdicj37KjYmSRGS2c8ae9yscCqcQOnU5pJmYX
	FBSbB+dNAxd79eW4dlfvnSu7oHwqTgttU6ZZlgvALf4FZntvR+sLAPku3ywKU63b
	zFT+w8GR4SsXR/f/6iG7TUU2mTehvUUx9cYVLHOnYxVj3pvXcfb2VPT/5VN7gcQQ
	J1I0zonqTuJ7hd7dlr4rVGb3Ij88X0cM4XC2bASWensNVdMaLkk7XvqJOPQnWjfn
	JrA9oozU3LLMJ8Zvf4CnSEUiHGr8cti/qvogeyFzqPzgnGBRXVXURfpb/mg80pp9
	bXohrccEXpW6l3/491/Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy1jhsqng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:52:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JFpxhs027331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:51:59 GMT
Received: from [10.50.62.188] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 08:51:56 -0700
Message-ID: <a1f72a31-c4c0-4436-b262-d826f3b4f810@quicinc.com>
Date: Tue, 19 Mar 2024 21:21:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Jonas Gorski <jonas.gorski@gmail.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-2-quic_ramess@quicinc.com>
 <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
 <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
 <605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
 <87il1qf571.fsf@kernel.org> <87edcef4qi.fsf@kernel.org>
 <f768cfec-d20d-424d-85ef-3576434aca12@quicinc.com>
 <CAOiHx=kx03MKKyMcJPxYPZH=E7krZwfsDqq2xnow8qRB7D-aqQ@mail.gmail.com>
 <f542dbeb-debf-4335-9d49-4d12510f8bb4@quicinc.com>
 <87zfuvbd5u.fsf@kernel.org>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <87zfuvbd5u.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SBnRdUBcjF7uquOuBGn5qxYvjTapcdRQ
X-Proofpoint-GUID: SBnRdUBcjF7uquOuBGn5qxYvjTapcdRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_05,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403190121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_085216_330872_3D44E4E6 
X-CRM114-Status: GOOD (  18.69  )
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



On 3/19/2024 12:06 AM, Kalle Valo wrote:
> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
> 
>> On 3/14/2024 1:26 AM, Jonas Gorski wrote:
>>> On Wed, 13 Mar 2024 at 20:18, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>>>>
>>>> On 3/13/2024 9:58 AM, Kalle Valo wrote:
>>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>>>
>>>>>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>>>>>
>>>>>>> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
>>>>>>>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>>>>>>>>> and guess we have to figure out how to suppress the ath12k-check issues with
>>>>>>>>> this macro
>>>>>>>> ath12k-check complains about the reuse of ah and index arguments which
>>>>>>>> may get evaluated multiple times if its an arithmetic expression, But
>>>>>>>> areas where we use the macro in our code aren't doing so.
>>>>>>>> Do you have any suggestions here ? or shall we go back and use this
>>>>>>>> for-loop inline.
>>>>>>>
>>>>>>> The macro makes sense -- we'll need to update the overrides in ath12k-check.
>>>>>>
>>>>>> IIRC it is possible to avoid variable reuse in macros with typeof()
>>>>>> operator (or something like that). I can't remember the details right
>>>>>> now but I think there are examples in the kernel code.
>>>>>
>>>>> Here's the GCC documentation with an example:
>>>>>
>>>>> https://gcc.gnu.org/onlinedocs/gcc/Typeof.html
>>>>>
>> Thanks Kalle for the references, as Jeff mentioned below, we need to
>> reuse the arguments since we write to ar and index arguments on each
>> iteration.
>>
>> Defining local vars using typeof() without limiting their scope (since
>> we are defining a for_each iterator{}) leads other issues like
>> redefinition of variables in functions where we use this macro more
>> than once :(
>>
>> Also even if we somehow manage to convince check-patch, we'll still
>> end up evaluating index and ar arguments in every iteration of loop.
>> This just gives an impression to check-patch that the macro is unsafe
>> (although logically its not).
>> Experts, what is the standard we should follow here. Please suggest.
> 
> Yeah, typeof() won't help here as we can't create a local variable. Or
> at least I can't come up way to do that safely, ideas very welcome.
> 
> I think it's just best to ignore the checkpatch warning for now, unless
> better proposals come up. ath12k-check has functionality to ignore
> specific warnings (see checkpatch_filter array), I can add this warning
> to the array.
> 
Sure, Thanks Kalle, I'll send v5 with Jeff's comments addressed.

