Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7D9C2FC3C
	for <ath12k@archiver.kernel.org>; Thu, 17 Aug 2023 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+N/6x8UZp5UwkkFaqLW7/6WThMLGVXrgDLzGDopoZA=; b=k7Ora98y0QhUHB
	Gn60pTxlNqu5/spQKelbi9lf2XKogFAA6g4gHWiidl5oDeJ4EPzjS5m4cT7HEvpS6wtsldzgBeJD+
	7VCoGYx7j1qrGJy1AHEsI47k3FpGOmLEZRrt/08rZpd7OusScNFtESKMqoURhs8sIY8/gk9GF3+lC
	cxoVnuOgtEV3Hstpq6GfmmrYcfOv5KJVZBizjDWtrbDJetRopzkEU8/X2csVKqp6YBCd5dDhKFQGZ
	1dqAqxEU2NWWPN2GE3SRiI6SRC1DdesJdcR/tZEENUazgcr/Yu6VUFvzMGwGomAKwKgCnT3Um7wWe
	WNL1TEynC96fIozfW74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWdrh-006XIf-1l
	for ath12k@archiver.kernel.org;
	Thu, 17 Aug 2023 14:20:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWdre-006XHS-20
	for ath12k@lists.infradead.org;
	Thu, 17 Aug 2023 14:20:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HD1r3V031507;
	Thu, 17 Aug 2023 14:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Wjg2YyzZjKdxmmAoe487S4k7NU1zRvT9a3rX4sZd+a4=;
 b=D5uBt+E0y7i1TXtXvBsxjJdolprtt5qQWzf8rsXoV3HXGLoYV2yGkBXF8MALhdIGbSIU
 0RGl+9WEiSCmP78Mqhtk/gqK+/obhtO2JFtuODwv80FAWd1r1pGmDOgwVaOohoLBYGZd
 gq4a7ZV8RFvYRC9N9Ph++RL2tvGyMu1+A5TdAn9O57dHU4hD/YwZCJPzw9K0zQn//Ndh
 SXQda+f7VUcKS9n+3AsvTQa1Fmj4Y+TlAo3vo/mCLZrYdqjtwwfdECTyCs/tjXY0wtuI
 xTcWTzEaSmPiDOOyzohprlOlD6NjAmMTz3+yIg8w7f4CoQNnNi1/VxkgaHjOTiGd+hrE gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sh0upamxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 14:20:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37HEKapQ029942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 14:20:36 GMT
Received: from [10.48.241.213] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 17 Aug
 2023 07:20:35 -0700
Message-ID: <1868f377-be15-49f3-8bdd-e5e72858f15d@quicinc.com>
Date: Thu, 17 Aug 2023 07:20:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix WARN_ON during
 ath12k_mac_update_vif_chan
To: Manish Dharanenthiran <quic_mdharane@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230802085852.19821-1-quic_mdharane@quicinc.com>
 <20230802085852.19821-2-quic_mdharane@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230802085852.19821-2-quic_mdharane@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gkki4-fntb40-7j5ub9ltYGHutD8WDzZ
X-Proofpoint-GUID: Gkki4-fntb40-7j5ub9ltYGHutD8WDzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_07,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=605
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_072042_806448_48FCEF95 
X-CRM114-Status: UNSURE (   9.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/2/2023 1:58 AM, Manish Dharanenthiran wrote:
> Fix WARN_ON() from ath12k_mac_update_vif_chan() if vdev is not up.
> Since change_chanctx can be called even before vdev_up.
> 
> Do vdev stop followed by a vdev start in case of vdev is down.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
