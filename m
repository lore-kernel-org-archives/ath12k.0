Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D08D0C5F8
	for <ath12k@archiver.kernel.org>; Fri, 25 Oct 2024 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IgLGyzdm/Oz8+57j6vgG+Bixk6o1KsOnA+JBxBzS9Y=; b=DmUuxqP/kti1ZOCq8yUNe9MLfV
	FJvJSPALrLUTHCaHtGJPlkdEewXp/E/q5AWm0WFfCZzVr7q2subYB3DirSghmgcYIOhyG1lXnb4OY
	pAm/yMNmKBlYiMBYc/aNub7aWVeXcoctlDW1uw48fsAEFYm+IhW1R6TCd7vweMJF0bG5pPUJjMnhT
	+HP+nizqKSjoWtkjiVFFWCOHn094gJPtSSMva/1FOmZxgL7Cro8ptKLw03/lq+Q5M9SvIwRzvxo7a
	cZBsrCQvQH92ITtD0UtbAWfasC+V9XT6XjA70HDrjsTtLq1/ORlATGYXUTMWyoFUu3bJkw8gi/4+K
	35gT7eLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HGA-00000003JX6-3UeE
	for ath12k@archiver.kernel.org;
	Fri, 25 Oct 2024 10:09:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HFN-00000003J9x-2iIe
	for ath12k@lists.infradead.org;
	Fri, 25 Oct 2024 10:08:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0mmpb004988;
	Fri, 25 Oct 2024 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IgLGyzdm/Oz8+57j6vgG+Bixk6o1KsOnA+JBxBzS9Y=; b=hAmoK8NpDQkVoM+C
	Gp+hHQSnPI2SOW/HB95nsNQSpeApGf1zR8iS+ZgzCyImmVCQsnqj7QpvmcoF7dl5
	5XOvf2fzxd0SXntL6RfhcauMFytd9mzQs01NvdjywUzIjtyOKtpFxR2X8JuK+T4V
	AQxI7yYM6AJz6KJ3gQDhVIKmjFo754A54/9GFeJYvKnj3lDhvHM9kOR+R2t4KTQk
	H2agamty4Uiv+KvWuW/03W2+59kI8hxCqfK2WmOIDxK+eyc3ZaASCWg3IAazZG2Q
	Qt243QgSRDRvPeIc6gAtlWVnvLCkl9Rh7n+h6Dk1MhgvZzOwDmF3hTOnm1KEEDjJ
	pk5SjA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em688gvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:08:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PA8fKp025900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:08:41 GMT
Received: from [10.151.41.25] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 03:08:37 -0700
Message-ID: <db0a6797-0e51-45b2-bf8a-58d53d8cf959@quicinc.com>
Date: Fri, 25 Oct 2024 15:38:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: wireless: ath12k: describe WSI
 property for QCN9274
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
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
 <20241023060352.605019-3-quic_rajkbhag@quicinc.com>
 <c7c6bf7e-0f79-44b1-aed4-db1fdbedc9a8@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <c7c6bf7e-0f79-44b1-aed4-db1fdbedc9a8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cTudtVr9yD2hfIhIKlDkE9f4wgUtdiAW
X-Proofpoint-GUID: cTudtVr9yD2hfIhIKlDkE9f4wgUtdiAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_030845_982481_DB24A4DE 
X-CRM114-Status: GOOD (  13.45  )
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

On 10/23/2024 12:30 PM, Krzysztof Kozlowski wrote:
> On 23/10/2024 08:03, Raj Kumar Bhagat wrote:
>> QCN9274 device has WSI support. WSI stands for WLAN Serial Interface.
>> It is used for the exchange of specific control information across
>> radios based on the doorbell mechanism. This WSI connection is
>> essential to exchange control information among these devices
>>
>> Hence, describe WSI interface supported in QCN9274 with the following
>> properties:
>>
>>  - qcom,wsi-group-id: It represents the identifier assigned to the WSI
>>    connection. All the ath12k devices connected to same WSI connection
>>    have the same wsi-group-id.
>>
>>  - qcom,wsi-index: It represents the identifier assigned to ath12k
>>    device in the order of the WSI connection.
>>
>>  - qcom,wsi-num-devices: Number of devices connected through WSI in
>>    the same group ID.
>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  .../bindings/net/wireless/qcom,ath12k.yaml    | 61 +++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> index ecf38af747f7..6c8f97865075 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> @@ -19,6 +19,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1107  # WCN7850
>> +      - pci17cb,1109  # QCN9274
> 
> Missing supplies. How does the device take power? Everything through
> standard PCI pins? Are you sure? Please submit complete binding, so with
> all required properties.
> 

QCN9274 gets powered from the standard Pcie (3.3 V) supply. No additional
regulators are required.

