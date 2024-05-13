Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342C2C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/dQG5q46d96/RraF89SE7oBLYzNSXOi4gxyHcJ0M0U=; b=d5cKH9wV3Ps12BEx9MF2MTx7od
	t1xBGdGvr0u0eR6Z2fk4VPKnaXC1iU35bNw43hDwj+s94hUnMf/n1EDl/5cSbBs327XZSH2VmzXLC
	ownCLpae+dMi9l6IiKKBET0RKMbaWiWffT+ICQLJtCHp6bcCIdA2B4U+DOs2ldLbHTJhnD5jZzO5n
	wiB2ivXmelzLDIyCiaCop4vHwkEcjbXTA0frPAXmi2o7RnpawD3jFNLkiStyofBAGs7uJFyNtxIDG
	+PEYWPBBzCtOHL1hltxT+Jddk/diNzDm0ptKS6RrWyzAVlRoS/EOikzwnhH5zpb/HEXrWYD2RH1ut
	8dQvXP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZIl-0000000DhDR-3Wf6
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 17:17:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZIj-0000000DhCb-3T15
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 17:17:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DCYAHA029260;
	Mon, 13 May 2024 17:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=I/dQG5q46d96/RraF89SE7oBLYzNSXOi4gxyHcJ0M0U=; b=Z2
	7/Xl2MSai4GNig5+t2EavWdO0xmvQ6KOScHJjl/VBzP61PqXGC09YijF2noYGxgI
	ysodjI5t6fDm6G0S4ZfsAixdyFcoFu+m2ACXVs/JeBOR7JjwRdApBsEQM82K5vMB
	atQBbk88WHHeu/3sBVoIlkM8vlg23DDnh7TBQMJtuNUU4+zbQtkw6+/KsjrwPMR9
	1nRzVkw/d83ktBH9AvYNJf2Xtzv/NgSFPTUPFzxAoLs7AOUhEIvDdQJDP3eGpoxE
	lCbWLExFmtCiJacACCANWA7s1F//pCcHZtglICpbWpwMsSARTvr9z6KznZwJ/hh2
	NhbxfORnIcwFbTlfB2ng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21edc26r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 17:17:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DHHLNA031990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 17:17:21 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 10:17:20 -0700
Message-ID: <b69c3612-3d9c-491a-b98c-03b9997654d7@quicinc.com>
Date: Mon, 13 May 2024 10:17:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add Dynamic VLAN support
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240506231752.942567-1-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240506231752.942567-1-quic_msinada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OFoCWF-SWYAPTUXZMhNmAhryJ3tdy6kB
X-Proofpoint-ORIG-GUID: OFoCWF-SWYAPTUXZMhNmAhryJ3tdy6kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_101725_910735_B2A3EBE6 
X-CRM114-Status: GOOD (  10.35  )
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

On 5/6/2024 4:17 PM, Muna Sinada wrote:
> Add support for dynamic VLAN. VLAN group traffic is encapsulated and
> encrypted in mac80211 and driver needs to set flags for the VLAN group
> traffic to skip hardware encapsulation and encryption.
> 
> VLAN group traffic utilizes ext MSDU and HTT Metadata to set
> encapsulation type to RAW and encryption type to OPEN in order to
> inform firmware to skip hardware encapsulation and encryption.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

My first test of this patch gave intermittent connectivity, but a second test
didn't show that, so I think my issues were actually with my home router.
So giving this:

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

However I do have one question:

> +struct hal_tx_msdu_metadata {
> +	__le32 info0;
> +	__le32 rsvd3[6];

why not rsvd0?

If that is OK, Kalle can change this in 'pending'

/jeff

