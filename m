Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81D8C021B8
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK3OEtZglCgu0R7nEVLQN2ZciwLgMdqHWEcxO4yfvYk=; b=sQOK5GFzeoRDmjWxrBJHNxmllJ
	IIQ9RWxrQ8dmP+5hZyGh+PDA8OZ6N+FqKnPR2/583kk6nNSyKFRUXe4lmhmclYTveFjzhdCKwejtY
	Mn+Q7kmsQM4vVhoTyGh8Fr26P7K2HJU79+NY4JUpyF2qKL4ibFKpsVh1raKliLBt8fl4sDWE9YDm/
	RLrt4s+noQF6iZrvxrxoDYkFDA/vKDQjiSyIvcxiCcQnU1ityLpoTJ0UXOBLe8G75YUs39Vk+uAmN
	ASa/9i+CUx8useUsl6mCe2gASBfqgo+wo0kdpjXaTA421XdtlvhqHwyvm5/uT2gcWVb79uFANsbYo
	4PqUHJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLtD-00000004s8q-2Lls
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 18:12:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLrb-00000004r0c-2zZL
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 18:10:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QABfer017692;
	Wed, 26 Feb 2025 18:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UK3OEtZglCgu0R7nEVLQN2ZciwLgMdqHWEcxO4yfvYk=; b=cKy6LedyUGC4b41E
	djkwQAkYxcEdDS1/Z6x2BAvo0dff7z5ppXWNNJ9FwbUhJ+kZIRzmvA4obhJrN5gD
	zgWeR95pS5hMCqmYb1dlTDYiq/spPxXKkIdwlj+oDtn90RBzLux2G0+NwIrWzOVP
	moUMPQUZ0MpIGDVNrueQHQ/nMnfq+d7VQq0JW3kjcEFGF4aW+br+BbZFzFEgAsWP
	rOz9K/Ui1vrt8DSYyrObgiEUFQQUOoeOl2sfPwuuHingaEOr9DVGtx1RAhPruiVk
	k2knsVULYN9AhIQJkkxdFRaXHHMTTo0DFXGd6RVTGyITBdLCW93hquphsHiP3ibD
	V9P8AA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn2wca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:10:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QIAPdM011606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 18:10:25 GMT
Received: from [10.216.2.27] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 10:10:22 -0800
Message-ID: <cc3c73ac-409c-479f-8c51-11c6d60dd2f8@quicinc.com>
Date: Wed, 26 Feb 2025 23:40:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] wifi: ath12k: Enable IPQ5424 AHB WiFi device
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
 <3db11710-8ad7-439b-8674-ce07fa221920@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <3db11710-8ad7-439b-8674-ce07fa221920@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xp64ga6p3dXO-sWUO8H3PHQjjKvwwnXi
X-Proofpoint-GUID: Xp64ga6p3dXO-sWUO8H3PHQjjKvwwnXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=618
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_101031_902734_971C4D99 
X-CRM114-Status: GOOD (  11.64  )
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

On 1/30/2025 1:07 PM, Krzysztof Kozlowski wrote:
> On 30/01/2025 06:18, Raj Kumar Bhagat wrote:
>> Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
>> AHB only supports IPQ5332 WiFi devices.
>>
>> The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
>> configurations. To enable the IPQ5424 device:
>> - Add the necessary hardware parameters for IPQ5424.
>> - Modify the boot-up sequence for ath12k AHB to accommodate the
>>   requirements of the IPQ5424 device.
>>
>> Depends-On: [PATCH v5 00/13] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
>> Link: https://lore.kernel.org/all/20250130043508.1885026-1-quic_rajkbhag@quicinc.com/
>>
> You marked this a RFC, so this is not ready, but nothing explains this
> here. What sort of comments are you looking for? What's incomplete with
> this work?
> 

Only the basic validation has been done hence marked as RFC. For the next version
v2, we will have complete validation and will change from RFC to normal patch.

