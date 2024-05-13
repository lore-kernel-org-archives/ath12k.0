Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26536C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+685nWWh2QNUSFRVZIswThV4BrxdkazQm5cuj68UX8g=; b=buwN9mdL3B5bqgEfPaQVwPpcJy
	1Y7j+8LBI2XwD1G9zQnV3pTAl6xmoSNh/miiYHBeyXL6H/vnYH5brdmo7Y8wFROkKJMNLY3EvhMJi
	+baLy+o8TSNdf/8053SWkcngBWQWFSoMtE7JqUNCAqDkqcinUj4TK+S6elgA1pDzv791pOFhFqJOP
	qa4dE0lFzirt2+ij/QtXHyuk1+ChumCsfUIlILxhNpYradIxBlnodVGYWnl9L3JBTIzOWIa0J9aHU
	b7ULbPHtCmF/seNEKZ07nmtUpnR5iWsKS+Lqq0OrK3lDGbFu+SfjLEcRFytY5g4TTvbOXIzYl/Ct7
	VYK5twLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6chS-0000000EB3I-3ZjT
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:55:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6chP-0000000EB2k-3i9S
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:55:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8T8g003249;
	Mon, 13 May 2024 20:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+685nWWh2QNUSFRVZIswThV4BrxdkazQm5cuj68UX8g=; b=Ic
	m9dR9WrUaDuUoXpb6Q6+kuG/OnRuLN8JsFyAchpY7xo4Ee+tLCx+2sp7hFK1WXrX
	LvMaCt2GQcU/CYzdGUj4Bd+mfPMwBElE+blVW2Iztl0/HITPugok1Wdh/Y1bGVqA
	//fMRvHaQA/igodhbWKRaTXpEXJLzGPT7DX+SnKHk6RmnDYitMQUPMW8psexr80J
	8XeRE1T/NOL49kuiE1GiYBhawJxKPTTVsa6Pc0ibvZP1NFultDtGo7QPSyEbcpAV
	g1mU2a1RSb5eL2nZqfXPyVcHopVrPv4hapxF6H7VYDkweGSPlXX2h23Q6RXzO1M+
	5Q2c770lM7oEJX58qBKA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28h5a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:55:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKt3n8020340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:55:03 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:55:00 -0700
Message-ID: <4ce44353-994e-4ae5-8f5a-9bb19d31ba9d@quicinc.com>
Date: Mon, 13 May 2024 13:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 09/10] wifi: ath12k: add support for 160 MHz bandwidth
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-10-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-10-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ATFUaZ5zbxchVfMViVEB760BvcDbsdmb
X-Proofpoint-GUID: ATFUaZ5zbxchVfMViVEB760BvcDbsdmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135508_103187_3B44A8F3 
X-CRM114-Status: UNSURE (   7.75  )
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

On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
> Add support to configure maximum NSS in 160 MHz bandwidth.
> Firmware advertizes support for handling NSS ratio information

s/advertizes /advertises /

(one of the exceptions where US English doesn't use z)

> as a part of service ready ext event using nss_ratio_enabled
> flag. Save this information in ath12k_pdev_cap to calculate
> NSS ratio.
> 
> Additionally, reorder the code by moving
> ath12k_peer_assoc_h_phymode() before ath12k_peer_assoc_h_vht()
> to ensure that arg->peer_phymode correctly reflects the bandwidth
> in the max NSS calculation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


