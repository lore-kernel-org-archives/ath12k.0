Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C88AC369CB
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=; b=XSeM8r0dk11rYC6lgKRkK+zng8
	4efQkWG9Z3FrLksIifEgf6F3nHSZWSWG1hPXIuBeeLhqegHwKPGbHcgmlGIXRij1LUB6N8ONr03Yj
	TlUIYMlywT49u2zTtfKRPf9/V0G7cn6cSdigvpqRY57BehIpTZAwyg66hAhKsiScAC29oTupmvzYC
	92Dg5lUHvF3a1FBjc+VOwztPqSNM0la06oUIsn3nQ4fxFbd/g8vl5LO/9izCNS9obyjryoYxdCJN5
	MCIshj/BAPSw489x0cCD9VNxVP5eA96S3b3Mf70TcBbm97LJNUzOHlzg31LdqR/dcweMYVsS5jlwR
	T1QjEBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7exd-0000000BbBl-1Yft;
	Wed, 23 Apr 2025 18:36:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eTy-0000000BTiT-3frq
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 18:06:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANU9l023265
	for <ath12k@lists.infradead.org>; Wed, 23 Apr 2025 18:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=; b=MzLZkDzF6Gd/ZMYv
	VKlitnGJYzKA7e/Kw4n31LTEjugRCsbvh/w6VHFU4Nu7Wt4xVpKxorocveN/+YKT
	EFyp9sovYvLOrXzNGJ4hpMLIgdS+F1hsbw9ry+IypidI3wDHU8ze3oMVB6p9jPnS
	oIMzx6ohZ6c/wFK6Es6Qqp4wJ7+g5uHwL1Gc6/+43SKLI8B8kJItjcfaBhP471Wd
	nYDuG6gVbGl1Bw0DnCqHuLEQJYOUbQ6sBKpBzJO2GDM4CQGVoOiIXltjgNT0NV90
	XtAJfz/RZnNxhyBkvNtgVElKuURrcAivmd5U/7UvGhiSLcBP1KirhQNQVrrNPHrm
	3WXR9A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh130af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Apr 2025 18:06:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-896c1845cb9so102820a12.1
        for <ath12k@lists.infradead.org>; Wed, 23 Apr 2025 11:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431560; x=1746036360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=;
        b=a3MCsB1C8Lsla+lpE9THw4LCzdvQl28q2etoE85YlYqi2L101xoIfOssvq+dAzgIyI
         2WVVfpi5t1s/UIsa4BmjIUxd3VKy9b3hL3GSbckygXh2GCTrBNI+lQeHRk2CIRioxhkb
         +yuVsfPfe6rfLJjr9eqCm5QxM5liIsm0S0aQa9gRIxIeWTPpM9EdywbNf5P5CcL5fO16
         Pc0mzAcyx2FfAe+S/xj9/znmUhYJH3C7p18ccvcjVOBxTKtSxmexMdkHxZQHjE0HvV8k
         mOm4UV37dTifd56+VaI7AoYFrEeWqhsELYsPwL0vtXBlkz9cXHNXhAlL2ZDyIa2v48+M
         CHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUfp5jwcy2Xg/EzZPNQHQZHZUYuKTttWUvoh1MUu3Hug1pW4z1di5jnTFHKIUk7wk3UqiVF1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd0QiKT1tP6Qd3pocleXZfraUD6nm2keMCXfRXGbvuRxynXXI2
	v0aULwpkFzPWbJma8aOul3ym9Ab/DL4+QDRQQ5VgQOqkp5NyeLtPWglyc3VsSb/8veWP/B6kWH2
	abDGEypQI4wsX5Yt4efdmFD4EZ5G4PNLPOSvimbO1fA7Dd9XJqVFE23sWWg7F
