Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFDEC02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2DFr8O0VMaWPwK0ueg3lGyqTuoLafEqVtZgKNF8Qq4=; b=KMM1QiD/pjqWtn8FiTLKCZ8wV7
	axsdrt9GCQ4bwhq8zbWwZvWWBSn0YoGNDURC+cEfILSTRLtb0tR3sud0om9kpwj1PD2Ubq3E8hQHZ
	csn+fpDZC+R6k7wRuxj2YSriZHH+Foe3VMEJVd5UrENvKyLZxGFOManWH1qd4WIuivcSBesWU7zVT
	OMR7tWYoJ9SLXCEfQ5wj63gjKrLMJDsZUptGyXm/xPrI5KhkpIogewKi7ePQ7vOzPx0recxmxLXkj
	BF7LrkUj6pMiyUleamlgRl+Wqxd+5C0+M24N9+GL5s5f2tL5B+0O2Ts3HPzRAtrIecuodPd+SROgO
	pLLdU+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tet0v-0000000F2BW-1Kk3
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 09:45:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tet0U-0000000F23K-41Ou
	for ath12k@bombadil.infradead.org;
	Mon, 03 Feb 2025 09:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g2DFr8O0VMaWPwK0ueg3lGyqTuoLafEqVtZgKNF8Qq4=; b=ceUG7RSQVWk08ysFo5wPJXckSK
	34vsoMx3RWifWYQEmNDxvP5kAXCpB4AhYC1JgsZPmqdNRgaEoFnBfB5RiijDI1RCNgeBWnyU3jHIl
	+uxWKqSNRSlwWzCN5f6sxZcbhR3nyw84zK2xO1cwiRH9R84J4Q6zul1lXYig39599MjFgdh2s1fJf
	U0CjtBSohvByPwMBVbpYCFhQbHLOyGMB7cGHUiXh0Y8kmJX0knD+UfeSIfhCwbqE1gP4PIEwsivqI
	Hf4iHDmge4yvt7DHbKtsCazW45JMLfDJzCoqT8NJi31eJgF/jzeOKcCxbdHFjPU4qva1C5AHJMXOI
	kUV4mukg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tet0R-0000000G2t8-3Yae
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 09:44:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5138CVjD031453;
	Mon, 3 Feb 2025 09:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2DFr8O0VMaWPwK0ueg3lGyqTuoLafEqVtZgKNF8Qq4=; b=mMpiZKc1ctumbGZH
	hhITUglLt+Sl5PWErTTybucNccie1DuSJqcK3NzyhyJiypI2EULfqbs4lytxYMRP
	HSUEdcQ7ZAo8p1NVRlYes0Bc6L7I5hTkckAHbHUV93PQPXPO+dFiAiMThYij6kf8
	xwSQ+ok5Jqf9PpRlD90V6CYRCuxwdlymSAVHOtArYTkUE0LwNtUvOy2BJX3L6v/T
	HkOPuyxjBS9tMNpAiOAh7eryTRQqDdzskKr0cslzyEOMMuCtfxavldNL8Ch9vkvl
	vZ5v6cspbxOHQOlKo2NsBhtixP++6iVEz5u3CQniSQiMg+mX46+JXBbZ12t7nMf/
	UAIm5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jt3ar672-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:44:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5139iYLN001103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 09:44:34 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 01:44:31 -0800
Message-ID: <7d5f7b4c-2a55-41c7-b85c-cb4cd76d553f@quicinc.com>
Date: Mon, 3 Feb 2025 15:14:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-8-quic_rajkbhag@quicinc.com>
 <4c9b512f-59d2-4d96-a899-5af4de2c823e@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <4c9b512f-59d2-4d96-a899-5af4de2c823e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lw-e8y6ZMt4lsEKxF5uTHuk6yG7IqSW9
X-Proofpoint-ORIG-GUID: lw-e8y6ZMt4lsEKxF5uTHuk6yG7IqSW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=986
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_094440_353538_AEA2ABFA 
X-CRM114-Status: GOOD (  12.32  )
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

On 1/30/2025 1:16 PM, Krzysztof Kozlowski wrote:
> On 30/01/2025 05:35, Raj Kumar Bhagat wrote:
>> @@ -2646,6 +2663,136 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>>  	return ret;
>>  }
>>  
>> +static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>> +{
>> +	struct device_node *mem_node;
>> +	struct resource res, m3_res;
>> +	u32 bdf_start_addr;
>> +	int i, idx, ret;
>> +
>> +	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>> +		switch (ab->qmi.target_mem[i].type) {
>> +		case HOST_DDR_REGION_TYPE:
>> +			mem_node = ath12k_core_get_reserved_mem_by_name(ab, "q6-region");
> 
> 
> Why cannot you use existing API for reserved memory -
> of_reserved_mem_lookup()?
> 

The of_reserved_mem_lookup() requires reserved memory node to read the memory and
return in the structure "struct reserved_mem".

The of_reserved_mem_lookup() would be used after we get the reserved memory node
using the API - ath12k_core_get_reserved_mem_by_name(ab, "q6-region");

In next version we would use of_reserved_mem_lookup(), Something like below:
    mem_node = ath12k_core_get_reserved_mem_by_name(ab, "q6-region");
    struct reserved_mem res = of_reserved_mem_lookup(mem_node)

