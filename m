Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B5DC0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGkukPgangna9iKZ9EqZRIQO3/75FNBNDmH6yVQC8Yc=; b=putjuQH5NYtxYPccG7VzkOOxp/
	F/vTDOBqRR7eqXe/z7iBwnkRDXeyzT4K1EcsVdjJCP+yLD9pFD4RTMNJ9p2qRHJEDvuDt7hJDKl/P
	CCczOiAro4obTSjXxo5sHxGFQmvaUGOskLU1cMm2whl+ypTsXEOU7gGCoR+2Tbr0n7us3oZPqgmjJ
	VfsmlWJRlC16o/1HxRxIqYC3qTayzPvikQnCfq9jJRcs5ysn11hJXCZp3lziyAOAnuKyz8a2LD7Da
	mFdMiAkNPIddpaVty9E2Lbylj6EuUcvzLFAVZjhMmS5qQjcgU1BiJZNuYIcFKCasUeHI95yffwuTq
	uKk/02/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tci67-00000004Z9q-0UnT
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 09:41:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tci64-00000004Z9W-0wkq
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 09:41:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0Vod2002950;
	Tue, 28 Jan 2025 09:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGkukPgangna9iKZ9EqZRIQO3/75FNBNDmH6yVQC8Yc=; b=EGTg2eQlc6xnjhih
	2GBoYy6TdK902JddumNFzFOxWA7HXkRqpQWiRMuSoJeZmrop2Q1PIBuKLipReuJE
	MWQAFl1QpI3GJPYlWUsAN4SZ+JF+zl40g4N9a+FLSfI7mqaLa5RJa1JXadVlRsTu
	dEPYoPMDD+OOc4Mhq8A7AVMi5VxJ6ne/uksGm39UPlqm2xLuctq89ZtLCOLmY/VR
	KGcmHZATLwxhNaCq9aRGDQTRcBmWNArFip13HB5jbr44mfxuOmY5LwcI8s34Ukko
	DGinNueCpQqyy967BTwJhQ5bovwqmiiETvmqSGne2jA3xUQpqFo6BQSVUjAGjcIX
	k/E9UQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44emry0xk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:41:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9f8kr014863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:41:08 GMT
Received: from [10.151.40.239] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 01:41:04 -0800
Message-ID: <a752a135-9cd0-402b-b0fb-967491cfdaee@quicinc.com>
Date: Tue, 28 Jan 2025 15:11:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add wifi node for IPQ5332 based
 RDP441
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250128091012.2574478-1-quic_rajkbhag@quicinc.com>
 <20250128091012.2574478-3-quic_rajkbhag@quicinc.com>
 <b3ff05c1-6424-4ace-a873-ddf1a0d3d07d@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <b3ff05c1-6424-4ace-a873-ddf1a0d3d07d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: przWctJGitIxmfNxgpsBrbJOG3EQ-dX2
X-Proofpoint-GUID: przWctJGitIxmfNxgpsBrbJOG3EQ-dX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_014128_395758_51F91D14 
X-CRM114-Status: GOOD (  15.04  )
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

On 1/28/2025 2:52 PM, Krzysztof Kozlowski wrote:
> On 28/01/2025 10:10, Raj Kumar Bhagat wrote:
>> +	/*                 Default Profile
>> +	 * +============+==============+=====================+
>> +	 * |            |              |                     |
>> +	 * | Region     | Start Offset |       Size          |
>> +	 * |            |              |                     |
>> +	 * +------------+--------------+---------------------+
>> +	 * |            |              |                     |
>> +	 * |            |              |                     |
>> +	 * |            |              |                     |
>> +	 * | WLAN Q6    |  0x4A900000  |       43MB          |
>> +	 * |            |              |                     |
>> +	 * |            |              |                     |
>> +	 * +------------+--------------+---------------------+
>> +	 * | M3 Dump    |  0x4D400000  |       1MB           |
>> +	 * +============+==============+=====================+
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |            Rest of memory for Linux             |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * +=================================================+
>> +	 */
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		q6_region: wcss@4a900000 {
>> +			reg = <0x0 0x4a900000 0x0 0x02b00000>;
>> +			no-map;
>> +		};
>> +
>> +		m3_dump: m3-dump@4d400000 {
> 
> This fails with your wireless patchset.
> 

Yes, this will fail with v4 wireless patch.
We have v5 (yet to be sent) to read the correct reserved memory. Since,
in v4 I was asked to address and send DTS patch separately, The corresponding
driver patches are yet to be sent.

>> +			reg = <0x0 0x4D400000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>>  };
>>  
>>  &blsp1_i2c1 {
>> @@ -63,3 +104,16 @@ data-pins {
>>  		};
>>  	};
>>  };
>> +
>> +&wifi0 {
>> +	memory-region = <&q6_region>, <&m3_dump>;
>> +	memory-region-names = "q6-region", "m3-dump";
> 
> Binding said you have four items. I don't understand why this varies and
> why this is 2 items instead.
> 

In total we have 4 items, with minItems as 2.
The other 2 items (q6-caldb & mlo-global-mem) functionalities are not yet enabled
in ath12k driver. Hence these memory are not reserved yet.

