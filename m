Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5615C021B8
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rEmYa7gR6MQcUBZvuFdwIgnak9aj7gj2C6Y17IhzvU=; b=d4ZcrmeQ0rlJJs4BssYHeWJLUD
	pAQZjl0AGpNDWUCT38rth+Kgc6cbQDlG2vhSIAjjyoQv/ALOON3n7xNBAxbACFlc08HzWqjynafaP
	ZIgXOvuBrv3zDqpi8O/yUQm5QZ7gTXss1EJb1jiLPIJr+isI/QYGK6V+4aziLT+SveapRiqlPCrU8
	F9l2Xz+L41M3HRcMIuJIUm63L7ct1M5B4oGmrtO50Euu9FkZwMzvOvo2dgVeuAYqZMDOeo0V2rwDf
	wGlKKLmcAO8kBOY5Do+L6z7RFCKWQw6IO23r2UUiQ+1HgvIyqSonPH2tAVjqPavtrrszrN6ckg4lR
	r/jBPOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM5R-00000004wiT-2M4s
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 18:24:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM5O-00000004whn-2C6I
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 18:24:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QA4Xte013260;
	Wed, 26 Feb 2025 18:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rEmYa7gR6MQcUBZvuFdwIgnak9aj7gj2C6Y17IhzvU=; b=kq3hCYLeg7SqEhVC
	a6qB8unSGTdV3r9zeNNptLgrdBgdgRSsLhTSQz0pOpo751Iai+Np/PFlEsa6KhvL
	U2mKDQLHLOsNHEQXhnAa3YxBY/DCIuwK39qKLBMyB+rpog5euMRSKiSjUvQ0ndO6
	bnp9wIxhN41WYx6IP834cyHPnFMjNbqOK+IZNV5VfpxvbXG6pNYV58z9Dw0HOmNA
	3Vk0foROajlT9frIZNeP1E9YS+P1t/Yk4+LkLQdB8KGUAhKoSqHEMkIeq5nI1E+N
	/+Pcmocp+AAUQBzK7cszwuNWdI8wYZReLZkItzATpAm/3dvVqe6wzXG3tWxQyPUf
	NKTNlw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk2wtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:24:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QIOgc6012736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:24:42 GMT
Received: from [10.216.2.27] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 10:24:38 -0800
Message-ID: <96b26045-6f7d-435f-92a0-d994d4afc953@quicinc.com>
Date: Wed, 26 Feb 2025 23:54:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based
 RDP441
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20250130045900.1903927-1-quic_rajkbhag@quicinc.com>
 <e037cad2-1462-4be7-81bb-5c41c346f765@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <e037cad2-1462-4be7-81bb-5c41c346f765@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fU5EN45o401EU2uaup6Kfq785PhLMHwG
X-Proofpoint-ORIG-GUID: fU5EN45o401EU2uaup6Kfq785PhLMHwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=926 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_102446_693124_0AF9FB04 
X-CRM114-Status: GOOD (  14.04  )
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

On 2/3/2025 7:35 PM, Konrad Dybcio wrote:
> On 30.01.2025 5:59 AM, Raj Kumar Bhagat wrote:
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
>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
> 
> [...]
> 
>>  / {
>>  	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.2";
>>  	compatible = "qcom,ipq5332-ap-mi01.2", "qcom,ipq5332";
>> +
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
>> +	 * +------------+--------------+---------------------+
>> +	 * | Q6 caldb   |  0x4D500000  |       5MB           |
>> +	 * +------------+--------------+---------------------+
>> +	 * | MLO        |  0x4DB00000  |       18MB          |
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
> 
> I'm still not super on board with this graph, since this is a very predictable
> layout where there's [something for firmware, contiguous] and [free]
> 

As per latest comment from Bjorn, will omit this graph representation in the
next version.


