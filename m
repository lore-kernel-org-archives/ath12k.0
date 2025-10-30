Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB8CCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZz41aEdKXKG9rGqSCE2bhjgFPPDtAOM+JviEVYKqx0=; b=vD8yVS0wMXuNaIW5NZK0wCkWCY
	vZiHdtE247uMs59mrp+oEvs+hv+6YzwSUHyDLFABgCJLTbfe53lVV6/+62dCobnXlu44cUk0wsgD2
	+FpobVYQoMlKXOQyr1mmF8UDKYv+Mup4+66frTEoBun5fXpeO23ppDqrLFiFr7Fwtg6fz8brjxLSE
	vplX0JyOPcFUd+DMBQbLRfb6wnmFI3ta4b2ZGX42K3UCJvfRQ5JgM8svIKC2g9ta1r2u1zB+E7dO2
	IrpVpmSSIG1dGTkIBIDkDFIJbJJqZGgfrYGG96Uw5fnyfImTKee1dpbvFJZKxUmJx07Atw2bEqPDq
	+PN8Xbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVsa-00000004Uex-27f1;
	Thu, 30 Oct 2025 16:52:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVsY-00000004Ueb-0n6G
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 16:52:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UCbF8w2623042
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZz41aEdKXKG9rGqSCE2bhjgFPPDtAOM+JviEVYKqx0=; b=cSe2SeeptTJAo4lV
	7r1J4sQZKIdU1SlzwiaZJcg2iLDPL5tMjeY5YWtRf/VjLDaqT58YCoSCZu2MDAPY
	mRZuKBfAQUtpxWGDiyZYL1YmZi9OsrCMLlreR2wyhZtSOUuSXj8/exV/TIb84BV9
	BbklknSX7MIVDkRAQsFqIvoZsiWY8dMWXKWDDNDUhjOHTPjCLzAVrOj0C/ivwFJh
	ErYtrqN4ZFMWibqz8gK/IoNbix9f3agNblOHjN9eQfcG3R6VSdtupH/bweObrf10
	FpLJvaWb9V8zMhCTb4lwEMNefoGObb1Z8r1EhM/y9Fv4KgG0BaeNTIBpJUA6IIMs
	Zco9bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxj10m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:51:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2951a6cf0d2so1201305ad.0
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761843119; x=1762447919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZz41aEdKXKG9rGqSCE2bhjgFPPDtAOM+JviEVYKqx0=;
        b=hNySi9X/nhg9X8YEQnW9nxP3cY482zmdB7dblISEgYfYl6G15C9/BZf8WVCoZ6Pxd6
         7HHR9iWdM5y4ABY8Wq65eaAqV9h2O9Ve+UC8WMOtVSRV8/AhhiQ9nVWQUllR91rjiLv9
         gafwFj5aMTYfaHZ1Cf4+PD49uP1VFWyhNzwOPUHTW2eE4MIyZqrn0xTU6dbiOg0mMbuv
         zM06zZRR3KQG8aYmlENUiJpnX83kc4pLnkSDxsdl8S3FRNCWROL7DcffGpwkmr6X6zsY
         S0KQw/t4Jl3wdKiH3h2k5o3Xu0QyCfPQLfQY0TiVEcuFJDQtYjuhSkPKod8i15dWBJXZ
         we1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843119; x=1762447919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZz41aEdKXKG9rGqSCE2bhjgFPPDtAOM+JviEVYKqx0=;
        b=OH8ageO40GA7lRmZBag4nQ9v9pkhKobb6+OsUzAlG9Zz4f1AdTDvlV3lNPySnkO8di
         qD9Rs+I7tvU3CAGdyNfyEEBgE/G6iA5/E5yDZ1Wnmbu2/a9I2VVYTPE0G9t0f7REIp30
         tzETN7na3QuHSJJyNLwkNtQYmv4OfDQ04S8+ejJtGrNZ5ukZQLqnkF40K26hJUiBONy5
         aY3Y9TvoLkHeH9tWqfqhmt8J6B6EBeNpoWc29ok1MGwYRsRYc55hA4ezBXRpxNmlekIi
         pUnRCXDYU5JYJMUGRrGaXVOu79GND9nolhhndKOdDEF670dzvpcXnr5Rh+evWB4ckCtT
         8xdg==
