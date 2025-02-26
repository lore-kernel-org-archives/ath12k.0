Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8081C19776
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 18:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWSD4j6EEFeqcOQdnQ85n26HkbUr80sn+V/kPvDpcbA=; b=NJh/YpQECqm1iDS8MWQOjHY/91
	q9+XgmVffEBs6CsMTirISYiR+GzrR4YesYn714K7IjoRycQ3DRBQSKviUCqsnlqaJmM4fctPV2ck1
	ejyJB2/Bxwv3Gb/r2t7BGJyDTvT3eflqeEZETjtSQPtCLteK/7Xz3Fl31d9uYqt2v1GY8RBcC0hY8
	xcB4X2E8tZO474oNEjhBxcUq8LRpOyy1zKGJ5V1q0rdZNYygZf/Vq99cLxqlH25KmlbL0XYCsE2zF
	6FQXW0mE6jcCVRsA0lGK/ksBBYZ9Zhz9lYhMWCzK0meH4EnDWWzggshkjcEj26m7ioimuy39oWGeA
	Em8DZzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM2K-00000004v94-2dug
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 18:21:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM2H-00000004v4l-4B5j
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 18:21:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QA4XtO013260;
	Wed, 26 Feb 2025 18:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWSD4j6EEFeqcOQdnQ85n26HkbUr80sn+V/kPvDpcbA=; b=TFhmjS128+nTmbVt
	zgEhsr+6Gk9pCQ5euCwg59tHf768r3RCoo/nwqxl4b3JM/sduzRjgq4VDxiJyty9
	4v98eHvQQPdplALtddMSMkp3KgybruXhgX/QzgNEvm8Il220HyjzJzDJdcnRo+VW
	y4pXy+VimBqWbfJiDM0u8uFbYvdH3ot05YpZACePJiKF0JlsvKY6ChKYPGWtEyMg
	nVztZ0kM3+ErXYeQfuXswA8PEiedMTGMZ2BZ9tyMsHuxb6ReRAcp+qUhuuzLNaHb
	jYbZKESkazH7+wO2Y3q4bFfkDgtmlmvxGBWCjPtjaShjjDkygn8u9M8O0DgHMy6a
	mTLmmw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk2wg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:21:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QILTom026686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:21:29 GMT
Received: from [10.216.2.27] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 10:21:25 -0800
Message-ID: <0a193a56-0197-486b-9d36-20aeb0d5860a@quicinc.com>
Date: Wed, 26 Feb 2025 23:51:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based
 RDP441
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20250130045900.1903927-1-quic_rajkbhag@quicinc.com>
 <3iwfhcl5gmpwfiatsawwkm5qns4pmzvhcrroq236y45kklw244@6rngcplttabx>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <3iwfhcl5gmpwfiatsawwkm5qns4pmzvhcrroq236y45kklw244@6rngcplttabx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sHONV2xv9nPhtqYL3M9SXHmuBq0UOOMR
X-Proofpoint-ORIG-GUID: sHONV2xv9nPhtqYL3M9SXHmuBq0UOOMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_102134_180625_4F461351 
X-CRM114-Status: GOOD (  33.61  )
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

On 2/26/2025 9:22 AM, Bjorn Andersson wrote:
> On Thu, Jan 30, 2025 at 10:29:00AM +0530, Raj Kumar Bhagat wrote:
>> RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
>> device.
>>
>> Describe and add WiFi node for RDP441. Also, reserve the memory
>> required by IPQ5332 firmware.
>>
>> Depends-On: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
>> Depends-On: [PATCH V3 0/8] Add new driver for WCSS secure PIL loading
>> Link: https://lore.kernel.org/lkml/20241231054900.2144961-1-quic_srichara@quicinc.com/
>> Link: https://lore.kernel.org/lkml/20250107101647.2087358-1-quic_gokulsri@quicinc.com/
> 
> Please run "git log --grep 'Depends-on'" to see how this tag is expected
> to be used. As you can see, dependencies on other patches in flight does
> not go into the git history, and should as such be mentioned only below
> the --- line below.
> 

