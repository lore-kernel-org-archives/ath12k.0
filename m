Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0921C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRZ14mxC8d07XCdoMoa5RtYRF7xwfFXScdD4Cm7odQo=; b=uSPdOO6kvww09+jUiz03dQl9P6
	MGCCeSZNG9bFPPGExVPgKS5u8vt++bHr27uhzFM5b4Zq7y97CihpBntHh0x4V+wPuTPUsiobYNdoI
	KpUvzGPXkWquoWS/dn7vZIxoS42RzxsTzS09W/Erc9Kmy9adwOCQldHYf9FsH4VxWaUiWKyZjXxzP
	rL4/w7tdXS3cY4YB8l2A8ma/6Nmo6xXNHCjLMKIt9A9DVLvpvTO4u75OiJ7tIyjxOswkTXC4kF4zP
	vM+IW0+I5mDzF2xRN4/72O7qQUILOSx+mrKgFrbyt1kAxcmYJ69bveEWZHC01IwX1o5kmhvpINhp6
	MqgeG26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sR9-00000007co7-1KBf
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 18:42:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sR6-00000007cmJ-1VL4
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 18:42:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UDoJl3008265;
	Tue, 30 Apr 2024 18:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kRZ14mxC8d07XCdoMoa5RtYRF7xwfFXScdD4Cm7odQo=; b=cU
	qgPvR4uHnvwbK/2KERyVs2NGIhTcluhhPC2nmNoBL3H3EmV9E76WBq3qR3EMHVvd
	z4zt64CC3N7HKhP5D/CFb6t1tutUl0W86rX0u9vIXm9WxM5o4DCz00LPzRWfbJTW
	A9ErNBXUPI6GP4ZapUR6R5NcsWj0pfBxY/awtFx+6NztoEwcowgTuYICT+hQTO14
	KGkcg7FYz+CmH5qkaFiUZxpoVUWYWdfTXCTb0uhAjqMabMbMIEBoj91pCaOrLuM4
	bwvBm9FaPG1cv0oD4fQNW5TBnBrxo3SC6pTqL+iClzNehkVHomqVTaA3uKGxZjPe
	ZoMlcKe4Us8LU8K9Sr1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtw1hhp0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:42:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UIgZZx020232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:42:35 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 11:42:35 -0700
Message-ID: <26854263-0a16-4b27-9de3-be3d159b8e40@quicinc.com>
Date: Tue, 30 Apr 2024 11:42:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: Replace "chip" with "device" in hal
 Rx return buffer manager
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
 <20240430165811.1377182-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430165811.1377182-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 13J2nSjpYB9xutHNVAcwu8kPuNLkGePO
X-Proofpoint-ORIG-GUID: 13J2nSjpYB9xutHNVAcwu8kPuNLkGePO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_11,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=745 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_114240_476284_2F2EE247 
X-CRM114-Status: UNSURE (   6.18  )
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

On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
> Prefer the term "device" over "chip". Therefore, modify the relavant terms

Kalle, can you fix in pending (if there isn't a respin):

s/relavant /relevant /

> in hal Rx return buffer manager to use "device" instead.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


