Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3831C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=claHLXbH5lmJ3EZDLUdZVqkZ81FgUMtb2qbwvcKR/tA=; b=Ut7G7MIEsi2+tTXnwYsNDtqOuh
	m6h8iS1PQaX/mR024V2xxJtJcW/8nBL6k7D6N4Wx/Lfr4Qmv7LatBBJ8PJS9JJ0Dp1Xuc8ASmKmTA
	k7njStRuqNTWRFbvlkrEig9U2A7DpE0OuHGStP+hLmaS/13PfvrgfAcPCvCmDzOlsLQ4RXDUfyOoq
	OP/FF7nhFtKrdvrnS1cyKQVX9E63ZSorP2/ZoR4Q3d7/hkwLD1vGHQZBOxjNvJ7W9grcorVrqfBZR
	c6MJu25KSTyIKxHc8MCbdFTWlgCIvYRn3s8kjx56zrIMyF9GK0qY2OU0Icycce/m8KCe0SDUznDAV
	JG/9mB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchuN-00000004XW3-1ouO
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 09:29:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchuK-00000004XVV-3FXz
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 09:29:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0VocD002950;
	Tue, 28 Jan 2025 09:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	claHLXbH5lmJ3EZDLUdZVqkZ81FgUMtb2qbwvcKR/tA=; b=K5N5u7lQvCwlwJOo
	BQBzHL0v09pQ9KBzSWq+FDxrBAZtlK6xqv7a6A72oK7fzXcNzTMM4Te63cFTLfVg
	R7ZRrqiIm0ne0ctJHDs+jrKRoT21rAZaKnV8+QlYFtGJvHAfUs8QXWEtlXjFLMwW
	mfOwjs5AM/vAkiU9P+yI27oeNtcnBkvYgolobDFwuMJ3WxMyXcJi3ToGrDTQ5bAh
	mqnyTjbpAGnpj0Go4oTADRfzZDNPQbAb2M7Kdt7aoXRuD02Q0l0CpZXqz+VdwNBr
	yJwLLEryAahjX4yyxjqU+rToX1ZN089Bpiv30HFmfWjYjyhuY7CA55nnmHBjWTgS
	y/eTpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44emry0ws2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:29:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9TGxY001567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:29:16 GMT
Received: from [10.151.40.239] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 01:29:11 -0800
Message-ID: <1bd2dca3-1fa0-424d-95e8-cdb887f1d9e2@quicinc.com>
Date: Tue, 28 Jan 2025 14:59:08 +0530
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
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <0ca970e7-cc9a-4853-86de-5f01dc6d82a2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: whHjXphh8AbHOZkHJhbuJxESvrcjNOY5
X-Proofpoint-GUID: whHjXphh8AbHOZkHJhbuJxESvrcjNOY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_012920_953219_76D0708A 
X-CRM114-Status: GOOD (  13.43  )
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

On 1/28/2025 2:47 PM, Krzysztof Kozlowski wrote:
> On 28/01/2025 10:10, Raj Kumar Bhagat wrote:
>> Add device-tree bindings for the ATH12K module found in the IPQ5332
>> device.
>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  .../net/wireless/qcom,ath12k-ahb.yaml         | 317 ++++++++++++++++++
>>  1 file changed, 317 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> 
> It was v4, now v1? So entire previous discussion and feedback is
> missing? Go to previous series and implement entire feedback. Then use
> proper versioning, proper changelog and make it obvious/understandable
> to us, instead of sending v1 after v4 in entirely separate thread.
> 

I was asked to send DTS as a separate series, this is a new series for
DTS hence stated with v1.

To address the undocumented ABIs we have changes in dt-binding and hence
corresponding changes in driver as well. Let me know If we could send the
complete series as v5.

> I also do not understand why this is sent to arm soc. That's wireless patch.
> 

All the email list are as per - './scripts/get_maintainer.pl'