X-Gm-Gg: ASbGnctiq2ntCD1JTKd+6amckPIycESKOBUW2TnYEWhTAekiplpddGFIvOUKCDylFHF
	/IONVPk8+g5qZGy0M7y51N2xIGe01c6F4jvpm0BWQXVv1/goP+2r603XQCWmlS7iGBqGRRvwNek
	LZTGVlfO7A6rCQd2rWYvCtsTlTGymTn3ckDvP0hTJ+B/ZF9hJYrp87WOhRFzls7kjTXyJ2xStSl
	ziOXtxfhbmIrOsYSXkJvH5nace6hUMXfa34TNO2F5S8Qc1nFe5cnAxYfKbO8HKIIPFankFU15XH
	R+wntewxjpHpaiJRXCNf4ynsegMJkXdGrxBJiN/uSE/wjQfzXXYCe6GRnNaUj/yK92U1m7Pux1E
	P1Xjy
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222588637.5.1745431560150;
        Wed, 23 Apr 2025 11:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMrARP/m9bsGTLL17jz8nZcyUaPfX9EbmJw5sWgd+pENLjq2lyoM/AdSZbE+MxuS5BlOOl4w==
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222551637.5.1745431559766;
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a4084sm9362325a12.32.2025.04.23.11.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Message-ID: <99d239c6-e276-4a16-b7db-6e1f8ecc0bf6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:05:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        ath12k@lists.infradead.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <202504220128.2KvxCzaG-lkp@intel.com>
 <47ea4e64-cd87-4c42-a20d-f663f197e44c@oss.qualcomm.com>
 <aAhEc8yrW4vcrE7J@rli9-mobl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aAhEc8yrW4vcrE7J@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X061VwqzKUEcuFBHsTagT5I2QJNdDBRY
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68092c09 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=mHkUAZ6zn0caESaBz8IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: X061VwqzKUEcuFBHsTagT5I2QJNdDBRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyNyBTYWx0ZWRfXzZUNQK9psCft KktbsZC11Je6CGTaAlYyIVRpqUB8NG2PwqUOrIpFv+2vXthJcwr/uunYR+veRQbjlmhBeqbk9Mx CNeS+HmIv8RcmRpWUArkuSqKFjLEEd9SjlUz7o3I3rU0dYPBIURtLdn6y3I5xJ2Gphu0D9SgsJi
 o/xVxGVRR2k0UEKLtyTCsuoV5RUnEj77y5vOQV+lhPH3FsRPMWgcSanS2VzamLfSrVB6rWJKbE8 SBsPQJAMsKHDOehn2J9u6c374LE9QO7++mh5pFSjNAH04CI1YKxFsmwbLXHfpGqM8p6VXuOfyjt 0BONMflIfgCZSG8F+t2rAAx4KAqW1hg6j+j3EyDoNfTf2008hJZBTBzWC3+F9FNIdWWX6SuI4fK
 WXX1WrHsHA+xJDfHi/wdMEsW+mWBj395exUQ9D6iWoLuYIxpUMFGPAffoPOGgwvB8V6Aw2Nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=496 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_110603_055105_5A81C222 
X-CRM114-Status: GOOD (  16.57  )
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

On 4/22/2025 6:37 PM, Philip Li wrote:
> On Mon, Apr 21, 2025 at 11:44:46AM -0700, Jeff Johnson wrote:
>> On 4/21/2025 10:16 AM, kernel test robot wrote:
>>> Hi Karthikeyan,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]
>>
>> lkp@intel.com folks:
>> This patch contains the following footer:
>>
>> base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
>> Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
>>
>> Is there a different mechanism needed to tell the robot about the dependency?
> 
> Sorry for confusion, for now if there's base-commit specified, the bot would
> only consider it as the base and apply the patch. And actually, if there's
> a dependency specified by link, the bot so far can't recognize it well.
> 
> BTW: for this case, does it mean the patch need be applied on this "Depends-on"
> patch, and this "Depends-on" patch is on top of the base-commit?

In this case the Depends-on patch is applied on top of the base patch, and
then the actual patch is applied on top of that.

/jeff

