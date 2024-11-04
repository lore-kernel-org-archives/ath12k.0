Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F528D132D6
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+LVHLVvV23psnH5k8auFoe6nsaJjyQzXDADndrFqXc=; b=Mr1bK5+i3+PbUsOBaXjXaKv3t2
	RmSkIQNMmeDIWNgVU74a3cFSwIfJeZgPbJd2hNRUTfLMO/cBVNzp5EBqJ0Mh2ZxRmNMnmi2oNKkMW
	QWAn9pdUFcxnQELcCVq+dnjJdd/iplIgytelKFDGtXukQFcAtx41RURiB5pDVK5owrSdx69mKW5dA
	NBnrqreC66oisDGQuV9TZrrL2R5R2riRZxqbBG4mr5sbVYXR3fbiMkhy9pZ9sfZgUazJq6qnm9Byc
	z3YTG2j3APFAKqiCNkdiO6ZZa086wl5tvsoWvHn/TSPJSo1JA2cQ/h632YSdPk4xdNjAc3790/wxH
	GA8FeubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yKa-0000000E6Zs-3Eub
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 14:45:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xt9-0000000E18d-2TBd
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 14:17:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjcPE026525
	for <ath12k@lists.infradead.org>; Mon, 4 Nov 2024 14:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+LVHLVvV23psnH5k8auFoe6nsaJjyQzXDADndrFqXc=; b=fOXV+QK/hyhMCDXy
	PjqJed/kJ3Z2YbnFXQpjjKWfJ5PXO4X7j77P+pgicDAdzqIOQ35Iq5cS0J/aSNEv
	gyUgDreEe46iHdnQ+TxlgX0oQt9JGf+w6W6s9MWZLheFjUvJi4kRrEmAF0CsUhQW
	UtEmYGQaxJ+MeQx2to+7+bxmUo8gWUO7Wfi647rYrLFEPjULi2nZ3BcoZX+lg4Zb
	I/Xz+QK6n+GF0QxddXppoJXIcqcySMcJyaJfhznUuA29Y4bISc8igzdsAyreE84H
	DaS4LJtNTKpOt0jmg/zjEEH19zXgQ4/khs6A9Gih3ZhoAy8FndNtdK+5sB1f89D7
	M7E3kQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd1fmgv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Nov 2024 14:17:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-460b5727217so5355841cf.2
        for <ath12k@lists.infradead.org>; Mon, 04 Nov 2024 06:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729821; x=1731334621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+LVHLVvV23psnH5k8auFoe6nsaJjyQzXDADndrFqXc=;
        b=Mg4MTLfr3ErbJ5FVhmEAyS52jqyuWKfw6JVP5WYDOUKZhSp0+NaEnp39ksCOyJ9I+N
         w0EeRE/W6ZatnUMElJLIfwbllbE1t6hFAoSa5m86AhNfIKwZCJOOfnLCwC/uZsMvBKeW
         tESlKIgpoUTW8gkoGbkXqdUv6YQ6rTEBy0sqU6fr1hmLRW6scNIX84yrCwnKsPMZDuyP
         k7A/yBr6N1fPVOw+EIhbTT7BlZypkd8i51733RO3AxDV09ATchTOaHYZvg708tPvIYjy
         0gQy4zKATMs5wAXQdHd8I6oIIufHR75T6VgSKQeKQ9o3VP9Mj8bWiBKCio9P1crthyoV
         i2yg==
X-Forwarded-Encrypted: i=1; AJvYcCVocrVktf8wbsv/oe6otpk15htx/sJgPZihfpC0OptJn2dh+BP5QuxfnPN7uc8jgNnrJEm9fRk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx++sSCetTs1pu9Ud2fZ5g4O7lo0Mmu2T+/GgP7ulBx39rExgH0
	XNW5dXSfOH5SQEWMSmAyXFsIVLlHWytaf96cBMYjMTyviz8y07GZpjg2DFSUpQLl4Ia2lz5ZMIb
	hRmsfyTfAKcEmw7rkR0aivCgEYBmcbETqCoYGInHpTv1gygLFwTKf4xsA96Xo
X-Received: by 2002:a05:622a:104:b0:461:5d78:4ab0 with SMTP id d75a77b69052e-4615d784f13mr181253981cf.3.1730729821599;
        Mon, 04 Nov 2024 06:17:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7oonLih/OW/AF9dZ7ubomiq4C6h3xeUDXyivjErSr0Hk8yihCCrZnRm9ZrUOTpV8rhO6nzg==
X-Received: by 2002:a05:622a:104:b0:461:5d78:4ab0 with SMTP id d75a77b69052e-4615d784f13mr181253691cf.3.1730729821072;
        Mon, 04 Nov 2024 06:17:01 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5663fdaesm567059166b.148.2024.11.04.06.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:17:00 -0800 (PST)
Message-ID: <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ky-gypF0oBfjdlPxydwG-75EM1a957m0
X-Proofpoint-ORIG-GUID: ky-gypF0oBfjdlPxydwG-75EM1a957m0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_061703_795235_2F7545B4 
X-CRM114-Status: GOOD (  10.43  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
> memory during QMI memory requests. This memory is part of the
> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
> hardware parameter and provide this memory address to the firmware
> during QMI memory requests.

Sounds like something to put in the device tree, no?

Konrad

