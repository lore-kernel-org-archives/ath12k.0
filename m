Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850EDD591A6
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 06:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKlpZD7GpfJQFr5VDeb5n6AdOu9t7CZwikPHaLqN+Hc=; b=SOf0SozO0J84oZzsJoX/pLJfyS
	beG8+04NzVX7HPdKh3TZxphfptJ75eQtzJkylOnjBWl+SnAtLaj2BWfS18DFJVG5zeZtlry3LEwO2
	vsDCztAADox0hxVl9oekn00owVnFhg9Qsww7Ysg6BDzZiK6rBVKfQrStCVN6dvonHl0UZIqcPnBoX
	H5DeRKHIUdBnHaCxcPBEoIHLLb4Io8Xuw73PV9//XyLl8I+RBBCqMa4UnCZ7c7klNBT9VgOhuP84o
	Kt3jri4nxeYAvw/Ow+BH/VukCw9Fk9whwza4QXlkcEnWY9afL4tcG89/xsc8zX+jbYTeG47P9bdPx
	3A5ppr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHKn-0000000BTn5-10Tu
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 06:03:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHKk-0000000BTl3-07Hi
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 06:03:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGbCX027393;
	Tue, 19 Nov 2024 06:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKlpZD7GpfJQFr5VDeb5n6AdOu9t7CZwikPHaLqN+Hc=; b=AbL1ll+qhJkULr3h
	0LieVNAl7/IAcVw+9d1J+oMsVxRd6iUT9KD1PqBSHt2Uojh2sRUv3nJgWkf/Uw5O
	n7ovINMXh3FoZ6DMct8RpD8UB6qCdT6EReH649iuKzyZo4u1f52CG5Z+J+sRr0Il
	jFzE3GAWRDw2J6k9kcI37y5L0LM4LImjRD71xaRHVuj8+0v4BlgZNAvLZa/NJEd2
	ZQZSQ1VtlO4oHGxpaq8o8kFb346VsMkM+ZUHp+8B3W1QABtJszkYTuWkIRvsVDH5
	bkF0EnQyS/rG/X8sIOlWfxTsbz/5W6hDgGGllC7vKjsXPyC0Xloff+rAG9iqGdtv
	LqAPSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6sk6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ63SB5009713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:28 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:03:27 -0800
Message-ID: <231dd425-cffb-481c-8856-0fd2fcbad704@quicinc.com>
Date: Mon, 18 Nov 2024 22:03:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add documentation
 HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
 <20241119003248.1579567-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241119003248.1579567-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PoSyhvtXfiHwHgMs63Rs13XXp5-4vFMh
X-Proofpoint-GUID: PoSyhvtXfiHwHgMs63Rs13XXp5-4vFMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=809
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220330_119247_5B13E2D6 
X-CRM114-Status: UNSURE (   5.57  )
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

On 11/18/2024 4:32 PM, Karthikeyan Periyasamy wrote:
> Add missing field documentation for HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
> command with indentation alignment.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


