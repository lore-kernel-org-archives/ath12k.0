Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37835E7717D
	for <ath12k@archiver.kernel.org>; Fri, 13 Dec 2024 04:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRtKfWOTxHgeaHEN5DPAcru9H3wyqs+TXKFWq0Pxzcg=; b=khjHT8D1vgO0FJ4Zz9WfFwdBiL
	YDWtOsg3oKUmsty+WlA+DQOMcmvk0RIhrt1YkEMtjR2EZQ4OnWXqNCXiZy3mflsVyBK+XJ9/8coxX
	GF4tfqh9smO0Y4+VU0MvrixZaHRtsYQoKYWd5pj0IMKwull9XUXIlfNrA0FJdlmuj8GuPQ1uapt/a
	KvuDFe7ZvBr5seewhi8lDrIWY6lBfBcnDmuLMPo5+rlN0x9nUwzK7K1EQFpNHys9FcVoXsXrOOiu0
	ibmaIQW2YPnoyLZ4XYKdUVUvBuyZDv4j2vj8oXbSd86+j9Xt6GnABjOtaHEH1EpDYHZqmLyIqQaQb
	hFd9SmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxIl-00000002h4W-47Tm
	for ath12k@archiver.kernel.org;
	Fri, 13 Dec 2024 04:29:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxIi-00000002h3G-1B5l
	for ath12k@lists.infradead.org;
	Fri, 13 Dec 2024 04:29:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHaiT9026866;
	Fri, 13 Dec 2024 04:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRtKfWOTxHgeaHEN5DPAcru9H3wyqs+TXKFWq0Pxzcg=; b=OYLiRB8Z6xuLGRWW
	NxKQ8ai6SDFev3SX4cDN5c0ez0sW45yyBhJtPc/5Atc5NHdrmq/xHLiP4B9DNroa
	cw6RETUvNzVbeR2zO3vUIGsz2w/Xjh37VyD2Is3BYtxLXw8cmCIcHZhfw30d9Cfz
	xPorKLaNE4eHKqbpXdcTdsNG5YmVGMv2ClwmXW/SID3klT92YzXkBSrQixRjuBH2
	04dOwxipjw5stOvmC/T9voQLdF/1mbNYra5m/vnXskvx81RXXOtHIedCa2xLl1Lk
	QIO/QEjQHNTwCeEs2AGdSvIlDQiXEC7x1JPy4Bki3l8l6ZQ7rxo9PneUfGRaoOP+
	aNjBNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40n2px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 04:29:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD4TAgm001630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 04:29:10 GMT
Received: from [10.216.12.63] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 20:29:06 -0800
Message-ID: <980d4a8f-2ea8-4138-8885-5ace5d87e0d2@quicinc.com>
Date: Fri, 13 Dec 2024 09:59:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
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
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
 <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
 <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
 <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
 <30e5d714-2e52-4a0e-9dc8-b6cacf6ad382@quicinc.com>
 <e63af513-5fd8-40b0-a1b2-daa9821ebf5a@oss.qualcomm.com>
 <b3581663-8dc0-44d4-9395-df385316bb09@quicinc.com>
 <e3dff1d0-989c-48db-9fd6-6b3c209d1452@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <e3dff1d0-989c-48db-9fd6-6b3c209d1452@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cBaRtzOHvgnCQAhClYx1Ulc7ewwG_TwU
X-Proofpoint-ORIG-GUID: cBaRtzOHvgnCQAhClYx1Ulc7ewwG_TwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_202916_410753_EB634697 
X-CRM114-Status: GOOD (  15.43  )
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

On 12/13/2024 5:48 AM, Konrad Dybcio wrote:
> On 9.12.2024 5:23 AM, Raj Kumar Bhagat wrote:
>> On 12/6/2024 4:19 PM, Konrad Dybcio wrote:
>>> On 6.12.2024 5:34 AM, Raj Kumar Bhagat wrote:
>>>> On 12/5/2024 11:12 PM, Konrad Dybcio wrote:
>>>>> On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
>>>>>> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>>>>>>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>>>>>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>>>>>>> memory during QMI memory requests. This memory is part of the
>>>>>>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>>>>>>> hardware parameter and provide this memory address to the firmware
>>>>>>>> during QMI memory requests.
>>>>>>>
>>>>>>> Sounds like something to put in the device tree, no?
>>>>>>>
>>>>>>
>>>>>> This BDF memory address is the RAM offset. We did add this in device tree in
>>>>>> version 1. This is removed from device tree in v2 based on the review comment that
>>>>>> DT should not store RAM offset.
>>>>>>
>>>>>> refer below link:
>>>>>> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/
>>>>>
>>>>> Right, I think this could be something under /reserved-memory instead
>>>>>
>>>>
>>>> Thanks for the suggestion. However, the BDF_MEM_REGION_TYPE is already within the
>>>> memory reserved for HOST_DDR_REGION_TYPE through /reserved-memory. Therefore, reserving
>>>> the memory for BDF_MEM_REGION_TYPE again in the Device Tree (DT) will cause a warning
>>>> for 'overlapping memory reservation'.
>>>
>>> Then you can grab a handle to it with of_reserved_mem_lookup()
>>> and of_reserved_mem_device_init_by_idx()
>>>
>>
>> The memory HOST_DDR_REGION_TYPE is a bigger memory around 43MB, while the memory
>> BDF_MEM_REGION_TYPE is smaller around 256KB within HOST_DDR_REGION_TYPE, Using the
>> above mentioned API we still have to store the offset in ath12k to point at memory
>> BDF_MEM_REGION_TYPE from the start of HOST_DDR_REGION_TYPE.
> 
> That's still way better than hardcoding platform specifics in the common
> driver
> 

Sure, I agree. I'll update in latest version to store the offset for BDF_MEM_REGION_TYPE.
Thanks!

