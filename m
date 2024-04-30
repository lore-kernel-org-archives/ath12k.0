Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE2C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e26QQdGzOxHOVUFEQqXWnhRV6+agHMoM+Y7hToaUJsw=; b=DocIf59LETma2hzleq+3RoBEWc
	6yRGs/X8+3h8VpX7hnIsupHCka8HY2wUVs0Z8QWmrWXLtvbAP3ilfaOa637s/GMGso5hPH3K7R8Cp
	1f9gqFUZXMndndb/KNGHfgeGIFLOYH/PU5R5l8N+ONGcoFI9fbgKmrkQKiq8ZC1k7XqjuZOuk4Rp4
	QVeFt30POCE4t8cvzir+m0PA/XIpgz7vxhmg88JoOobbhemUe4cw8wXTyIeutfKydCabIWPPNbuNL
	xNDsUZcJqswaUm7oleQ5tA8E/tcXh8DrdFh0uNPsjtXL1j7/TtZD4hXIrmjZ9WJuXgyVAXcZHlmyR
	2jZSrb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sSt-00000007dAz-11np
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 18:44:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sSp-00000007d9h-3wJc
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 18:44:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UGHvdd011394;
	Tue, 30 Apr 2024 18:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e26QQdGzOxHOVUFEQqXWnhRV6+agHMoM+Y7hToaUJsw=; b=Y0
	fQhpAk5pjqznj42MHdhzSYpsO/7XK9MOzlDdReBFvnalx0U0W/I5cyKe5iYifAbZ
	r2JGq5Cjqr61m+Zrt5QBT5WVShaQ0UgEo1y5Wf1bOu+1ALSgMgfnpAARHLNknwUU
	BkWKG2NoMRZqe6cpvqEyrfb353lNhDd/hxIfL9ioWugDTra5wv7SU797uE7nIcG/
	RL6T90N3YGl9n5FOeMYW4c2sxi6VYMUwYzP7fwKCfFanmSN7dqcCI2XvnLLN0qwR
	4FT6vlP4BJdmnADuejz3C7VWPo3MSd71qNmNtxKpxVktaeUpypBaMIy9oftvt96B
	KFIos1HUu1ta6LPRoRsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtv1hsudb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:44:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UIiQgs019538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:44:26 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 11:44:25 -0700
Message-ID: <c1f80f1d-235c-4fbe-beb8-168f7e969707@quicinc.com>
Date: Tue, 30 Apr 2024 11:44:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath12k: Introduce device index
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
 <20240430165811.1377182-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430165811.1377182-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P21_IheBpZJX0OZCpOvzSPfsBzfFmU3n
X-Proofpoint-ORIG-GUID: P21_IheBpZJX0OZCpOvzSPfsBzfFmU3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=848 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_114428_057813_32E66590 
X-CRM114-Status: UNSURE (   8.54  )
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

On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
> Introduce a device index parameter in the ath12k_base structure. This
> value is used as unique identifier for devices involved in Inter-device
> MLO. It is also used to configure the MLO parameter within the QMI host
> capability send request. While currently set to zero, future logic will
> be added for inter device support to populate this parameter with
> non-zero values.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


