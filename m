Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E4AC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPLl11x4Z/AWOegpbb32olSWI/6SPyUEKslL2fdrjJ8=; b=slky4ms65Cj/v/4o6dIVWj8SVp
	WZ5RZtMrgfipts2zYK/Gp7yGK43aZ7MK8PTCZ78uL7RflVBIuIzM8RIocuBsWzTgJnsPms9+iOqtm
	sdS9LLJVs2WRJrVfKXUbTPW2IXYY2A7fbMd6MQF7naJb7FZoKDkK+NWFKbORtLXeAl28o8cxqJ95Z
	0fouwsBquA3a6W9HyV36o8BhRe9HLE4luIc7VYaEpo16gHNbWyJwfogc/QuiFuTJZeA9dGHvxgCZo
	7g5EyLcK+E2Jseu/fn40SzVTPxUNpLpifDQMeDIKJt/wTmujWyOX95KsbNWnsCZ8X8+N9W6k/tfp3
	bAI/bTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06fi-0000000AGL2-1dgV
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:30:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06fe-0000000AGKQ-3Itd
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:30:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PIlIqj024808;
	Thu, 25 Apr 2024 21:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jPLl11x4Z/AWOegpbb32olSWI/6SPyUEKslL2fdrjJ8=; b=b4
	FKbKVljPV0fWFvTxt6SAJ0lsq5E76qba8IffUc2Q842bX0696kAyMLXPX1K7dPBq
	mB68jKLNVL+vZkLqEih7BC314pYPl2tdQnaKpxOMw4TX9BzasjDZ+tAqx87nzXIM
	6YlhpD+OTqBI6d625Yrza19sknADKr4rtBt8ADjz6ebIdwZ99geN+4cdJkdw8Co8
	y51/Y7x02Xuzvd3r+URB25CF+TF5+j6+K1V61afDPSxX9i24NGlEczdtJ5+NM2gj
	CSEQP9KXkfM2Kx3WPwZK+uWiu8wldRbM40IoJNvkHQoLacQiUUYxP/gFhko+DzBl
	aQIBDuC3t3wfe1SGbywQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkkr2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:30:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLUKTj000658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:30:20 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:30:19 -0700
Message-ID: <6277fad5-a974-4b62-bb35-43a93f71cc02@quicinc.com>
Date: Thu, 25 Apr 2024 14:30:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set
 to mac_register api
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-6-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425055759.1181165-6-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MTff5IrDsksBoFiUQGpWwMTTkH4Aa_H-
X-Proofpoint-GUID: MTff5IrDsksBoFiUQGpWwMTTkH4Aa_H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_143022_976170_09985C8C 
X-CRM114-Status: UNSURE (   7.91  )
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

On 4/24/2024 10:57 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> When hardware device group abstraction is introduced, in future, a group
> abstraction is registered to mac80211 rather than a particular device.
> Hence, setting ATH12K_FLAG_REGISTERED in QMI firmware ready event might not
> be ideal.
> 
> Add changes to move set/unset of ATH12K_FLAG_REGISTERED flag inside
> ath12k_mac_register() and ath12k_mac_unregister() respectively.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



