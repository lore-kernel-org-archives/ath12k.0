Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DE8D3F283
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tGKOhQP9AnanB1aw/7BV3wpUi1rDbiQvMRXCGixeyo=; b=ERb+1pm30Z26Uf2RV6c4xQCPZD
	3Catta01aklMuK60y36e3bVHMQG5dX/rrJ40gaDaRLvJd3e+riT8PIrJJccORj9NDAanpgqCQR4Fe
	u7u5O8wMh0bjjmW/bZ87qQdQtZ5v4FFmw1ByrcwgKCjjQqp4n0MeICIc11EGy/qY5g/CbmNuRdvtF
	LA8mVFXZCgytsq8pxz1QSc4kqd/jzEMntIDT4q+FjuL4lzmEWY7fM1OMDeZGT4QR1Bv0se0za/KWI
	aY0/vHIfKk+t4A3erPFSATFSwvStnDxNY2dwPv9X+MbkJd0CDUxyeLrN1dKJomqjs3HL8JB8ULKg7
	lqyT7rSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t9S-00000001szD-1U0i
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 20:00:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t9P-00000001syK-1zth
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 20:00:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IJssYq006586
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tGKOhQP9AnanB1aw/7BV3wpUi1rDbiQvMRXCGixeyo=; b=UzXnKPLoshLJjtBC
	YsSRPz+SOjzQjAFYx703qyUPHGm/QO6WBK342i+HQsdU7yzW8XfNAZnNpiGE1bZQ
	prQ+ARrfUOBRhYQj2JSPNkUMtmyWODbi/5Z9bXLHDJx/FSduZsvni4evbbMcAIcu
	3LEPmn+g6J3/izyYl8BNuCO7xXwWqydxAWWkfsTEpgXRdunPjzsPhxxzVyX/4Qcf
	D8RikVfnl+2cXj/pa+aK2PMYYD59ELcqZhVjCYo371YnG47dMKpcZtejjl7cEbi+
	9P0uj6LRBJ6OCytIFmYmuEbc52GCPuInYZReDJVVwlZ4FxU41Ssa3k8jdKO3sKll
	FICuqg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bmys9tp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:00:41 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-8501280c38cso80859241.0
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 13:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281640; x=1729886440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tGKOhQP9AnanB1aw/7BV3wpUi1rDbiQvMRXCGixeyo=;
        b=kWPj1hYtcVFSSDtJODi9SOloNxIIAUVkLFtJw2D+AL6zmX8jjVRtUFu++s3mjr4kX3
         Nna9RTmNbOzih7PBGy0jya5FDx56PDAFkJcUXOubE/AA88GcXulb9GrlBmAOynEiQRPp
         IDPMEozjhPQy7MMktXcvumDNH5Aom/Mr2pPIO5r6mP3vvj5wwP7eY8fBljFVgiXke/WP
         63rINlnVUbOEynKqdBGE0LmdVpBHUUYE41/CMNbDPpQFClghzQxbPQQErsWAs4th8ExA
         I9OawrYF+6vc4ESPZlJYWrwTJhSAfEsjHxfd37AtZBZB+atq9CRkc0oKMf01MXvaS7ti
         aUDg==
X-Forwarded-Encrypted: i=1; AJvYcCVSxXcU/N5t8N97/YGNTZuKsjBq0QSF2utD3aV2yr5LMZotpKUuMOQSh1jGE1y3yTZQ7pa3z7s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81Wlsk1Yv76mRWKJGQFUYrtJSmqw1GoH97Kd2BgKg13Xoh5J1
	W31RBc6GAP0BGgPH0QDLdsjHl3MR5gBVtGZFbhppcpp3p4MRqTrhu/EEaEw+kwckZpan3WMIxQ6
	4PnirNto80ck/llNGQ8GD3VHJko5iaWTtjdOUtDDDXPcdOxoU0meiglqk5l99
X-Received: by 2002:a05:6102:2ad6:b0:4a4:91e1:9939 with SMTP id ada2fe7eead31-4a5d6bffee7mr1498627137.7.1729281640651;
        Fri, 18 Oct 2024 13:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSpLOvXy2ZJYFYCESLX3QZsA4k17+P+w4yaJ6g1/oZglutsaQiEYVFZTCLMNovcB+2umfTeg==
X-Received: by 2002:a05:6102:2ad6:b0:4a4:91e1:9939 with SMTP id ada2fe7eead31-4a5d6bffee7mr1498582137.7.1729281640242;
        Fri, 18 Oct 2024 13:00:40 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c271c3sm132517066b.193.2024.10.18.13.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:00:39 -0700 (PDT)
Message-ID: <4961d425-b660-4dac-8744-36d69993d1e1@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 22:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] wifi: ath12k: avoid m3 firmware download in AHB
 device IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-10-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-10-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LzF5xyP8kccpWHj5LtQ7ljiFxo9aHhXU
X-Proofpoint-ORIG-GUID: LzF5xyP8kccpWHj5LtQ7ljiFxo9aHhXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410180127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_130044_016642_62032265 
X-CRM114-Status: GOOD (  16.06  )
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
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Current ath12k devices, QCN9274 and WCN7850, supports m3.bin firmware
> download through ath12k driver. The new ath12k AHB based device
> IPQ5332 supports m3 firmware download through remoteproc driver.
> 
> Hence, add new parameter (m3_fw_support) in ath12k_hw_params to avoid
> m3 firmware download in IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/hw.c  |  8 ++++++++
>  drivers/net/wireless/ath/ath12k/hw.h  |  2 ++
>  drivers/net/wireless/ath/ath12k/qmi.c | 28 ++++++++++++++++-----------
>  3 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index e5e2164c27d2..a4e0c21ac4b7 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1299,6 +1299,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.iova_mask = 0,
>  
>  		.supports_aspm = false,
> +
> +		.m3_fw_support = true,

'support for m3 firmware' is not a fitting term.. maybe "needs_m3_fw"?

Konrad

