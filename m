Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705DFC36000
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCbcORBD7TYTk+XKpRjnplu+uBcKKY/kXvr0Jk5Isao=; b=35XzT6twktnVZwB0yVExOAX5YT
	w+AK0ZrBX7dq+pJAnC+/IqJ0o+k7gvUFXtz9l157a4xdT5ELnholDCYbZFvJa0jjqoEgA8Z8K3hEx
	Odz3tMGhZ8gqvZnS0Tsg2c6eyxy+2AVPB71KpD66WTX9Vgge2l91C5Zthwsqkd3VA8JpabZ5NMysu
	FHimNRELoOor9HHyK6fxBXrAufEP6tyMvOr9Jd+Ez72dVSyQWwVfUdv1ZWVLZNynjXzrsrfcO/3zo
	svUrshn0hFhyR7/531s1w3d7y6ipfm0Cgd4ATwKEu2ZWaXWvEfV4FfNUrbYUrvDiwdx477zWQ9h1x
	Daczazqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvepP-0000000FP16-0vVB
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 16:02:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvepM-0000000FP0H-3GKZ
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 16:02:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSFeP025611
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 16:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCbcORBD7TYTk+XKpRjnplu+uBcKKY/kXvr0Jk5Isao=; b=ErGCfkJ2qMEFeXqk
	UC6l3H8dLAHsfzb1ZcqgKMAcqIXxd1mg90Dt6wUrb4v/+kjl7J9QM8OAiQNlgi16
	heDzJw1s5Cx6pg2e95+DyHxENBc4AzO6LFS/05aOZ20OBC6FF99fGpFePUaymPLo
	z4ldDaUgfYs4+SUwlgGHl3Wr0XoIXdatQHoMs2ml5Akou6I+aoecjcohNE2k0k+j
	MZbzmwwA3DYhsTGYwM9Mcxz3dKdMvbrh0zu4Cl2rsf0xiiIF8dLdMkyJcaLUCQU1
	YyR4ePNXfB5AQXDgQwBGXZSkfigHCz13fWQsOljLdxkl8aHElgjisq83HpLFOP6Z
	1Uza0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854gjn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 16:02:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2233b764fc8so34574175ad.3
        for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572950; x=1743177750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCbcORBD7TYTk+XKpRjnplu+uBcKKY/kXvr0Jk5Isao=;
        b=mZehYQzVIMSRE0PS9Nyia24u73orHgVaZb7YOVzOWNclBRuwMgac6i1A2wC2zW6MBT
         ZchOnpKELL+/u1dRUI+hHdB9ewgFLOqIktrR04OMnj7uMLrcUbk33VdXLK+Tw6ZXi89U
         i6EL816i03YCUwY8N+Ct3PiJ0+Nc7FOZLD4h8Kb0KwoJNxybRcDLlGd1R2FrVmVIxJAo
         fZf4RXD7bT2ws+b8iu7YI3XK4h6nNrizesOokRdFi1FOhE1mOg6sf2KyUauazxJ17t9x
         Zdi6jn2cGYoW6QD/DhQ+YsR1eOE6+/kGIJrMzZKJR+VhdnfBfo3VNKJB4k4BS6MPM7AH
         9nDA==
X-Forwarded-Encrypted: i=1; AJvYcCWN8khaSxK2JDWsitl4ARyuyHs+OR3x0bqlGJDch/hkQwbzcyFR0HiGkK8QX0e6TFrnVQu3Nm4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vtfe71a4M1xEhJqe0uAFqNgRstc6DLJlJhPhZD1clqdAcuH+
	feyTJolEt3U31yrDyZtYmTlGUd8NjWDC4rBonTJ0Fu1J9IAUByYT+9kmJBrneIwhvyWmFZXPnwu
	UzMeFLArURZfbYJ9tlua3SaudJaM5AdwNQhppPPsm+lg2glXRcWcxdrd1f8Cp
X-Gm-Gg: ASbGncsWXNaLV/Qakkaa8kwIi0IfSD+TPKhoOeKbtYYpi+f30QFqZsi80ejzNtirLrs
	TgepffGcU7I00HNZ6Lai0KxvuOXVkob308gr8Ane2H50ilUQQ7PeltinKSKRUI3Z4+kzEk/rLjo
	0RjHNBrnOWFZ5tG4bor1rc/tp81t8WVcZxO8qWEgQQIQQENoTyuW/mXmRJR7KHbALca6KNp1Chb
	4q77zabvTfkgw+kDsQJehDKasnEXPeqVds+Fn3yShimSX7vfH7qOtOqqASMdLqsPCmNV/gi6cy/
	8pqxGWMQ4BhvW8/8HSHdURo7lEV0BUl6RIhLSVsPFYZK2Pk/kc1K3fRSFT4XEMxeXsKB1/kIVtn
	geDJ7t8eu
X-Received: by 2002:a05:6a20:7347:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1fe42f53152mr6623756637.19.1742572950028;
        Fri, 21 Mar 2025 09:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcQ2r97XLcVjprlkXYBQ4t6SFERPXbBeumuUB0GSNO6WM4PH5u+Dkl5/WJ+KpfvQZJ1YN3/g==
X-Received: by 2002:a05:6a20:7347:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1fe42f53152mr6623691637.19.1742572949501;
        Fri, 21 Mar 2025 09:02:29 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a29177sm1911891a12.62.2025.03.21.09.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:02:29 -0700 (PDT)
Message-ID: <72e9ddb1-c0eb-4eea-aa11-3f24ed0caea2@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:02:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v12 07/13] wifi: ath12k: add support for fixed
 QMI firmware memory
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250321-ath12k-ahb-v12-0-bb389ed76ae5@quicinc.com>
 <20250321-ath12k-ahb-v12-7-bb389ed76ae5@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250321-ath12k-ahb-v12-7-bb389ed76ae5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GCPUkX-9IROn8PCSTPjGsEWsDZ8Muvr0
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd8d97 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=7wgTMAlwxEMamJX448IA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: GCPUkX-9IROn8PCSTPjGsEWsDZ8Muvr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_090232_822893_1A898CF0 
X-CRM114-Status: UNSURE (   7.70  )
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

On 3/21/2025 3:52 AM, Raj Kumar Bhagat wrote:
> IPQ5332 firmware supports only fixed QMI firmware memory.
> 
> Hence, add support to read reserved fixed memory region from
> device-tree and provide the reserved memory segments for
> firmware to use during QMI firmware memory request.

Be aware that new memory-region helpers are being introduced by Rob:
https://msgid.link/20250317232426.952188-1-robh@kernel.org

/jeff

