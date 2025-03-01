Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514DC021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFT5nBEi6P5rbXSNr2RavioxPFqsPJh7CqDvB8mlzxU=; b=ePfee1kX23Q43BcIeTODd4QYma
	jaCtauYqlcMks3CwBk30wW2jk/oROSk9P7ofXtZJuQ5jiMLCWdXMlvoXT9By8E5/Y8FDgZjhRV88+
	BeG8lm6mQfTtaLT634m7HFteC+1qiR6cVXZye3x7NJrsNhrvHjGJ+2ljhJDtu/lPYEnU6GvIrqXVb
	Z4qMMCe0AB/qHSuDWzvYUYTe/hwqoff1C5WG8zkoF0umAfF98pdUJyUWiXwNsDStKGPvOsVZSP6Qo
	Ye2fOlNZgojUc33l3VYM3K83+eBnY5/5AXTVwuDWF2QRNuzcqCUIpkD1Jy1dPN40yb/r/MPorYQrs
	Fwr/DXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toF4k-0000000DPsY-04k3
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:07:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toF4h-0000000DPsD-1hHI
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:07:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213MErI026213
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFT5nBEi6P5rbXSNr2RavioxPFqsPJh7CqDvB8mlzxU=; b=YCIX9lfbSv04SAfb
	W4OCrdCDPGxlgaopmblrjkkcW3Rim59LQIWaRLKQXrDAqX/HxA7MzO7ha7g6mKNz
	+/1JB6T8KAhy9Tz87zt5uXw5MLyO7Ylof3fD1kcF/karBLhejrYPhmSboseAQ9Z3
	WVAGSFJBLhtLSegGyyErwFuv9G2K9gYs9SC3G0rObPfbCiI4Gt7dViHqF+O/Gqk5
	vupN1L4hB+whCKqSFfGs513qvVi0thCt84FiIH7BgdLbSq5rkQ9x5VPPUBr/b7n0
	l+kJZ/C89kjEa3N0TO+yjxf2n/BqI2gAxs4CO0Idc3lIP1SLXGQ3frdEEz2/HD31
	C+ln0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95r53q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:07:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fede63f32dso501507a91.1
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740805658; x=1741410458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFT5nBEi6P5rbXSNr2RavioxPFqsPJh7CqDvB8mlzxU=;
        b=ZYAfPqw7/hmoa+0hEDpRf8FhxW8xRLaadL6EmQpADBghRACO38u2ENCcW/yhrBXxv0
         CDqBxc6l+8fpvobFKQIIWusp6snp8VtNplxVslHsA6EJUEBvj4d/XdL/Meq9i1emZRx2
         fPz0qJqTxglmUOd863IbnCUWbsbtabACIe6K9SHZvpLHVEFmrEbXCaRu5u72SP45jDh3
         obL2iUb4m377lpybfYuKguTLcP1ASkAv34kEZAjISFVb2s3LufiuSABUE5Ws4RlE5uul
         IYFaFLMdNVywWpiSmpDUTwHs2h7HE9aSC7QXx+Xfnza/foYB21rbjwICkpuPsyqIfWv8
         WoRg==
X-Forwarded-Encrypted: i=1; AJvYcCVupJs/wXbSoA/poa4XkBA6/IoyXI43u9gTyPJXLe5rZ1bNzefHuN0gghfgXJ/jHy7VCxh6+WU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYneFBGb6O6rFqOm0SuXRmtoa0yPlRcKdDRfWE7LQAcKwhGkHr
	oZZGCyCZKMYEHOKwgB64JKYC93i93xtf/q0KcnPvmXOqOvc4HlYWO88UGJTCQRPJd1lubnol47q
	jq2j7we0kwaXZnYIpfzG0aH3loMOSl55BTmrsYdqRldQbeZCZ2o2wNCCfF1h4u+H8cG06
X-Gm-Gg: ASbGncuO0KvGTzUXxfkK1D3RYg1r1sUk3jUEhxZwBh5ZbPFBzkt04AJzSjX8clWppza
	dU7GpgTej9giaaae9kl/2+bKS8kXxWMGzaH2VA1pZQEh6LFL9u1IfxhYDDXgNpw5f/oPi6bHzxV
	59kDEv4rPzN+H7twpFvKI84KqJ4zOMka7AwYMySSVfBCrFXoyN5x3/Jh19geJXeAOEd02rZpymt
	IxcAj7Bdv0w0omOfdkTgv62SSxXPLcIdMLA/vLXREGKISjRna34DIIpSPtIh6ojatwvvNdsPUly
	Vzmetc10+gluqXNbr8dM0oQngipi6EFyAzXIEFkU8an3NafeJyU5NuomlxFfIyU=
X-Received: by 2002:a17:90b:1e03:b0:2ee:cddd:2454 with SMTP id 98e67ed59e1d1-2febab75c47mr10665682a91.15.1740805658231;
        Fri, 28 Feb 2025 21:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9UVdU0oV+qEOL0CvwM8/vOiZK617gSZTNyxyzB4mbr004phFYfIO5DKdKHeY4FWpLxnLXZg==
X-Received: by 2002:a17:90b:1e03:b0:2ee:cddd:2454 with SMTP id 98e67ed59e1d1-2febab75c47mr10665651a91.15.1740805657873;
        Fri, 28 Feb 2025 21:07:37 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2b85sm6819271a91.26.2025.02.28.21.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:07:37 -0800 (PST)
Message-ID: <366c02d9-2b31-17e9-609f-e397f675672e@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:37:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] wifi: ath12k: fix incorrect CE addresses
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-3-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-3-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: opJW_tJMZACmcUpTWzFVTMnJyhI7syzI
X-Proofpoint-GUID: opJW_tJMZACmcUpTWzFVTMnJyhI7syzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=863 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_210743_580169_1B84B864 
X-CRM114-Status: UNSURE (   8.90  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> In the current ath12k implementation, the CE addresses
> CE_HOST_IE_ADDRESS and CE_HOST_IE_2_ADDRESS are incorrect. These
> values were inherited from ath11k, but ath12k does not currently use
> them.
> 
> However, the Ath12k AHB support relies on these addresses. Therefore,
> correct the CE addresses for ath12k.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

