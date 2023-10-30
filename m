Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C4EC4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/tw27sT+7r8RG0ngkL+pi8v6rDiomWbz0Sz8TkrrII=; b=M0ph1U5nYB0Yav
	L2LQexKHlPMyDEDo4C3DaAHe/iljtRywV0a58eJCliL/c8xvcOO8RFZg761mCVMSr9p2Nhvgy5zOn
	jTEnJXcVQZltLJWIiYeLYJVgD7G1eyVOteUuug2uUc0r4eGvG3k6rgBFFwCaT4dgglcwrglHQmEkU
	/zGfVRzTSFfxGqdTcQpX1PKwvu7JiiafGRq+9I07Ov+yG5g8mEgKOpoi0VShjBKX0NrAt5b8al4a2
	bL5BYON3GRDw9TknY7qXYjbSP4gY6C1BOMocJIh7tAi83uyOynPJmV4Ixdfw2JVgqbv91CDFX8E2B
	Bs+HKzOZ6e28MRWU3gIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbVd-004BTI-0y
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 23:17:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbVa-004BSm-2K
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 23:17:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UMqDdM012131;
	Mon, 30 Oct 2023 23:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qCKeI95mpN1gOrFxNZzewCOcYJPv6G2mwfMjQ6a4Wew=;
 b=eMbKzPOMt3tpBguWosm9KKTTyLsMu/adnbX0dIAKBJ4h08DmC+Mt0Onb1SJBqCJETTs5
 w9K8G/Mt9Q+cFOdIX4sMhnmTHMKiNZ/eA8Fm56q/4cLKomiUS0RvGgfmhff6njRHkiTf
 fcHdI2I0Gql2qi1QoZ0r9TuziMGhm75nejfBUEzoDsDsRy6JHQpkN+YeJgTa1/wcwmpC
 AxqzvmxiRoIXv24Tls3IfnnaTndlBoGcCtkI2ra08dC6EDE/G66RegxlsfYbg+hztbLJ
 S4XTZvCn3utzLQVqPtqA00cLTUQLENK0UyMakCIFvbgkgn+n+2omf6aZsvmWe2fPZ1Mu gA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2c4rsepm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:17:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UNHLPC022959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:17:21 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 16:17:21 -0700
Message-ID: <e3701aa5-66b5-4b4a-bb72-09dd6019c07f@quicinc.com>
Date: Mon, 30 Oct 2023 16:17:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] wifi: ath12k: fix fetching MCBC flag for QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-6-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-6-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Iqkvvfck07a_MD8ow8DpSHQLjGJBdg5p
X-Proofpoint-GUID: Iqkvvfck07a_MD8ow8DpSHQLjGJBdg5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_161722_789881_16D75CDE 
X-CRM114-Status: GOOD (  12.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/30/2023 3:26 PM, Raj Kumar Bhagat wrote:
> In QCN9274, RX packet's multicast and broadcast(MCBC) flag is fetched
> from RX descriptor's msdu_end info5 member but it is not correct
> for QCN9274. Due to this with encryption, ARP request packet is wrongly
> marked as MCBC packet and it is sent to mac80211 without setting
> RX_FLAG_PN_VALIDATED & RX_FLAG_DECRYPTED flag. This results in packet
> getting dropped in mac80211. Hence ping initiated from station to AP
> fails.
> 
> Fix this by fetching correct MCBC flag in case of QCN9274.
> For QC9274 MCBC flag should be fetched from RX descriptor's mpdu_start
> info6 member.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 8f04852e90cb ("wifi: ath12k: Use msdu_end to check MCBC")
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
