Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312C3C54791
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scks9tYyUMDTRmnslv2srjZa5cALFnqvoeHDv12bEXg=; b=Sa0m2M6RWknoHCrNhUc0bdAmxT
	XCviXR7qoId1Od8L/Ibl+gmgXvDIvrX4lRyDOXVfF+uZxeMK+JwpY3RWRIWSGEDDeFXqycBtT8gB/
	Ut+uRNcIQRul2JoK9as5Wwi8CvffIPyVbavfFIC5+u4NHo5x1dmJJKF8roWvMggREvqJcrjXba5ep
	IYwA+991jU3uV2gkmqKP4VWi9oV8WwErUUvl7Va5X0WgmcboFYU8I0tCmi0ipomq7He9NJZu/CPQV
	OUuCGIRTymV/xoDjl5svo5xRgiG4i3S41vbOecQoNN5WeWvDqo6LHzFs5N6YD0jpLCBU51TVGzIKR
	CgxgvA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSyC-0000000BCix-3lc0
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 18:04:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSy9-0000000BChP-1p3j
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 18:04:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D9v9oW007297;
	Wed, 13 Mar 2024 18:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=scks9tYyUMDTRmnslv2srjZa5cALFnqvoeHDv12bEXg=; b=iU
	+dh2TTrN1JSsUZv1fik7LWagnOOxrJn7H9MewamhvTLoyQf9SHtIwUiX/YPsppi7
	r/BZOtaHxVQgrJeuOMt4taBOep/on+nmKtvRXzJmZqv7dNWRCfq59m+qeiVkonDD
	4iC+LSvT583fwg5NsgVBWTj+7RrCMUCBNVyGlT236Ey9ZqYT4Tj4uxNmc73Y/S7K
	0LdLH+Qs9a9QuWr5PIAGzOMokoVHzrh6kGlVOKZN9iwRkf1pUdN8GCRF+wG6/2pu
	xTG2YfzZaXxjVdPhfZ5zgzebSonWHQl8qAG2I8deCzM9HDh1dOX0ePdp3oDvsk5O
	zhiQ6x4USAznZi1Bc0nw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu9y3s2ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 18:04:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DI4jp6002860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 18:04:45 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 11:04:44 -0700
Message-ID: <f768cfec-d20d-424d-85ef-3576434aca12@quicinc.com>
Date: Wed, 13 Mar 2024 11:04:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Karthikeyan
 Periyasamy" <quic_periyasa@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-2-quic_ramess@quicinc.com>
 <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
 <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
 <605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
 <87il1qf571.fsf@kernel.org> <87edcef4qi.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87edcef4qi.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ehXgaA8TvWHcA0CCSqY7-kG8qzDYlNJ5
X-Proofpoint-GUID: ehXgaA8TvWHcA0CCSqY7-kG8qzDYlNJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=956 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_110449_528811_3EB65872 
X-CRM114-Status: GOOD (  16.29  )
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

On 3/13/2024 9:58 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>
>>> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
>>>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>>>>> and guess we have to figure out how to suppress the ath12k-check issues with
>>>>> this macro
>>>> ath12k-check complains about the reuse of ah and index arguments which 
>>>> may get evaluated multiple times if its an arithmetic expression, But 
>>>> areas where we use the macro in our code aren't doing so.
>>>> Do you have any suggestions here ? or shall we go back and use this 
>>>> for-loop inline.
>>>
>>> The macro makes sense -- we'll need to update the overrides in ath12k-check.
>>
>> IIRC it is possible to avoid variable reuse in macros with typeof()
>> operator (or something like that). I can't remember the details right
>> now but I think there are examples in the kernel code.
> 
> Here's the GCC documentation with an example:
> 
> https://gcc.gnu.org/onlinedocs/gcc/Typeof.html
> 

the problem here is that the macro actually writes to those arguments multiple
times, so we actually need to reuse the arguments

the macro as defined exactly matches the semantics of other for_each macros in
the kernel, i.e. see in include/linux/list.h:
#define list_for_each(pos, head) \
	for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)

what I don't understand is why list_for_each() doesn't trigger the same
checkpatch issues. even stranger is that if I copy that macro into ath12k then
I do see the same checkpatch issues:
CHECK: Macro argument reuse 'pos' - possible side-effects?
#998: FILE: drivers/net/wireless/ath/ath12k/core.h:998:
+#define list_for_each(pos, head) \
+       for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)

CHECK: Macro argument reuse 'head' - possible side-effects?
#998: FILE: drivers/net/wireless/ath/ath12k/core.h:998:
+#define list_for_each(pos, head) \
+       for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)

So I'm really confused since I don't see anything in checkpatch.pl that would
cause the behavior to change between macros in include/linux/list.h vs macros
in drivers/net/wireless/ath/ath12k/core.h

<scratch head>

/jeff

