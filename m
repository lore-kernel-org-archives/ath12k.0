Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4738E77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P9ucAuLFxtv4Nv+7uevs2CJjzDeKgIkyHJHTH274yo=; b=sTfDyfbWidBQSid46XWiqCz/u0
	JPp1hda5CEM44QFxiLZHF2JzS8xP1ozSJ4658I4tgPsAZw3rqBki8SXGcYys2WDXwCsEs1+ptM351
	zE4LV2S4Wo4+CdiwahdqXffcjxQ/djUoAXySqSm0wZhAX/y42vzIEkg6E0mO3nBQgrRPYGawsC0Eo
	oq3U7yDfzQMbWo7v/rr7pYMh277HyakFJ0ylc40N6FrYq7dfhbNMOP0bF47RFuDYl/4dVDsdb2T5S
	ywFZ1EOXHxZCDXxQXxu6HueXnSJfA0QbSqAqIAeYRQW0ph+lmrcNOg+/2ZwxNIt8qmrYeYvcqmwDP
	RcaigADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfGO-00000002iG3-2dGt
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 20:49:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfFw-00000002iAO-2qrL
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 20:48:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6CF4it003155;
	Fri, 6 Dec 2024 20:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0P9ucAuLFxtv4Nv+7uevs2CJjzDeKgIkyHJHTH274yo=; b=S0jLFYXGMAZo/p10
	2gTwh4/dHKXQi3S/GRpmKPLyDUOh8cr6/lgvEhEIJQJiPRnN3eTnp4RfM4Jgv+YN
	QfsF36d+aYl4EzvlYB4wXe+jZUkLliQS1MICy+bhuo/odzwF3KuBRe2RYxHW1P/H
	opDjfoBQ7QwMHTKy+7w1vZMjzsS8N92h+UG40pNjAczIAh5G53e4Q1vlUKkO1ih0
	uEPBqM0rzgs2FncQuWYt7UpGX/FJTGx/QThVclM2U1hBJClXAycvc/NDqeb+eQCd
	1CX0W8RkPb1WfLGSzjFtCcfydTQnMwVCDyq0J82cF6vIzpclpJM08DPkeNvr5eRC
	fp7pGw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp2qyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 20:48:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6KmrMs004444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 20:48:53 GMT
Received: from [10.111.177.171] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 12:48:53 -0800
Message-ID: <c7c66d91-c862-41e8-b8e4-fa661cc8e2f7@quicinc.com>
Date: Fri, 6 Dec 2024 12:48:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix leaking michael_mic for non-primary
 links
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241206054552.177424-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241206054552.177424-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kQ_zv5HUKXhZ2KK91wxVe3lGHSdoNeGS
X-Proofpoint-ORIG-GUID: kQ_zv5HUKXhZ2KK91wxVe3lGHSdoNeGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_124856_800862_AFB01AD7 
X-CRM114-Status: UNSURE (   9.13  )
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

On 12/5/2024 9:45 PM, Baochen Qiang wrote:
> In ath12k_dp_rx_peer_frag_setup(), commit ea4192553850 ("wifi: ath12k: add primary
> link for data path operations") checks whether a link is the primary link, and
> returns directly if it isn't. In ML scenario where we have non-primary links created,
> this results in leaking the michael_mic info since it is allocated by default but
> could never be freed for a non-primary link.
> 
> Note that we can not move the might-sleep allocation after primary link check since
> there we are in atomic context (due to spin lock). So keep the default allocation,
> and then free it before return to fix this issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Fixes: ea4192553850 ("wifi: ath12k: add primary link for data path operations")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