Thanks will take care for next submission.

> Please wait for these dependencies to be accepted before resubmitting
> this Devicetree change.
> 

Sure

>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>> NOTE:
>> The DT binding changes for this patch has been posted along with the
>> driver ath12k AHB series.
>> Link: https://lore.kernel.org/all/20250130043508.1885026-1-quic_rajkbhag@quicinc.com/
>>
>> v2:
>> - Dropped 'dt-bindings: net: wireless: describe the ath12k AHB module'.
>>   This DT binding is posted along with the ath12k AHB driver changes.
>> - Reserved four memory regions required by IPQ5332 ath12k firmware in DTS.
>>   These memory regions are also referenced in the WiFi node.
>> - Moved 'qcom,smem-states' and 'qcom,smem-states' to the ipq5332.dtsi file.
>> - Used lowercase hex values for the reg property.
>>
>> v1: https://lore.kernel.org/all/20250128091012.2574478-1-quic_rajkbhag@quicinc.com/
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts |  64 ++++++++++-
>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 113 ++++++++++++++++++++
>>  2 files changed, 176 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> index 846413817e9a..4b7a75e450ca 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> @@ -2,7 +2,7 @@
>>  /*
>>   * IPQ5332 AP-MI01.2 board device tree source
>>   *
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  /dts-v1/;
>> @@ -12,6 +12,61 @@
>>  / {
>>  	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.2";
>>  	compatible = "qcom,ipq5332-ap-mi01.2", "qcom,ipq5332";
>> +
>> +	/*                 Default Profile
> 
> Why is the title "Default Profile", is this expected to be changed by
> someone? At what point?
> 
>> +	 * +============+==============+=====================+
>> +	 * |            |              |                     |
>> +	 * | Region     | Start Offset |       Size          |
> 
> "Start Offset" relative to address 0 is typically called "base address".
> 
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
>> +	 * +------------+--------------+---------------------+
>> +	 * | Q6 caldb   |  0x4D500000  |       5MB           |
>> +	 * +------------+--------------+---------------------+
>> +	 * | MLO        |  0x4DB00000  |       18MB          |
> 
> 18MB is the same size in your graph as the 1MB segment, but somehow the
> 43MB segment is 5 times the size of the 18MB segment. So the graph isn't
> to scale...
> 
>> +	 * +============+==============+=====================+
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |            Rest of memory for Linux             |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * |                                                 |
>> +	 * +=================================================+
> 
> Doesn't DDR start on a more even address, such as 0x40000000? I presume
> the purpose of your picture was to give a good overview of the memory
> layout of this system, but the only thing it added to the table below is
> a curious question about what happened to the first 169MB of DDR.
> 

Yes this graph provide the overview for memory related to wireless
components(rproc and ath12k firmware memory).

> 
> Please omit the graph, it doesn't add value beyond what's provided by
> the below text form of the "same" data.
> 

Sure, will remove in next version.

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
>> +			reg = <0x0 0x4d400000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		q6_caldb: q6-caldb@4d500000 {
>> +			reg = <0x0 0x4d500000 0x0 0x500000>;
>> +			no-map;
>> +		};
>> +
>> +		mlo_mem: mlo-global-mem@4db00000 {
>> +			reg = <0x0 0x4db00000 0x0 0x01200000>;
>> +			no-map;
>> +		};
>> +	};
>>  };
>>  
>>  &blsp1_i2c1 {
>> @@ -63,3 +118,10 @@ data-pins {
>>  		};
>>  	};
>>  };
>> +
>> +&wifi0 {
>> +	memory-region = <&q6_region>, <&m3_dump>, <&q6_caldb>, <&mlo_mem>;
>> +	memory-region-names = "q6-region", "m3-dump", "q6-caldb", "mlo-global-mem";
> 
> As you are resubmitting this, it would be nice to have these two
> properties wrapped (one entry per line), to increase readability...
> 

will update in next version.


