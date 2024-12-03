Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A2D73612
	for <ath12k@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOU1gNRtbLcjg5yJztx/++hV82MOGeBAmpzpBhJX20k=; b=kz+NjKQqF14JbuPSTFanVOgLyG
	PVwwuXJ/vZULknhGpflM0Nr2MSnZ7Q75HhE0RPwYJoJdJk4YiaiJY58Uu2CUXYr3IgHMlfftlYZGo
	oYSpIQTBmMGo1NZuoSRaIuyXU1znBqAVt6gysFyajqTnSapy4NMChIs+bNVc6AMXacnKws3sH3Vhi
	5RNjfkjMxpgH/CTh2O+EVKJUNtkUYsRZ83Y53a1nPP4STjwtlnMPuPifhRMxvtA/LBJQb14IAhotd
	G/ZYsx9aPjtd8owVLG2qUm5xUzf9HFnhRg8Piz0pKJKopFgN1l012gcbTA8q+Td7usZ9JwEcZAZUB
	WUmj4rig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOzT-00000008pj4-0ujl
	for ath12k@archiver.kernel.org;
	Tue, 03 Dec 2024 09:14:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOwO-00000008ozX-1eQC
	for ath12k@lists.infradead.org;
	Tue, 03 Dec 2024 09:11:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37Pr4p017944;
	Tue, 3 Dec 2024 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOU1gNRtbLcjg5yJztx/++hV82MOGeBAmpzpBhJX20k=; b=koAbj0f4n6KxgUSo
	V0DnJ0XbIP3QRyjE3oHzHMmv66XyiniZW7r4UwV/pBgLk/w0SqGHxCmgBVPa3Vi9
	4Lrv9FuBuJ6Mh4JV9kgq+6E9YZvjnn3sYB7fxryK9j1LN8BKy/rZajEWOROX6bXQ
	7nasYKfBBr9NV0t0gpuulVNVHcc+QFmFjBoJmr/Wfb4dQFdZRUsSdIj2HLcxSDFh
	YnMMfjVEYxz4gvFE3ILiMJ08tFnFdOKvs6Vs2YGQOAQPeJOIgacuq3CvRILp6ji7
	2/z9aOhcuGL1DvhqDXlqcg2IKmGSmW8VqAUOfBca6TpAEo1rOUXxvoY13oe/7PYU
	W3ijFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstfjhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:11:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39BCCF019589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:11:12 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 01:11:07 -0800
Message-ID: <231fae33-4d3b-47f9-a824-ea752f8a23ae@quicinc.com>
Date: Tue, 3 Dec 2024 14:41:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] wifi: ath12k: avoid m3 firmware download in AHB
 device IPQ5332
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        "P Praneesh" <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-10-quic_rajkbhag@quicinc.com>
 <4961d425-b660-4dac-8744-36d69993d1e1@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <4961d425-b660-4dac-8744-36d69993d1e1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AJpQOBUnE02lFidt4Tm3e0hN9ya97Oe9
X-Proofpoint-GUID: AJpQOBUnE02lFidt4Tm3e0hN9ya97Oe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011132_548378_BE4CF5FF 
X-CRM114-Status: GOOD (  13.92  )
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

On 10/19/2024 1:30 AM, Konrad Dybcio wrote:
> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>> From: Balamurugan S <quic_bselvara@quicinc.com>
>>
>> Current ath12k devices, QCN9274 and WCN7850, supports m3.bin firmware
>> download through ath12k driver. The new ath12k AHB based device
>> IPQ5332 supports m3 firmware download through remoteproc driver.
>>
>> Hence, add new parameter (m3_fw_support) in ath12k_hw_params to avoid
>> m3 firmware download in IPQ5332.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/hw.c  |  8 ++++++++
>>  drivers/net/wireless/ath/ath12k/hw.h  |  2 ++
>>  drivers/net/wireless/ath/ath12k/qmi.c | 28 ++++++++++++++++-----------
>>  3 files changed, 27 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
>> index e5e2164c27d2..a4e0c21ac4b7 100644
>> --- a/drivers/net/wireless/ath/ath12k/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/hw.c
>> @@ -1299,6 +1299,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>>  		.iova_mask = 0,
>>  
>>  		.supports_aspm = false,
>> +
>> +		.m3_fw_support = true,
> 
> 'support for m3 firmware' is not a fitting term.. maybe "needs_m3_fw"?
> 

The name "m3_fw_support" is inherited from ath11k, for ath12k we could
change it to "needs_m3_fw".


