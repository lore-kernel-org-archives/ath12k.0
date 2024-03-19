Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC51CD11C2
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gjwgr/uB/JzHaXhvWi8JLRQxHSeYGVHw6DQDphoLxoo=; b=goiKbgZ76v34TKMTZI27pbCKfl
	uIP4QuUeHEmSE9uEoA1d14CnsywcpKiFCYRvSLXlI2XBYQTs4b8IoND8NjVUKLN7Er3KPpls9fpYV
	wffmjfTtWPjkWoAdlc7irsX1jnZQf3ifd91Cq6yBx/s3VJOJCjI1nipnJUJ7E9si2Vd0rJIMwZO2D
	D5zP3gJEwFAsIIDHmLEJnxp2YNa/kQoDh6IUtxh1W3i+9U1Rij/cyiiYOAvWVz6eZnMNZoQ3FLJZ+
	5wXpG0AnQ58n5o+qBp7OSulQQyIsgmRB2hAg+kVjJMrLHs7SKqWOKIHoml7nK3+ZhKtKBVV25q/np
	DjnihJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbXD-0000000DBOM-1Yww
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 15:37:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbXA-0000000DBNP-19CZ
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 15:37:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JESjFC004824;
	Tue, 19 Mar 2024 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Gjwgr/uB/JzHaXhvWi8JLRQxHSeYGVHw6DQDphoLxoo=; b=iB
	GIBcAAptLcH2IZSY0NI5H6K2at0Fue/b4vrzG2Xymdj8qhfX7C67P7uD51V2c5EN
	knGHO4fWscGS7m0SD801kRXxD3mDjg0dwoNQ1oO1JSjPUZNF0mDGgQRbqKylJPX+
	LxwW0WOTzpopg9nUbMU4M8eLHfUqh7MPx49OBTpuLnDh/jiPYP6DFVtGANeUFxzY
	VKi88a88nFzq/QmOPG+uMFbroQVSaL/bELyPb7+AqJwuxw6j8IXMVqPlgahqnKmJ
	JAeHnBnB5mCNhtAcGlQSjxnutLQOdBXQLteK3E+Zc05xhxYIDH7R3m6feivu5X0m
	dUne547/qS8tGd6LEmqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy553ha2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:37:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JFbisD029504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:37:44 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 08:37:44 -0700
Message-ID: <75ae7746-99e8-4ee5-a486-6b2fc07ce574@quicinc.com>
Date: Tue, 19 Mar 2024 08:37:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add support to handle beacon miss for
 WCN7850
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240319023032.719-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319023032.719-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2TW3KMFxHQk8bF-84ur8M3cg1bCUnPkb
X-Proofpoint-ORIG-GUID: 2TW3KMFxHQk8bF-84ur8M3cg1bCUnPkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_05,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 mlxlogscore=694 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_083748_489007_E2602019 
X-CRM114-Status: GOOD (  12.09  )
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

On 3/18/2024 7:30 PM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> When AP goes down or too far away without indication to STA, beacon miss
> will be detected. Then for WCN7850's firmware, it will use roam event
> to send beacon miss to host.
> 
> If STA doesn't handle the beacon miss, will keep the fake connection
> and unable to roam.
> 
> So add support for WCN7850 to trigger disconnection from AP when
> receiving this event from firmware.
> 
> It has to be noted that beacon miss event notification for QCN9274
> to be handled in a separate patch as it uses STA kickout WMI event
> to notify beacon miss and the current STA kickout event is processed
> as low_ack.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


