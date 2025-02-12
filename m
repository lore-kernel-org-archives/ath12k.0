Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4900CC02198
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnd0+ycBfQNPMC4oWZS4BXvKfWaH6/W1TyXhpqePNEQ=; b=PXJA8cUK4Jw/FAeVu1Q4/roo0Y
	7qNqn/dFRT1tt4Tu8pprlvFUEOFvB6bZ7htbAkLKAt9eTlQdLk/dix73xB5JR1fq6hwIBxqUw6nut
	TCmvkkn0/t7aZ6yaTXjfJYhRndb/udiOW8kLvvyz8E8ZnhLPIL10baTfl8GdL1KPH7vwFCK3P7JjZ
	yMWPJU+2JzYqqTISIR4LXy2dfy3IqD0Q1mQuFU79zbLA18/EQ2meejCcJIXRHV6cfbZ+Mp//OQjUW
	2+MamwOzMF0nuBBqQi5hSKzIvdF+i0i43xJkfPu3WRe6A9zVEfiaDHpgNWIj/3gT3KTwdtVGuwFEi
	AIGFRvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGKJ-00000008H6E-04HK
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 17:15:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGBA-00000008DQZ-4ATI
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 17:05:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CC0ohJ010392
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 17:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnd0+ycBfQNPMC4oWZS4BXvKfWaH6/W1TyXhpqePNEQ=; b=clbcZAH0NjrgUDpd
	mRkzYwrySfK/E+3reVbcB3wjPAiuo2Z9jsNwG70COQE104N4jbx3wcfOSX2RRWic
	qT/49HcQVdqRCGYgp4+D2ipcQS7YrIzZd7zdkToQElA1hkkbZ33HQz9xkNhhMmd3
	OnHtCBUwd2NLZx9Rx++j8A84vGtbLPi2s+Rbx5vqZ8QsRZQBujWpVkUwBGtF1RTI
	yW0OrZytnbakYq/h9AfHeQW7neUMckugji3eAvEtcVqtIn7Ymvfnk0E6jalH9M8q
	2qsfBvzOUeozzo1H3Hwapq+llkGZW7Ek51ZhSJ9qa7x2AXsK1mssUCMeungcD2he
	B5kV4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5ggun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 17:05:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fa6409c0baso42756a91.1
        for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 09:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379938; x=1739984738;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnd0+ycBfQNPMC4oWZS4BXvKfWaH6/W1TyXhpqePNEQ=;
        b=v7I32mb7uZNv8Kc+DML961d/u8WCwLnSAui/p/taAbgKWmP5B6xRBq3Jxsk07oFUd5
         RjyxfgcFoliHut52J2xTMJeer8DyQkL1eHfaS/KDdOIquOi8+QgtVsmXtlTClbi0n5m9
         qymIYhkC582r7mqMTEh4COq16zeMGmN/VoLSDKxxX8W3YQ2fZBiVZMBxRUMnasVfdjxv
         ApoqqgtONOp16CJrW6p8O4wI6H4JL8RZh7WXQls/Iz/RlGIqLlHsQKCfTJGiE9NBhQeo
         Ro+JkerlojkozcZuLnBDIlU59+n4Wb+rDiA6Ny4am8q9bpSS6CEtLPGYbpkaAdKL7oX8
         DOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUumgrwlQ0yhGPlet5jJ2cZa4z1XBpsCUOtEcYNL9TfQswxcQbwKUAfHCMUHmT64nOmj/3v6AI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwjiDkGvIPd3JJGjWkuKQqZXSkGJEWg3x8Vc7R/yFq8bY5LGi
	rJgWayiL/XXS2fNTJYYEqpReizJtNhl2SfPStPzDJTga4LV4Q/ZKsU2C80nDLvx5wx10jyBOB2B
	NUsv3UD2t1d5whamqb/I33PxqDmEiBC7KOq1dZNUtvjC6Bp+Rdah6yKA5zeKE
