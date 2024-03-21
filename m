Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53985C6FD1F
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27Ky3glqmxTXku2vVHIr0BA9XQzJYRv7uZ7n+hO69cI=; b=OvxYsBB0AvNwvH/ZQfj7oKp6hw
	vLwapMI3/Lb6qy/FB1G4X5SMvvRXjME80VnMsKVmis77McTm3jbZzcSN5ZpbF3F7eSnwLSo+fpFE6
	EXY07d1TTzpLePmE2xCvp8gCQ6z+jsIzRvZsolnTYP/vtzgSc4h5EePy4Ke3/eSPzerbMKc6u25yp
	F2b/7F4W+YRFQ77i18FDpUPvss6kcn0LtI4eFw+x9tEIryj+euqNyV97hflNB6DIgBSee8gKBtXIe
	PzOptJewSVQlWXcM5v4+MkjyPeKw7BbNQfgLArSimHKeXUTWQkMqp+dAVVFfVfsHlyRiedpNMnrh9
	5hkQVzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOYP-00000004Sai-09Q2
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 19:58:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOYN-00000004Sa5-04bd
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 19:58:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LGDYQi023831;
	Thu, 21 Mar 2024 19:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=27Ky3glqmxTXku2vVHIr0BA9XQzJYRv7uZ7n+hO69cI=; b=H7
	ojeDnqulVo4iYNnYkfXUvBZD2AmlVVeuPnKWRWcV7eckcjCUbndLvpKsGHPafwCW
	q+HhLjsBc5fxoAPt7KYnp7kZRpylk8LaAy793X2R7iFTrkevQ10kg2e2PgoAHbgU
	+8m1LBREFk6qx3bh6FeheioCc8k+VTiAK7Ab2FvDKRhCwqc/19S61K9qBpKGjJN7
	ux5ZzFSJhM3PboTvidlbjeoumXCDr/PCcwIvMFRy/w3AvJ5OCiiOthzDNOY6DQ6A
	1APx91Etu6HPzf5dj3J3sKTSwewUI+KtWy+tG4e+rA4Tn9cCuGOd9EOi5c0SH5AK
	zUzSZjF5r/FW6q0tob1A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0r7q8ggn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 19:58:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LJwF1I014506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 19:58:15 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 12:58:14 -0700
Message-ID: <5f1d40ba-d1cc-44c6-b7ed-de79af145c20@quicinc.com>
Date: Thu, 21 Mar 2024 12:58:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add display tx and rx bitrate for 11be
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240104032202.19472-1-quic_lingbok@quicinc.com>
 <efd81ac0-8b82-43e0-aef3-44313a5187ba@quicinc.com>
In-Reply-To: <efd81ac0-8b82-43e0-aef3-44313a5187ba@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1NtiKi34HXfEVQOemCW9aJQIzTN0fP6J
X-Proofpoint-GUID: 1NtiKi34HXfEVQOemCW9aJQIzTN0fP6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=760 suspectscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403210148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_125819_215167_9668A039 
X-CRM114-Status: UNSURE (   8.84  )
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

On 1/4/2024 8:50 AM, Jeff Johnson wrote:
> On 1/3/2024 7:22 PM, Lingbo Kong wrote:
>> When AP is in 11be state, STA's tx/rx bitrate display error value using iw
>> dev wlan command.
>>
>> In ath12k_dp_tx_update_txcompl() function, not handle the case when
>> pkt_type is equal to HAL_TX_RATE_STATS_PKT_TYPE_11BE, so add a else if
>> statement to handle this situation.
>>
>> In ath12k_dp_rx_h_rate function, not handle the case when pkt_type is equal
>> to RX_MSDU_START_PKT_TYPE_11BE, so add a case statement to handle this
>> situation.
>>
>> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
>> tx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>> rx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 9 EHT-NSS 3 EHT-GI 0
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 

Tested-by: Owen Mesh <owen.mesh@gmail.com>

