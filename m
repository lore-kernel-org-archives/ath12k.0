Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB383D59F53
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSDpocEV0yz3CEoMlXviiQK6lBU9fkj3mTfj16J0P+8=; b=Tf9y/6aKJo7mV4v7U1BbT0Le/V
	ua3HTl0zQD2WnKCKCZJFBWD6MIphBfR3jivDHMSJz5J5W108q4AMf6A8cgBYT/bZkzAT8U5ijBLoi
	2bVsM7+B6H6WI3JKAvrdqfUSWoC2iIZLGlXeUBGwlcfZ/0XtiTr1hyHTdMBXSJqVLB/Ao6yFsY01X
	cxo4jrYCnd6vPKyMXwbE0hShbOMb9nlpolVjH7bsioCubtUioSOP29kXnYxozehZB1bHD3I7X2S5p
	jbWvhyMp7ftTyFfLEEM+l3fBZXkRkEpxk7j6kujcsZw+oxVs+2gkm9hbk3GQWdeKhFUlLExyUuKSW
	nl0JrXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyZ-000000042eg-2ANf
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyW-000000042dW-3vRt
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6EEbsm002132;
	Wed, 6 Nov 2024 16:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSDpocEV0yz3CEoMlXviiQK6lBU9fkj3mTfj16J0P+8=; b=DVvPv8GQsH2Rv9eg
	29VYjsd7OR6GNLQVibIbikfT5edKIcmOl5vGPVHzQvzMYXWKXWGyLQ9+iERs2mJw
	gdZ8PMRguNmxy/Cd+VADiVpBa7g7EOy+kPdp8LLteDY1qejN/c9OOa7WCj/i5ant
	tMEyDRzyu7LT6xFB9h4GofRCfMefFppIswYlOtUGm23t41i+8tgETwufcQMMbkzg
	u0JJ4PX8mseG5SzZFyNki2jkP5fjaer8H6mDS7Taylv76x+BiW9QicJp8l30rt9M
	t8bX63EkBzjBiJ7dW3JJeLRBKlHkpNJy22fNh/4ngdJPYdl2XD6q4hIjsx3/kGdj
	3F22PQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072hycv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXgeO004804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:42 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:42 -0800
Message-ID: <bf2dc4c5-1735-4ead-815c-03d11d0cb6eb@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] wifi: ath12k: Use mac80211 sta's link_sta instead of
 deflink
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-9-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-9-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lu1a-pZ-vVaRpaA0tavUOrQzkUoVVr8j
X-Proofpoint-GUID: Lu1a-pZ-vVaRpaA0tavUOrQzkUoVVr8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=544 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083345_020253_6524BA1D 
X-CRM114-Status: UNSURE (   7.97  )
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

On 11/6/2024 6:26 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently mac80211's struct ieee80211_sta deflink is used to fetch any sta
> related configurations in driver. With MLO multiple link sta's (struct
> ieee80211_link_sta) are affiliated to an ML sta and corresponding link configs
> are present in sta->link[]. Fetch link sta of corresponding link from ML sta
> and use the same for configurations.
> 
> Add ath12k_get_link_sta() helper to fetch ieee80211_link_sta from arsta. But as
> ath12k_mac_op_sta_rc_update() is called in atomic context the helper cannot be
> used and instead rcu_dereference() has to be called directly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


