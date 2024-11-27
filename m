Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01D0D609A8
	for <ath12k@archiver.kernel.org>; Wed, 27 Nov 2024 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2AWkEyxvmsl1kvKldkRb2KMSlvYt9LKy1TqsWTIG5A=; b=Vff6ug7l75/uBCDD4Pq7fKLB95
	NE9IWYtPtfz5+4fXKtczD4EQRR7PVSQSyzsQyt0lvNF4WH13idBYNXvNp9SHxGJ6hQl3iwYLsCjIj
	RwFZqnhwdF+0cf6WsQopldMgkz4uVYbjNLXqP8JDU2JI0TlAHqGf0U2Mn94L50Y1peTjCQXqNWw2C
	bI2Ycg2uloAQkpnGOtcA30QFsSKB0IQEskd7DodW1Oz4vLOa2N8Hyicby2yGp1qSblodwgP5RwSbN
	fmM/Ylc9fEbnYrLMew6iYmYFCojiIGerJxC7ox7bcsvjtJc/h2CU2Jtt3yClN01hHhaINMa2utAku
	qi7V743Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCQV-0000000CQlk-2Kym
	for ath12k@archiver.kernel.org;
	Wed, 27 Nov 2024 07:25:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCPw-0000000CQgd-3JkK
	for ath12k@lists.infradead.org;
	Wed, 27 Nov 2024 07:24:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLZME007169;
	Wed, 27 Nov 2024 07:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2AWkEyxvmsl1kvKldkRb2KMSlvYt9LKy1TqsWTIG5A=; b=h8Fc8TA0mzTfkfDB
	tW0wPDETYDLRFUJLZX4LDurH6YMdAYN04rPUXRaAAKDgM6CxeIKKHzvGWSFfg5e3
	lzONddtNv8kAf7rbzWDdOn8FmNCISbALj25PS+8rlKPLgHDoAiS/pHF0w4iVye/+
	YIW8ZKjFY3asWlmXs1T56f6tbNVsmAaiV5Q38mucSJDQUlcDRBVQe9Pz8hbEzar4
	LjgxXG6XQOczQFL6DwX3GlsV0HRHQHCy+niOfNVHxqgJB6/3d19bQus9oScj8LZH
	nkxMVfwn7xkqqe3WZeU3V5jx6oCSALP8GAgr1DZd0huf0nf1SE0s6DOiS/4lKScB
	esmOkg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9dukf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:24:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR7Oq46012527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:24:52 GMT
Received: from [10.216.30.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 23:24:48 -0800
Message-ID: <2d10224e-102c-4508-99f4-5743588d0686@quicinc.com>
Date: Wed, 27 Nov 2024 12:54:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Kalle Valo
	<kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-2-quic_rajkbhag@quicinc.com>
 <h4xel7xh3vyljxi7jn2afqasfmbsiqjtgpvqthrviovode6cxt@ey5nnzi4dwtv>
 <708e9d22-0513-4646-aeac-2187c052e208@quicinc.com>
 <b5f352e8-19a5-4c06-b9ba-44af791f6a81@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <b5f352e8-19a5-4c06-b9ba-44af791f6a81@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a33gLwOSBQYVf_Bonnz9Mjr4doGl8QAp
X-Proofpoint-ORIG-GUID: a33gLwOSBQYVf_Bonnz9Mjr4doGl8QAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=901 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_232456_838237_6D19E8AE 
X-CRM114-Status: GOOD (  12.55  )
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

On 10/16/2024 2:30 PM, Krzysztof Kozlowski wrote:
>>>> +    description:
>>>> +      phandle to a node describing reserved memory (System RAM memory)
>>>> +      used by ath12k firmware (see bindings/reserved-memory/reserved-memory.txt)
>>>> +
>>>> +  qcom,rproc:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      DT entry of a WCSS node. WCSS node is the child node of q6 remoteproc driver.
>>>> +      (see bindings/remoteproc/qcom,multipd-pil.yaml)
>>> DT nodes are not children of drivers. But other DT nodes. Explain why
>>> this phandle is needed, what is it for.
>>>
>>> To me it looks like you incorrectly organized your nodes.
>>>
>> This phandle is required by wifi driver (ath12k) to retrieve the correct remote processor
>> (rproc_get_by_phandle()). Ath12k driver needs this rproc to interact with the remote
>> processor (example: booting-up remote processor).
> That's driver aspect. Why does the hardware needs it?
> 
> WiFi is the remote processor, so I would expect this being a child. Or
> just drop entirely.
> 
> You keep using here arguments how you designed your drivers, which is
> not valid. Sorry, fix your drivers... or use arguments in terms of hardware.
> 
> 
>> In next version, will correct the description based on existing bindings (qcom,ath11k.yaml).
> Sorry, let's don't copy existing solutions just because they exist.

In the IPQ5332 platform, the WiFi component, known as the Wireless Control Subsystem (WCSS),
functions as the wireless controller. Additionally, there is a separate hardware module, the
Qualcomm Hexagon DSP(q6 remote processor), which is utilized for offloading WiFi processing
tasks. These two hardware modules operate in conjunction, necessitating a phandle in the WiFi
node that references the remote processor. Despite their interdependence, these modules are
distinct from a hardware perspective.

