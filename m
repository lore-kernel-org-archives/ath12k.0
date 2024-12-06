Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416BDE7716F
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 04:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP542XJNSvkrzwUEMLEQpg0/BQLxgfqDs8i4N0BglIc=; b=2hFNJ0wlfJXk24QgKvU45V9670
	A1tBKPIq0i+CAOoPjb/9Z61Ex/GqGb8eTYzaiSu8MkovScqFeGWJMaTjUAdu9p77asxjhXTlmn+YT
	GbdG6Xi2T9O7Pns9G1K+7fPnobLTVworw/bKSVJft5sHPYKW3Yz0xPFduss+tNI5uiopL6bmjtff1
	pQazXTKyQnsG5KYhZD/dT3RqErn4S4XawintYSADdfQJGLbdf+gbJvjvm5ULyuaIop1T+RSy42dmj
	iFs4nxTWBDUknIlhDeaIjc70Vbl+4NuNEn3ZnpopNa3K10j7XwtZCPvRS8+YRv0XrpMQb+L6yfk97
	t2DFwQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQ3E-00000000WdZ-0BaS
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 04:34:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQ3A-00000000Wce-48RJ
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 04:34:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaLpa006894;
	Fri, 6 Dec 2024 04:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TP542XJNSvkrzwUEMLEQpg0/BQLxgfqDs8i4N0BglIc=; b=IQX0GNBErrXSp8tf
	9trCowkcz2k/aRmLWprqO7Ka+LK8yFH32UQfaY990ZgQtUDhDwRwNGdZKgFdp0a/
	+sGHVW07NEZLHprzxfIPuB+rwFTWdPs7eMHGHd3EWhF/145dJzzLZMNmiDa1nPKC
	qNyOCkdieoaSDStBVDbknDoBHmYIocqTVD4ji3B3ntscSSC2ExPZl4gstAfV645s
	b/fGwP/JdP+rT10uvgohrmlG13a1J6/Oj/VshmyxIXN4s+SwjxiTb3FSsH/+i0+j
	7FjAhru4WHDwAfJ0Oy/1p1rJ6CiOWiz/ytkwp00Ef24TnwbHtIisKrq3qR2n/Gd7
	qRlHeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben89rv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:34:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Ye7i008688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:34:41 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 20:34:36 -0800
Message-ID: <30e5d714-2e52-4a0e-9dc8-b6cacf6ad382@quicinc.com>
Date: Fri, 6 Dec 2024 10:04:25 +0530
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
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZegeMDTdfZJGKPTq4W6wq0pR_khR401k
X-Proofpoint-GUID: ZegeMDTdfZJGKPTq4W6wq0pR_khR401k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_203445_049839_57EDDAD2 
X-CRM114-Status: GOOD (  13.24  )
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

On 12/5/2024 11:12 PM, Konrad Dybcio wrote:
> On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
>> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>>> memory during QMI memory requests. This memory is part of the
>>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>>> hardware parameter and provide this memory address to the firmware
>>>> during QMI memory requests.
>>>
>>> Sounds like something to put in the device tree, no?
>>>
>>
>> This BDF memory address is the RAM offset. We did add this in device tree in
>> version 1. This is removed from device tree in v2 based on the review comment that
>> DT should not store RAM offset.
>>
>> refer below link:
>> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/
> 
> Right, I think this could be something under /reserved-memory instead
> 

Thanks for the suggestion. However, the BDF_MEM_REGION_TYPE is already within the
memory reserved for HOST_DDR_REGION_TYPE through /reserved-memory. Therefore, reserving
the memory for BDF_MEM_REGION_TYPE again in the Device Tree (DT) will cause a warning
for 'overlapping memory reservation'.

