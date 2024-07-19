Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2FEC3DA5D
	for <ath12k@archiver.kernel.org>; Fri, 19 Jul 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQH2jNQy0JqFB9jEU0yvzPfpjLt2So36InmB746BOG0=; b=AXKUo/U5EP4/V3YlYbdg+QqjDk
	1gN8xLz7jtHzm8tn/r2/urRxxLrK04rp/mrXyTrItCfJmr85AzMXLNNWyo1ro/CKn1oNrqlrwc3ob
	vINPbthF+sK6mR4kLHEHa2Bz0Wp7L7cY0+9VzAa3AqrROA9EApmAx1EPE6ou8PJenvsaIlM9M/HV0
	UnF95YV4NwCLAiPfmejJ2k/QnRPK2pTWrhMyo1kOWgv+Ps0MfsFhHcaVc76CLXDwB1vfAOMAuzYqn
	ccO1mVfi/6XHlBWZuiBzquoGshAd9Q+KCiS2Q0bMQr+iNVgJuUGkLQehZaZbK/eK9dl0hqS2ixSSb
	8JJn01eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUoJn-00000002t3a-1DhK
	for ath12k@archiver.kernel.org;
	Fri, 19 Jul 2024 14:10:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUoJk-00000002t2v-3iIL
	for ath12k@lists.infradead.org;
	Fri, 19 Jul 2024 14:10:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JBGqTM010390;
	Fri, 19 Jul 2024 14:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQH2jNQy0JqFB9jEU0yvzPfpjLt2So36InmB746BOG0=; b=bxwN9SodpQOaW8YR
	OP0xYkf9rZxZ3BfaToDc0EElO3KrEOOuw0kiEYFpr2cIySN7yalKWxpHdueW8vhj
	oZyeWGbDmXnD1Z2kcQMfpiIbWmMOmRTNKL+oxYsms6mW9XUy4h/DFLDJOc+XuC5M
	CJQatyT7NJmIRk4dUGmHe1LkBgReSNea3+mqNcUSnFmwG0sm5aa2Gbfw4C+CpCN1
	CxAUqS1evyaVV9Etwau8oUgzrLNi1/ue/uIX93s7JX0oW+DoARjBZSTbGXnmeVIn
	9nd+8PRTw0jAjMlKn9tlJjmZ81ZfS5tg0GOaYV0ZkN+q9LbnVnq96Jf7qyfOPjAa
	i1kLQw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe459p8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 14:10:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JEAdkl014122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 14:10:39 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 07:10:36 -0700
Message-ID: <c26af1cb-747a-462d-8e13-af948bbb8171@quicinc.com>
Date: Fri, 19 Jul 2024 07:10:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path
 for WCN7850
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kernel@quicinc.com>,
        <netdev@vger.kernel.org>
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240715023814.20242-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T58X8atz_8Ey9GE3Oj7W9Tiif5DrwHLz
X-Proofpoint-GUID: T58X8atz_8Ey9GE3Oj7W9Tiif5DrwHLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_071040_965924_1B512275 
X-CRM114-Status: GOOD (  21.42  )
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

On 7/14/2024 7:38 PM, Baochen Qiang wrote:
> In transmit path, it is likely that the iova is not aligned to PCIe TLP
> max payload size, which is 128 for WCN7850. Normally in such cases hardware
> is expected to split the packet into several parts in a manner such that
> they, other than the first one, have aligned iova. However due to hardware
> limitations, WCN7850 does not behave like that properly with some specific
> unaligned iova in transmit path. This easily results in target hang in a
> KPI transmit test: packet send/receive failure, WMI command send timeout
> etc. Also fatal error seen in PCIe level:
> 
> 	...
> 	Capabilities: ...
> 		...
> 		DevSta: ... FatalErr+ ...
> 		...
> 	...
> 
> Work around this by manually moving/reallocating payload buffer such that
> we can map it to a 128 bytes aligned iova. The moving requires sufficient
> head room or tail room in skb: for the former we can do ourselves a favor
> by asking some extra bytes when registering with mac80211, while for the
> latter we can do nothing.
> 
> Moving/reallocating buffer consumes additional CPU cycles, but the good news
> is that an aligned iova increases PCIe efficiency. In my tests on some X86
> platforms the KPI results are almost consistent.
> 
> Since this is seen only with WCN7850, add a new hardware parameter to
> differentiate from others.

I asked for expert opinion on this patch and received the following response.
Baochen, can you take a look at this suggestion?

> Aligning headers is sometimes done, but it appears the driver
> doesn't support scatter gather? I think the author may want to advertise
> scatter and linearize manually in the driver, to a correct offset.
> Because now core is linearizing the skb in validate_xmit_skb()
> and then the driver moves it a second time..



