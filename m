Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6BEC0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E/11L6bTr/abK1jSaUDzqcbdGdMmdVqWMAVsWUG+4E=; b=G7poqEs2gzTY53qjTnilJQmcTX
	xJ4hwobkxRlb3bzznG9KPLf/EBq/TEpJuaWDIGf94WWPWh/u4aHDa3Rrcv4gqF+7X3K4rTtJz5fnI
	wAsPQWZujjdKGwr8pEkChSh0cR4EZf2ZkMiLCSKzohDE3R8pcD0KtxbbhAlfOIqGh2B6n2ZAh8Yz5
	9HkE5ZUzBoS4kb9waegOY0YAqOMVDdv8wTAeutq3CHWHPQ1NuOrWTSwJToFLdLraMLfideddCouMh
	TbGw2OsTNS6KB+qChN0afdy2XUDOjHSfY3FWsIr3limZR4vLQmmZ/CiT2v7VHUuFKFPYHgtpWTwH5
	H83DjbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpU3-00000005S3u-3VRN
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 17:34:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpU1-00000005S3L-1g0I
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 17:34:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SFqVbj032373;
	Tue, 28 Jan 2025 17:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4E/11L6bTr/abK1jSaUDzqcbdGdMmdVqWMAVsWUG+4E=; b=FRP5Xavkct1J9Pvz
	gUSLKTIu2z9q+uhaaQ3tMvvYYaUz/20xU10LcUQ5TUbalMWsEuwQGJsuJIhPsxic
	HXOny3uNV3E6f3wbft52DYuUsfri2UZFqBeAsfVDNleJlaGtU9pzOfv/CRhQ6QkC
	mew70Ob7aSvPY+H/a54Up/xcq47q+54f+8mZykqAhvs2+y6Rmc+DvNLdw9V4hb6Q
	57Bkq6QaQQjCSvsW99egU1yUeFwNQHTJ2eXSQZat4s3Cs4gODMphgKoVd9vwZdf9
	aqNtLqf4FsFh/eUfSCl+o8X9FcU7762NT4yxd74513SYrYzsTcxXwvXowlJIcyDW
	ztxPtQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f28y084n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 17:34:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SHYbjV024257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 17:34:37 GMT
Received: from [10.216.5.143] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 09:34:33 -0800
Message-ID: <0de7039c-d94e-4857-922f-29274d8632d9@quicinc.com>
Date: Tue, 28 Jan 2025 23:04:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: describe the ath12k AHB
 module
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
 <20250128091012.2574478-2-quic_rajkbhag@quicinc.com>
 <0ca970e7-cc9a-4853-86de-5f01dc6d82a2@kernel.org>
 <1bd2dca3-1fa0-424d-95e8-cdb887f1d9e2@quicinc.com>
 <112fe636-1328-49f0-8f0a-395764e118c7@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <112fe636-1328-49f0-8f0a-395764e118c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: duoJqxOjIVtVhRNbowjgCOArEyuFRZEA
X-Proofpoint-ORIG-GUID: duoJqxOjIVtVhRNbowjgCOArEyuFRZEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_093441_449174_F47BFB53 
X-CRM114-Status: GOOD (  15.41  )
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

On 1/28/2025 3:51 PM, Krzysztof Kozlowski wrote:
> On 28/01/2025 10:29, Raj Kumar Bhagat wrote:
>> On 1/28/2025 2:47 PM, Krzysztof Kozlowski wrote:
>>> On 28/01/2025 10:10, Raj Kumar Bhagat wrote:
>>>> Add device-tree bindings for the ATH12K module found in the IPQ5332
>>>> device.
>>>>
>>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>>> ---
>>>>  .../net/wireless/qcom,ath12k-ahb.yaml         | 317 ++++++++++++++++++
>>>>  1 file changed, 317 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>>
>>> It was v4, now v1? So entire previous discussion and feedback is
>>> missing? Go to previous series and implement entire feedback. Then use
>>> proper versioning, proper changelog and make it obvious/understandable
>>> to us, instead of sending v1 after v4 in entirely separate thread.
>>>
>>
>> I was asked to send DTS as a separate series, this is a new series for
>> DTS hence stated with v1.
> 
> 
> But we do not talk about DTS here, but bindings.
> 
> 
>> To address the undocumented ABIs we have changes in dt-binding and hence
> 
> That's v1 so how it could have changes in the first place? Unless this
> is v5?
> 

Sure, I understand your point now.
I shouldn't have sent dt-binding here along with DTS as v1. dt-binding should
go with wireless patch-set in v5.

Let me know your thoughts on the next steps:
1. I will send v5 for 'wifi: ath12k: add Ath12k AHB driver support for IPQ5332'
   along with dt-binding.

2. In a separate series, I will send only DTS changes as v2, considering the
   review comments in this version as v1 for DTS.