X-Forwarded-Encrypted: i=1; AJvYcCUSwTJ3LR4t96w+MFTm0fzt/6IonVmKc0N/Ev4eWsgZ7XZsnisudQ//J3ysjKtrza9YKh0fQsw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxtZbN69X0E1nh7DTi9ZCmdA60oEQdDzRvfWeoy7qy+WMsMSd9
	VRHp6TzzuhftNLVv3BHSal3iGd4MFlIXbOGmz8DioSO4eKjvh+kwvX5rDYE6SryGBbovHwDft1+
	wvIROw2it8+41si57bLABzKlpoXvL8zgcNUm/8kw9Wu1Ul6qYGiFhjc7/Ph7z07LY
X-Gm-Gg: ASbGncveqStiP/OBU0rbdpYeTUVNpUxJVu34adm/Yck6CZ42RvxsiyZ4yZ2dht50OEH
	QOxsm+4JSBjAu4GRTq+6aIWZ9cj+u9NjCcsn63fyHtBgrl5WWMZrbeIi7uJZvXlpLlCoj62abVJ
	JB2kWypzETNhSiYacCXNSiYFsN57fq3LeZSlh9tJLUmk/xwR3pb74b95haCfx/q1oxn1akaOmR6
	F6QUtNGGA7gGGn5OAOazvtbh+mTR9MD0+gP9e7GApXBpb1rj9IZHXQND+FyNgyJvKtsNVACIU5m
	hMHD6L5CSiCp62Ut+x1XQvSdtCZ1fI++rvmnxJJSi0nj6f8QY7TcefqM6eZIfK4lIti8KojE23K
	7h3ivOEtV8jcv4yklzCRtrR07aGtwVJd36fi4YwOT15Dt4bpUvFg=
X-Received: by 2002:a17:903:1ca:b0:276:305b:14a7 with SMTP id d9443c01a7336-2951a4d8340mr5105965ad.33.1761843118790;
        Thu, 30 Oct 2025 09:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR9LgXr8czIv65FYwiMZ5GG7V0UqUQKtKjDM4xNrkLZJSnVNHhApxPf7or4gwmqERQek4oyA==
X-Received: by 2002:a17:903:1ca:b0:276:305b:14a7 with SMTP id d9443c01a7336-2951a4d8340mr5105585ad.33.1761843118126;
        Thu, 30 Oct 2025 09:51:58 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.207.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294f34bd8e6sm31144515ad.105.2025.10.30.09.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 09:51:57 -0700 (PDT)
Message-ID: <8a1d7118-bc51-247a-87bc-d8dd6c669e65@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 22:21:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add support for EHT fixed rate
Content-Language: en-US
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7ltA0ZhMPpb-YGCszpwUg-o9oCo9M7qC
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=690397b0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=CMr6UP9dfYAYc02HN5pMZg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w0vWegmNwKWFXUhCgOMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7ltA0ZhMPpb-YGCszpwUg-o9oCo9M7qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEzOSBTYWx0ZWRfX2l+kS4rW+BpG
 bfF+UXJ6W0HGHDAnk1fTAoVMJOyoAq7jWe4n/3WZArC+SbXBkCekqVyqHIM1cY5kA/v+Hv3kCYS
 InmZ1K4jRaYNGj1iCNuvkEQ9adzdPwBVj28IGxsPCZL5pwJutOzvhUy2QmqUomozRUzHBaSUtHK
 1+foqyOf8zEYIBdvnkAoZ2ejwbWvyphBDc+ZbHL0O/OFGY/QQ3/wasdM+qhLXgZNYsQfYNVQ1Qn
 7X1IUyUshbtg6X0JyRfi1LE89hNiPUqP/qtmXXg0CKs6uZK7XTXCYGWBVbIlIg9KFgi/qFYu1mD
 NY3ka/dOHnrtRdSlXMDiCXIBphtZrUbQlXChfhjkh0Te5TGOLLgLuRud4iXmHvMsVWUSyD74Jdr
 OVUJv0CkW90I5SW/qHTATvdIVk1pCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_095202_361777_9FE37A5F 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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



On 10/24/2025 5:49 AM, Muna Sinada wrote:
> Add support for setting EHT fixed rate for mcs, nss, GI and LTF.
> 
> Before adding EHT fixed rate support, generalize GI and LTF setting
> functions to allow additional modes besides HE to utilize the
> functions.
> 
> ---
> Muna Sinada (6):
>    wifi: ath12k: generalize GI and LTF fixed rate functions
>    wifi: ath12k: add EHT rate handling to existing set rate functions
>    wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
>    wifi: ath12k: Add EHT fixed GI/LTF
>    wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
>    wifi: ath12k: Set EHT fixed rates for associated STAs
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 579 +++++++++++++++++++++-----
>   drivers/net/wireless/ath/ath12k/mac.h |  14 +-
>   drivers/net/wireless/ath/ath12k/wmi.h |  13 +-
>   3 files changed, 504 insertions(+), 102 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

