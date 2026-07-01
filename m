Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E415AC43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=; b=jt0/S/2C/3QsFTaMIyDwOvJMOA
	ZaWDnkvP9rl7263KqHQYU8fHWqvxbqeTT1xaWC+6OVjOVRnUfI5shI8cfLP+INc+SQj8sm9M5ABjx
	NRscOQP4+78aZ30eShln96vGECCAGVFcoskb03wDxZh6nUpp1+bzxWksoBdWvnNnPOgX67c7kWruS
	W+ObsMFyUj2b2IrilULQyKWy+tYJOMYm8YmqsLoKVVrbsEdd/oaNcNx3AKcfqzWI5p0dM4DV2Fjxc
	I7BWx1yEUF3L/JMMyYxfU6aSuH1uApbGNQb33IqHR2NSTKWU8J5/PW4nuDJ6nD+YjRegqB12NHFBF
	9Nn0XRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyQh-00000002fkL-2pjn;
	Wed, 01 Jul 2026 17:08:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyQe-00000002fjg-2Swp
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 17:08:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmbc71691928
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 17:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=; b=ZeyOKYmqz2ir6nJK
	qKPD7WUPFIKl0j3SrJ4phD3celcOrernGQcnZzlfBOJ5oCWQ0neO2BC8jbCbZ3V5
	//cL0gzclLOwWxT34+OXsR53jpEfgCd0OIfzxdcWQQmBr7nHIhN7+3upIlDa7tN4
	h9ANvjLfKfwebJ7E//0X5JIe1ENm6Fo1PiOAUmWn9Rj3dPDgTl+mhachxeEFlB9D
	C/mbemb4bUXEEV6XGljcK7Cg7dd+4s0DZJj/XLNAmAvJgZxY7j2JkqpTm+zDoq6P
	vKw18bbKByZE5IWswsPGkFXjNudwg+DWnBIvQQykPxoUuT7QawaoqsieLTcaSmx6
	8h9l3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tjqad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 17:08:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso14604775ad.0
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782925730; x=1783530530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=;
        b=ZIyutC37UC6qX5udyrq6sF//UOvxrklWOY3UcGuKZuU1EPwUeg26vr00jW9uGtmKQP
         abKYzSWhr0yjDE+AxNU/reoZHqJQKenXoDATQr/UeM+++cNoEmO3bK1SmHPgeeRyXHf8
         KOEHDQEZD1h3lf+8o6f4rziIQye1a8LK/s8CXFwK7Sv987SB/f9s99gCTKYmdwYNxRBG
         eqLrLbtL1CVZte5idXMrgNwP1Na2yGXf67lkQRSmuZqtPwSnZTCihOgPsFA1VyXR825X
         7MTw0fMBp1I/FmMREIzrz1HQXT9gW8hGroowUpK3qVLqBMNediRR8JmkYFpnjCwJXXpO
         tTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925730; x=1783530530;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS5vtTLQxJ4op5FEDuxp3nMiGG9OS6mVarK5ICm9UAU=;
        b=hAfvPo6HWalwORvPHZGpRzmxqDTiLGRO5WtnGnybfl7z0XucJEoHcZBS+B2fmB/pGr
         AOKdZcq8qP6Iz9Ng+PHnicMaVEPL7GaQf+yfoRsLscxGqZ0Y3jjTFuyxwMXQCCH/Yrcl
         8/x28Gl6MfKoQZLS2tz/8xonxsoBQcbk5LF3KJ2EhjxwSYctKYUrcf9tL6fLNA9x9pY+
         b0Q213s9/i/9SzpF0cqcqodbxOMH1lE9J+2npAsX/WCdLKwk0aeSvs1kbp+UDwjz3/RH
         tP35GGOYOrCzJfwHA2OXeYCm0vcMpwHGD0fSbMpZT4GxJ1KFp1Fe5NE8xc7XLV6sIg9I
         TD4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqm/KVvHAXWn55phpxeAGmuDNH35xqmlye669ZV3IVk7vW0HfL+TVN4NNtf5vOKSSUNrRJHAxQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWqNhC9PG6QVOSxh0GDYwSWXLsVvKqjO3mx/rZ/SIwi1FHjCdC
	gIvff5ESoaj3puFOiEOWNlIld7oWAev9NWZ4fv+wEmGN+BRCdrII0NsgeR4BU1v5gXswJ/Gs5Km
	ULw1KGVSuggTbOGGP9bCeF6u9PXw640zjQvDpIy3sZGBLqIGiIiyX7/AlEzHXKJn2
X-Gm-Gg: AfdE7clEG1s+8I+NhqgZLBubAjIyTjAZc/T6lrwtI5v7c2w94q/YSZ4C5I7NDqh8Dhq
	bjGxUkd+v9eZKts2gYFl3q5IHgrb7X3fpBlJw+vKniJ19YILob3gFiqJCyTLDSQryAvWZm6DUm2
	20ZwO8dEk+OkGc6V27bpg3MIV5lVmdDXwERLCX7/3rxxiSFIQvvL3K8w8VAz5cnAduZwo3oqP0B
	2/rX0rIDTdclXs45te+uhl9+m/tQzZ8NDRt8ediJVB0heLxXdhpz6HSCbLM0bth2oAuT1G4YOAI
	8n5Knn4x1zOo4nELhxCco3NLGo5AkvBI7sGWx/rjUNn2nGwrIWtNHaWgKC33SejPMNh0hQdbw0p
	IdHeTnD3RU1Ait3+P6dtm9XbR/4WZMUhp2rP8Nveedy+FAA3VGOaIacsRJbW3PtdTAT9jXxU=
