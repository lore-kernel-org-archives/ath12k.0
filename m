Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E58C3DA45
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 23:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6OLQNNv3wHhoZl68PLjnz9+Sa2EoPBOEpp8cRmc3e4=; b=3tVkurqCVj1hGrohRjZWF+jYls
	DYLh+RL8J1QM5uaRtAaYOaABfyGu8ziCTEnzjqar0jcmqmZ8CODnUqKK7GLmWzp16lFRbcH7dt0xm
	S+OC/xTHJxxj2514AmmHqJf1SYwSnzSkQhaTCSruIscKhTqFIckKX+kxmj/lHHjZijc/ubcpg7d0h
	TSch4VOzwP0sSQIav+7Znr7owgf0DSx7X9HgpZlmixltPsBonnpKp9H3MZHcccveeweJhps1Xh2o8
	GsYPh2J8n6LwmvncV2Y89/FQGLMp8E/y0PV9OvuHLyUnhlkH3q+AM8ubrQYyKJCZLVqGlC0ECK6i/
	2/B5Mykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxqn-00000005KhO-14nM
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 23:32:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxqk-00000005Kgt-2RSn;
	Mon, 08 Jul 2024 23:32:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468Meowd012208;
	Mon, 8 Jul 2024 23:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6OLQNNv3wHhoZl68PLjnz9+Sa2EoPBOEpp8cRmc3e4=; b=IyELS522y2ARgBFC
	BOJFDE0yN61pMk+2/JcSS1Uj8GAsq8WDs1REkvMjMr5MxNwL3CFC3uvTDY0meB3D
	scZlThy5MjuxfSp1cjldFcz7qoSJBwg8Ein/gGfvA2Avpr++Im0NmoW81HDsT69l
	v+4zbCpsZeOHJVN9AGSwvlaf61k35S94VOF7C3/o/6LKAAvaTh6HN9dnobZhn+xQ
	TU9XeRXnOTM+Lr+M6iNx+zUbXtlFNN7TikV+8BhXQYXrq4rYotKGW1u6qko+r4Wr
	XpJc0JxS7HIDjrQCs+ZJuezlic5BqnpZll698U1p3eUu5rB0RkL4Nlj6Iy9VY3M9
	AGXwtA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg3vywc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 23:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468NWmxl031113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 23:32:48 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:32:47 -0700
Message-ID: <c5219b32-bc58-4581-abb7-7bae22090bcd@quicinc.com>
Date: Mon, 8 Jul 2024 16:32:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix array out-of-bound access in SoC
 stats
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240704070811.4186543-1-quic_periyasa@quicinc.com>
 <20240704070811.4186543-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240704070811.4186543-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TL5DFtv7WgFfmjlgDIoumhcX_kk4Ditg
X-Proofpoint-GUID: TL5DFtv7WgFfmjlgDIoumhcX_kk4Ditg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_13,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=776 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_163250_660591_F67031B2 
X-CRM114-Status: UNSURE (   8.90  )
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

On 7/4/2024 12:08 AM, Karthikeyan Periyasamy wrote:
> Currently, the ath12k_soc_dp_stats::hal_reo_error array is defined with a
> maximum size of DP_REO_DST_RING_MAX. However, the ath12k_dp_rx_process()
> function access ath12k_soc_dp_stats::hal_reo_error using the REO
> destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
> normal ring ID, and this usage leads to out-of-bounds array access. To
> fix this issue, modify ath12k_dp_rx_process() to use the normal ring ID
> directly instead of the SRNG ring ID to avoid out-of-bounds array access.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


