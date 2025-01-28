Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B259BC0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg7KgCeFkHFpNSsYE8u5hk8iLj7p7GoJw/mPLS3+mtw=; b=GKSYtOgsViIS1B6Lq6S1htTa1x
	zVxD6khtRt6FNWKaO0QvGBFmDcJPEfj0LSnYGiUiEgAdpQ2vpaGjS1goz4/7Il/dYmOum6k5cDIf+
	N5bRWl7TuMXEK5Mqblb67iX3VYuJBjwj5KIVu6NkhQUWcF4q3gX57GRPZeUNdFFKlbBiPqL5ogfKH
	DJtp90MewAwZKrMKxU2PrVLhoi7PlgKdM2+coA9o4JA8A+/knE0vDF3Jnr3xJ7XcS9fvboEwGW7lx
	1t7caImy8vdHOMKxfQmVLyKo2S2Olmw/ATnJC8lfXDoFHBFVOCkYReGGQwdLi9XuIxoDjOeCTN2t+
	RTtVMAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmul-000000054go-22l5
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 14:50:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmui-000000054gF-3nrZ
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 14:50:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SDrkhE004141
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 14:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg7KgCeFkHFpNSsYE8u5hk8iLj7p7GoJw/mPLS3+mtw=; b=RQ8yi2ZtF+mIzT3p
	lzZB+egjQsUII91eV7gnTX58yJZt45Vnje9DK8cVEZsUyTu1zShS1q23a8vRifPH
	98Bcmy0qn8rIa6Yv3zw1jWrewM0Yep8v6rq6geLOHcxYvY2RsAKQ/6WMQp83VXWG
	yhYMF0++ubId0P1NiFfR9Ze9JeiiVng9Z86FPr/pd/8mes6YkeZ+yGPd8XojT25Y
	vP/Riu0dLkDE0Y24sugRZEBKOIl350F/KI1oa3aJdqbPPpXZlcU3UBsGIFKvZJy4
	5BtuzXjaUzUm9t2sA7tBhDgF1llyg1rpYR7KvmKAO4f5fDgsIXf5+vXb0iL2Jqqc
	HA4koA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f0h784mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 14:50:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2162259a5dcso178150415ad.3
        for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 06:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075803; x=1738680603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg7KgCeFkHFpNSsYE8u5hk8iLj7p7GoJw/mPLS3+mtw=;
        b=F3XSb6awbIwxvw/zL7irvd8575S5+sxpxnd352VpzpNFqlJauk8cCTf4I55u0SMTbT
         rgFRx9KdEZvVCyJSb1whSXXSyVpkGbLMG1wgL9gmkdWAgYU7F/Ng2jVGGMji/puXPAVc
         253qfAR51+Bb1N+BJqzTfMZE1QkmIhs/LiO7wOChsPZzRynjd7jYbzZbzn6LHT0+vfvv
         xSVrF3MVwLDmo58EK7S5/vikpt5U9jKEPG17kTnvLejcoQ8fk0x05L+gu9dqncJ5YxDu
         qht+QeUy/MMWL0vDAPzJ/+v9xD7ArTaZ2HvgqYHJt13V1QtBC6kxjeZzDIwXUmSAnj+H
         kzBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKeiOeQHWnUfa4r9LC3RvSyo5li8gA5HnoYkQ+CvPzd/6MufHPqiFBsTYMkyMbXyyDN8gC6Bw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5y7XsOw3KVZxY98pqiAoFgraMg6nMfI+T3lJ2jNE4cjHzZRT
	7eWVDn3MgQMG/Hf7uvcuBP6Avlm+D7hmURn/BObLo7p9Ls323X+7y3lg9UMfZQQ+zTJ0YYU9tN7
	FC8j5WZljb9vUMPO7pQJQzf8qPoeKk9wBYnglAEugo5fX9zZjpXrub0qHKNBd
X-Gm-Gg: ASbGncsZn2Z4X10g755j0kMcKEKp3RShfZhpHssUTGVjgT0eGf7YSIuxUpkBOTh37I/
	mwAcbTWqZRkhis8/ElDOihrdUsd2UuO1MnW0NfSx8JSYSyYKUuBzS24ESqaPhrIS9XxcqHujq4Q
	RHDMLSq9DSfW1LaTvXYGyQ1UJ5Nrnhe/iNgsN/Rbtfgu6lJ3AdCF1IOazeb/RDgx9P9nXz81C5C
	eHtoixTC9NCwvV6KdcGmMDALmH85Xk6Bv3UR3izKfkWsiWI8lDOhK0+WthoOow20G53mz4z5aA2
	lf2cjk3KkmZ09MfImVbywu+mFZ2MXF7x9DJfAyKJQg==
X-Received: by 2002:a17:902:c94d:b0:216:3e87:c9fc with SMTP id d9443c01a7336-21c353ef5damr753457205ad.5.1738075803163;
        Tue, 28 Jan 2025 06:50:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8jXYTfjcUCXFjJG6lpWbPt8PeB6TXSFVj8bhXCi5auL8mxkEEOnalCqSS8TNNFiC16do/Lg==
X-Received: by 2002:a17:902:c94d:b0:216:3e87:c9fc with SMTP id d9443c01a7336-21c353ef5damr753456905ad.5.1738075802786;
        Tue, 28 Jan 2025 06:50:02 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414e30dsm82406075ad.199.2025.01.28.06.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:50:02 -0800 (PST)
Message-ID: <1fc5e70e-12a7-4a4e-9d0b-3fc25f5151cd@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 20:19:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250128111059.1690113-1-quic_rdevanat@quicinc.com>
 <20250128111059.1690113-2-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250128111059.1690113-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gaOEJx4J7rAS3rDRrmwqvv-tx6Vpqqow
X-Proofpoint-ORIG-GUID: gaOEJx4J7rAS3rDRrmwqvv-tx6Vpqqow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_065004_963564_41337DE7 
X-CRM114-Status: GOOD (  11.22  )
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

On 1/28/25 16:40, Roopni Devanathan wrote:
> From: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> 
> Host receives four Transmit Power Control(TPC) events from firmware on
> sending TPC request. Fixed param TLV is present as part of all event to
> indicate the event count and end of event. TPC config parameters along
> with regulatory power array comes as first event. Rates array comes as
> second and third event as it cannot be packed in single event.
> Conformance Test Limit (CTL) power array comes as the fourth event.
> Firmware packs different sets of array params which includes array
> length and type inside master TLV as different subtlvs. And the actual
> content of array is packed one after the other inside a separate TLV as
> single buffer.
> 
> Parse various events and save it in local structures. Create tpc_stats
> file using debugfs to store these local structures. Create function to
> handle TPC stats read to relay the information to the user.
> 
> Command usage:
> cat > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> Co-developed-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Co-developed-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

