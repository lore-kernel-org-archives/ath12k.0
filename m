Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15816C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/CwnoxZ5GtMudGM3SQsLOA0jz1cr6SN0cIWEketjXA=; b=rYJOuw+D5dFa/l5uy492ZyvSuY
	hyf+sN8IylZTOD/rsq9do5/RgdjwOKHjiKKIX7dBpgO4t6AunFKTWteoPNVgu58mcyz+Z78TbP6x8
	ZrSUBf89K3tNqoncJp+/rA6GlMqSzVkEcg/Gp8rXLfZKxGR2Vcv6yonpilvhPU+AbcV7VSEKWjRSm
	zWQfDEhENFIPKP2rjBtJcxLtllZ7tRtYodqdpX628+nrFeMprSqExBnpWkrIzTYcXHH6aVDj80lTu
	QaeehDZ5h60Ix2hbDwxQ2lyPjgvqZPo2HgHnnWAFED4an+/EJ57GL/vF3lNhiG5dtdSfq0kIrH40q
	saydjCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rcn-00000007Us1-3Ij6
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 17:50:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rcj-00000007UqN-0rJn
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 17:50:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U8Ju93021331;
	Tue, 30 Apr 2024 17:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=U/CwnoxZ5GtMudGM3SQsLOA0jz1cr6SN0cIWEketjXA=; b=Xw
	91aIDY8TqdC3osQ74Zt6zxlIichNqOeI5A96A+jy7dYVjoBvpuwPtKyNIbfxC2ar
	8fHzOShp6un5qjggKnqsgo0+YnF0nM1Ys67sGoBdGdAKlu98WoFBfERr5CHqAkiW
	L0JLbgv/TZsRr8av1pZKAob46QkQP8ORs1pUeK3ngV4HUUvkcnj1iMBb9AZ+6yUU
	QdKcNTXfPP/I4b3StCTdQcaBbewPWIBpICl5Ep2Mviizc3hVDFVbIiwHUV+mQOuK
	3N1IOlmSxrdt3ad92uSZNtbOM6x7rwXapUMOLpakw2iZF7PNkh2pPQM+Bq3kMryD
	Km+Sm/Dopx6qswjF4sNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtw1hhfek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 17:50:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UHoUEK024314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 17:50:30 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 10:50:29 -0700
Message-ID: <27e74c02-7ac6-40ba-b3d7-a303079246d7@quicinc.com>
Date: Tue, 30 Apr 2024 10:50:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Don't drop tx_status in failure case
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>,
        Sarika Sharma <quic_sarishar@quicinc.com>
References: <20240430074313.885807-1-quic_kathirve@quicinc.com>
 <20240430074313.885807-2-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430074313.885807-2-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fPnzT2u_-KI8dWI1lwhMiHBe7W-q5oYW
X-Proofpoint-ORIG-GUID: fPnzT2u_-KI8dWI1lwhMiHBe7W-q5oYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_11,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_105039_578880_776302BE 
X-CRM114-Status: GOOD (  14.78  )
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

On 4/30/2024 12:43 AM, Karthikeyan Kathirvel wrote:
> From: Sven Eckelmann <sven@narfation.org>
> 
> When a station idles for a long time, hostapd will try to send
> a QoS Null frame to the station as "poll". NL80211_CMD_PROBE_CLIENT
> is used for this purpose.
> And the skb will be added to ack_status_frame - waiting for a
> completion via ieee80211_report_ack_skb().
> 
> But when the peer was already removed before the tx_complete arrives,
> the peer will be missing. And when using dev_kfree_skb_any (instead
> of going through mac80211), the entry will stay inside
> ack_status_frames thus not clean up related information in its
> internal data structures. This IDR will therefore run full after
> 8K request were generated for such clients.
> At this point, the access point will then just stall and not allow
> any new clients because idr_alloc() for ack_status_frame will fail.
> 
> ieee80211_free_txskb() on the other hand will (when required) call
> ieee80211_report_ack_skb() and make sure that (when required) remove
> the entry from the ack_status_frame and clean up related
> information in its internal data structures.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Link: https://lore.kernel.org/r/20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


