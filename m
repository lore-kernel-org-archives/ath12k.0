Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E5C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Znukd4a9vLSq9iBLbwtwUpukVCClnHX+oVKK1a4Xt0=; b=GpPyh6W6hn3LD3HuUDSQF8kGbK
	FLnmgIRKTUObo+hJy/AhNeO8p5M3OwKc5mVBg5jPtNxu/WhBXPvoo8oEb8v2OZC8M0JHJpnIfGnxb
	2yXqYWJucr0KlgcCzKpOliAH5jSH+4veFn8xSBzbl5m5QyDfT6AN8uzMtxDcG89uFtqZt8J03SLMF
	8Qz68GewKeX9YFNLfPCMzAgGOk6A2CCnAO2H16xsP6Yi5t9N2sbatofCFxImInK/swC0BSFsk7M5Q
	PzvLPcex9Q5yNi9VMiwqVxWQsYWgNdrnVaAKlabTeDyluYstjRKyDHD9u8HMBuLDKsrygjiIpllvd
	Tni3Nu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l60-0000000GMUI-3Hs0
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 17:28:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l5t-0000000GMRa-0Tzy
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 17:28:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448AdwGO004571;
	Wed, 8 May 2024 17:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/Znukd4a9vLSq9iBLbwtwUpukVCClnHX+oVKK1a4Xt0=; b=TF
	zvu3TMcIOUwm8GBVp/ldWxW36oCkAt4ZOYYTGvC6F3+1sO7FtJb8CAu8VbhWSOIo
	QfVffpwYP91IfD99gHNMA01AYaD7Ke9/WSDuek/1G3CAAyiYj6UYBp7LAG+A4Rzu
	pS5NFr96cPwgbVA883vpRbdd3F79RT670FWa5+bw2ZCwn0BovKwdkCEmTs8GwilF
	umqb1KVhdsAyboNyfDcd/Jm2CozMHyPwlSn+QBqGnoehdIioWWJwWXNSFoAaAjvZ
	2kuSB36mSJYMj+dJaCQC8cp90m/wcTSLqNWuqjYQvJHGa+cfgEVLScmz7gfHnx/Q
	gCKn1or/wKIFGVW3qlrg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u9905x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 17:28:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448HSWkJ024231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 17:28:32 GMT
Received: from [10.227.91.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 10:28:32 -0700
Message-ID: <88beaf14-5b78-4d8d-a196-4f3ce4f2c361@quicinc.com>
Date: Wed, 8 May 2024 10:28:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/6] wifi: ath12k: refactor SMPS configuration
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
 <20240425221902.11553-6-quic_pradeepc@quicinc.com>
 <d7b57775-711d-4180-b3de-5ab59aad0ec6@quicinc.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <d7b57775-711d-4180-b3de-5ab59aad0ec6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xGDdwCY9mQJIq5d_zXVVA7uCnvROAnfi
X-Proofpoint-ORIG-GUID: xGDdwCY9mQJIq5d_zXVVA7uCnvROAnfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=865 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_102842_271653_21FA2BC5 
X-CRM114-Status: UNSURE (   7.16  )
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



On 4/25/2024 4:40 PM, Jeff Johnson wrote:
> On 4/25/2024 3:19 PM, Pradeep Kumar Chitrapu wrote:
>> Move fetching SMPS value to a new function and use u16_get_bits
>> to extract smps value from capabilities. This will help in
> 
> s/smps/SMPS/
> 
>> extending the functionality when SMPS support in 6 GHz band gets
>> added in subsequent patches.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> 
Thanks Jeff..will address in next revision