X-Gm-Gg: ASbGnctzov0c/Bl31BR0rMyQ5235N6iNbewO+7/knLqleXPjh0JFx8xdEL0XA10YOQ8
	oCNlWGeSUWFgq+AcrqXyMwFq6p/oMf18WZOn+qrcHOElAZoQs5DBdLuNBMgt/kP6G26a/SR9noi
	kLp1I7JE4mCVnx/18qGbGmfRcsAdWdLIL9qygze5hx94LO6NJAaToJpQTrZmpWpvQXBLXkBzMmc
	Zad9c4tLjUJs50tXlC92L4VjRWIOPDGtFMfQZdL/NJMsMXd3FfNoyCcVq/iUvz6Wjej4Rf9HrR9
	rkfKQOp2VCR1UBbDD9ql1v1gqW1rXY7BpXm96B2gn8p5OEH47uRieYaw4Tq4
X-Received: by 2002:a17:90a:c912:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-2fc0b403555mr1491494a91.10.1739379938132;
        Wed, 12 Feb 2025 09:05:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUt2lq1oFlB4bsT3D4UF+HoAa24Rkzxvgc6j4DJgkutmH/tUKFc2bhFS2x5A06AoQXeC1Oig==
X-Received: by 2002:a17:90a:c912:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-2fc0b403555mr1491259a91.10.1739379936213;
        Wed, 12 Feb 2025 09:05:36 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d05cesm1746598a91.18.2025.02.12.09.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 09:05:35 -0800 (PST)
Message-ID: <f7f9d508-e999-4e5c-b02f-976e7cb700f3@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:05:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized variable and remove goto
To: Ping-Ke Shih <pkshih@realtek.com>,
        Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo <quic_kvalo@quicinc.com>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
References: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
 <a7ca4e4b-c432-4f2b-81c6-c7b06cd12de1@oss.qualcomm.com>
 <mmutvwbsr3h33hxr364zr6f3whmyxp73od3fihsbynek2pkvjd@6bqaqfkwkf4m>
 <94ddba7eff9f4261bf8fa547f1ba4d7d@realtek.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <94ddba7eff9f4261bf8fa547f1ba4d7d@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 940-0-b3psE152vscdr-TByCr81ajsJb
X-Proofpoint-GUID: 940-0-b3psE152vscdr-TByCr81ajsJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=975 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_090541_154639_00A75002 
X-CRM114-Status: GOOD (  15.17  )
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

On 2/10/2025 8:09 PM, Ping-Ke Shih wrote:
>>>>
>>>> Addresses-Coverity-ID: 1642337 ("Uninitialized scalar variable")
>>>
>>> Is that an official kernel tag? IMO the proper tag would be
>> So, it isn't "official" as far as I can tell, but it is widely used in
>> other commits, especially by Gustavo Silva.
>>
>> Also:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=778e2478d19574508861bcb
>> 1806d6e34d095587c
>>
>> Coverity-IDs: is another option I have found. I have seen Closes: a few
>> times as well. I'm not really sure what the best option is, honestly.
> 
> In my patch, I used and treated Addresses-Coverity-ID as a unofficial tag,
> so additional empty line is added.
> 
> Days ago I have received Coverity issues sent to mailing list, so I used
> Closes tag at that time. But recently I have not seen that kind of mails. 
> Instead, I visit Coverity web site to check issues and use
> Addresses-Coverity-ID tag, since Coverity link is not visible to everyone.
> That is just my thought. 

The problem I have is that I get Coverity fixes both from the linux and the
linux-next projects:

https://scan.coverity.com/projects/linux?tab=overview
https://scan.coverity.com/projects/linux-next-weekly-scan?tab=overview

The Coverity IDs from these projects are allocated independently, so a
Coverity ID does not uniquely identify an issue.

The URL uniquely identifies an issue, and also utilizes an official tag.

That is my thought.

/jeff

