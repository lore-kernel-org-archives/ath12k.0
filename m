Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D210FEEAA5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sTZolfqGVb1LOyPEhDf1pwWG1psjkADP74lwJLFkuk=; b=DWqgpGJsL8l8e+
	MH4X8zLu2C8PD1nx1xulCy8RG8dYFf6OxEdR4rIgVA/acfCYRejQnUtHCQdDMqcqU6jmStX7rnCtE
	pVXmkBaANhc0hkIE6GZtZCI/CHE3xlOlRmlCOhTBKkLs8WO45bVuGTxTKx7ADhoHp9kctH/Q70gKv
	HKMh1cNDMGD3yDESry7J+9HteniL8GjazYvbTg+vS2O7KgHvHAEtrwQwD5NwHc6qA4GPB2dFLqiuE
	Mbw/FIrIMjUQOPoPX1zODefMLmy0a/RdY9WSY3LyM7cww2F+EZ8Xuyqpw1nlWZ+Ptx6OeKZ77utXy
	Ip7nz+DNzFUvz8NBbMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpxM-008ybr-1r
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 17:16:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpxK-008yb8-20
	for ath12k@lists.infradead.org;
	Thu, 14 Sep 2023 17:16:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EFEoEk029345;
	Thu, 14 Sep 2023 17:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bgXlpcV8eKLz9WA3vQHuIZZ80FfUyEMV8UohKl9+Gzw=;
 b=jttwqktMhnE6/da/OBNs4DqSjg5WGP56GIbWMUybUim4joAXCeFgeRyhSIP0DX5/VFoE
 KOP5l36CM0R2dDkbYu9FnzYixWTDwpz7pF+WmWbEjJneHSkCI6vkZpl032LMnjH9mHUp
 pue4huVv2oCs9nbjPsVtrNYJMEu2s/F1iZL36oPBCwFkQngWGdkmAo+6dF9EuMQgASZj
 n2kwiMBGcBBMhNuEhOL1UpJ2ZktCbz0rKFAIRqC5xoSGlNNdgdYq85NLhE7hvM/XH/J8
 y31VzIV0tubfFFqGcgs2sW2yVSMWtLtGbIaWkwM9CFuhUMlYg3UZfUJzW/6vP/9LJ7sJ Yg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3v4g9w45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EHGcMw026899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:38 GMT
Received: from [10.111.183.186] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 10:16:38 -0700
Message-ID: <9a24244c-8007-49d7-8355-d6b366826d61@quicinc.com>
Date: Thu, 14 Sep 2023 10:16:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: store and send country code to
 firmware after recovery
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230914090746.23560-1-quic_wgong@quicinc.com>
 <20230914090746.23560-5-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230914090746.23560-5-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v-QqftaJGdyN_Pz8i6GT-3Q1PMzScStY
X-Proofpoint-GUID: v-QqftaJGdyN_Pz8i6GT-3Q1PMzScStY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=819
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_101642_773232_597F7BC8 
X-CRM114-Status: GOOD (  12.64  )
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

On 9/14/2023 2:07 AM, Wen Gong wrote:
> Currently ath12k does not send the country code to firmware after device
> recovery. As a result the regdomain info is reported from firmware by
> default. Regdomain info is important, so ath12k also need to restore
> it to the value which was used before recovery.
> 
> This is only needed for platforms which support the current_cc_support
> hardware parameter.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
