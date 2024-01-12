Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A474EC47258
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRp49dbiwgqfyIXpIKtoWePS7EFkwbo1kejuMz6RTWA=; b=sVI5yhermdfRdf0zJwLpbeAwOu
	axAoo5uItAzd2UaGHitQPQ08hiABXPklyynoU/vkb+dTaLwTDDu2bITwSmm1uE78AesD2DwRJapOR
	OBQC/thOi/bZ4SM1A0ENyURowrgzxFuS0xO6JUhkwpvSXbe2vherq8Dlyh7O1o6TG9TVw+ks2hk7b
	NIX6ExssX5lOYdqwPvvAyCzPAHmbwRz4IUK201zzQwsrQsdQpylVhSQ6KjL1VwB5vGlKf8M4O3S5s
	iITMRfOUhgEq5ttAYUbDoUrPRVJXH/qmXKO19qQ6Ds+DRmnG1yYlNwangmfKFZDt9frMWIuyHfljh
	1Jm8nvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL3Z-003Q6R-0u
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 17:10:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL3V-003Q5n-2K
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 17:10:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFJnJY023887;
	Fri, 12 Jan 2024 17:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aRp49dbiwgqfyIXpIKtoWePS7EFkwbo1kejuMz6RTWA=; b=XK
	zIv6Td41T9eIwIhzAmFaRvz7k/aaaVRCJq43a7b/teaDjK6lEKffmLj4n1WHT2Kb
	klwoY9xf0bASYB9WfZKbOGJu8MobmSb5PralS3JBnIGoALnrSXr1FIdW2ujYTrBv
	mcKhWS6lqmHYag2Sd0dB34JmKbSO+tBrx2531rJCLeYGnU7uRYZRfXQBWGXkZ0Hj
	6OP+LuQIxwpVqd/6NdiT1FrUhPQcKEs9G+0ieFreENSI/1/3SRd+pbpleKkhyTo0
	XeWB5hLjP82xu0ADKU4PN5iBTPwriSpgO2bWjXFMWS5vHuFUCm8h1GZEnLM9CJ/E
	FWSZdJe0P3X4PnkSi/Wg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk43xgrhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:10:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CHApHu007161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:10:51 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:10:50 -0800
Message-ID: <a69e4b0d-7a92-4af9-8efb-196fffd4f08a@quicinc.com>
Date: Fri, 12 Jan 2024 09:10:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] wifi: ath12k: vdev statemachine changes for single
 wiphy
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-5-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-5-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PxVIorMHZUTC2GAiw9vysveQBFUM0vFq
X-Proofpoint-GUID: PxVIorMHZUTC2GAiw9vysveQBFUM0vFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=656 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_091053_873552_DCE4D0A5 
X-CRM114-Status: UNSURE (   9.18  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> With single wiphy, multiple radios are combined into a single wiphy.
> Since any channel can be assigned to a vif being brought up,
> the vdev cannot be created during add_interface(). Hence defer the
> vdev creation till channel assignment.
> 
> If only one radio is part of the wiphy, then the existing logic
> is maintained, i.e vdevs are created during add interface and
> started during channel assignment. This ensures no functional changes
> to single pdev devices which has only one radio in the SoC.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


