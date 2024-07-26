Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EA1C3DA70
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0Vm+bbCEh4Jla68pOE4PtbCWCjDW9tH7zIpIGBBR+g=; b=YlE7436oNMhMjbKEUmCOMPcOP1
	Bn5j1LU0Tq7ZGCHToJFKJnJHCHQ4Pw2fAMw5TnTI742YgnDFhL3DnSlAKR+TveYlgybNGvMx80gOK
	656IoqJx2FTqWdibx+o4Ys3LmAb0Tc69DzgCrN2RyzjHYlPOTQufmSvfZARE0c1RJzpzIY/Wu0TvZ
	PFor6YBlztFYphbUMGin+LMplTpfK6hKF5zimC9fcNcsMFMjcu+cFlNfEa8+3WenZyGftBDBUtNRP
	SNomNVb4xxw9N8dWke24h8JYf4U19VZJaNoKAWu3W+w1GIqG+IbvDyKXBEr5HbzAUugUDcYbUfOiq
	SFPzKsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8eo-00000002VBh-2vDt
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:18:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8em-00000002VAO-36nm
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:18:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PKtQGl010804;
	Fri, 26 Jul 2024 00:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0Vm+bbCEh4Jla68pOE4PtbCWCjDW9tH7zIpIGBBR+g=; b=WdSLg5axKrWHshRP
	9bkGxeXs54KUUzQ61epaT1cX9Frth8xP4Lvq9TcY3CI9o7XolYtoQiiW+PhVAnyw
	g3EwUEM4uSvQQDve7rPbL1HtpUeEo6nFbTVH4SUVn9HJEWVMNOU3lIIjp2vAvhtz
	zknKlAyOxQlJFpcJrrbeA1rMrWhFFYBlA8iNWcJCOM9U3KsOJx1H9LgKzqKjnUXv
	yzHBkWEytX76hepWHV8KJOFAQyx1uKpWeGuiSNNL2jgWHaN/aH8Z6XwI5Be6cMHG
	a5Tx4RFGzbIPmCMITzY56T3MGlFEl4nGvGZx70Y6cnkyl9zrdlWi6sPGxfknWLWR
	e9uriQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40jyrfmuwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:18:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0HxmR004044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:59 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:17:59 -0700
Message-ID: <3a0a2d45-ef8a-4bd4-9931-eec88dcd4dee@quicinc.com>
Date: Thu, 25 Jul 2024 17:17:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] wifi: ath12k: use tail MSDU to get MSDU information
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-10-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-10-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPr_EvWD4Nvu2lxU3hQ0Xp4MWI_RpQkt
X-Proofpoint-ORIG-GUID: EPr_EvWD4Nvu2lxU3hQ0Xp4MWI_RpQkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=896 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171800_820882_B59A6A05 
X-CRM114-Status: GOOD (  10.60  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> When receiving a packet in monitor mode, hardware will fill status
> information msdu_end for MSDUs. Then host can use these status
> information to get specific information about this packet, such as
> l3 offset, bandwidth, mcs, packet type.
> 
> If this packet is composed of multiple MSDUs, then hardware will only
> fill status information for the last(tail) MSDU. At this time,
> MSDU information is uncertain for others MSDUs. But current code use
> the first MSDU in monitor mode, so will get the wrong information.
> 
> Fix it by getting msdu information from last(tail) msdu.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



