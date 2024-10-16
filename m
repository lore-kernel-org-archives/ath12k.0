Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0555AD1AD2E
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VgZz4yLtQii/zVmyg9PHNVDdQYpnxH1Pv+8yYlKqxM=; b=UCOP8dY0jNG1lJ316+eNfnCHJ7
	9KWUgHKby2u2GlLXcAGSigbqMgih5gTWh6vdxGv9Qf58iUmzZD8Q2VtMh6BCkn0CW4a1wrGddEFnI
	BKvUXmoJyM5n85IN92+I3xQ201sU7kTZzcx4MBwKYzsPXOk7blgg//XHkOzdVndoGyCNhcD3GLpVU
	Ke07Yiaei/pJ3Y7+J6WCujAmh/DSAEg51w15p63o0A0SAAqO9G30xB/2wJi1k0KyZ9wo+6dXHETf/
	AWMJM5gEEWPx+HDefkvqQHOnBv6SzDLMZa5rJIWmzXA2DNXwzl3YekgCUZJ7XSJCbQCXVdvc94hhy
	2hRbbLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zkf-0000000B6lx-2FrX
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 08:51:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ziA-0000000B69y-10HW
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 08:48:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8PuON014334;
	Wed, 16 Oct 2024 08:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4VgZz4yLtQii/zVmyg9PHNVDdQYpnxH1Pv+8yYlKqxM=; b=kVIeTejcPqWkS1cI
	rxdKdfprP5VIAukccatnHx3devfaHQuNx1LaNDVhYtJXWCwTZ0ca9TxqgEaeJYdh
	6DtVkBKnuU9Jd1yg3PnXJqFIA1sdiQdkFO2n33amqPcJvRYAko6nI5GGw1bth/Ar
	pqaLgCdYpXCTMOTs84N+19VaDQ5IcPB/W3A2U9/jQTPSSskWs0brnuKiOhDeZY8d
	AlVRg6DbumKysnnGscMAHg6FyDlD6vlvZx+z11rlXFBQw1CGj0ZRPhxWjFdlBpb+
	QZpOGhgKNF3sJFEgWwKzbXI/sjGBKvw5+ps4I1OlEh9CzX2ue9Odi/tXjSl7OU/y
	mwaISQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a79h8jv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 08:48:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G8mnYa006852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 08:48:49 GMT
Received: from [10.50.26.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 01:48:44 -0700
Message-ID: <ed906492-a82a-4c20-9966-26d862ec03c4@quicinc.com>
Date: Wed, 16 Oct 2024 14:18:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: add wifi node for IPQ5332
 based RDP441
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
 <20241015182637.955753-3-quic_rajkbhag@quicinc.com>
 <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FqqHyzGn5_myvUH1deseV5_5ag_P7ZuJ
X-Proofpoint-ORIG-GUID: FqqHyzGn5_myvUH1deseV5_5ag_P7ZuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=874 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_014854_431193_4E076ED7 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On 10/16/2024 12:28 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 15, 2024 at 11:56:17PM +0530, Raj Kumar Bhagat wrote:
>> RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
>> device.
>>
>> Describe and add WiFi node for RDP441. Also, reserve the memory
>> required by IPQ5332 firmware.
>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Don't send one DTS patch in 22 patchset targetting different subsystem.
> Imagine, how wireless maintainers are supposed to apply their bits? 21
> commands instead of one command?

Sure, we can drop the DTS patch from this series. Will take this patch
separately once the binding (qcom,ath12k-ahb.yaml) is merged.