X-Received: by 2002:a17:903:b0c:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2ca4487f865mr59166415ad.3.1782925729724;
        Wed, 01 Jul 2026 10:08:49 -0700 (PDT)
X-Received: by 2002:a17:903:b0c:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2ca4487f865mr59166005ad.3.1782925729203;
        Wed, 01 Jul 2026 10:08:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm27631455c88.0.2026.07.01.10.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 10:08:48 -0700 (PDT)
Message-ID: <a412f206-e856-47f8-af74-8eb268ed50d0@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:08:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: BigEndian platform support?
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <68290980-5bfb-c88c-be78-954f9591c135@westermo.com>
 <87cz0y96j1.fsf@kernel.org> <akIuPiYGXDbDWLGZ@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akIuPiYGXDbDWLGZ@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FU-EDHXD1zlgPUmyIGSgCN_4rcEhU-1y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE4MiBTYWx0ZWRfX+5RVFEYXd1EK
 WWKwbeQ7S8SYeBPtfMTl2UheqNbR5raGfiVju5raiDiy7hk7+Ilk+cY1ILBjVMArD34LLEkGjcl
 HqxX9T4aZ2YF7yZrTXs7Xa4q40a9tZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE4MiBTYWx0ZWRfX+bD8CXAJHXYq
 qPkCsiMlBrz+hSvxPTFA8yNQCxO6e08nO3EMUCCOeA9CBe5rciObGneSrhJ0ve6TWd9QikkGTgw
 TXinudVjHnI60Juaz7Zlk2iulGVqSpBwfXTLFbheF766a6QScegCUIJsVANO6MW2kNPZATA98RS
 FHEIK6aTM0iKyjHoUJVrcaFYwryS0D5+bq3hn2k2eKrssVv3ppGXGZUR2KfM6kccvsnfb43N0Zd
 VqNp3Hd6JfP1zgyahk1mt/Q+kGTSvffQ30DmYjmzMOYUMkupXBHARp5qU0To/FMsnI/p0LugYy+
 pqKGGucezIWGOzq3veVt5SiJ73yLjBdafn2psNgkNNA+c1zkFvGE94lIgVZht7YfDDyVRjLNhhx
 UcTJjEFbAE5ucC+BXHufWMJyN5IQAhfhBof084Vc+IEtrIONffyiuav+F43wHjut8F/Oq3vH96l
 lBg8CD4yAYCAEkd3ysQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4549a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N9GNhs4bAAAA:8 a=ZRmf-2ApCqndCitTYBsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: FU-EDHXD1zlgPUmyIGSgCN_4rcEhU-1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_100852_746700_1AC4FF58 
X-CRM114-Status: GOOD (  25.10  )
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

On 6/29/2026 1:35 AM, Alexander Wilhelm wrote:
> On Tue, Jul 11, 2023 at 11:49:54AM +0300, Kalle Valo wrote:
>> Alexander Wilhelm <alexander.wilhelm@westermo.com> writes:
>>
>>> I am trying to get the QCN9074 module to work on a BigEndian PowerPC
>>> platform. My question would be, has anyone done it yet? If not, what
>>> kind of effort would you estimate for porting or are there any
>>> firmware limitations?
>>
>> This is a good question. The short answer is that it _might_ work with
>> QCN9074 but AFAIK nobody has tested it and I'm not really optimistic.
>>
>> The long answer is that the big endian support in ath11k is implemented
>> in a weird way which I regret big time. The idea is that the firmware
>> does the translation instead of ath11k driver with this flag:
>>
>> /* Host software's Copy Engine configuration. */
>> #ifdef __BIG_ENDIAN
>> #define CE_ATTR_FLAGS CE_ATTR_BYTE_SWAP_DATA
>> #else
>> #define CE_ATTR_FLAGS 0
>> #endif
>>
>> But later I was told that not all firmware branches actually support
>> this feature, sigh. To my knowledge QCA6390 and WCN6855 firmwares do not
>> support this CE_ATTR_BYTE_SWAP_DATA but I'm hoping QCN9074 firmware
>> would support it. Grep for BIG_ENDIAN to see more big endian specific
>> changes.
>>
>> In ath12k the endian support was implemented in a proper way using
>> __le32 type family and cpu_to_le32() & co macros, but it's also
>> untested. It's on my todo list to convert ath11k to do the same but no
>> idea when I'm able to work on it. Patches very welcome.
>>
>> Do let me know if you test ath11k on big endian, I'm very curious to
>> know the results.
> 
> Hello Jeff and the `ath` developers,
> 
> there are still a number of pending patch requests from my side for `ath12k`
> addressing various big endian issues. I assume there may still be gaps that I
> did not uncover during my testing. Nevertheless, `ath12k` is now running stable
> for me in both AP and STA modes, so I have started to look into `ath11k`.

Let me start by addressing ath12k. I have been sitting on your patches because
internally there has been a lot of discussion on this topic. Just this week I
convinced Those That Need Convincing (tm) that your changes are consistent
with the approach that was taken with the rest of ath12k to have the host
driver responsible for all byte swapping. So I'll finally be taking those patches.

HOWEVER, Qualcomm is trying to transition all of our products to be based upon
the upstream driver, and the team responsible for enterprise access points
believes that their KPIs on Big Endian platforms cannot be met with software
byte swapping (my understanding is they currently use hardware swapping in
their out-of-tree driver). So it is possible that ath12k will need to
transition to hardware swapping in the future to meet that need.

I just wanted to share that bit.

Your proposal for ath11k still needs to be discussed, but there is obviously
concern about introducing regressions to code. There will also be impacts on
projects like QSDK and OpenWrt, which are based upon applying patches to the
existing driver, if large portions of ath11k are rewritten.

/jeff

