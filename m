Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F8C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 03:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMj+XM3Z7JH4+lFd4b2GenYlhhOZHTCBQd8J2A+tk1w=; b=jmfdg40bKXYKVLO31oESzHGxDr
	YrTo3WNEHn96E6zszaUhbLtl5crZU3fah5bGa01ywRg9Ja0Ph3rqGvzGLstNhBTSBJ/4XRLUeQL5b
	mTDY1aN/r7AdaV+kRGoCPoMOqhIa9F9SwULV3ahoQLfjBfW1r2FhFovphsolcLjEnYa3wPd7W+jBa
	wDJ/DIPrurLX6RCbB9aXOelmf123OBhUphx+pXQwD/QwnNW99U2gWP8nGfR5GG84+IIxZ+gxLeeUR
	fcUO8wDse3nPzd3O3TtODNkJZv4x2nL/u8+Ott6mmCKeZyAS30P7cxu9Ve1NJ35lqFTGflH/qfmJI
	470idnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2Mc-00000009xch-20FW
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 03:57:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2Jv-00000009xMH-3FSO
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 03:54:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52618IuF005627
	for <ath12k@lists.infradead.org>; Thu, 6 Mar 2025 03:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMj+XM3Z7JH4+lFd4b2GenYlhhOZHTCBQd8J2A+tk1w=; b=WebLRMYitnfl+Si4
	FxnOil3mxGXKTb6d+s9nWOzg9pwMBNmAkbyYJFdcfWhtvkBC5I2HQiBsTy7Bei29
	VDeE/M7QOlJT5zzwacaQOVfgCx2wKDpI1x/IP5rjYwMMKT2jXMweeZB7KHr18YS0
	1bF6aVoC+Xe75pKeeVPJn/IeY96sWBLAgEmBVrJcrCiivFM9Nd/8ktPr2PeKMIxw
	IRY8jwMacGhUGpjh/gL+NrGk3nCJMye0MiimmMg6C+vvnnwBKKLqIga4xGmW0ewS
	0O6WVMoSC0lgQjRjx1vBPGGnYNQPFbvotpkv3AhFxQgIIcHWHL7flqFzMmDMypdJ
	IM77dw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4571sd8bb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 03:54:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22366bcf24bso4378575ad.1
        for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 19:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741233288; x=1741838088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMj+XM3Z7JH4+lFd4b2GenYlhhOZHTCBQd8J2A+tk1w=;
        b=TO/xoPfRxFcZeG6vSFLUfsyjvOD/FHXOhrjpnBEBHvzYsfHeIsR/gKR0rMhNMpoDDp
         RTTsWbOm3O65SEqVtNm+2G6DCa6OG4/OVS9rvPANtnVo6TQY7eArMzGrlKb6QYSLbk83
         ZwPGhNhv5a8svEdUwEgOy8j1xvSLxrYzm4ZWx61iV1k3cfJ94tXko+opIWwjd87wp3k/
         kx1qJe8JifVrqNpVCBzTT0t+jiSXTTFPQJxzuirlXHZ9uc+SFh3z6ix0Z04zNXtVvLt7
         XSaG9jOb559b+sbz+Ly9hM6ASH9743VAYzBi5vsJ5dUdq7qYOw45U9LTFblKJyGIw+x0
         +HsA==
X-Forwarded-Encrypted: i=1; AJvYcCUx8v0JzoyI12lLyT7/bGDCoRiBCHxy1DC9J/PA2dpvmZUVqKqtKPuGPImWiikSEKohJihD+HI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz53TvrWcR39hzdQkWIeyayrl85PeS2dZvMYF7EWzfklJT6ylka
	+acnoerqdjCb5AkycASP57BzP0GgjKdqUDnTPICSTqxna2AF/5fsR5HpEwXk1is6PbQcdslVa6f
	kAoTy1lwWaQUrdGZEPv7qahg9PnZdeeWJSvFE/MW0K7kIHyIHQ3LHgiQl48+J
X-Gm-Gg: ASbGncvfP3EgndhhCn4uj4U1fQDkvUHz1i/cVQ8Mvjcr5gDwCzyRSmzSUv8QD5vB1Ny
	fO8sk9gNjLA+ShJE+fQW9NuFCro65vQ2eWh10BcCQygRyB2KNrkOFzEzfUnvdbTp7yrUfSeN37z
	K/wLpO/sFA1SqK7oiLFsGchrFg+A4ZSxwhDXGLUnQjHxFZIhdf79fG7cvrloUWYeYF6/JovuFSf
	bMfP4tF9uceI7y4v4J2tHyXihd9ubXY/8neQfh4848fvSEAhnskUdw9iK2wkgyF/eT8VAoZZVy2
	q1v42vGy8/AKau7ud/znbufBqATSRQX5NbRBpum4ke65qSJO4MUE9GkWGw==
X-Received: by 2002:a17:902:ec90:b0:221:7343:80f5 with SMTP id d9443c01a7336-223f1d8430bmr93073265ad.53.1741233288041;
        Wed, 05 Mar 2025 19:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrogsGcvQe4xJVpBUgNzk/PrC3/Ys140YEy4yJBQknm/w4HVahaHFJ7/Au++I8Of0gIUxgkg==
X-Received: by 2002:a17:902:ec90:b0:221:7343:80f5 with SMTP id d9443c01a7336-223f1d8430bmr93072865ad.53.1741233287636;
        Wed, 05 Mar 2025 19:54:47 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7fasm2054525ad.115.2025.03.05.19.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 19:54:47 -0800 (PST)
Message-ID: <4ed9eebf-3470-0cdc-498f-ec4811b909a4@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 09:24:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v9 13/13] wifi: ath12k: enable ath12k AHB support
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250305185501.2400888-1-quic_rajkbhag@quicinc.com>
 <20250305185501.2400888-14-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250305185501.2400888-14-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -swqdCFQehQNChv8whGnpyoUUY8QF5fr
X-Authority-Analysis: v=2.4 cv=W6PCVQWk c=1 sm=1 tr=0 ts=67c91c8a cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=w_ZfqNI5J2udKohul8UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -swqdCFQehQNChv8whGnpyoUUY8QF5fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=768 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_195451_821157_9D47A91E 
X-CRM114-Status: UNSURE (   9.47  )
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



On 3/6/2025 12:25 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Currently only PCI devices are supported in Ath12k driver. Refactor
> Ath12k module_init and module_exit to include Ath12k AHB support.
> 
> Add Ath12k AHB support in Kconfig with dependency on Remoteproc
> driver. Ath12k AHB support relies on remoteproc driver for firmware
> download, power up/down etc.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

